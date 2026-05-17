# DafnyCBT — methodology

Detailed reference for DafnyCBT's test-generation pipeline. The README gives a high-level overview and a quick-start; this page covers the algorithms, decomposition rules, BVA tiers, output-uniqueness analysis, class support, and test emission. Section structure mirrors the pipeline order.

## Vocabulary

- **DNF clause** — one disjunct of the contract's Disjunctive Normal Form. Each clause is a conjunction `Q1 ∧ Q2 ∧ … ∧ Qm` of literals (atomic spec predicates). Each clause defines an equivalence class of inputs/outputs.
- **Literal `Qk`** — one atomic predicate inside a clause (e.g. `arr[pos] == elem`, `0 <= pos`).
- **Test condition** — the (clause, optional boundary tier) pair that motivated a generated test. The emitted test carries the spec literals as a comment header.
- **Phase 1 / 1r / 1v / 2 / 2b / 3** — the six pipeline stages of the progressive-auto strategy. See [Phase architecture](#phase-architecture) below.
- **kill@k** — the number of methods whose first failing test is among the first `k` generated tests for that method (per-method local index). A higher kill@k means more bugs caught earlier in the budget. **kill@max** = the asymptotic count when `k = n` (the configured budget).
- **Tests/fail** — total tests of a phase emitted across the corpus, divided by the number of methods whose first-fail came from that phase. A cost-benefit ratio: lower = the phase contributes more first-fails per test it costs.
- **First-fail** — the first failing test in a method's test sequence (per-method local index). Used to attribute kills to specific phases.

## Phase architecture

DafnyCBT generates tests through a **progressive escalating pipeline**: each phase only runs if the previous phases haven't reached `--min-tests` (default 4). Phases:

| # | Name | Purpose | Tested in our corpus | Default |
|--:|---|---|--:|:--:|
| 1 | **Baseline DNF clause** | One concrete witness per DNF clause | always | ON |
| 1r | **Relevance check** | Replace the Phase 1 query with one that forces every safe literal to non-trivially prune outputs | when `--no-relevance` is not set | ON |
| 1e | **Establish check** | For a clause whose post is a *pure target-state predicate* (references modified state; no `old(...)`; no return-only vars), generate an input where the clause is **false on the pre-state**, forcing the method to actively establish it. Kills mutants that only pass because the input was already in the goal state (e.g. array already partitioned for `FIND`, already sorted for a sort). The `/Estab` witness is also registered as a Phase 3 base carrying the hard `¬Post(pre)` constraint in `extras`, so Phase 3 repeats yield a *budget-scaling family* of distinct `¬Post(pre)` inputs (single-shot at low `-n`, deterministic once budget allows enough samples for content-pattern-sensitive kills). Runs **before** 1v. `/Estab` label. Disable with `--no-establish` | when applicable | ON |
| 1v | **Vacuity check** (CEGIS) | Find inputs where one literal is vacuously true — *for fault localisation*. Tries isolated witnesses first, falls back to non-isolated automatically | only with `--vacuity` | OFF |
| 1e-PreSat | **Pre-satisfied check** | Inverse of 1e: input where the clause is **already true** on the pre-state — the idempotent / no-op boundary. Runs **after** 1v. `/PreSat` label | only with `--presat` | OFF |
| 2 | **Literal-centric BVA** | Per-clause-per-relational-literal `E1 op E2`: emits boundary (`E1 = E2`), strict-companion (`E1 < E2` or `E1 > E2`), and chained-range mid (`LO < EXP < HI`) tiers. Legacy variable-centric extractor available via `--no-literal-bva` / `-nlbva` | when budget remaining | ON |
| 2b | **Type/size coverage** | Categorical tiers (`=0`, `>0`, `<0`; `\|s\|=0`, `\|s\|=1`, `\|s\|=2`, `\|s\|≥3` at default `--tiers 4`; enum constructors; pre vs post modification) | when budget remaining | ON |
| 3 | **Round-robin repetition** | Distinct alternatives per base (one query per base per round); alternates plain repeats with genuine relevance-style repeats when a `/Rel` witness exists; bases drop on plain UNSAT; cross-base input dedup with retry | when budget remaining | ON |
| post | **Vacuity annotation** | Per-test scan tagging every vacuous `Qk` with `// VACUOUSLY TRUE` for SFL precision | always | ON |

Phases 1 and 1r occupy **the same slot** — for each clause, 1r's enhanced SMT query is tried first; on UNSAT or unknown the plain Phase 1 query is the fallback. Phases 1v, 2, 2b, 3 add tests to the per-method test set in that order.

For empirical contributions of each phase, see [`empirical-evaluation.md`](empirical-evaluation.md).

---

## Equivalence Class Partitioning via DNF Analysis

Disjunctive postconditions and preconditions naturally originate multiple test scenarios. DafnyCBT converts all contract clauses to **Disjunctive Normal Form (DNF)**, producing a set of clauses that partition the input/output space as **equivalence classes**.

### DNF vs FDNF and the `-a` flag

DafnyCBT supports two decomposition modes:

- **DNF (default)** — *short-circuit-safe*. Each disjunctive operator produces a **partition** with mutually exclusive branches. For `A || B`: branches `A`, `!A ∧ B` (not `A`, `B`). Preserves the guard order Dafny uses for short-circuit evaluation, so generated tests never reach a guarded subexpression with the guard violated.
- **FDNF (`--all-combinations` / `-a`)** — *full disjunctive normal form*. Each disjunctive operator produces all 2^N − 1 non-empty subsets of branch satisfaction. For `A || B`: branches `A ∧ B`, `A ∧ !B`, `!A ∧ B`. Generates more clauses (more test scenarios) but **drops the short-circuit-safety guarantee**: tests may evaluate guarded subexpressions where the guard is false, potentially causing runtime errors (out-of-bounds, division by zero) before the spec violation is reported.

When to choose FDNF: only if you specifically want to test all combinations of independent disjuncts (e.g., a postcondition like `IsSorted(s) || IsReversed(s)` where you want both branches simultaneously). Otherwise, the default DNF is safer and produces fewer redundant tests.

### DNF decomposition rules

The DNF decomposition respects Dafny **short-circuit evaluation** of Boolean operators, to avoid generating test cases that would cause runtime errors. Consider the following example:

```dafny
method GetFirstOrZero(a: array<int>) returns (result: int)
  ensures a.Length == 0 ==> result == 0
  ensures a.Length > 0 ==> result == a[0]
```

The implication `A ==> B` is decomposed into mutually exclusive, short-circuit safe, DNF branches `!A` and `A ∧ B` (instead of `!A` and `B` as in standard DNF). Similarly, `A || B` produces branches `A` and `!A ∧ B`. For this example, the second ensures clause produces:

- `!(a.Length > 0)` — antecedent is false, implication vacuously true
- `a.Length > 0 ∧ result == a[0]` — antecedent holds, consequent must hold

With standard (unsafe) DNF, the branch `result == a[0]` alone would lack the `a.Length > 0` guard, possibly causing an out-of-bounds error.

The following table summarises the branching rules:

| Expression | DNF Branches |
|---|---|
| `A \|\| B` | `A`, `!A ∧ B` (a) |
| `A ==> B` | `!A`, `A ∧ B` |
| `A <==> B` | `A ∧ B`, `!A ∧ !B` |
| `A == B` (both Boolean, ≥1 side compound) | `A ∧ B`, `!A ∧ !B` (b) |
| `A != B` (both Boolean, ≥1 side compound) | `A ∧ !B`, `!A ∧ B` (b) |
| `!(A && B)` | `!A`, `A ∧ !B` |
| `if C then A else B` | `C ∧ A`, `!C ∧ B` |
| `x == (if C then U else V)` | `C ∧ (x == U)`, `!C ∧ (x == V)` |

(a) With FDNF, the branches would be: `A ∧ B`, `A ∧ !B`, `!A ∧ B`.

(b) **Boolean `==` / `!=` (how `bool == bool` is handled).** A Boolean-typed `==` is logically `<==>` and `!=` is `xor`; both are decomposed like `A <==> B` (into the `A ∧ B` / `!A ∧ !B` truth-assignment partition) — **but only when at least one side is a *compound* Boolean**. "Compound" means a predicate/function call, a quantifier, or a Boolean connective/comparison `BinaryExpr` — i.e. an expression with internal predicate structure. Bool detection uses the resolved type with structural fallbacks (quantifier, logical/comparison `BinaryExpr`, `!`, bool-result function call).

The rule **does not fire** in three cases, each kept as a single atomic conjunct:

- **Either side a Boolean literal** (`x == true` ≡ `x` — better atomic; the contradiction-pruner collapses the trivial second clause).
- **Either side an `if-then-else`** (the more specific `x == (if …)` rule applies instead).
- **Both sides atomic Boolean references** — a Boolean variable / field / `MemberSelect`, optionally wrapped in `old(...)`, or a bool literal. An `atom == atom` equality has no predicate structure to partition against, so the split adds **no behavioural distinction** while multiplicatively inflating the FDNF cross-product (it crosses two truth-assignment sub-clauses into *every* other clause). This specifically keeps **frame conditions** like `weekend == old(weekend)` ("the method does not change `weekend`") and **aliasing equalities** like `b1 == b2` atomic. Splitting a frame condition is pure waste: it doubles the per-method clause/test count with sub-cases the method's logic is independent of, diluting the fixed test budget across redundant clauses — a measured contributing cause of the `car_park` ROR `>=`→`==` survivor (the budget dilution pushed the killing Phase-2 BVA tier out of reach).

The motivating shape this rule *does* serve is the ubiquitous `method m(...) returns (b: bool) ensures b == pred(...)`: without the split, `b == pred(...)` stays atomic and Z3 is never forced into the `b ∧ pred` vs `¬b ∧ ¬pred` partition, so a defect in the `b`-computation that only diverges on (e.g.) the all-`pred`-satisfying input region is never exercised. Here one side (`pred(...)`) is compound, so the rule fires. Concrete win: `ExercisePositive`'s `mpositivertl` with `i := i-1` corrupted to `i := -i-1` returns `b=false` on every non-empty all-positive array; the `b ∧ positive(v[..])` clause forces exactly that input, flipping the mutant from never-killed to a deterministic kill at `-n 10`.

Both DNF and FDNF are computed bottom-up, starting from leaf literals, by a dual-return recursive function that produces both the DNF/FDNF of an expression E and of its negation simultaneously.

### Input-only ensures (preservation properties)

Not every `ensures` clause describes the *behaviour* of the method. A class invariant restated in the postcondition (e.g., `ensures Valid()`) is a **preservation property**: it asserts that the post-state still satisfies the invariant, but doesn't differentiate equivalence classes of the method's output. Decomposing such literals can produce a 2^k blowup in clause count (k = number of internal implications in `Valid()`) without adding test value — the sub-cases just split the input space on invariant configurations the method's logic doesn't depend on.

DafnyCBT therefore applies the following rule:

> **For a non-mutating method (no `modifies` clause), any `ensures` literal that does not reference a return parameter is kept atomic in the DNF** — it contributes as a single conjunct to every clause without being internally decomposed.

The literal is still emitted as a hard `assume` constraint in the SMT query; only its internal disjunctions/implications are skipped. Rationale: when a method has no `modifies` clause, all class state is immutable in its scope, so an ensures literal that references only pre-state values is semantically determined by the precondition, not by what the method does. For *mutating* methods (with a `modifies` clause), the rule is skipped — `ensures Valid()` may then meaningfully constrain how the mutation preserves the invariant.

**Example.** In a `TwoStacks` class with a non-mutating `search1` method whose contract includes both `requires Valid()` and `ensures Valid()`, the `Valid()` postcondition references no return parameter (only `this.*`). Without the rule, `Valid()` decomposes via its internal `|s1|!=0 ⇒ …` and `|s2|!=0 ⇒ …` implications into four sub-cases that cross-product with the actual behavioural ensures, producing eight DNF clauses indistinguishable on `search1`'s behaviour. With the rule, the DNF collapses to **two** clauses (one per outcome direction); existential-boundary tiers then drive the witness to non-top positions in the input sequence, killing the canonical "always-checks-top-of-stack" mutation that survives under the eight-clause regime.

### Cross-product and incremental pruning and simplification

With multiple `requires` and/or `ensures` clauses, their cross-product forms the full DNF/FDNF. After each pairwise merge, two passes are applied before the clause reaches Z3:

1. **Contradiction detection** — discards syntactically dead merges, never sending them to the solver. For each pair of relational literals on the same variable, the engine flags:
   - **Same LHS string, same RHS string, incompatible operators**: both sides matched purely on string equality of their canonical printed forms — neither side has to be a plain variable, so any pair of literals sharing the same operands fires the rule (`x == 5 ∧ x != 5`, `x == y ∧ x != y`, `arr[i] < c ∧ arr[i] >= c`, `f(y) in S ∧ f(y) !in S`). The check is symmetric in the two orientations, so `x == y ∧ y != x` is also detected. No semantic equivalence is performed: `x == y+1 ∧ x != 1+y` is missed because the strings differ.
   - **Numeric range with no overlap**: `x op1 a ∧ x op2 b` where both RHSs parse as numeric constants. Each relational literal defines an admissible interval for `x` (`x > 5` ↦ `(5, ∞)`, `x <= 10` ↦ `(-∞, 10]`, `x == k` ↦ `[k, k]`, etc.); the rule fires when the intersection of the two intervals is empty. Catches `x > 5 ∧ x < 3`, `x >= 10 ∧ x <= 5`, `x == 0 ∧ x > 0`, `x == 1 ∧ x == 2` (empty intersection of `[1,1]` and `[2,2]`), etc.

2. **Redundancy detection** — simplifies surviving clauses by collapsing redundant relational pairs.
   - **Same LHS string, same RHS string, overlapping operators** — dual of the incompatible operators rule:
     - Drop the weaker literal when a stronger one is present:
       - `a <= b` is dropped if `a == b` or `a < b` is present.
       - `a >= b` is dropped if `a == b` or `a > b` is present.
       - `a != b` is dropped if `a < b` or `a > b` is present.
     - Collapse a pair into a single literal:
       - `(a <= b) ∧ (a != b)` → `a < b`.
       - `(a >= b) ∧ (a != b)` → `a > b`.
       - `(a <= b) ∧ (a >= b)` → `a == b`.
   - **Numeric range overlap** — dual of the contradiction "no overlap" rule: when both RHSs parse as numeric constants (typically distinct), the literal whose admissible interval is a strict superset of the other's is dropped (it is implied by the tighter one). Examples:
     - `x <= 5 ∧ x < 10` → drop `< 10` (`(-∞, 5] ⊂ (-∞, 10)`).
     - `x >= 3 ∧ x > 0` → drop `> 0` (`[3, ∞) ⊂ (0, ∞)`).
     - `x == 5 ∧ x < 10` → drop `< 10` (`{5} ⊂ (-∞, 10)`).
     - `x != 10 ∧ x < 5` → drop `!= 10` (the hole at 10 is outside `(-∞, 5)`).

Negations are pre-canonicalised so the rules apply uniformly: `!(x == 0)` becomes `x != 0`, `!(x > 0)` becomes `x <= 0`, `!!X` becomes `X`, `!(X !in Y)` becomes `X in Y`.

In the `GetFirstOrZero` example above, the cross-product of the two ensures clauses in DNF mode nominally yields 4 conjunctions. After canonicalisation and the two pruning passes, contradictory merges drop out and the surviving clauses simplify:

| Cross-product merge (raw) | Post-pruning form | Verdict |
|---|---|---|
| `!(a.Length == 0) ∧ a.Length > 0 ∧ result == a[0]` | `a.Length > 0 ∧ result == a[0]` | SAT |
| `a.Length == 0 ∧ result == 0 ∧ !(a.Length > 0)` | `a.Length == 0 ∧ result == 0`| SAT |
| `!(a.Length == 0) ∧ !(a.Length > 0)` | `a.Length < 0`| UNSAT |
| `a.Length == 0 ∧ result == 0 ∧ a.Length > 0 ∧ result == a[0]` | false | Pruned |

With **FDNF**, each implication produces 3 clauses instead of 2, giving more combinations but losing short-circuit safety, namely by including the unsafe clause `a.Length == 0 ∧ result == 0 ∧ !(a.Length > 0) ∧ result == a[0]`.

### Relational-orientation canonicalisation

Before dedup/merge, every literal key is run through a canonicaliser that orients relational operators so syntactically-different-but-equivalent literals collapse to one key:

- `>` rewrites as `<` with swapped sides; `>=` as `<=` with swapped sides.
- `==` / `!=` swap to put the lexicographically smaller side on the left.
- balanced outer parens are stripped before parsing the operator.

So `0 <= pos` and `pos >= 0`, or `0 > pos` and `pos < 0`, or `a.Length > 0` and `0 < a.Length`, all map to a single key. This matters because DNF cross-products of `A ⟹ B` with `!A ⟹ C` routinely surface antecedent-vs-negated-antecedent pairs that are the same constraint in different parses. Without canonicalisation the per-literal relevance check treats them as separate safe-indices (emitting redundant `/RelQ` tests) and test-goal labels list each constraint twice. Applied uniformly to `originalDnfExprs` and `dnfExprs` so the inlined-vs-original literal-count comparison stays fair.

### Clause merging by input-projection equivalence

DNF cross-product of a disjunctive ensures with other clauses can split one logical outcome into several clauses that differ only in **output shape** over the **same input region**. For binary search, the not-found case splits into `pos < 0 ∧ val !in a` and `pos ≥ |a| ∧ val !in a` — same input region (`val !in a`), two sentinel encodings of "not found". Testing every shape adds no input-discrimination signal, so merging saves test slots. But the converse — LongestCommonPrefix's three maximality disjuncts `|prefix|==|str1| ∨ |prefix|==|str2| ∨ str1[|prefix|]≠str2[|prefix|]` — are **genuinely input-discriminable partitions**; merging those silently loses mutation kills. A purely syntactic input/output literal classification cannot tell the two apart: `pos ≥ |a|` and `|prefix| == |str1|` are structurally identical (`output_metric REL input_metric`) yet must be treated oppositely.

The only sound discriminator is **input-projection equivalence**. Define each clause's projection onto the inputs:

```
proj(T)(X) := ∃ Y . ( pre(X) ∧ typeof(Y) ∧ T(X,Y) )      -- Y = outputs + mutable-post
```

Two clauses A, B may be merged iff `proj(A) ≡ proj(B)` — i.e. no precondition-admissible input makes one feasible while the other is infeasible *for every output*. Equivalently, both `∃X. proj(A) ∧ ¬proj(B)` and its converse are UNSAT, where `∃X.(∃Y.A) ∧ (∀Y'. typeof(Y') ⇒ ¬B)`. `typeof(Y)` carries the output type bounds (`nat ⇒ Y≥0`, `char`, enum range) into the quantifier — these can *induce* a forcing input region that appears nowhere in the spec text (e.g. `y<x ∨ y>x` with `y:nat` splits because `proj(y<x)=x>0` comes only from `y≥0`).

This is decided by a Z3 probe, gated by two cheap sound heuristics:

- **H1** — no clause mentions any input ⇒ every projection is trivially the full region ⇒ merge all into one disjunction (handles `rand(): i==0 ∨ i==1`).
- **H2** — partition clauses by the canonical set of their **input-only** literals (mentions a pure input, nothing output/mutable). Clauses in different partitions have provably different input regions ⇒ never merged across. Sound regardless of precision, since splitting only ever costs a test slot, never a kill (handles `out<0 ∨ out>=n>0`, split by the input-only `n>0`).
- **Residue** (same input-only set, ≥ 2 clauses): pairwise projection probe against the group representative (projection-equivalence is an equivalence relation, so rep comparison suffices). The probe **declines → keep split** on non-scalar outputs (the flattened seq/array/set/map encoding cannot be soundly universally quantified — over-approximating its domain is the unsound-merge direction), uninterpreted residuals, or any Z3 `unknown`/`timeout`. Every decline is sound.

A confirmed-equivalent group keeps its shared input-only literals once and OR-s the per-clause remainders (`BinaryExpr(Or, …)`); an empty remainder collapses the group to the shared input region.

Effect: Exercise6 binary-search not-found sentinels merge (probe proves equivalence within the `val !in a` region) → fewer slots on operationally-equivalent clauses; LongestCommonPrefix's `seq` output declines the probe → all three maximality disjuncts stay split → the discriminating `|str1|=0,|str2|=1` test is generated and the mutant is killed. This replaces the earlier syntactic input-fingerprint key, which over-merged disjunctive `returns`-spec postconditions and silently lost kills.

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

Pass 1 substitutes `IsFirstOdd(a, index)` with its body, producing an `if C then A else B` expression that the DNF engine splits into two clauses. Pass 2 inlines the nested `IsOdd` calls. The resulting DNF branches (abbreviated) are:

- `index == -1 ∧ ∀i. ¬(a[i] % 2 == 1)` — no odd elements
- `index ≠ -1 ∧ 0 <= index < a.Length ∧ a[index] % 2 == 1 ∧ ∀i < index. ¬(a[i] % 2 == 1)` — index of first odd element

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

**Fallback when recursive residuals remain in postconditions after inlining.**

The `filter`-style case above works because the inlined post DNF-splits into multiple structural clauses — each guards a specific control-flow path, and BVA tiers within each clause then diversify inputs. For some recursive functions, however, the inlined post does **not** split: e.g. `sum == Max(a[..]) + Min(a[..])` after inlining becomes `sum == (if |a|==1 then a[0] else ...) + (if |a|==1 then a[0] else ...)`. DNF cannot distribute `==` over the `+` of two ITEs, so the whole post stays in a single DNF clause carrying residual `Max(...)` / `Min(...)` calls. Z3 then treats those residuals as uninterpreted, freely assigns values, and finds a SAT model on the cheapest input — typically the base case (`|a| = 1`) — where the mutant happens to agree with the spec. The mutant survives even though it misbehaves on every multi-element input.

When this pattern is detected — at least one DNF clause of the inlined post contains a function call whose callee is in the recursive set — DafnyCBT falls back to the same "drop the post as an SMT constraint" path used for `multiset(...)` / double-slice patterns: replace the ensures DNF with the trivial `true` clause, generate inputs purely from preconditions + BVA tiers + relevance constraints, and emit the **full postcondition expression** as a runtime `expect` in each test. Dafny's executor evaluates `Max([3,1]) + Min([3,1])` concretely at test time, so the spec is enforced — just at the test-execution stage rather than the input-generation stage.

The fallback is gated by `!hasNonInlinableFuncs` to avoid double-handling cases where the existing inlined-DNF-mismatch detector already flagged the spec (Fibonacci-style: `Fib`'s ITE splits the post into 2 clauses, the existing detector sets the flag, but the inlined DNF is still used for SMT input generation, giving BVA-diverse `n` values). For maxVal-style (single clause after inlining), only this new detector fires, and the result is diverse `|a|` values from BVA + correct expected outputs from runtime evaluation of Min/Max on each test input.

**Deeper unfolding for linear-recursive predicates in preconditions.**

Recursive predicates that appear in **preconditions** are a special case: shallow (depth-1) inlining leaves an uninterpreted residual recursive call that Z3 can certify only at the base case, collapsing the legal input space to one trivial witness. Concretely, for `requires Is2Pow(n+1)`:

```dafny
predicate Is2Pow(n: int) {
  if n < 1 then false
  else if n == 1 then true
  else n % 2 == 0 && Is2Pow(n / 2)
}
```

After one unfolding step, the body has `Is2Pow((n+1)/2)` still as an uninterpreted call. Z3 can certify the predicate only when `n+1 == 1` (base case) — so it picks `n = 0`. Every generated test ends up with `n = 0`, which short-circuits any method body that has a `if n == 0 then return …` guard before its recursive structure executes. Mutations in the recursive branch then survive untested.

The fix is to deep-unfold (depth 3) such predicates in preconditions, then DNF the result. Successive unfoldings expose the natural disjunctive structure of the recursion:

```
Is2Pow(n+1)  ≡  (n+1 == 1)              // n = 0
              ∨ (n+1 == 2)              // n = 1
              ∨ (n+1 == 4)              // n = 3
              ∨ (n+1 == 8)              // n = 7
              ∨ (deeper residual)
```

DNF splits these into one clause per power-of-2 → one test goal per concrete `n`. The resulting tests cover `n ∈ {0, 1, 3, 7}` and reach the recursive code path.

**Linearity gate (to prevent exponential blowup).**

Deep unfolding is applied only to **linear-recursive** predicates — those whose body contains at most one self-call. Functions with two or more self-calls (e.g. `Min(a) := if |a| == 1 then a[0] else var m := Min(a[..|a|-1]); if a[|a|-1] <= m then a[|a|-1] else Min(a[..|a|-1])` — two `Min` calls in the else branch) double the AST size on each unfold; at depth 3 they generate 2³ = 8 copies of the body, blowing past Z3's tractability. Such predicates stay at depth 1.

Detected automatically by `ComputeLinearRecursive` (count self-calls in the body). The gate also limits the unfolding to **preconditions**: in postconditions, even linear-recursive functions like `Count(s, x)` produce ITE-chained DNF clauses that explode the test suite size when cross-producted with the rest of the spec.

---

## Anti-trivial bias (`--no-bias` to disable)

Z3 minimizes model size by default, so it may pick special values that trivially satisfy the specification. E.g., without bias, tests for `PowerOfListElements([1,2,3,4], 2)` degenerate to `l = []` or `l = [0, 0]` — correct under the spec but useless as regression fixtures.

DafnyCBT adds two Z3-native nudges per query:

1. **Soft constraints** (`assert-soft`): for each primitive-typed input `v`, emit `(assert-soft (not (= v 0)) :weight 2)` and `(assert-soft (not (= v 1)) :weight 1)`. For sequences/arrays, also bias their length away from `0` (weight 1) and their first few elements away from `{0, 1}` (weights 2 and 1 respectively). Length-1 sequences are *not* explicitly dispreferred — an A/B test showed pushing toward `|s| ≥ 2` helps a few iteration-body defects but loses more single-element defects (off-by-one on singleton, value replacement, etc.). Soft asserts are satisfied-when-possible: if the hard constraints force `v = 0`, Z3 picks `v = 0` and simply pays the weight. **Zero cost on correctness.**

   **Magnitude caps** (also soft): each `int`/`nat` input gets `(assert-soft (<= v 10) :weight 3)` (and `(>= v -10)` for signed), and each `seq`/`array` gets `(assert-soft (<= (seq.len xs) 8) :weight 2)` plus element-magnitude caps at positions 0..2. Higher weight than the 0/1 nudges, so magnitude bound dominates when both are satisfiable. Keeps Z3 from picking e.g. `n = 4294966430` for recursive-function arguments that would time out the Dafny static checker — while still allowing large values when the spec demands them.

2. **Randomized seed**: `smt.arith.random_initial_value`, `smt.random-seed`, `sat.random-seed` are set from a deterministic per-method hash, so Z3 explores more of the model space while the solution remains reproducible.

Bias applies to every SMT query — Phase 1 (DNF), Phase 2/2b (BVA), the relevance query, and Phase 3 repeats — so even variables not pinned by a BVA tier still get nudged away from trivial values and into bounded magnitudes. It is skipped only in the uniqueness alt-enum query (where we *want* Z3 to freely enumerate all valid outputs, including zeros).

**Quantifier caveat**: Z3's optimize module does not fully support quantified constraints (`forall` / `exists`). When a clause contains a quantifier and the full query returns `unknown` under bias, DafnyCBT automatically retries the same query with bias off before falling through to the input-only fallback. This rescues cases like `IsPrime(n)`'s prime-witness clause, where bias + `forall k :: 2 ≤ k < n ==> n % k ≠ 0` made Z3 give up.

Pass `--no-bias` / `-nb` to disable both mechanisms.

---

## Per-literal relevance check (`--no-relevance` to disable)

The overarching goal of relevance checking — and of the layered strengthenings described in this section — is **full specification coverage**: every literal of every clause of the postcondition must be exercised non-trivially by at least one generated test, both for positive literals (`Q`) and negated quantifier literals (`!exists`, `forall ⇒ ¬body`). A test exercises `Q` non-trivially iff at the chosen input, removing or weakening `Q` from the spec would admit a *different* output than the one the implementation produces — i.e., `Q` is actively pruning the output space. For conditional postconditions (`forall var :: if C then A else B`), full coverage further requires that *both* branches of the ITE are exercised by some input. This is the spec-side analogue of MC/DC for branch coverage (see §"Relation to MC/DC" below) and it is what gives a generated test suite real fault-detection power.

Even with anti-trivial bias, Z3 can still satisfy a clause `P ∧ Q1 ∧ ... ∧ Qm` by picking inputs where a literal `Qk` is **trivially true**. The whole conjunction holds, but the literal that captures the method's distinguishing behaviour is **vacuously satisfied** (i.e., it adds no constraint on the valid outputs for the selected inputs), and so the spec is not really covered.

Example — `LastPosition(arr, elem)` returns the last index of `elem` in sorted `arr`. The "found" clause is:

```
elem in arr[..]                  // Q1
∧ 0 ≤ pos                        // Q2
∧ pos < arr.Length               // Q3
∧ arr[pos] == elem               // Q4
∧ elem !in arr[pos+1..]          // Q5
```

Without a relevance check, Z3 could pick `arr = [10]`, `elem = 10`, `pos = 0`. All five literals hold, but `Q4` and `Q5` are each vacuous (single-element array → nothing for each literal to prune). The defining behaviour is never exercised.

### Formulation

In general, let `X` be the tuple of input parameters and `Y` the tuple of output values. Each safe literal `Qk` is relevant iff there exist `X`, `Y`, and `Y_k` such that

```
pre(X)
∧ Q1(X, Y) ∧ ... ∧ Qm(X, Y)                                // Y satisfies the full clause
∧ Q1(X, Y_k) ∧ ... ∧ ¬Qk(X, Y_k) ∧ ... ∧ Qm(X, Y_k)        // clause minus Qk, with ¬Qk
```

![Output-space Venn diagrams illustrating per-literal relevance checking](DNF_Relevance_Checking.png)

Each panel shows the output space for a fixed input `X`: each `Qk` is the region of outputs admitted by that literal, `Y` is a full-clause witness, `Y_k` is a paired witness of `¬Qk` satisfying all other literals. Dashed boundaries mark literals redundant given the others (no `Y_k` can exist — the relevance check is UNSAT for that `Qk`). Panel (a) is the "strong" case the check rewards; (b) and (c) illustrate redundancy.

### Relation to MC/DC

This is in the spirit of [Modified Condition / Decision Coverage](https://en.wikipedia.org/wiki/Modified_condition/decision_coverage) but applied to a specification rather than to code, and with a different goal. Classical MC/DC demands, for each atomic condition, a pair of test cases where toggling that condition alone flips the overall decision outcome — the condition is shown to *independently affect* the true/false value of the whole decision. The per-literal relevance check here instead witnesses that each safe clause literal `Qk` *independently prunes the space of valid outputs*: the paired witnesses `Y` and `Y_k` share the same inputs `X` and satisfy every literal except `Qk`, so `Qk` is the one that distinguishes them — but nothing requires flipping the truth of a whole decision (clauses are emitted only in their fully-satisfied form). Effectively it is "MC/DC for postcondition literals as output-constraining clauses" rather than "MC/DC for branch conditions as true/false toggles". The safety filter (no guards, output-referencing, no uninterpreted-function fabrication) plays a role analogous to MC/DC's "strictly observable" requirement: it rules out cases where the witness of `¬Qk` is semantically vacuous.

### Modes (`--relevance-mode`)

DafnyCBT **embeds the relevance check inside Phase 1**: for each clause it collects the set `S` of [safe literals](#safety-which-literals-are-safe-to-negate) and asks Z3 a query involving shadow output blocks. Three modes are available:

| Mode | What the shadow block enforces | SAT means | UNSAT means |
|------|---|---|---|
| `combined` | One shadow `Y_k` per safe `k`, each negating `Qk` | Every safe `Qk` strictly prunes outputs simultaneously (richest witness) | Try per-literal sweep, then `group` (in `ladder`); otherwise fall back to plain Phase 1 query |
| `group` | One shadow `Y_G` satisfying non-safe literals + `¬(⋀_{k ∈ S} Qk)` | *Some* `Qk ∈ S` is non-redundant on this `X` (collectively) | The cluster `S` is collectively implied by guards — clause is genuinely redundant |
| `ladder` *(default)* | `combined` first; if UNSAT, **per-literal sweep** (one query per safe `k`); finally `group` | Richest witness when `combined` SAT; otherwise one `/RelQ<k+1>` test per individually-relevant `k`; otherwise the collective-witness `/Rel` from `group` | Only if every step UNSAT — fall back to plain Phase 1 |

**Per-literal sweep** — when `combined` is UNSAT but some safe `Qk` still individually prunes outputs, the ladder tries each safe `k` in turn with the single-literal query. This is needed when two safe literals mutually subsume each other: e.g. for `FirstEvenOddIndices` whose post has `forall i < evenIndex :: lst[i] is odd` (Q9) and `lst[evenIndex] % 2 == 0` (Q8), Q9 ∧ guards ⇒ Q8, so the Q8 shadow `¬Q8 ∧ Q9` is UNSAT — but Q9 alone is SAT on multi-even inputs (the shadow `evenIndex_alt = 1` works when `lst[0]` is also even). The sweep emits one `/RelQ<k+1>` test per individually-SAT `k`, deduped by input fingerprint. Multiple per-literal tests are valuable: each exercises a *different* literal of the spec, often producing structurally distinct inputs (e.g. multi-evens vs multi-odds) that expose defects the combined witness would miss.

Regardless of mode:

- **SAT** → emit `Y` as the clause's test case, labelled `{clause}/Rel`, and **skip** the plain clause query.
- **UNSAT** / **unknown** / empty `S` → fall back to the plain Phase 1 clause query.

All shadow-block constraints (the negated `Qk`, the surviving `Qj`s, and the `outs ≠ outs_alt` inequality) are emitted as **hard** `(assert …)` — they encode "*there must exist* a different output that flips this literal while keeping the rest valid", which is a logical question, not a preference. The anti-trivial bias and forall-non-vacuity preferences (see [behavioural-relevance constraints](#behavioural-relevance-constraints)) remain soft (`(assert-soft … :weight N)`) and stay on during the relevance query — soft asserts don't change SAT/UNSAT, only Z3's preferred model among satisfying assignments.

A concrete example where `ladder` matters: `LongestCommonPrefix(str1, str2)` has a DNF clause `|prefix|=|str1| ∧ prefix=str1[0..|prefix|] ∧ |prefix|≤|str2| ∧ prefix=str2[0..|prefix|]`. Under `combined`, the shadow block for `prefix=str2[0..|prefix|]` is UNSAT (given the other three literals, `prefix` is forced to equal `str2[0..|prefix|]` anyway), so pure combined falls through to the plain query which picks the degenerate `str1=[]`. Under `group`, the disjunction `¬(Q2 ∧ Q4)` is satisfiable when `str1=[a]` and `str2=[a]`, forcing a non-degenerate witness. `ladder` gets the non-degenerate witness for free.

For `LastPosition`, `S = {Q4, Q5}` (guards `Q2`, `Q3` excluded, as well as `Q1`, as it refers only to inputs). The query forces `arr` to contain *multiple* duplicates of `elem` (for `Q4`) and at least one value different from `elem` (for `Q5`) so all literals are **simultaneously non-vacuous**. Generated test:

```dafny
var arr := new int[4] [-10, -10, -10, -9];
var elem := -10;
var pos := LastPosition(arr, elem);
expect pos == 2;     // LAST occurrence of -10 (index 2), not the earlier ones at 0, 1
```

The four redundancy regimes for the "found" clause are exhaustively enumerated by varying duplicate-presence and distinct-value-presence in the input. For each input, the cells show the set of positions allowed *if only that literal were enforced* (with `Q2 ∧ Q3` always implicit, i.e. `0 ≤ pos < arr.Length`); the rightmost column gives the actual valid `pos` (intersection of both):

| Input | `Q4: arr[pos] == elem` allows | `Q5: elem !in arr[pos+1..]` allows | `Q4 ∧ Q5` | Regime |
|---|:---:|:---:|:---:|---|
| `LastPosition([5, 5, 6], 5)` | {0, 1} | {1, 2} | {1} | **Both relevant**. Phase 1r`/Rel` test. |
| `LastPosition([5, 6], 5)`    | {0}    | {0, 1} | {0} | **Q4 relevant, Q5 vacuous**. Phase 1v`/Vi5` test. |
| `LastPosition([5, 5], 5)`    | {0, 1} | {1}    | {1} | **Q4 vacuous, Q5 relevant**. Phase 1v`/Vi4` test. |
| `LastPosition([5], 5)`       | {0}    | {0}    | {0} | **Both vacuous**. BVA tier `\|arr\|=1` test. |

Corner cases such as vacuously-true clauses are covered by [per-literal vacuity check](#per-literal-vacuity-check-vacuity-to-enable) or by [Boundary Value Analysis](#boundary-value-analysis).

### Safety — which literals are safe to negate

Negating a guard literal can leave later literals referencing undefined indices, lengths, or out-of-bounds positions, and Z3 is free to pick arbitrary values on undefined terms — **producing spurious SAT** with no real semantic content. To avoid that, DafnyCBT classifies a literal `Qk` as safe iff:

1. `Qk` references at least one output variable **outside any `old(...)` wrapper**. Literals whose only output occurrences are wrapped in `old(...)` (e.g. `car !in old(carPark)`, `old(|carPark|) < N`) reference pre-state only; pre-state values are shared between `Y` and `Y_k`, so the per-literal query is UNSAT by construction. Filtering them upfront saves a Z3 call without losing any witness.
2. `Qk` is **not** a frame condition of the form `X == old(X)`. Such literals say "field X is preserved across the call" — trivially flippable by alt-`Y_k` (`Y_k`-X just takes a different value), but the resulting witness's input is unconstrained by the frame and reuses values Phase 1 already covers. Filtering them frees per-literal-sweep budget for genuinely informative literals.
3. `Qk` does **not** match any guard shape: `0 ≤ X`, `X ≥ 0`, `X > 0`, `X < |Y|`, `X < Y.Length`, `X ≤ |Y|-1`, `|X| ⟨op⟩ E`, `X.Length ⟨op⟩ E`. (These shapes typically protect a subsequent indexed access.)

The frame-condition and `old`-only filters matter most for `{:autocontracts}` class methods, whose DNF clauses are dominated by frame conjuncts (one per non-modified field) and pre-state guards (`car !in old(carPark)`, …). Without them, a single clause can spawn 5+ per-literal `/RelQ` tests that all probe the same success-case input shape, crowding out higher-value BVA tiers under tight budgets.

Literals whose negation would reference a residual uninterpreted function (typically a recursive user-defined function like `Count`, `Power`, `R`) are also excluded from `S`, because Z3 can fabricate function values on the `Y_k` side that satisfy `¬Qk` without reflecting real semantics, defeating the separation. Remaining literals in the same clause are still checked; the full clause's relevance check is skipped only when `S` becomes empty after this filter. Literals *not* referencing the uninterpreted function stay eligible — Z3 cannot exploit the function's freedom to dodge a negation that doesn't mention it.

Even when a relevance query yields a less-than-ideal choice of `X`, the emitted test remains correct: `Y` always satisfies the full clause, so the test case's `expect` conditions hold by construction.

### Behavioural-relevance constraints

On top of the abstract bite, two extra assertions are added to every Phase 1r query (both default-on, disable with `--no-modification-relevance` / `--no-forall-relevance`):

- **Modification relevance** — for any `modifies`-listed input, `pre ≠ post` must hold somewhere. Catches witnesses where the impl could legitimately do nothing: e.g. `reverse(a)` at `|a| = 1` is a no-op, vacuously satisfying the postcondition. With this constraint, Phase 1r picks `|a| ≥ 2` and exposes whether the loop body actually swaps elements.
- **Forall non-vacuity** — for every top-level `forall i :: lo ≤ i < hi ==> P(i)` (and symmetrically every `!exists i :: lo ≤ i < hi ∧ P(i)`, which is logically equivalent) in the **post**conditions, `lo < hi` is **preferred** (soft, `(assert-soft … :weight 100)`) so Z3 picks an input that maximises the count of non-vacuous foralls. Skipped for preconditions (a vacuously-true precondition is just a weaker context — BVA's tier-0 `|a|=0` exists precisely to cover that case). Soft (rather than hard) avoids UNSAT when multiple postcondition foralls have mutually-exclusive non-empty-range requirements: e.g. `forall i < evenIndex :: lst[i] is odd` and `forall i < oddIndex :: lst[i] is even` in `FirstEvenOddIndices` cannot both have non-empty range, since `lst[0]` would need to be both odd and even. A hard assert would make the entire relevance query UNSAT and fall back to a non-relevance witness; the soft form lets Z3 satisfy whichever foralls it can while still finding a non-trivial witness. The non-vacuity preference handles the *empty-range* failure mode; for `!exists` literals whose body has multiple conjuncts, the deeper "near-witness" failure mode is covered by [`!exists` near-witness strengthening](#exists-near-witness-strengthening) below.

### Stripped-existential strengthening

When a safe literal `Qk` is an existential `exists vars :: c1 ∧ c2 ∧ ... ∧ cn` whose **last conjunct** `cn` is itself a quantifier (typically a constraining inner `forall`), the bare `(¬Qk)` shadow lets Z3 satisfy the relevance query with degenerate inputs — e.g. picking the smallest existential witness, where the inner `forall` is vacuously true because no other index pair triggers its antecedent. A defect we want to expose may rely precisely on the inner quantifier *having substance*.

To force that substance, the shadow block additionally asserts the **stripped** existential

```
exists vars :: c1 ∧ c2 ∧ ... ∧ c(n-1)
```

so the combined shadow constraint becomes

```
… ∧ ¬Qk(X, Y_k) ∧ (∃ vars :: c1 ∧ … ∧ c(n-1))(X, Y_k)
```

i.e., *a witness exists for the first parts of the existential under `Y_k`, but the full `Qk` fails*. This pinpoints `cn` as the actively biting clause and steers Z3 toward inputs where the inner quantifier is non-vacuous.

A canonical case is `FindFirstRepeatedChar(s)` whose post is
`exists i, j :: 0 ≤ i < j < |s| ∧ s[i] == s[j] ∧ s[i] == c ∧ (∀ k, l :: 0 ≤ k < l < j ∧ s[k] == s[l] ⇒ k ≥ i)` —
the inner `forall` constrains `(i, j)` to be the *first* repeated pair. Without strengthening, Phase 1r is happy with `s = "aa"` (a single-pair witness, inner forall vacuous). With the stripped existential asserted, Z3 must find an input with at least two distinct repeat pairs (e.g. `s = "aabb"`), which exposes defects such as a missing loop early-exit guard — a correct implementation returns `c='a'`, but a buggy one that continues past the first match returns `c='b'`.

The strengthening is tried first; if UNSAT, the query is retried without it. So the refinement can only enrich Phase 1r witnesses, never lose them. It also composes cleanly with the existing `combined`/`group`/`ladder` modes — the strengthened query is built from whichever mode is active, then the standard fallback ladder runs.

This generalises [behavioural-relevance constraints](#behavioural-relevance-constraints) one level deeper: where forall-non-vacuity ensures *top-level* foralls in the postcondition are non-empty, the stripped-existential ensures *embedded* foralls (those occurring as the last conjunct of a postcondition existential) actually constrain the existential's witness on the chosen input.

### `!exists` near-witness strengthening

Symmetric refinement for **negated** existentials in postconditions: `!exists vars :: c1 ∧ c2 ∧ … ∧ cn`. The literal references inputs only (no output is bound), so the standard relevance shadow can't probe it (negating it would force `exists vars :: c1 ∧ … ∧ cn`, which by the spec's bi-implication structure typically contradicts a paired `result` literal and the shadow comes back UNSAT). Phase 1r then falls through to a plain query that picks the simplest input where the `!exists` holds *vacuously* — typically `seq=[]` or `seq=[c]` where the body has no near-witness — and the spec is again not really covered.

The fix is to soft-assert one **stripped existential per body conjunct dropped** alongside the spec's hard `!exists`. For `!exists vars :: c1 ∧ c2 ∧ … ∧ cn`, emit n soft assertions:

```
(assert-soft (exists vars :: c2 ∧ … ∧ cn) :weight 200)
(assert-soft (exists vars :: c1 ∧ c3 ∧ … ∧ cn) :weight 200)
…
(assert-soft (exists vars :: c1 ∧ … ∧ c(n-1)) :weight 200)
```

Each variant captures a different near-witness pattern. Z3's MaxSAT optimiser prefers the model that satisfies as many softs as possible — typically an input where every body conjunct individually has a witness, while the **full** conjunction still fails (so the spec hard-assert holds). This is the structurally-rich input that exposes the defect: positions 0..|s|-1 with the right "almost-witness" geometry to differentiate a correct implementation from a buggy one.

Two canonical cases:

- `IsDecimalWithTwoPrecision(s)` post: `!exists i :: 0 ≤ i < |s| ∧ s[i] == '.' ∧ |s|-i-1 == 2`. Body conjuncts: `s[i]=='.'` and `|s|-i-1==2`.
  - Drop `s[i]=='.'` → `exists i :: range ∧ |s|-i-1 == 2` forces `|s| ≥ 3`.
  - Drop `|s|-i-1==2` → `exists i :: range ∧ s[i]=='.'` forces a `.` somewhere.
  - Combined cost-0 model: `|s| ≥ 3` with `'.'` at a position other than `|s|-3` (the spec forbids `'.'` at `|s|-3`). A buggy implementation that drops `s[i]=='.'` from the loop guard would return true at `i=|s|-3`; the correct implementation returns false (no `'.'` at the matching index). The test FAILs on the buggy version.

- `has_close_elements(numbers, threshold)` post: `!exists i,j :: 0 ≤ i,j < |numbers| ∧ i != j ∧ abs(numbers[i] − numbers[j]) < threshold`.
  - Drop `i != j` → forces a pair (possibly `i=j`) with `abs < threshold`, i.e. `threshold > 0`.
  - Drop `abs < threshold` → forces `i != j` exists, i.e. `|numbers| ≥ 2`.
  - Combined cost-0 model: `|numbers| ≥ 2` with `threshold > 0` and no `i ≠ j` close pair. A buggy implementation that drops `i != j` from the loop guard would return true at `i=j=0` (`abs=0 < threshold`); the correct implementation returns false. The test FAILs on the buggy version.

These soft asserts are emitted in the **plain** query (Phase 1/2/2b) as well as the relevance shadow. The relevance-shadow case helps when the safe-index probe is otherwise structurally UNSAT; the plain-query case helps when `!exists` references inputs only and is filtered out of the relevance safe set entirely.

### Conditional-forall branch coverage

Symmetric refinement for **conditional foralls**: `forall var :: range ==> if C then A else B` (or directly `forall var :: if C then A else B` with no range implication). The body is an ITE — without further pressure, Z3 picks inputs where every `i` lands on a single branch (e.g. all elements satisfy `C`, all elements fail it), and defects that affect just one branch are invisible.

For each such forall, we soft-assert **both** branch witnesses:

```
exists var :: range ∧ C ∧ A      // then-branch witness
exists var :: range ∧ ¬C ∧ B     // else-branch witness
```

Z3's MaxSAT optimiser prefers a model that satisfies both, which forces the input to contain at least one element where `C` holds *and* at least one where it doesn't — full case-coverage of the ITE.

A canonical case is `ToLowercase(s)` whose post is

```dafny
forall i :: 0 ≤ i < |s| ==> if IsUpperCase(s[i])
                              then IsUpperLowerPair(s[i], v[i])
                              else v[i] == s[i]
```

Consider a defect in the implementation that omits the upper-case branch's body (so upper-case characters are silently skipped). Without ITE coverage, Z3 picks inputs like `s = []`, `['~']`, `['~',')']` — all non-upper-case, and the defect is invisible because the upper-case branch is never entered. With both branch witnesses asserted, Z3 picks an input like `s = ['Y','@','A']`: two upper-case (`Y`, `A`) plus one non-upper-case (`@`). The buggy implementation returns `v = ['@']` (length 1, not 3), violating `|v| == |s|`. The test FAILs.

The strengthening composes with — and is independent of — the existing forall non-vacuity preference (which guarantees `lo < hi`); together they cover the two main "missed coverage" failure modes for postcondition foralls.

These soft asserts are also emitted in the **plain** query (Phase 1/2/2b) at low weight (1), so non-relevance-driven witnesses still benefit from branch-coverage pressure when relevance probing is structurally UNSAT.

---

## Per-literal vacuity check (`--vacuity` to enable)

Phase 1r proves a literal `Qk` is **non-vacuous for at least one input** — i.e., it actively prunes the output space somewhere across all valid inputs. A complementary regime exists: `Qk` may be globally relevant (Phase 1r SAT) yet **vacuously satisfied** for some specific input tuple `X` — the other literals already force it true. Phase 1v (opt-in) generates *semantic boundary tests* that exhibit such per-input vacuity.

Example — `LastPosition(arr, elem)`:

- `Q5 = elem !in arr[pos+1..]` prunes whenever `arr` has duplicates of `elem` (Phase 1r SAT).
- But whenever `elem` occurs **at most once** in `arr`, `Q3 ∧ Q4` (range + `arr[pos] == elem`) pin `pos` to the unique occurrence, so `arr[pos+1..]` cannot contain another copy — `Q5` is automatically satisfied. Minimal witness: `arr = [X], elem = X, pos = 0`.
- Dually, whenever **every** element of `arr` equals `elem`, `Q4 = arr[pos] == elem` holds for any `pos`; the clause's remaining constraints force `pos = arr.Length - 1`. `Q4` is vacuous. Witness: `arr = [X, X, X], elem = X, pos = 2`.

### Formulation

Let `X` be the tuple of inputs, `Y` the tuple of outputs, and `Y'` an alternate output tuple. `Qk` is **vacuous for `X`** iff

```
¬∃ Y'. (∧_{j≠k} Qj(X, Y')) ∧ ¬Qk(X, Y')
```

For full SFL value, the witness `X` should make **only `Qk`** vacuous — i.e., every other candidate `Qj` admits an alternate output that breaks it (`Qj` is non-vacuous on `X`). DafnyCBT seeks an *isolated* witness:

```
∃ (X, Y, Y'_{j≠k}).  Pre(X) ∧ ⋀_j Qj(X, Y)                          (1) Y is a real witness
                  ∧ ⋀_{j≠k}  ⋀_{i≠j}  Qi(X, Y'_j) ∧ ¬Qj(X, Y'_j)   (2) each non-k Qj non-vacuous
                  ∧ ¬∃ Y''. (∧_{i≠k} Qi(X, Y'')) ∧ ¬Qk(X, Y'')      (3) Qk vacuous on X
```

The outer `∃ X` is handled by **CEGIS** with two phases per attempt:
- **Phase A** asks Z3 for a candidate `X` satisfying conditions (1) and (2) — one Z3 query. This is the same dual-block / shadow-output structure as Phase 1r's relevance query, but with safe indices = `candidates ∖ {k}` (every non-target literal must be active).
- **Phase B** pins `X` and checks (3) — one Z3 query. UNSAT confirms `Qk` is vacuous; SAT means `Qk` was pruned for this `X` (exclude `X`, retry); UNKNOWN bails.

When Phase A returns SAT, the model already contains concrete `Y'_j` witnesses proving every non-k `Qj` is non-vacuous, so isolation is **established by construction** — no per-`Qj` post-hoc check needed.

If Phase A returns UNSAT (no isolated witness exists for this clause), DafnyCBT **falls back automatically** to a non-isolated query: Phase A is replaced by the bare `∃ (X, Y). Pre ∧ ⋀ Qj` (no isolation precondition); Phase B is unchanged. The resulting witness still proves `Qk` vacuous on `X`, but other `Qj` may also be vacuous on the same `X` — informative for SFL but less surgical. Such tests are labelled `/V{k}` (no `i`) to distinguish from the isolated `/Vi{k}` form.

### Implementation notes

- **Per-candidate, not combined.** Unlike Phase 1r (which collapses all safe indices into one combined query), Phase 1v runs the CEGIS loop once **per** candidate literal `Qk`.
- **Two-mode CEGIS.** Try isolated first (Phase A = relevance-style query enforcing condition 2); on Phase A UNSAT, fall back to non-isolated (Phase A = bare SAT). Each mode has its own retry budget (3 attempts).
- **Subsumption pruning.** Pre-CEGIS: skip the candidate when a prior test of the same clause is *isolated-equivalent* — i.e. its ins makes `Qk` vacuous AND every other `Qj` non-vacuous. Post-CEGIS: drop the `/V{k}` registration when the witness is structurally identical to a prior test.
- **Phase 1r UNSAT skip.** Candidates where Phase 1r returned UNSAT are skipped (Phase 1 baseline already exhibits vacuity for those).
- **Magnitude-only bias.** Phase A drops the weight-1/2 anti-trivial pushes (steer values away from `0` / `1`) but keeps the weight-3 magnitude / length caps (`|n| ≤ 10`, `|arr| ≤ 8`). The trivial pushes conflict with isolated witnesses that require uniform arrays (`[X, X]`); the magnitude caps keep values readable.

Tests are labelled `{clause}/Vi{k+1}` when isolated, `{clause}/V{k+1}` when fallback (1-based literal index).

**Cost per candidate:** typically **2 Z3 queries per attempt** (1 Phase A + 1 Phase B), up to 3 attempts per mode, two modes worst case → ≤ 12 queries. With Phase A's relevance-baked isolation, one attempt usually suffices, so the realistic cost is ~2 queries per candidate.

### Per-test vacuity annotation (always on)

Independent of `--vacuity`, every test in the final suite is scanned by a post-phase **annotation pass**: for each safe-candidate `Qk` of its clause, run the Phase B query (`¬∃ Y'. ⋀_{j≠k} Qj ∧ ¬Qk`). If UNSAT, mark `Qk` as vacuously-true on this test's ins and the test emitter renders `// VACUOUSLY TRUE` next to the matching `POST Q{k}` line in the comment.

This means *every* test (Phase 1, 1r, 2, 2b, 3 — not just `/V` / `/Vi`) gets the per-Q vacuity signal. For SFL, a passing `/R` or `/B` test that happens to make `Qk` vacuous **does not** exonerate `Qk`'s implementation code: the annotation lets the SFL ranker discount that exoneration evidence per-Q. Cost: one Phase B query per (test, candidate), typically ≤ 4 queries per test.

### Role and limits

Phase 1v's primary value is **fault localisation**, not raw kill rate (on the buggy_progs corpus its kill-set was within 1–2 methods of strategies with vacuity disabled — anti-trivial bias plus seeded repetition already covers most boundary regimes). The `/Vi{k}` and per-test `// VACUOUSLY TRUE` annotations together provide:

- A vacuity-isolated test deterministically reaches an `X` regime where only `Qk` is implied by the rest. When such a test fails, the bug must lie in `Qj`'s code paths (since `Qk` is auto-satisfied) — a sharper pass/fail signal for SFL rankers like Ochiai / Tarantula.
- A passing `/Vi{k}` test exonerates only the non-`Qk` code paths; passing `/V{k}` (non-isolated fallback) is weaker but still useful.
- Per-test vacuity annotations let the SFL tool identify, for any test, *which* `Q` literals were actually checked — discounting test-passing exoneration for code that maintains a vacuous `Q` is the key to lifting suspicion ranking above the "every line covered by every test" plateau.

Demonstrating this rigorously requires statement-level coverage instrumentation and an SFL experiment on a corpus where the faulty statement is known — left as future work. See [`empirical-evaluation.md` §Vacuity](empirical-evaluation.md#vacuity) for the kill-rate numbers.

*Worked example — `LastPositionSorted` with a buggy binary-search implementation* (returns `mid` of the search range; correct for unique occurrences but wrong for duplicates):

- **`{2}/Vi4`** (`Q4 = arr[pos] == elem` vacuous, `Q5` active): `arr = [-9, -9], elem = -9, expected pos = 1`. Uniform array forces `Q4` to be auto-satisfied at any index; only `Q5` is doing real work. Buggy implementation returns 0 → **fails on `Q5`**. Localization: bug is in the duplicate-handling logic.
- **`{2}/Vi5`** (`Q5` vacuous, `Q4` active): `arr = [0, 1, 1], elem = 0, expected pos = 0`. Single occurrence → only `Q4` carries weight. Buggy implementation returns 0 → **passes**. Rules out lookup-path bugs in unique-occurrence regimes.

The pair (failing `/Vi4` + passing `/Vi5`) pinpoints the bug class to "duplicate handling" rather than just "somewhere in the method".

---

## Boundary Value Analysis

BVA complements equivalence class partitioning by testing at the **edges** and other structurally interesting cases of each equivalence class. DafnyCBT applies the **single-fault principle**: each BVA query pins exactly **one** variable to a boundary value; all other variables remain free for Z3 to choose. This avoids combinatorial explosion, prevents combining potentially conflicting constraints, and may facilitate fault localization.

Each DNF clause produced by Phase 1 already defines an equivalence class as the conjunction of precondition and postcondition literals. BVA attaches at most one extra pin per query on top of those class literals.

[Anti-trivial bias](#anti-trivial-bias---no-bias-to-disable) is applied to every BVA query as well. Only one variable is hard-pinned per query; the others remain free, so the soft-assert nudges steer them away from trivial values (`0`, `1`, empty / singleton collections) and into bounded magnitudes, producing tests that actually exercise the spec rather than degenerate corner cases.

### Phase 2 — literal-centric BVA

For each DNF clause, Phase 2 scans every relational literal in the precondition and postcondition (`E1 op E2` with `op ∈ {<, ≤, >, ≥}`, where `E1` and `E2` are arbitrary expressions — not necessarily bare variables) and emits two tiers per literal:

| Tier | SMT constraint | Purpose |
|---|---|---|
| **Boundary** | `(= E1 E2)` | Pins `E1 = E2` — the exact-at-boundary regime that ROR-mutated `≥` / `≤` → `==` bugs need (the buggy code catches the boundary but admits values strictly above/below). |
| **Strict-companion** | `(> E1 E2)` for `≥`/`>`, `(< E1 E2)` for `≤`/`<` | The strictly-above (or strictly-below) region — where the buggy ROR-mutated implementation admits inputs the original would have refused. |

Pure constant comparisons are skipped. Pairs of literals that form a chained range get an extra **mid-of-range** tier, and the boundary tiers are strengthened with the *opposite-end* strict constraint so the three tiers can't collapse to the same model:

| Chain shape | Tiers emitted |
|---|---|
| `LO ≤ EXP ≤ HI` (with `EXP` syntactically equal on both sides) | `EXP = LO ∧ EXP < HI`, `EXP = HI ∧ LO < EXP`, **mid**: `(and (> EXP LO) (< EXP HI))` |
| Strict variants (`<` on either side) | Same, with the boundary's `<`/`<=` matching the chain's strictness; boundaries dropped when their strictness makes them UNSAT |

The opposite-end strict constraint is the load-bearing part: without it, when the precondition admits `LO == HI` (degenerate single-point range), Z3 can satisfy *both* `EXP=LO` and `EXP=HI` tiers with the identical `LO == EXP == HI` model — collapsing two tiers into one and defeating boundary diversity. Forcing `EXP < HI` on the `=lo` tier (and `LO < EXP` on the `=hi` tier) keeps them structurally distinct whenever the range can be widened.

`EXP` can be any expression — bare variable, cardinality `\|s\|`, indexed access `arr[i]`, function call, etc. — so the scan reaches bounds the variable-centric extractor misses. Examples:

- `\|carPark\| ≥ normalSpaces - badParkingBuffer` (single literal) → boundary `\|carPark\| = K` and strict-above `\|carPark\| > K`. The strict-above is what catches an off-by-one defect (`==` instead of `≥`) that would admit `\|carPark\| > K` but be missed by a boundary-only test.
- `0 ≤ k ≤ n` (chain in CombNK's precondition) → boundaries `k=0 ∧ k<n`, `k=n ∧ 0<k`, and mid `0 < k < n`. The mid tier forces non-boundary `k` for FIND-style midpoint bugs.
- `m < arr[i] < M` (chain on indexed access) → boundaries `arr[i]=m+1`, `arr[i]=M-1`, and mid `m < arr[i] < M`.

**Existential boundary tiers**. Phase 2 also scans post-clause literals of the form `exists k :: lo <= k < hi && P(k)` and the equivalent negated-forall pattern `!(forall k :: lo <= k < hi ==> P(k))`, emitting up to three additional Phase 2 entries per quantifier — each adding ONE narrower constraint as an extra (the original quantifier STAYS in the clause):

1. **First satisfies** (`/Eb<n>=lo`): `lo < hi && P(lo)` — the property holds at the first position.
2. **Last satisfies, first doesn't** (`/Eb<n>=hi`): `lo+1 < hi && !P(lo) && P(hi-1)` — the property fails at the first position but holds at the last.
3. **Strict middle satisfies, neither end does** (`/Eb<n>=mid`): `lo+2 < hi && !P(lo) && !P(hi-1) && exists k :: lo+1 <= k < hi-1 && P(k)` — the property fails at both ends but holds at some strictly-interior position.

Each guard (`lo < hi`, `lo+1 < hi`, `lo+2 < hi`) reflects the minimum range size for the tier to be satisfiable: ≥1 element for `=lo`, ≥2 distinct positions for `=hi`, ≥3 elements for `=mid`. The mutex chain (`!P(lo)` on `=hi`, `!P(lo) ∧ !P(hi-1)` on `=mid`) forces the three tiers to pick *distinct* witnesses even when the predicate happens to hold at multiple endpoints — without it, Z3 could return the same input for `=lo` and `=hi` (when P is true at both lo and hi-1) and subsumption would prune one, losing a test.

This is the same idea as the chained-relation tiers — strengthen with a narrower constraint to force a non-degenerate witness — applied to existentials. Unlike a 3-way DNF clause split, the original existential literal STAYS in the clause; the boundary is just an extra. So no DNF inflation: N existentials in one clause yield 3·N Phase 2 entries, not 3^N DNF clauses. When Phase 1's plain witness already lands in one of the boundary regions, the corresponding tier is subsumed and skipped at solve time.

Consider the following example:

```dafny
method FindMax(a: array<int>) returns (max: int)
  requires a.Length > 0
  ensures exists k :: 0 <= k < a.Length && max == a[k]
  ensures forall k :: 0 <= k < a.Length ==> max >= a[k]
```

The `exists` literal yields three Phase 2 boundary tiers, decomposing into: (1) `max == a[0]`, (2) `max != a[0] ∧ max == a[a.Length-1]`, and (3) `max != a[0] ∧ max != a[a.Length-1] ∧ exists k :: 1 <= k <= a.Length-2 ∧ max == a[k]`. Combined with the Phase 2b size tiers (`|a|=1`, `|a|=2`, `|a|>=3`), this produces "max is first / last / strictly-middle" test scenarios.

Concrete win: consider a `LinearSearch3` defect that returns `position = -(n+1)` instead of `position = n+1` (a sign error). It only violates the spec `position == -1 || position >= 1` when the iteration index `n >= 1` — i.e. when the searched element appears at a non-trivial position in the input. Z3's default existential witness lands at the first or last index, where `n=0` makes `-(0+1) = -1` coincidentally match the "not found" sentinel and mask the bug. Without these tiers the defect escapes (0 fails on 20 tests under default options); with them, the `/Eb1=mid` tier picks `s1=[23,12,13]` (element at strict-middle index 1) and the test FAILs.

**Spec-coverage all-flipped tier (`/SC<i>`)**. For every post-clause literal of the form `!exists vars :: range ∧ c1 ∧ … ∧ cn` (with `n ≥ 2` body conjuncts after dropping range/guards), Phase 2 emits **one** entry per literal with extra-constraint

```
(exists vars :: range ∧ ¬c1 ∧ ¬c2 ∧ … ∧ ¬cn)
```

This is the truth-table row that no Phase 1r near-witness soft can reach. The Phase 1r drop-each softs (described in [`!exists` near-witness strengthening](#exists-near-witness-strengthening)) already cover the n single-conjunct-false rows in both the plain query and the relevance shadow — promoting those to hard Phase 2 tiers as well was tried and proved redundant. The all-flipped row is the missing piece: it can't be combined with any drop-each row inside a single test (drop-`j` forces `cj` false but the others true; all-flipped forces every body conjunct false), so it has to be a separate test. It targets COR-style mutations whose discriminator is the *whole* conjunction — defects where every individual conjunct can be true or false but the *combination* shifts truth value.

Concrete win: a COR_Iff defect on `has_close_elements` replaces `&&` with `<==>` in the existential body. With `numbers = [-62330.0, -62329.875]` and `threshold = 0.0`, the spec demands `result == false` (no pair has distance `< 0`), but the buggy code evaluates `false <==> false` as true at `i=j` and returns `true`. The drop-each soft pressure alone doesn't pick this input (each soft biases threshold to `> 0`); the `/SC2` all-flipped tier picks `threshold = 0` with two distinct numbers — the test FAILs.

**Subsumption pruning** at solve-time discards tiers whose witness is already covered by a prior test (typically Phase 1's `/Rel` witness lies in the strict interior, subsuming the mid tier).

Covered types: `int`, `nat`, `real`, and any expression that translates to an SMT-numeric value (cardinalities, indexed reads, etc.). The legacy variable-centric extractor (`--no-literal-bva` / `-nlbva`) walks input/output/field variables individually and emits boundary tiers per variable from extracted bounds — narrower than the literal-centric path because it can't see bounds on compound expressions.

### Phase 2b — type/size coverage

Categorical fallback, one pin per query, when Phase 2 does not cover a variable (or the variable's type isn't integer). Tiers:

- **`nat`**: `=0`, `=1`, `>=2`
- **`int`**: `=0`, `>0`, `<0`
- **`bool`**: `=true`, `=false`
- **`real`**: `=0`, `>0`, `<0`
- **enum datatypes**: one tier per constructor
- **seq / array / string**: `|v|=0`, `|v|=1`, `|v|>=2`
- **set / multiset / map**: `|v|=0`, `|v|=1`, `|v|>=2`

As in Phase 2, this applies uniformly to inputs, outputs, and mutable class field post-states. Each tier is one pin per query (single-fault principle).

Tier is skipped if `classLiterals` already implies it, or if Phase 2 already emitted an equivalent pin.

Phase 2b interleaves tier emission **round-robin across DNF clauses**: the i-th tier of every clause is emitted before any clause's (i+1)-th. Within a clause, tier order is preserved (per-variable, per-position). Without this, with k clauses and a small test budget the schedule could spend its entire allocation on the first clause's tier sequence and starve later clauses entirely — e.g. `FindFirstRepeatedChar` has clauses `!found ∧ forall ... s[i] != s[j]` and `found ∧ exists ... s[i] == s[j]`; clause-major emission used the whole budget on the `!found` clause's `|s|=1`, `|s|=2` tiers, leaving the `found` clause with only its Phase 1 baseline.

#### Modification tiers (post vs pre)

For mutable variables mentioned in `ensures` **both** as post-state and inside `old(...)`, Phase 2b also emits a pair: `x = old(x)` (no-op path) and `x != old(x)` (actually-modified path). Applies to mutable array parameters, mutable scalar class fields, and mutable array/seq class fields. This is important to make sure that the test suite will detect vacuous implementations that leave the mutable state unchanged when the spec demands a change.

### Walkthroughs

**`CalcComb(n, k)`** — combinatorial coefficient:

```dafny
method CalcComb(n: nat, k: nat) returns (res: nat)
  requires 0 <= k <= n
  ensures res == Comb(n, k)
```

Three DNF clauses (after inlining `Comb`'s body):

- `k == 0`: refined `lo = hi = 0` → pinned; Phase 2 emits nothing for `k`.
- `!(k==0) && k == n`: pinned to `n`; Phase 2 emits nothing for `k`.
- `!(k==0) && !(k==n)`: `0 <= k <= n` tightened by `k != 0` → `lo = 1`, by `k != n` → `hi = n-1`. Phase 2 emits `k = 1` and `k = n-1` (strict-interior endpoints).

**`LinearSearch(a, x)`** — linear search over an array:

```dafny
method LinearSearch(a: array<int>, x: int) returns (index: int)
  ensures if exists k :: 0 <= k < a.Length && a[k] == x
          then 0 <= index < a.Length && a[index] == x
          else index == -1
```

- Clause `index == -1`: pinned; Phase 2 emits nothing for `index`.
- Clause `0 <= index < a.Length && a[index] == x`: refined `lo = 0`, `hi = a.Length - 1`. Phase 2 emits `index = 0` and (if not subsumed) `index = a.Length - 1`.

Each Phase 2 query pins only `index`; the array and `x` remain free, so Z3 is forced to construct inputs that actually produce that specific `index` value.

---

## Repetition (`-r`)

The `--repeat <n>` option generates **N distinct test cases** per scenario. After finding a satisfying assignment, Z3 is asked again with an additional constraint excluding the previous solution, producing a different input. This is useful for increasing confidence that a scenario works across multiple input values, not just the first one Z3 happens to find.

## Progressive Auto Strategy (default)

When no explicit strategy flag (`-a`, `-b`, `-s`, `-r`) is given, DafnyCBT uses a **progressive strategy** that escalates until enough tests are generated per method (controlled by `--min-tests`, default 4). The pipeline is:

1. **Phase 1 — DNF clauses**: All clauses are solved directly using short-circuit safe DNF decomposition (including the existential and universal quantifier decompositions described above). Syntactic contradiction detection prunes infeasible clauses before Z3. Duplicate literals across generated clauses are deduplicated during cross-product.
2. **Phase 2 — Literal-centric BVA** (only when Phase 1 yields < `--min-tests`): For each relational literal `E1 op E2` (op ∈ {<, ≤, >, ≥}) in the clause's pre/post conjuncts, emit a boundary tier (`E1 = E2`), a strict-companion tier (`E1 < E2` or `E1 > E2` depending on the original direction), and chained-range mid tiers when a triangulation `LO < EXP < HI` is detected. Each tier becomes one SMT query. Pass `--no-literal-bva` / `-nlbva` to fall back to the legacy variable-centric extractor (per-variable boundaries from extracted bounds).
3. **Phase 2b — Type/size coverage** (only when still < `--min-tests`): For each (DNF clause, variable) not covered by Phase 2, emit categorical pins. Still single-fault.
4. **Phase 3 — Round-robin repeats**: Iterate every distinct schedule entry that produced a test (in original schedule order: Phase 1/1r `/Rel` first, then Phase 2 BVA, then Phase 2b tiers). Each base keeps its full label and extras. One round = one query per surviving base; a base that returns plain UNSAT is dropped permanently (its singleton tier or input-exclusion list is exhausted). For bases with a `/Rel` context, the per-base round counter alternates between plain (`{base}/R{n}`) and relevance-style (`{base}/Rel/R{n}`) queries; a `/Rel`-style UNSAT marks the base as Rel-exhausted but does not drop it (plain still works). When a SAT result's input fingerprint matches an already-seen test (cross-base duplicate), the test is *not* added — the duplicate's input is pushed onto the base's exclusion list to force a different witness next round, and the loop continues until unique-test count reaches the budget. **Length progression**: for an open-length tier base (`/O|<var>|>=K`), each successful repeat additionally appends a length-only exclusion `(not (= (seq.len v) L))` for the length `L` it just used, so the next round's anti-trivial bias picks a strictly larger length (K, K+1, K+2, …). The base drops naturally when the next length is incompatible with other constraints (e.g. precondition-imposed length cap). The exclusion list is **seeded** at the start of Phase 3 with a length exclusion derived from the base's own Phase 2 witness, so the very first repeat is forced to pick a length strictly different from the base's. Without seeding, when the test budget is small (e.g. `-n 10`), the first repeat can return another length-K result with different elements (passes input-fingerprint dedup), the budget is exhausted, and the post-emit length progression never gets a chance to ratchet up. Concrete win: a `Clover_reverse` defect where `i := i + 1` is corrupted to `i := -i + 1` only diverges from the correct implementation on length-4+ palindromic inputs (length 0–3 takes the same path through the loop guard `i < a.Length / 2`); without seeding the `/O|a|>=3` tier kept producing length-3 tests and the defect escaped detection, with seeding the second test reaches length 4 and FAILs. Singleton tiers (`|*|=K`) and BVA boundary tiers (`/B…`) are unaffected — their constraint already pins the size on every round. The loop terminates when all bases drop or the budget is hit.

**Subsumption pruning.** To maximize diversity with a limited number of test cases, across all phases (except Phase 3), each candidate `(clause, tier)` entry is first checked against already-generated test cases: if a prior test case (with its inputs and outputs pinned) already satisfies the candidate's literals and tier constraints under Z3, the candidate is skipped and no new Z3 search is launched.

---

## Class Support

DafnyCBT generates tests for methods defined inside classes, including classes nested inside named modules. The constructor call is module-qualified (`new <Module>.<Class>(...)`) when needed so the generated test method (which lives in the default module) can resolve the type. Classes with trait parents or unsupported field types are auto-skipped.

Fields are treated as synthetic mutable parameters with separate pre- and post-state SMT variables (suffixes `_pre` and `_post`). Generated test code constructs a fresh object, assigns Z3-derived values to its fields, captures any `old()` state needed by postconditions, calls the method, and asserts postconditions using `obj.field` references.

Constructor parameters are extracted and used for object construction (e.g., `new StackOfInt(capacity)`). `const` array fields (e.g., `const elems: array<int>`) are handled as mutable-content arrays linked to constructor parameters via `ensures` clauses. Parameterless member predicates like `isEmpty()` and `isFull()` are inlined in preconditions.

### Support for `{:autocontracts}`

For classes with the `{:autocontracts}` attribute, the `Valid()` predicate (expressing class invariants) is automatically injected as both an implicit precondition and postcondition; its body is inlined for SMT translation so it constrains both pre- and post-state. Heap ownership constraints (`this in Repr`, `data in Repr`) are automatically stripped during SMT encoding, and `Repr` is reconstructed in test code as `{obj}` plus all object-typed (array) fields.

### Ghost field handling

Ghost fields (`ghost var`, `ghost const`) are fully supported:

- The `ghost` qualifier is stripped from field and constant declarations in the generated file, making them concrete (compilable) so test code can assign and read them directly.
- Ghost sequence fields (e.g., `ghost var s1: seq<T>`) are assigned from the Z3 model as sequence literals.
- Ghost constants already set by the constructor are left untouched.
- `old()` wrappers are stripped from method bodies in the emitted test file.

---

## Test Emission

For each processed source file (e.g., `FindMax.dfy`), DafnyCBT writes a new file with the suffix `Tests` (e.g., `FindMaxTests.dfy`) containing the original source plus the generated tests. If the source already defines `Main`, it is renamed `OriginalMain`. Ghost functions and predicates have their `ghost` qualifier stripped so they can be called from `expect` assertions at runtime.

### Making generated test code runtime-executable

Dafny's static verifier and its runtime compiler accept different fragments of the spec language: the verifier accepts unbounded quantifiers, ghost functions, chained relations, ghost fields, and `old()` wrappers everywhere; the runtime compiler imposes a "compilable" subset. Generated tests must satisfy the compiler's rules — they are executed by `dafny build`/`dafny run`, not just verified. DafnyCBT applies several transformations at test-emit time so the test setup (assigning Z3-derived values to ghost state, binding ghost return values, calling spec predicates) and the `expect` assertions all compile.

| Transformation | Why | Where |
|---|---|---|
| **Selective ghost stripping** on `function`/`predicate` | Ghost members aren't runtime-callable; `expect P(...)` fails to compile if `P` is ghost. But over-stripping breaks helpers that are *intended* to stay in ghost context | AST-based closure: walk the test method's `Req`/`Ens`/`Decreases` for `FunctionCallExpr`/`ApplySuffix`, BFS through callee bodies. Strip `ghost` only from names in the closure. Functions used only in lemma contracts or helper-method invariants stay ghost — their bodies (forall statements, calls to ghost helpers) keep their ghost context and skip compilability checks. Lemmas (ghost-by-construction) are never touched. |
| **Ghost field/parameter stripping** on `var`/`const`/method parameters | Tests need to assign Z3-derived values to ghost fields and bind ghost return values to local variables | Always applied (independent of the closure) — fields and parameters are storage shapes, not callable code. |
| **Ghost field assignability** — `ghost var`/`ghost const` become regular `var` | Tests need to assign Z3-derived values to ghost state to set up a starting world | Same regex pass, plus model-extraction code that emits assignments for ghost-typed fields. |
| **`old()` stripping** in non-spec lines (statements, asserts) | `old(x)` is a spec-only construct; uses outside `requires`/`ensures`/`invariant`/`decreases`/`modifies` don't compile | Per-test capture variables (`old_x := x;` before the call) replace `old(x)` in the emitted `expect`. |
| **Unbounded-forall rewrite** — `forall i: int :: A ∧ B ∧ …` (no top-level `==>`, no `\|`-range) → `(false)` | Such a forall is logically false (must hold for *every* int), but Dafny's runtime compiler can't enumerate ℤ to confirm. Rewriting to `(false)` gives the same semantics — the surrounding `==>` becomes vacuously true. | `RewriteUnboundedForalls` in `TestEmitter.cs`. Skips `forall vars \| range :: body` syntax (the `\|` provides bounded enumeration). |
| **Chained-bound rewrite** — `LO ≤ V1 ≤ V2 ≤ HI` → `LO ≤ V1 ≤ HI ∧ LO ≤ V2 ≤ HI ∧ V1 ≤ V2` | Cross-dependent bounds (V1 bounded by V2, V2 by V1) defeat Dafny's enumeration heuristic; the rewrite gives each variable an independent constant range plus a filter on their relation. Same semantics. | `RewriteChainedForallBounds` in `TestEmitter.cs`. Applied to PRE-CHECK and POST-emit paths. |
| **Vacuously-true literals commented out** | The post-vacuity scan tags each clause literal vacuous-on-this-input. Such literals pass trivially and add noise to the test body. Emitted as `// expect …; // VACUOUSLY TRUE on these inputs` instead of an active assertion. | `EmitTest` in `TestEmitter.cs`. Doesn't reduce kill rate — vacuous literals can't catch bugs by definition; the *other* literals of the same clause are still asserted. |
| **`--comment-uncompilable` fallback** | Catches the residual: if `dafny build` fails on an uncompilable expect we didn't transform, the offending lines are commented out with a `// UNCOMPILABLE (...)` marker and the build is retried. | Opt-in flag, off by default — failing-to-build is informative when a new uncompilable pattern appears. |

The combination of these passes lets DafnyCBT generate compilable tests for the great majority of corpus specs, including those using recursive predicates, autocontracts class invariants, and chained range quantifiers in postconditions. Specs that still fail to compile after these passes are rare and tend to come from `forall` *statements* inside non-ghost helper methods of the source — code we don't rewrite.

### Grouping (`--grouping` / `-g`)

Two options control how test cases are grouped in the emitted file:

- **`by-method`** (default) — one test method `TestsFor<M>()` per source method `M`. Failing tests (detected by `--check`) are placed alongside passing ones with their `expect` lines commented out and a `// FAILING:` header.
- **`by-status`** — a single `Passing()` method holding all passing tests from every source method, plus a `Failing()` method for failing ones.

In both cases, `Main()` calls all emitted test methods so a single `dafny run` or `dafny build` executes every non-failing test.

A typical test case assigns concrete input values produced by Z3, calls the method under test, and checks the returned outputs with `expect` assertions:

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

method Main() { TestsForFindMax(); }
```

### Output uniqueness check

When postconditions constrain outputs implicitly (via predicates on outputs rather than explicit `result == expression` clauses), Z3's first model is only *one* valid assignment — other valid outputs may exist. DafnyCBT issues a second Z3 call that pins the concrete inputs and asks whether a *different* output satisfies the original contract. If the second call returns UNSAT the output is unique and the concrete value is used in the `expect`; otherwise the assertion falls back to the postcondition literals that mention the output.

The uniqueness query is built from the **original ensures conjunction only** — tier/boundary literals used during test generation are excluded, so the check reflects the spec's real ambiguity rather than the tier's artificial pinning.

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

**Limitation — residual uninterpreted functions.** When the spec references user-defined functions that remain uninterpreted after 2-pass inlining (typically recursive functions like `Count`, `Power`, `R`), the uniqueness enumeration is **skipped entirely**. Z3 is free to assign arbitrary values to uninterpreted-function calls, so a "different output satisfying the spec" query would fabricate phantom alternatives that do not reflect real semantics. DafnyCBT detects such cases and emits a single observed-value `expect` derived from the check-mode runtime instead of a disjunctive enumeration. The original postcondition literals are still emitted as `expect` assertions.

### Test emission for mutable objects and class fields

When an `expect` assertion refers to the pre-call value of a mutable input or class field (via `old()`), the generator captures that value into a local variable before the call and uses the captured name in the assertion.

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

By default, tests are also generated for bodyless methods (declared without an implementation body), but the method call and expects are commented out since there is nothing to invoke. This supports **test-driven development with Dafny**: write the contracts first, generate test scaffolding from the spec, then implement the method body and uncomment the calls. Use `--skip-bodyless` (`-p`) to skip bodyless methods entirely instead.

### Smoke tests for precondition-only methods (`--smoke-tests` / `-st`)

By default, DafnyCBT only tests methods with at least one `ensures` clause — the postcondition is the test objective. Methods that have only `requires` (a precondition) and no `ensures` are skipped, since there is nothing to assert about the output. This excludes a class of helpers and side-effecting procedures from the corpus.

`--smoke-tests` (`-st`) relaxes this filter to also include methods with at least one `requires` and no `ensures`. For each such method, DafnyCBT generates a single test that satisfies the precondition (Z3 solves for inputs against the `requires`) and calls the method, with no `expect` checks. The test passes if the method returns; it fails if the method crashes or hangs. This catches infinite-loop / out-of-bounds defects in helpers that would otherwise have no test coverage, without requiring the developer to retrofit a postcondition.

The flag is **OFF by default** — existing corpus runs are unaffected. The implementation reuses the existing `preOnlyMode` path that DafnyCBT already employs as a fallback when post-condition solving times out: when `ensures` is empty, the DNF degenerates to a single trivial clause and Z3 only constrains inputs to satisfy the `requires`. Methods named `Main` and methods whose name contains `test` / `Test` are still excluded, as in the standard mode. Methods with no `requires` AND no `ensures` (truly contract-free helpers) remain skipped — the broader scope was deemed too noisy without an entry-point constraint.

Concrete example: consider a `MVR_CountIndex`-style defect where a loop guard `CountIndex != a.Length + 1` is corrupted to `CountIndex != CountIndex + 1` (always-true → infinite loop). The defect lives in `FooPreCompute`, which has `requires a.Length == b.Length` but no `ensures`. Without `--smoke-tests` the method is untested and the defect escapes; with the flag, `FooPreCompute` gets four smoke tests and all four FAIL on the buggy version (timeout / crash signal).

### Check Mode (`--check` / `-c`)

Check mode is **on by default**, except that when any bodyless method is present in the source, the check is auto-disabled (since `dafny build` fails on them) and unchecked tests are written with a warning. Pass `--no-check` to disable explicitly.

DafnyCBT compiles the generated tests into a single Dafny file with `dafny build --no-verify` and runs the compiled binary. Each `expect` is replaced with a `CheckExpect` helper that prints `DONE:N` / `FAIL:N` markers instead of aborting, so all tests run to completion. If a test crashes (e.g., `IndexOutOfRangeException`) or times out, the remaining tests are automatically re-run individually against the same binary with a test-index argument — no recompilation needed. Each test case is then classified as passing or failing:

- **Passing** tests keep their `expect`s active.
- **Failing** tests have their `expect`s commented out (with captured expected/actual annotations) so the file still compiles. A `// FAILING:` header flags them in `by-method` grouping.

### Runtime value injection in check mode

Check mode also rescues tests whose `expect` assertions would otherwise reference an untranslatable right-hand side. This applies specifically to postconditions of the form **`result == expression`** where Z3 was unable to produce a concrete value for `expression` during solving. During execution in the check phase, the value of the expression is captured (via a `RHSVAL:` print for the spec expression, evaluable at runtime because ghost modifiers are stripped from the test binary), and the captured value is injected back into the final test file as a concrete literal, replacing the original postcondition expect.

Two flavors of "unresolved RHS" benefit from this, both handled by the same mechanism:

1. **Z3 could encode the RHS but didn't fully unfold it** — typically a recursive or uninterpreted function that was only partially inlined into the SMT query, e.g. `ensures res == Comb(n, k)` where `Comb` is recursive. In default mode the expect is `expect res == Comb(n, k);`; in check mode it becomes `expect res == 4;` (the value Dafny computed at runtime).

2. **Z3 couldn't encode the RHS at all** — operations beyond SMT's reach, such as bitvector XOR `^`, higher-order ghost functions like `Filter(s, p)`, or quantifiers over sets. Default mode leaves the postcondition literal in place; check mode captures the runtime value of the output and injects it.

3. **Postcondition has no equality on an output, but implementation passes at runtime** — when postconditions constrain outputs only indirectly (e.g. `ensures AllPrime(f) && IsSorted(f) && ProdF(f) == n`), Z3's chosen model may be unreliable or simply one valid witness among many. After a test passes at runtime, the observed output is injected as a supplemental `expect` with a marker comment:

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

When a test fails at runtime, the `expect` assertions are commented out in the emitted test code. For equality-shaped postconditions, the buggy actual value is also shown as a trailing comment:

```dafny
// expect res == 1; // got 0
```

---

## Bounded scopes (small-scope analysis)

DafnyCBT is a **bounded model finder**: like Alloy's `run … for N`, it searches for
contract-satisfying inputs within finite scopes rather than over the full
mathematical domains. The small-scope hypothesis — most contract-distinguishing
inputs (and most mutation-killing inputs) are small — is what makes the SMT
queries decidable and fast. Every implicit bound is collected here so the scope
is explicit and reportable.

| Scope | Constant / flag | Default | Applies to |
|-------|-----------------|---------|------------|
| **Value universe** — `int` | hardcoded in `GetElementUniverse` ([TypeUtils.cs:161](../DafnyCBT/TypeUtils.cs#L161)) | `{-2,-1,0,1,2,3,4,5}` (8 values, asymmetric: 2 negatives, biased small) | set/multiset/map element & key membership, `_mset_count` conjunction, permutation-domain pin |
| **Value universe** — `nat` | `MAX_SET_UNIVERSE` ([SmtTranslator.cs:63](../DafnyCBT/SmtTranslator.cs#L63)) | `{0,…,7}` (8) | as above |
| **Value universe** — `char` | `MAX_SET_UNIVERSE` | `'a'..'h'` (codes 97–104) | as above |
| **Value universe** — enum / `T` | `min(#ctors, MAX_SET_UNIVERSE)` | up to 8 | as above |
| **Value universe** — `string` | fixed constant table | 8 short string constants | `set<string>`, string-keyed maps |
| **Sequence / array length** | `MAX_SEQ_LEN` ([SmtTranslator.cs:57](../DafnyCBT/SmtTranslator.cs#L57)) | ≤ 8 | every `seq<T>` / `array<T>` / `string` input; BVA size tiers |
| **Nested inner length** | `MAX_INNER_SEQ_LEN` ([SmtTranslator.cs:60](../DafnyCBT/SmtTranslator.cs#L60)) | ≤ 4 | inner sequences of `seq<seq<T>>` / `seq<string>` |
| **Recursive-function unrolling** | `RecursiveUnrollDepth` / `--unroll-depth N` ([Program.cs:35](../DafnyCBT/Program.cs#L35)) | 1 | recursive predicates/functions in specs (non-recursive funcs inline to depth 2) |
| **Collection cardinality tiers** | BVA Phase 2b | 0–3 elements/keys | set / multiset / map size coverage |

`GetElementUniverse(elementType)` is the **single source of truth** for the value
universe; it feeds set, multiset, map-key, string, and the
[permutation-domain pin](#per-literal-relevance-check---no-relevance-to-disable)
encodings. The pin (`--no-permutation-domain-pin` to disable) exists precisely to
keep this scope *consistent*: the bounded `_mset_count` is only sound if the
sequence/array elements are themselves constrained into the same universe, so
whenever a `multiset(X) == multiset(Y)` literal is present every element of the
involved sequences is asserted to lie in `GetElementUniverse`. Without it the
bounded count is blind to out-of-universe elements and Z3 can satisfy
permutation-preservation with `pre ≠ post` differing only outside the universe —
silently defeating modification-relevance (sort/permute reorder bugs survive).

**Not bounded here (different axes):**

- **Quantifier instantiation** — `forall`/`exists` over unbounded ranges (e.g.
  primality `forall nr | 1 < nr < n :: n % nr != 0`) are handed to Z3's own
  instantiation engine, which is incomplete. This is the source of the
  `Z3 returned UNKNOWN` fallbacks (inputs from preconditions-only, postconditions
  not verified). Widening the *value* universe does **not** help this; it is a
  separate bounded-quantifier-expansion concern, sibling to `--unroll-depth`.
- **Scalar integers not feeding a collection** — unbounded in SMT except for the
  [anti-trivial bias](#anti-trivial-bias---no-bias-to-disable) soft nudges toward
  small bounded magnitudes.

A unifying `--domain-size N` knob (parametrising `GetElementUniverse` and
`MAX_SET_UNIVERSE` so `int → [-N..N]`, default reproducing the table above) is a
natural future extension — it would make the small-scope hypothesis a tunable,
paper-reportable dial without inflating the default corpus run. It would *not*
address the quantifier-instantiation axis above.

---

## Supported Data Types

| Type | Notes |
|------|-------|
| `int`, `nat`, `real`, `char`, `bool` | native SMT sorts |
| `array<T>`, `seq<T>`, `string` | bounded length (default up to 8); boundary analysis uses size tiers |
| Simple enum datatypes (e.g., `datatype Color = Red \| White \| Blue`) | constructors with no parameters; mapped to bounded integers, one boundary tier per constructor |
| Algebraic datatypes with formals (e.g., `datatype Pair = Mk(int, int)`, `datatype Shape = Circle(int) \| Rectangle(int, int)`, `datatype Tree = Empty \| Node(int, Tree, Tree)`) | emitted as native Z3 `(declare-datatypes …)`; supports constructor application, destructors (`p.fst`), discriminators (`s.Circle?`), and `match` patterns in the body. **Out of scope:** mutually-recursive groups, `codatatype`, and generic-parameter datatypes (`List<T>`) — those are skipped at discovery. For self-recursive ADTs whose specs use recursive predicates (e.g., `BST(t)`, `NumbersInTree(t)`), Z3 cannot solve `define-fun-rec` queries reliably, so the spec falls back to the precondition-only / runtime-`expect` path |
| `set<T>`, `multiset<T>` | `(Array Int Bool)` / `(Array Int Int)` over a bounded element universe (8 values); supports `in`, `\|·\|`, `+`, `*`, `-`, `<=`. Element types: `int`, `nat`, `char`, enums, `T`. `set<string>` also supported via an `(Array (Seq Int) Bool)` encoding with 8 short string constants. **Sequence-built multisets** (`multiset(s[..])`) are counted by an unrolled helper `_mset_count(v, s, n)`. Equality `multiset(s1) == multiset(s2)` is emitted as a **bounded conjunction** over the element universe (`(and (= (_mset_count v₀ s1 …) (_mset_count v₀ s2 …)) … (= (_mset_count v₇ …) …))`) for Int-encoded element types (`int`, `nat`, `char`, enums, `T`); for string elements and other unsupported cases, falls back to the universal `forall ((v Int))` form. The bounded form reuses the closed-world assumption already in place for parameter-typed multisets, avoids the unbounded quantifier that slowed Z3 on combined queries, and lets relevance check compose with permutation+sortedness specs (sort/dedupe/partition family) |
| `map<K,V>` | parallel domain/values arrays over the same bounded key universe; supports `in`, `\|·\|`, lookup, merge. Key types: `int`, `nat`, `char`, enums, `T`. Value types: `int`, `nat`, `bool`, `real`, `char`, enums |
| Tuples (e.g., `(int, int)`, `(real, real)`) | decomposed into per-component SMT variables; usable as parameters, returns, and inside `array<·>` / `seq<·>`. Component types: `int`, `nat`, `real`, `char`, `bool` |
| `seq<seq<T>>`, `seq<string>` | native `(Seq (Seq T))` sort; outer length bounded to 8, inner to 4 |

Set, multiset, and map boundary analysis generates cardinality tiers (0–3 elements/keys). Collection literals in generated tests use Dafny display expressions (`{-1, 0, 3}`, `multiset{0, 2, 2}`, `map[-1 := 5]`). Generic type parameters are mapped to `Int` in SMT.
