# DafnyTestGen

Automatic specification-based test generation for [Dafny](https://dafny.org/) programs based on method contracts (preconditions and postconditions). 

DafnyTestGen analyzes `requires` and `ensures` clauses, converts them to Disjunctive Normal Form (DNF), and relies on the [Z3](https://github.com/Z3Prover/z3) SMT solver to find concrete test inputs and expected outputs that exercise different contract paths. Test generation combines equivalence class partitioning (via DNF analysis) with boundary value analysis. 

DafnyTestGen can be used in different scenarios, including:
- **Complement the verifier** — find and localize bugs in the implementation (or the specification) when Dafny cannot prove (or disprove) correctness or cannot provide adequate diagnosis information or counter-examples.
- **Specification-based (black-box) testing** — generate tests purely from contracts, reusable in Dafny or translatable to a target implementation language.
- **Test-driven development** — generate test scaffolding from contracts before any implementation exists, to clarify requirements (not possible with white-box test generators).


## Key Differentiators

Most automated test generators for contract-equipped languages — such as Pex/IntelliTest (C#), AutoTest (Eiffel), and DART/CUTE — derive test diversity from *implementation paths* via dynamic symbolic execution (DSE) or random testing, using contracts only as runtime oracles. DafnyTestGen takes a fundamentally different approach:

1. **Specification-driven partitioning, not code coverage.** Test scenarios are derived by decomposing *preconditions* and *postconditions* into Disjunctive Normal Form (DNF), treating each clause as a distinct equivalence class. A method with `ensures (if C then A else B)` produces two test scenarios regardless of implementation complexity. This is closer in spirit to the category-partition method, but fully automated via logical decomposition of formal contracts.

2. **Hybrid SMT / runtime architecture.** SMT solving generates both concrete *inputs* and expected *outputs*. When postconditions are not fully translatable to SMT (e.g., they involve recursive or uninterpreted functions) but have the explicit form `result == expression`, the expression can be evaluated by the Dafny runtime in check mode to obtain concrete output values that are injected back into the test code. As a last resort, the postcondition literals themselves are emitted as `expect` assertions. This layered approach sidesteps fundamental SMT limitations while still producing concrete, readable tests whenever possible.

3. **Output uniqueness analysis.** When postconditions are fully translated to SMT but only constrain outputs implicitly (not via explicit `result == expression` clauses), Z3 produces concrete output values that may not be the only valid ones. A second Z3 query pins the concrete inputs and asks whether a *different* output satisfies the spec. If UNSAT, the output is uniquely determined and a concrete `expect res == 5;` is emitted; otherwise, the postcondition literals are used instead (`expect a[index] == x;`). With `--uniqueness-rounds N`, the tool iteratively enumerates up to N alternative valid outputs; if exhausted, a disjunctive `expect index == 0 || index == 1;` is emitted — more precise than postcondition literals while still covering all valid outputs. This lightweight determinism analysis handles under-constrained specifications without requiring user annotations.

4. **Quantifier decomposition for boundary analysis.** Existential quantifiers `exists k :: lo <= k < hi && P(k)` are decomposed into boundary (k=lo, k=hi−1), middle, and multiple-match cases, with strict/non-strict inequality awareness. Universal quantifiers over collections trigger size-based decomposition (|a|=0, |a|=1, |a|≥2) to exercise both vacuously-true and non-trivial cases. These are combined with other contract clauses via cross-product.

5. **No implementation required.** Because test generation is purely specification-based, tests can be generated for bodyless methods — supporting test-driven development where contracts are written first and tests scaffold the implementation.


## How It Works

1. **Parse** Dafny source files and discover methods with contracts (`requires`/`ensures` clauses).
2. **Analyze** preconditions and postconditions in DNF to identify distinct test scenarios, which are further refined based on boundary-value analysis.
3. **Solve** SMT queries via Z3 to find satisfying concrete inputs and expected outputs for each scenario.
4. **Emit** a Dafny test file with `expect` assertions and a `Main()` method.


## Equivalence Class Partitioning via DNF Analysis

Disjunctive postconditions and preconditions naturally originate multiple test scenarios. DafnyTestGen converts all contract clauses to **Disjunctive Normal Form (DNF)** (or Full DNF (FDNF) with `-a` option), producing a set of clauses that partition the input/output space as **equivalence classes**.


### DNF decomposition rules

The DNF decomposition respects Dafny **short-circuit evaluation** of Boolean operators, to avoid generating test cases that would cause runtime errors. Consider the following example:

```dafny
method GetFirstOrZero(a: array<int>) returns (result: int)
  ensures a.Length == 0 ==> result == 0
  ensures a.Length > 0 ==> result == a[0]
```

The implication `A ==> B` is decomposed into mutually exclusive, short-circuit safe, DNF branches `!A` and `A ∧ B` (instead of `!A` and `B` as in standard DNF). Similarly, `A || B` produces branches `A` and `!A ∧ B`. For this example, the second ensures clause produces:
- `!(a.Length > 0)` — antecedent is false, implication vacuously true
- `a.Length > 0 ∧ result == a[0]` — antecedent holds, consequent must hold.

With standard (unsafe) DNF, the branch `result == a[0]` alone would lack the `a.Length > 0` guard, possibly causing an out-of-bounds error. 

The following table summarises the branching rules.

| Expression | DNF Branches | FDNF Branches |
|---|---|---|
| `A \|\| B` | `A`, `!A ∧ B` | `A ∧ B`, `A ∧ !B`, `!A ∧ B` |
| `A ==> B` | same as `!A \|\| B`  | idem |
| `A <==> B` | `A ∧ B`, `!A ∧ !B` | idem |
| `!(A && B)` | same as `!A \|\| !B` | idem |
| `if C then A else B` | `C ∧ A`, `!C ∧ B` | idem (a) |
| `x == (if C then U else V)` | same as `if C then x == U else x == V` | idem |

Both DNF and FDNF are computed bottom-up, starting from leaf literals, by a dual-return recursive function that produces both the DNF/FDNF of an expression E and of its negation simultaneously. 

### Cross-product and incremental pruning 

With multiple `requires` and/or `ensures` clauses, their cross-product forms the full DNF/FDNF. This product is **incrementally pruned** by discarding syntactically contradictory merges (complementary literals, distinct equalities, incompatible relational constraints), preventing dead branches. The remaining clauses are checked for satisfiability, and test data is generated for the satisfiable ones using Z3.

In the above example, the cross-product of the two ensures clauses in DNF mode nominally yields 4 clauses (after short-circuit safe decomposition). One is eliminated syntactically during cross-product building, and one is found UNSAT by Z3, leaving 2 SAT test cases:
- `!(a.Length == 0) ∧ a.Length > 0 ∧ result == a[0]` — SAT (element found)
- `a.Length == 0 ∧ result == 0 ∧ !(a.Length > 0)` — SAT (empty array)
- `!(a.Length == 0) ∧ !(a.Length > 0)` — UNSAT via Z3 
- `a.Length == 0 ∧ result == 0 ∧ a.Length > 0 ∧ result == a[0]` — pruned during cross-product

With **FDNF**, each implication produces 3 clauses instead of 2, giving more combinations but losing short-circuit safety, namely by including the unsafe clause `a.Length == 0 ∧ result == 0 ∧ !(a.Length > 0) ∧ result == a[0]`. Use FDND mode only when you understand the implications.


### Decomposition of existential quantifiers (multi-entries clause disabled with `--no-exists-multi`)

Existential quantifiers represent repeated disjunctions, that can be also decomposed into multiple clauses.
Single-variable existential quantifiers of the form `exists k :: lo <= k < hi && P(k)`, equivalent to  `P(lo) || P(lo+1) || ... || P (hi-1)`, are automatically decomposed into 4 clauses representing boundary, middle, and multiple-match cases:

1. **Left boundary**: `lo < hi && P(lo)` — property holds at first position (guaranteed to exist)
2. **Middle range**: `exists k :: lo+1 <= k < hi-1 && P(k)` — property holds somewhere in the middle
3. **Right boundary**: `lo < hi && P(hi-1)` — property holds at last position (guaranted to exist)
4. **Multiple entries**: `exists k, k_2 :: lo <= k < k_2 < hi && P(k) && P(k_2)` — property holds at two distinct positions simultaneously (forces inputs where the property is satisfied more than once)

These clauses feed into the same DNF/FDNF analysis, combining with other pre- and postcondition clauses via cross-product. The four clauses are **not mutually exclusive** — when 𝑃 holds at multiple positions, all of them may be satisfied simultaneously. This is intentional: unlike equivalence class partitioning, which requires disjoint input regions, our approach deliberately allows overlap to preserve solver tractability while exercising distinct structural patterns of quantified predicates, without overcomplicating the generated expressions. If Z3 produces the same input for overlapping clauses, the input exclusion mechanism deduplicates the result.

Equivalent range definitions are supported (using other relational operators or a conjuntion of two inequalities instead of chained inequalities), as in `exists k :: k >= lo && k < hi && P(k)`. 
Negated `forall` quantifiers (`!(forall k :: range ==> P(k))`, equivalent to `exists k :: range && !P(k)`) are handled similarly. 

Consider the following example:

```dafny
method FindMax(a: array<int>) returns (max: int)
  requires a.Length > 0
  ensures exists k :: 0 <= k < a.Length && max == a[k]
  ensures forall k :: 0 <= k < a.Length ==> max >= a[k]
```

The `exists` clause decomposes into: max at position 0 (left), max in middle, max at position a.Length-1 (right), and max at two distinct positions (multiple entries). These are combined with the `forall` clause via DNF/FDNF cross-product, producing potentially distinct test scenarios for each structural case.

The per-literal relevance check (below) and Boundary Value Analysis together cover much of what multi-entries provides (duplicate-sensitive specs like `LastPosition`), but not all of it — methods with several exists-decomposed preconditions rely on the cross-product of multi-entries clauses to reach their best input diversity (e.g., `ProductFirstEvenOdd` drops from 21 to 11 tests without it on the suite). Pass `--no-exists-multi` / `-nem` to skip clause 4 when the cross-product blowup outweighs the coverage.

### Decomposition of universal quantifiers (disable with `--no-forall-decomp`)

A positive `forall` over a collection is vacuously true when the collection is too short for the range to be non-empty. Each clause containing such a quantifier is split by **collection size** into sub-clauses `|a|=0`, `|a|=1`, `|a|>=2` (pre- or post-condition, any array/seq/set/multiset/map). For nested `forall` over `seq<seq<T>>`, inner-size tiers on `|a[0]|` are emitted too, so Z3 can't dodge the inner body with empty inner sequences.

Boundary Value Analysis and the per-literal relevance check (below) cover much of the same territory — BVA pins collection sizes to `0`, `1`, `>=2` anyway, and relevance forces non-vacuous witnesses when the quantifier is a safe literal. Forall decomposition still contributes incremental coverage on the suite (measured: ~25% of programs lose at least one passing test when disabled), so it stays on by default. Pass `--no-forall-decomp` / `-nfd` to skip it.

### Predicate and function inlining  

User-defined predicates and functions referenced in contracts are automatically inlined before DNF/FDNF conversion and SMT generation via **2-pass inlining** — substituting bodies into contract expressions to expose branching for DNF. For example, recursive specifications typically have at least two branches, for the recursive and the base case. 


All predicates and functions with bodies — both recursive and non-recursive — are inlined through **two textual substitution passes**. The first pass expands top-level call sites. The second pass expands calls introduced by the first, **except for recursive calls** (to avoid adding deeper uninterpreted residuals without contributing useful constraints). Any remaining residual calls are left as **uninterpreted functions** in SMT — Z3 can freely assign their values, which preserves branch diversity (both branches of a recursive `if-then-else` remain satisfiable) while avoiding infinite expansion.

**Example — non-recursive nesting:**

```dafny
predicate IsFirstOdd(a: array<int>, index: int)
  reads a
{
  if index == -1 then forall i :: 0 <= i < a.Length ==> !IsOdd(a[i])
  else 0 <= index < a.Length && IsOdd(a[index])
       && forall i :: 0 <= i < index ==> !IsOdd(a[i])
}

predicate IsOdd(i : int)
{ i % 2 == 1 }

method FindFirstOdd(a: array<int>) returns (index: int)
  ensures IsFirstOdd(a, index)
```

Pass 1 substitutes `IsFirstOdd(a, index)` with its body, producing an `if C then A else B` expression that the DNF engine splits into two clauses. Pass 2 inlines the nested `IsOdd` calls. 
The resulting DNF branches (abbreviated) are: 
- `index == -1 ∧ ∀i. ¬(a[i] % 2 == 1)`  — no odd elements
- `index ≠ -1 ∧ 0 <= index < a.Length ∧ a[index] % 2 == 1 ∧ ∀i < index. ¬(a[i] % 2 == 1)`  — index of first off element

**Example — recursive function:**

```dafny
function filter<T(==)>(a: seq<T>, b: seq<T>) : seq<T> {
  if |a| == 0 then a
  else if a[|a| - 1] in b then filter(a[..|a| - 1], b)
  else filter(a[..|a| - 1], b) + [a[|a| - 1]]
}

method Difference<T(==)>(a: seq<T>, b: seq<T>) returns (diff: seq<T>)
  ensures diff == filter(a, b)
```

The DNF engine splits the inlined expression `X == (if C then A else B)` into three branches. Since `filter` is recursive, pass 2 skips it — the inner `filter(a[..|a|-1], b)` calls remain as uninterpreted functions in SMT. The three clauses sent to Z3 are:

- `|a| == 0 && diff == a` — empty input
- `!(|a| == 0) && a[|a|-1] in b && diff == filter(a[..|a|-1], b)` — last element removed
- `!(|a| == 0) && a[|a|-1] !in b && diff == filter(a[..|a|-1], b) + [a[|a|-1]]` — last element kept

Z3 can freely assign values to the residual `filter(...)` calls, and the structural conditions already guide it to find inputs exercising each branch. 

### Anti-trivial bias (disable with `--no-bias`)

Z3 minimizes model size by default, so it may pick special values that trivially satisfy the specification.

For example, without bias, tests for `PowerOfListElements([1,2,3,4], 2)` degenerate to `l = []` or `l = [0, 0]` — correct under the spec but useless as regression fixtures.

DafnyTestGen adds two Z3-native nudges per query:

1. **Soft constraints** (`assert-soft`): for each primitive-typed input `v`, emit `(assert-soft (not (= v 0)) :weight 2)` and `(assert-soft (not (= v 1)) :weight 1)`. For sequences/arrays, also bias their length away from `{0, 1}` and their first few elements away from `{0, 1}`. Soft asserts are satisfied-when-possible: if the hard constraints force `v = 0`, Z3 picks `v = 0` and simply pays the weight. **Zero cost on correctness.**

   **Magnitude caps** (also soft): each `int`/`nat` input gets `(assert-soft (<= v 10) :weight 3)` (and `(>= v -10)` for signed), and each `seq`/`array` gets `(assert-soft (<= (seq.len xs) 8) :weight 2)` plus element-magnitude caps at positions 0..2. Higher weight than the 0/1 nudges, so magnitude bound dominates when both are satisfiable. Keeps Z3 from picking e.g. `n = 4294966430` for recursive-function arguments that would time out the Dafny static checker — while still allowing large values when the spec demands them.

2. **Randomized seed**: `smt.arith.random_initial_value`, `smt.random-seed`, `sat.random-seed` are set from a deterministic per-method hash, so Z3 explores more of the model space while the solution remains reproducible.

Bias applies to every SMT query — Phase 1 (DNF), Phase 2/2b (BVA), the relevance query, and Phase 3 repeats — so even variables not pinned by a BVA tier still get nudged away from trivial values and into bounded magnitudes. It is skipped only in the uniqueness alt-enum query (where we *want* Z3 to freely enumerate all valid outputs, including zeros).

**Quantifier caveat**: Z3's optimize module does not fully support quantified constraints (`forall` / `exists`). When a clause contains a quantifier and the full query returns `unknown` under bias, DafnyTestGen automatically retries the same query with bias off before falling through to the input-only fallback. This rescues cases like `IsPrime(n)`'s prime-witness clause, where bias + `forall k :: 2 ≤ k < n ==> n % k ≠ 0` made Z3 give up.

Pass `--no-bias` / `-nb` to disable both mechanisms — useful for debugging or for reproducing an upstream Z3 baseline.

### Per-literal relevance check (disable with `--no-relevance`)

Even with anti-trivial bias, Z3 can still satisfy a clause `P ∧ Q1 ∧ ... ∧ Qm` by picking inputs where a literal `Qk` is **trivially true**. The whole conjunction holds, but the literal that captures the method's distinguishing behaviour never bites (and so the spec is not really covered).

Example — `LastPosition(arr, elem)` returns the last index of `elem` in sorted `arr`. The "found" clause is:

```
elem in arr[..]                  // Q1
∧ 0 ≤ pos                        // Q2
∧ pos < arr.Length               // Q3
∧ arr[pos] == elem               // Q4
∧ elem !in arr[pos+1..]          // Q5  — the "last" constraint
```

Without a relevance check, Z3 could pick `arr = [10]`, `elem = 10`, `pos = 0`. All five literals hold, but `Q1`, `Q4` and `Q5` are each vacuous (single-element array → nothing for each literal to prune). The defining behaviour is never exercised.

**Formulation.** Each safe literal `Qk` is relevant iff there exist ins, outs, and outs_k such that

```
pre(ins)
∧ Q1(ins, outs) ∧ ... ∧ Qm(ins, outs)                              // outs satisfies the full clause
∧ Q1(ins, outs_k) ∧ ... ∧ ¬Qk(ins, outs_k) ∧ ... ∧ Qm(ins, outs_k) // clause minus Qk, with ¬Qk
∧ outs ≠ outs_k
```

DafnyTestGen **embeds the relevance check inside Phase 1**: for each clause it collects the set `S` of **safe literals** (see below) and asks Z3 a single combined query that introduces one shadow output block `outs_k` per `k ∈ S`, each with literal `Qk` negated. Z3 must find ins for which *every* `Qk ∈ S` strictly prunes the output space.

- **SAT** → every `Qk ∈ S` is simultaneously relevant at these ins. Emit `outs` as the clause's test case, labelled `{clause}/Rel`, and **skip** the plain clause query (one strong test per clause).
- **UNSAT** with `|S| ≥ 2` → at least one `Qk` is redundant here; retry with just the last safe index (matches the single-literal formulation for `Q_last`).
- **UNSAT** / **unknown** / empty `S` → fall back to the plain Phase 1 clause query.

For `LastPosition`, `S = {Q1, Q4, Q5}` (guards `Q2`, `Q3` excluded). The query forces `arr` to contain *multiple* duplicates of `elem` (for `Q4`) and at least one value different from `elem` (for `Q5`) so all three literals bite simultaneously: `Q1` (`elem ∈ arr`) needs any occurrence, `Q4` (`arr[pos] == elem`) needs the chosen index to actually hold `elem`, `Q5` (`elem !∈ arr[pos+1..]`) needs at least one earlier copy to distinguish "last" from "first". Generated test:

```dafny
var arr := new int[4] [-10, -10, -10, -9];
var elem := -10;
var pos := LastPosition(arr, elem);
expect pos == 2;     // LAST occurrence of -10 (index 2), not the earlier ones at 0, 1
```

Corner cases such as vacuously-true clauses (empty arrays, single-element inputs) are naturally covered by Boundary Value Analysis.

**Safety — which literals are "safe" to negate.** Negating a literal that acts as a guard can leave later literals undefined (e.g., negating `0 ≤ pos` makes `arr[pos]` out of bounds), and Z3 is free to pick arbitrary values on undefined terms — producing spurious SAT. DafnyTestGen classifies a literal `Qk` as safe iff:

1. `Qk` does **not** match any guard shape: `0 ≤ X`, `X ≥ 0`, `X > 0`, `X < |Y|`, `X < Y.Length`, `X ≤ |Y|-1`, `|X| ⟨op⟩ E`, `X.Length ⟨op⟩ E`.
2. `Qk` references at least one output variable.
3. Every output variable in `Qk` also appears in some other literal of the clause (so `outs_k` is partially constrained rather than free).

Literals whose negation would reference a residual uninterpreted function (typically a recursive user-defined function like `Count`, `Power`, `R`) are also excluded from `S`, because Z3 can fabricate function values on the `outs_k` side that satisfy `¬Qk` without reflecting real semantics, defeating the separation. Remaining literals in the same clause are still checked; the full clause's relevance check is skipped only when `S` becomes empty after this filter. Literals *not* referencing the uninterpreted function stay eligible — Z3 cannot exploit the function's freedom to dodge a negation that doesn't mention it.

Even when a relevance query yields a less-than-ideal choice of ins, the emitted test remains correct: `outs` always satisfies the full clause, so the test case's `expect` conditions hold by construction.

Pass `--no-relevance` / `-nr` to disable the relevance check (every clause then uses the plain Phase 1 query).


## Boundary Value Analysis

BVA complements equivalence class partitioning by testing at the **edges** and other structurally interesting cases of each equivalence class. DafnyTestGen applies the **single-fault principle**: each BVA query pins exactly **one** variable to a boundary value; all other variables remain free for Z3 to choose. This avoids combinatorial explosion, prevents combining potentially conflicting constraints, and may facilitate fault localization.

Each DNF clause produced by Phase 1 already defines an equivalence class as the conjunction of precondition literals and clause (post) literals (`classLiterals`). BVA attaches at most one extra pin per query on top of those class literals.

[Anti-trivial bias](#anti-trivial-bias-disable-with---no-bias) is applied to every BVA query as well. Only one variable is hard-pinned per query; the others remain free, so the soft-assert nudges steer them away from trivial values (`0`, `1`, empty / singleton collections) and into bounded magnitudes, producing tests that actually exercise the spec rather than degenerate corner cases.

### Phase 2 — refined-range BVA

For each (DNF clause, variable) pair, the refined range of the variable is solved from `classLiterals`:

| Pattern in `classLiterals` | Contribution |
|---|---|
| `v >= E`, `E <= v` | lower bound `E` |
| `v > E`,  `E < v`  | lower bound `E+1` |
| `v <= E`, `E >= v` | upper bound `E` |
| `v < E`,  `E > v`  | upper bound `E-1` |
| `v == E`          | pins `v = E` (lower = upper = E) |
| `v != E`          | if `E == lo` numerically → `lo++`; if `E == hi` → `hi--` |

Numeric fold: `lo = max(lower bounds)`, `hi = min(upper bounds)`. Symbolic bounds that aren't comparable numerically are kept as separate relational boundary candidates.

Phase 2 emits, per (clause, variable):

- Numeric endpoints: `v = lo`, `v = hi`.
- Numeric interior: `v = lo+1`, `v = hi-1` when distinct from endpoints.
- Symbolic endpoints for each relational bound: `v = E`, plus `v = E-1` / `v = E+1` for the interior side.

**Skip rule (single-value pin).** If `classLiterals` already pins `v` to a single value (refined `lo == hi`, e.g. because the clause contains `v == E`, or `!= N` tightening collapses `0 <= k <= 0`), Phase 2 emits **no** query for `v`. Phase 1 baseline already covers that point.

Covered types: `int`, `nat`, and numeric type synonyms. Applies uniformly to inputs, outputs, and mutable class field post-states.

### Phase 2b — type/size coverage

Categorical fallback, one pin per query, when Phase 2 does not cover a variable (or the variable's type isn't integer). Tiers:

- **`nat`**: `=0`, `=1`, `>=2`
- **`int`**: `=0`, `>0`, `<0`
- **`bool`**: `=true`, `=false`
- **`real`**: `=0`, `>0`, `<0`
- **enum datatypes**: one tier per constructor
- **seq / array / string**: `|v|=0`, `|v|=1`, `|v|>=2`
- **set / multiset / map**: `|v|=0`, `|v|=1`, `|v|>=2`

Tier is skipped if `classLiterals` already implies it (syntactic prune), or if Phase 2 already emitted an equivalent pin (dedup by `dafnyKey`).

#### Mutation tiers (post vs pre)

For mutable variables mentioned in `ensures` **both** as post-state and inside `old(...)`, Phase 2b also emits a pair: `x = old(x)` (no-op path) and `x != old(x)` (actually mutated path). Applies to mutable array parameters, mutable scalar class fields, and mutable array/seq class fields. This is important to make sure that the test suite will detect vacuous implementations. 

### Walkthroughs

- **`CalcComb(n, k)`** with pre `0 <= k <= n` and three DNF clauses:
  - `k == 0`: refined `lo = hi = 0` → pinned; Phase 2 emits nothing for `k`.
  - `!(k==0) && k == n`: pinned to `n`; Phase 2 emits nothing for `k`.
  - `!(k==0) && !(k==n)`: `0 <= k <= n` tightened by `k != 0` → `lo = 1`, by `k != n` → `hi = n-1`. Phase 2 emits `k = 1` and `k = n-1` (strict-interior endpoints).

- **`LinearSearch(a, x)`** with ensures `if ∃k. a[k]==x then 0 <= index < a.Length && a[index]==x else index == -1`:
  - Clause `index == -1`: pinned; Phase 2 emits nothing for `index`.
  - Clause `0 <= index < a.Length && a[index] == x`: refined `lo = 0`, `hi = a.Length - 1`. Phase 2 emits `index = 0` and (if not subsumed) `index = a.Length - 1`.

Each Phase 2 query pins only `index`; the array and `x` remain free, so Z3 is forced to construct inputs that actually produce that specific `index` value.


## Repetition (`-r`)

The `--repeat <n>` option generates **N distinct test cases** per scenario. After finding a satisfying assignment, Z3 is asked again with an additional constraint excluding the previous solution, producing a different input. This is useful for increasing confidence that a scenario works across multiple input values, not just the first one Z3 happens to find.


## Progressive Auto Strategy (default)

When no explicit strategy flag (`-a`, `-b`, `-s`, `-r`) is given, DafnyTestGen uses a **progressive strategy** that escalates until enough tests are generated per method (controlled by `--min-tests`, default 4):

1. **Phase 1 — DNF clauses**: All clauses are solved directly using short-circuit safe DNF decomposition (including the existential and universal quantifier decompositions described above). Syntactic contradiction detection prunes infeasible clauses before Z3. Duplicate literals across generated clauses are deduplicated during cross-product.

2. **Phase 2 — Refined-range BVA** (only when Phase 1 yields < `--min-tests`): For each (DNF clause, variable), solve the refined range from `classLiterals` and emit one SMT query per boundary value (endpoints + interior + symbolic relational bounds). Single-fault: one variable pinned per query.

3. **Phase 2b — Type/size coverage** (only when still < `--min-tests`): For each (DNF clause, variable) not covered by Phase 2, emit categorical pins (nat/int/bool/real tiers, seq/set cardinality tiers, enum constructors, mutation pre-vs-post pair). Still single-fault. Because each query pins exactly one variable, inputs and outputs are never simultaneously constrained to boundary values in the same query.

4. **Phase 3 — Repeats**: Generate additional distinct inputs per clause (up to 3 per clause) until the minimum test count is reached for a method.

**Subsumption pruning.** To maximize diversity with a limited number of test cases, across all phases (except phase 3), each candidate `(clause, tier)` entry is first checked against already-generated test cases: if a prior test case (with its inputs and outputs pinned) already satisfies the candidate's literals and tier constraints under Z3, the candidate is skipped and no new Z3 search is launched. This eliminates redundant tests from overlapping `exists` decompositions in Phase 1, and from output/input boundary tiers in Phases 2/2b that are already witnessed by an earlier model. The check is bounded to the most recent 20 prior cases and is conservative on translator failures (no pruning when the pin can't be built).


## Class Support

DafnyTestGen generates tests for methods defined inside classes. Classes with trait parents or unsupported field types are auto-skipped.

Fields are treated as synthetic mutable parameters with separate pre- and post-state SMT variables (suffixes `_pre` and `_post`). Generated test code constructs a fresh object, assigns Z3-derived values to its fields, captures any `old()` state needed by postconditions, calls the method, and asserts postconditions using `obj.field` references.

Constructor parameters are extracted and used for object construction (e.g., `new StackOfInt(capacity)`). `const` array fields (e.g., `const elems: array<int>`) are handled as mutable-content arrays linked to constructor parameters via `ensures` clauses. Parameterless member predicates like `isEmpty()` and `isFull()` are inlined in preconditions.

### Support for `{:autocontracts}`

For classes with the `{:autocontracts}` attribute, the `Valid()` predicate (expressing class invariants) is automatically injected as both an implicit precondition and postcondition; its body is inlined for SMT translation so it constrains both pre- and post-state. Heap ownership constraints (`this in Repr`, `data in Repr`) are automatically stripped during SMT encoding, and `Repr` is reconstructed in test code as `{obj}` plus all object-typed (array) fields.

### Ghost field handling

Ghost fields (`ghost var`, `ghost const`) are fully supported:

- The `ghost` qualifier is stripped from field and constant declarations in the generated file, making them concrete (compilable) so test code can assign and read them directly.
- Ghost sequence fields (e.g., `ghost var s1: seq<T>`) are assigned from the Z3 model as sequence literals. In `{:autocontracts}` classes, such fields (e.g., `Elements: seq<int>`) are also threaded through the SMT query as inputs.
- Ghost constants already set by the constructor (e.g., `ghost const N: nat`) are left untouched.
- `old()` wrappers are stripped from method bodies in the emitted test file (they are invalid for non-ghost variables in compiled code). The semantics are preserved because `old(x)` at an assignment site refers to `x`'s value before the enclosing method call, which is still the current value at the assignment point itself.

## Test Emission

For each processed source file (e.g., `FindMax.dfy`), DafnyTestGen writes a new file with the suffix `Tests` (e.g., `FindMaxTests.dfy`) containing the original source plus the generated tests. If the source already defines `Main`, it is renamed `OriginalMain`. Ghost functions and predicates have their `ghost` qualifier stripped so they can be called from `expect` assertions at runtime.

### Grouping (`--grouping` / `-g`)

Two options control how test cases are grouped in the emitted file:

- **`by-method`** (default) — one test method `TestsFor<M>()` per source method `M`. Failing tests (detected by `--check`) are placed alongside passing ones with their `expect` lines commented out and a `// FAILING:` header.
- **`by-status`** — a single `Passing()` method holding all passing tests from every source method, plus a `Failing()` method for failing ones. Failing tests have their `expect` lines commented out.

In both cases, `Main()` calls all emitted test methods so a single `dafny run` or `dafny build` executes every non-failing test.

A typical test case assigns concrete input values produced by Z3, calls the method under test, and checks the returned outputs with `expect` assertions (using the output values produced by Z3):

```dafny
method FindMax(a: array<real>) returns (max: real)
  requires a.Length > 0
  ensures exists k :: 0 <= k < a.Length && max == a[k]
  ensures forall k :: 0 <= k < a.Length ==> max >= a[k]
{...}

method TestsForFindMax()
{
  {
    var a := new real[2] [0.5, 0.0];
    var max := FindMax(a);
    expect max == 0.5;
  }
  ...
}

method Main()
{
  TestsForFindMax();
}
```

### Output uniqueness check

When postconditions constrain outputs implicitly (via predicates on outputs rather than explicit `result == expression` clauses), Z3's first model is only *one* valid assignment — other valid outputs may exist. DafnyTestGen issues a second Z3 call that pins the concrete inputs and asks whether a *different* output satisfies the original contract. If the second call returns UNSAT the output is unique and the concrete value is used in the `expect`; otherwise the assertion falls back to the postcondition literals that mention the output.

The uniqueness query is built from the **original ensures conjunction only** — tier/boundary literals used during test generation (e.g., an `index == 0` boundary forcing one branch) are excluded, so the check reflects the spec's real ambiguity rather than the tier's artificial pinning.

Example:

```dafny
method LinearSearch(a: array<int>, x: int) returns (index: int)
  ensures if exists k :: 0 <= k < a.Length && a[k] == x
          then 0 <= index < a.Length && a[index] == x
          else index == -1
{...}

// Unique output: concrete expect
{
  var a := new int[3] [17, 8, 24];
  var x := 8;
  var index := LinearSearch(a, x);
  expect index == 1;
}

// Ambiguous output (both index 0 and 1 are valid): postcondition expect
{
  var a := new int[2] [9, 9];
  var x := 9;
  var index := LinearSearch(a, x);
  expect 0 <= index < a.Length;
  expect a[index] == x;
}
```

With `--uniqueness-rounds N` (`-u N`), the tool iteratively enumerates up to N alternative valid outputs. If all valid outputs are exhaustively found (the final uniqueness check returns UNSAT), a disjunctive `expect` is emitted instead of falling back to postcondition literals:

```dafny
// Ambiguous output with --uniqueness-rounds 3: exhaustively enumerated
{
  var a := new int[2] [9, 9];
  var x := 9;
  var index := LinearSearch(a, x);
  expect index == 1 || index == 0;
}
```

This is more precise than postcondition literals (it pins the exact set of valid outputs) while still being correct for any conforming implementation. Each round is a lightweight Z3 call (~100ms) with pinned inputs. When the number of valid outputs exceeds the round cap, the tool falls back to postcondition literals as before.

The same fallback applies when postconditions cannot be fully translated to SMT (e.g., they contain recursive functions with uninterpreted calls remaining after inlining, higher-order ghost functions, or bitvector operators): Z3's concrete outputs cannot be trusted and the original postcondition literals are used as `expect` assertions instead.

**Limitation — residual uninterpreted functions.** When the spec references user-defined functions that remain uninterpreted after 2-pass inlining (typically recursive functions like `Count`, `Power`, `R`), the uniqueness enumeration is **skipped entirely**. Z3 is free to assign arbitrary values to uninterpreted-function calls, so a "different output satisfying the spec" query would fabricate phantom alternatives that do not reflect real semantics. For example, in `Mode([-6, -1, -1, 0])` the true mode is `-1`, but without this skip Z3 happily reports `m = 0` as an alternative (by picking `Count(0) = 2, Count(-1) = 1`). DafnyTestGen detects such cases (any `declare-fun` with non-empty arity remaining in the SMT query) and emits a single observed-value `expect` derived from the check-mode runtime instead of a disjunctive enumeration. The original postcondition literals are still emitted as `expect` assertions. The **per-literal relevance check** applies the same skip rule for the same reason.

### Test emission for mutable objects and class fields

When an `expect` assertion refers to the pre-call value of a mutable input or class field (via `old()`), the generator captures that value into a local variable before the call and uses the captured name in the assertion. For member predicates/functions inside `old()` (e.g., `old(Empty())`), the pre-call evaluation is captured into a variable like `var old_Empty := obj.Empty();` so the assertion can be checked at runtime.

For a mutable array output from a module-level method:

```dafny
// Odd numbers moved before even numbers (with arbitrary ordering in each category)
{
  var a := new nat[3] [0, 4894, 1];
  var old_a := a[..];
  PartitionOddEven(a);
  expect !exists i, j :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j]);
  expect multiset(a[..]) == multiset(old_a);
}
```

For a method on a class, the generated test constructs the object via its constructor, assigns Z3-derived values to its fields, captures any needed `old()` state, calls the method, and asserts the postconditions against `obj.field`. For `{:autocontracts}` classes, `expect obj.Valid();` is additionally emitted to verify class invariants after the call.

```dafny
class {:autocontracts} StackOfInt {
  const elems: array<int>
  var size: nat

  predicate Valid() { 0 <= size <= elems.Length }

  constructor (capacity: nat := 100)
    requires capacity > 0
    ensures elems.Length == capacity && size == 0
  {...}

  method push(x: int)
    requires !isFull()
    ensures elems[..size] == old(elems[..size]) + [x]
  {...}
}

// Generated test case for push
{
  var capacity := 1;
  var obj := new StackOfInt(capacity);
  obj.size := 0;
  obj.elems[0] := 13;
  var x := 5;
  var old_elems_size := obj.elems[..obj.size];
  obj.push(x);
  expect obj.Valid();
  expect obj.size == 1;
  expect obj.elems[..obj.size] == old_elems_size + [x];
}
```

### Test emission for bodyless methods

By default, tests are also generated for bodyless methods (declared without an implementation body), but the method call and expects are commented out since there is nothing to invoke:

```dafny
method CalcFact(n: nat) returns (f: nat)
  ensures f == Fact(n)
```

```dafny
// Test case for combination {2}:
//   POST: !(n == 0)
//   POST: f == n * (if n - 1 == 0 then 1 else ...)
{
  var n := 1;
  // var f := CalcFact(n);
  // expect f == Fact(n);
}
```

This supports **test-driven development with Dafny**: write the contracts first, generate test scaffolding from the spec, then implement the method body and uncomment the calls. Use `--skip-bodyless` (`-p`) to skip bodyless methods entirely instead.

### Check Mode (`--check` / `-c`, default on; disable with `--no-check`)

Check mode is **on by default**. DafnyTestGen compiles the generated tests into a single Dafny file with `dafny build --no-verify` and runs the compiled binary. Each `expect` is replaced with a `CheckExpect` helper that prints `DONE:N` / `FAIL:N` markers instead of aborting, so all tests run to completion. If a test crashes (e.g., `IndexOutOfRangeException`) or times out (infinite loop), the remaining tests are automatically re-run individually against the same binary with a test-index argument — no recompilation needed. Each test case is then classified as passing or failing:

- Passing tests keep their `expect`s active.
- Failing tests have their `expect`s commented out (with captured expected/actual annotations) so the file still compiles. A `// FAILING:` header flags them in `by-method` grouping; in `by-status` they land in a separate `Failing()` method.

Use `--no-check` to skip validation entirely; in that case all generated tests are emitted without a pass/fail classification. When any bodyless method is present in the source, the check is auto-disabled (since `dafny build` fails on them) and unchecked tests are written with a warning.

### Runtime value injection in check mode

Check mode also rescues tests whose `expect` assertions would otherwise reference an untranslatable right-hand side. This applies specifically to postconditions of the form **`result == expression`** where Z3 was unable to produce a concrete value for `expression` during solving. During execution in the check phase, the value of the expression is captured (via a `RHSVAL:` print for the spec expression, evaluable at runtime because ghost modifiers are stripped from the test binary), and the captured value is injected back into the final test file as a concrete literal, replacing the original postcondition expect.

Two flavors of "unresolved RHS" benefit from this, both handled by the same mechanism:

1. **Z3 could encode the RHS but didn't fully unfold it** — typically a recursive or uninterpreted function that was only partially inlined into the SMT query, e.g. `ensures res == Comb(n, k)` where `Comb` is recursive. In default mode the expect is `expect res == Comb(n, k);`; in check mode it becomes `expect res == 4;` (the value Dafny computed at runtime).

    ```dafny
    function Comb(n: nat, k: nat): nat
      requires 0 <= k <= n
    { if k == 0 || k == n then 1 else Comb(n-1, k-1) + Comb(n-1, k) }

    method CalcCombIter(n: nat, k: nat) returns (res: nat)
      requires 0 <= k <= n
      ensures res == Comb(n, k)
    {...}

    // Generated test case
    {
      var n := 4;
      var k := 3;
      var res := CalcCombIter(n, k);
      // expect res == Comb(n, k);  // default mode
      expect res == 4;              // check mode (Comb(4,3) evaluated by Dafny)
    }
    ```

2. **Z3 couldn't encode the RHS at all** — operations beyond SMT's reach, such as bitvector XOR `^`, higher-order ghost functions like `Filter(s, p)`, or quantifiers over sets (`r == (forall x :: x in S ==> x > 0)`). Default mode leaves the postcondition literal in place; check mode captures the runtime value of the output and injects it, so `BitwiseXOR([3], [4])` becomes `expect result == [7];`. For `seq<char>` outputs a helper prints values in parseable `['a', 'b']` form since Dafny's default `print` renders strings as raw text.

Because the injector only captures **output variables and the RHS of equality-shaped postconditions**, not arbitrary subexpressions, postconditions that are not equality-shaped on an output (e.g., `ensures result > Filter(s, p)`) cannot be rescued this way — they remain as the original literal in the generated expect.

3. **Postcondition has no equality on an output, but implementation passes at runtime** — when postconditions constrain outputs only indirectly (e.g. `ensures AllPrime(f) && IsSorted(f) && ProdF(f) == n` for prime factorization), Z3's chosen model may be unreliable or simply one valid witness among many. In that case, after a test passes at runtime (the implementation's concrete output satisfied the postconditions), the observed output is injected as a supplemental `expect` with a marker comment:
    ```dafny
    method PrimeFactors(n: nat) returns (f: seq<nat>)
      requires n > 1
      ensures AllPrime(f) && IsSorted(f) && ProdF(f) == n
    {...}
    // Generated test case
    {
      var n := 4;
      var f := PrimeFactors(n);
      expect AllPrime(f);
      expect IsSorted(f);
      expect ProdF(f) == n;
      expect f == [2, 2]; // observed from implementation
    }
    ```
    The postcondition literals remain as primary oracles (they fail for any non-conforming output); the observed-value line is a supplemental pin users can review and loosen when the spec admits alternative valid outputs.

### Failing-test diagnostics (expected vs. got)

When a test fails at runtime, the `expect` assertions are commented out in the emmited test code. 

In the case of equality-shaped postconditions, besides the `expect` assertion with the expected output value (produced by Z3 or by the runtime value injection mechanism previously described), the buggy actual value is also shown as a trailing comment, as in ():

```dafny
// expect res == 1; // got 0
```

See [test/buggy_progs/out/CatalanBuggyTests.dfy](test/buggy_progs/out/CatalanBuggyTests.dfy) for a worked example (a `CatalanNumber` variant with `(i+2)` instead of `(i+1)` in the update step).




## Supported Data Types

| Type | Notes |
|------|-------|
| `int`, `nat`, `real`, `char`, `bool` | native SMT sorts |
| `array<T>`, `seq<T>`, `string` | bounded length (default up to 8); boundary analysis uses size tiers |
| Simple enum datatypes (e.g., `datatype Color = Red \| White \| Blue`) | constructors with no parameters; mapped to bounded integers, one boundary tier per constructor |
| `set<T>`, `multiset<T>` | `(Array Int Bool)` / `(Array Int Int)` over a bounded element universe (8 values); supports `in`, `\|·\|`, `+`, `*`, `-`, `<=`. Element types: `int`, `nat`, `char`, enums, `T`. `set<string>` also supported via an `(Array (Seq Int) Bool)` encoding with 8 short string constants |
| `map<K,V>` | parallel domain/values arrays over the same bounded key universe; supports `in`, `\|·\|`, lookup, merge. Key types: `int`, `nat`, `char`, enums, `T`. Value types: `int`, `nat`, `bool`, `real`, `char`, enums |
| Tuples (e.g., `(int, int)`, `(real, real)`) | decomposed into per-component SMT variables; usable as parameters, returns, and inside `array<·>` / `seq<·>`. Component types: `int`, `nat`, `real`, `char`, `bool` |
| `seq<seq<T>>`, `seq<string>` | native `(Seq (Seq T))` sort; outer length bounded to 8, inner to 4 |

Set, multiset, and map boundary analysis generates cardinality tiers (0–3 elements/keys). Collection literals in generated tests use Dafny display expressions (`{-1, 0, 3}`, `multiset{0, 2, 2}`, `map[-1 := 5]`). Generic type parameters are mapped to `Int` in SMT.

## Limitations

### Not currently supported

- **Traits** — methods in traits, and classes with trait parents (require dynamic dispatch).
- **Bodyless functions/predicates referenced in contracts** — the semantics are unknown, so the method is skipped.
- **Twostate predicates/functions** — reference two heap states and cannot be translated to SMT.
- **Function-typed parameters** (e.g., `P: T -> bool`, `f: int ~> int`) — cannot be represented in SMT.
- **Non-enum algebraic datatypes** (e.g., `List<T> = Nil | Cons(head: T, tail: List<T>)`, `Tree = Node(int, Tree, Tree)`), including when nested in generics.
- **Class/reference-typed method parameters** — Z3 cannot synthesise object values.
- **Multi-dimensional arrays** (`array2<int>`, `array3<real>`).
- **Nested collection types** other than `seq<seq<T>>`, `seq<string>`, and `set<string>` (e.g., `array<seq<T>>`, `set<seq<int>>`).
- **Class fields with collections of reference/tuple element types** (e.g., `set<Message>`, `map<int, (int, int)>`) — the class is auto-skipped.
- **`iset<T>`, `imap<K,V>` as input parameters**. These types work fine as *return* types when inputs are supported — the postcondition is used as a runtime `expect`.
- **Variable-indexed sequence slices in contracts** (e.g., `multiset(b[..i+j])`) — the tool falls back to **precondition-only test generation**: inputs are generated satisfying only preconditions (with boundary analysis for diversity), and the full postconditions are checked at runtime via `expect`.

### Supported with limitations

- **Complex quantifier nesting** may cause Z3 timeouts (5-second limit per query); a per-method timeout (default 60s, `--timeout`) prevents indefinite hangs.
- **Postconditions with multi-variable quantifiers over nested seqs** often cause Z3 to return `unknown`, limiting coverage.
- **Ghost predicates with unbounded quantifiers** — when `ghost` is stripped to make the predicate callable from `expect`, a predicate body like `forall r': int | r' > r :: ...` causes Dafny compilation errors (infinite domain cannot be enumerated at runtime).
- **Untranslatable preconditions** (e.g., referencing recursive predicates) are emitted as runtime `expect` checks marked `// PRE-CHECK`. In `--check` mode, tests whose preconditions are violated at runtime are automatically discarded (reported as `SKIP`) rather than failing — this catches cases where Z3 picks inputs satisfying the translated constraints but violating untranslated ones.

## Prerequisites

- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [Dafny](https://github.com/dafny-lang/dafny) (for `--check` mode and for running generated tests; parsing uses the `Microsoft.Dafny` NuGet package, which is bundled with the build)
- Z3 SMT solver (auto-discovered from the Dafny VS Code extension, or configurable via `--z3-path` / `Z3_PATH` env var)

## Build

```bash
cd DafnyTestGen
dotnet build
```

Or publish a self-contained standalone executable to the `publish/` folder:

```bash
dotnet publish -c Release -o ../publish
```

This produces `publish/DafnyTestGen.exe` (Windows) or `publish/DafnyTestGen` (Linux/macOS), which can be run directly without .NET installed on the target machine.

## Usage

Using `dotnet run` (development):

```bash
# Generate tests for a single file
dotnet run -- test/correct_progs/in/Factorial.dfy -o test/correct_progs/out/

# Generate tests for all files in a folder
dotnet run -- test/correct_progs/in/ -o test/correct_progs/out/

# Generate tests with verbose output (shows contracts, DNF, SMT queries)
dotnet run -- test/correct_progs/in/BinarySearch.dfy -o test/correct_progs/out/ -v

# Force boundary value analysis with 5 tiers
dotnet run -- test/correct_progs/in/Factorial.dfy -b -t 5

# Validate tests and split into Passing/Failing methods
dotnet run -- test/buggy_progs/in/abs__121-127_COI.dfy -o test/buggy_progs/out/ -c

# Skip bodyless methods (old behavior) instead of generating spec-only tests
dotnet run -- test/correct_progs/in/BodylessFactorial.dfy -o test/correct_progs/out/ -p
```

Using the published standalone executable:

```bash
# Windows
publish\DafnyTestGen.exe test/correct_progs/in/Factorial.dfy -o test/correct_progs/out/
publish\DafnyTestGen.exe test/correct_progs/in/ -o test/correct_progs/out/

# Linux / macOS
publish/DafnyTestGen test/correct_progs/in/Factorial.dfy -o test/correct_progs/out/
```

### Command-line options

| Option | Alias | Description |
|--------|-------|-------------|
| `--output <path>` | `-o` | Output file or directory |
| `--method <name>` | `-m` | Target a specific method (default: all) |
| `--verbose` | `-v` | Show debug info (contracts, DNF, SMT queries) |
| `--all-combinations` | `-a` | One test per FDNF clause |
| `--boundary` | `-b` | Boundary value analysis on inputs |
| `--simple` | `-s` | One test per DNF clause (default) |
| `--tiers <n>` | `-t` | Sequence/array/set/multiset/map size tiers for boundary analysis (default: 4) |
| `--check` | `-c` | Validate each test at runtime (default: on). Failing tests have their expects commented out. Auto-disabled for programs with bodyless methods |
| `--no-check` | | Disable runtime validation (overrides `--check`) |
| `--grouping <mode>` | `-g` | Test grouping: `by-method` (one `TestsFor<M>()` per source method, default) or `by-status` (`Passing()`/`Failing()` split) |
| `--repeat <n>` | `-r` | Generate N distinct test cases per scenario (default: 1) |
| `--min-tests <n>` | `-n` | Minimum test count for progressive auto strategy (default: 4) |
| `--max-tests <n>` | `-x` | Maximum number of generated tests per method (0 = unlimited) |
| `--timeout <n>` | | Timeout in seconds for test generation per method (0 = unlimited) |
| `--skip-bodyless` | `-p` | Skip bodyless methods instead of generating spec-only tests (default: generate spec-only tests with call/expects commented out) |
| `--uniqueness-rounds <n>` | `-u` | Max rounds of uniqueness checking to enumerate all valid outputs (default: 2). When all valid outputs are exhaustively enumerated, emit `expect out == v1 \|\| out == v2;` instead of postcondition literals |
| `--trust-unknown` | | Trust Z3 output values when uniqueness check returns 'unknown' (default: true). When true, concrete values are emitted even when Z3 can't fully prove uniqueness but found no counter-example. Set to false to fall back to postcondition literals for undecidable cases |
| `--no-bias` | `-nb` | Disable anti-trivial bias (soft constraints + randomized Z3 seed). By default, Z3 is nudged away from absorbing (0) and neutral (1) values so test inputs exercise real arithmetic for recursive specs (e.g. `Power`, `Factorial`) |
| `--no-relevance` | `-nr` | Disable per-literal relevance check. By default, for each clause Q1 ∧ … ∧ Qm Phase 1 first tries a Z3 query that forces inputs where every non-guard payload literal Qk strictly prunes outputs (e.g. `arr` with multiple duplicates of `elem` for `LastPosition`), replacing the plain clause test on SAT |
| `--no-forall-decomp` | `-nfd` | Disable forall size-tier decomposition. By default, clauses with a positive `forall` over a collection are split into `\|a\|=0`, `\|a\|=1`, `\|a\|>=2` sub-clauses (and inner tiers for `seq<seq<T>>`) to force non-vacuous witnesses |
| `--no-exists-multi` | `-nem` | Disable the "multiple entries" clause in exists-decomposition (keep left / middle / right boundaries only). By default, `exists k :: lo <= k < hi && P(k)` also produces a clause forcing ≥2 distinct positions satisfying `P` |
| `--z3-path <path>` | | Path to Z3 executable (default: auto-discover) |


## Project Structure

```
DafnyTestGen/
  DafnyTestGen.csproj    # C# project file (.NET 8.0)
  Program.cs             # CLI, orchestration, test generation loop (~800 lines)
  DafnyParser.cs         # Dafny AST parsing, method discovery
  DnfEngine.cs           # DNF decomposition, quantifier boundary decomposition
  SmtTranslator.cs       # Dafny-to-SMT2 translation, query building
  BoundaryAnalysis.cs    # Boundary value tiers, numeric/relational bounds extraction
  TestEmitter.cs         # Dafny test code generation, old() capture handling
  TestValidator.cs       # --check mode: run tests, split into Passing/Failing
  TypeUtils.cs           # Type checks, Z3 model parsing, value normalization
  Z3Runner.cs            # Z3 process execution
DafnyTestGen.sln         # Solution file
test/
  correct_progs/         # Correct Dafny programs
    in/                  #   Source files
    out/                 #   Generated test files
  buggy_progs/           # Buggy programs for --check mode
    in/                  #   Source files with known bugs
    out/                 #   Check mode output (Passing/Failing split)
```

The pipeline flows as: **DafnyParser** → **DnfEngine** → **BoundaryAnalysis** + **SmtTranslator** → **Z3Runner** → **TypeUtils** (model parsing) → **TestEmitter** → **TestValidator** (optional).


## License

MIT
