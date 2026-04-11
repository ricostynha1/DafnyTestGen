# DafnyTestGen

Automatic test generation for [Dafny](https://dafny.org/) programs based on method contracts (preconditions and postconditions). 

DafnyTestGen analyzes `requires` and `ensures` clauses, converts them to Disjunctive Normal Form (DNF), and relies on the [Z3](https://github.com/Z3Prover/z3) SMT solver to find concrete test inputs that exercise different contract paths. Test generation combines equivalence class partitioning (via DNF analysis) with boundary value analysis. 

## How It Works

1. **Parse** Dafny source files and discover methods with contracts (`requires`/`ensures` clauses).
2. **Analyze** preconditions and postconditions in DNF to identify distinct test scenarios, which are further refined based on boundary-value analysis.
3. **Solve** SMT queries via Z3 to find satisfying concrete inputs for each scenario.
4. **Emit** a Dafny test file with `expect` assertions and a `Main()` method.


## Equivalence Class Partitioning via DNF Analysis

Disjunctive postconditions and preconditions, naturally originate multiple test scenarios. DafnyTestGen converts all contract clauses to **Disjunctive Normal Form (DNF)** (or Full DNF (FDNF) with `-a`option`), producing a set of clauses that partition the input/output space as **equivalence classes**.

**Short-circuit safety in DNF mode.** Dafny uses short-circuit evaluation for `||`, `&&`, and `==>`. The DNF decomposition respects this to avoid generating test cases that would cause runtime errors. Consider the following example:

```dafny
method GetFirstOrZero(a: array<int>) returns (result: int)
  ensures a.Length == 0 ==> result == 0
  ensures a.Length > 0 ==> result == a[0]
```

The implication `A ==> B` is decomposed into mutually exclusive, short-circuit safe, DNF branches `!A` and `A ∧ B` (instead of `!A` and `B` as in standard DNF). Similarly, `A || B` produces branches `A` and `!A ∧ B`. For this example, the second ensures clause produces:
- `!(a.Length > 0)` — antecedent is false, implication vacuously true
- `a.Length > 0 ∧ result == a[0]` — antecedent holds, consequent must hold

With standard (unsafe) DNF, the branch `result == a[0]` alone would lack the `a.Length > 0` guard, possibly causing an out-of-bounds error. 

The cross-product of the two ensures clauses in DNF mode yields 4 clauses (after short-circuit safe decomposition), of which 2 are pruned as contradictory, leaving 2 to solve:
- `!(a.Length == 0) ∧ a.Length > 0 ∧ result == a[0]` — SAT (element found)
- `a.Length == 0 ∧ !(a.Length > 0) ∧ result == 0` — SAT (empty array)

With **FDNF**, each implication produces 3 clauses instead of 2, giving more combinations but losing short-circuit safety, namely by including the unsafe clause `a.Length == 0 ∧ result == 0 ∧ !(a.Length > 0) ∧ result == a[0]`. Use FDND mode only when you understand the implications.

The following table summarises the branching rules.

| Expression (E) | DNF Branches | FDNF Branches |
|---|---|---|
| `A \|\| B` | `A`, `!A ∧ B` | `A ∧ B`, `A ∧ !B`, `!A ∧ B` |
| `A ==> B` | same as `!A \|\| B`  | idem |
| `A <==> B` | `A ∧ B`, `!A ∧ !B` | idem |
| `!(A && B)` | same as `!A \|\| !B` | idem |
| `if C then A else B` | `C ∧ A`, `!C ∧ B` | idem |
| `x == (if C then U else V)` | same as `if C then x == U else x == V` | idem |

Both DNF and FDNF are computed bottom-up, starting from leaf literals, by a dual-return recursive function that produces both the DNF/FDNF of an expression E and of its negation simultaneously. 

When multiple `requires` and `ensures` clauses exist, their cross-product forms the full DNF or FDNF. 

### Incremental pruning

The cross-product is **pruned incrementally**: at each step, merged clauses are checked for syntactic contradictions (complementary literals, distinct equalities, incompatible relational constraints) and discarded immediately, preventing dead branches from multiplying further.

Consider the following example:

```dafny
method Classify(x: int) returns (r: int)
  requires -100 <= x <= 100
  ensures x < 0 ==> r == -1
  ensures x == 0 ==> r == 0
  ensures x > 0 ==> r == 1
```

Each implication `A ==> B` produces 2 short-circuit safe DNF branches (`!A` or `A ∧ B`). In **DNF mode**, the cross-product of the 3 ensures clauses yields nominally 2×2×2 = 8 DNF clauses, but incremental pruning during cross-product eliminates 4 contradictory clauses (with contradictory equalities for `r`), leaving only **4 clauses** to solve (3 SAT, 1 UNSAT):
- `!(x < 0) ∧ !(x == 0) ∧ x > 0 ∧ r == 1` — SAT, corresponds to x > 0
- `!(x < 0) ∧ x == 0 ∧ r == 0 ∧ !(x > 0)` — SAT, corresponds to x == 0
- `x < 0 ∧ r == -1 ∧ !(x == 0) ∧ !(x > 0)` — SAT, corresponds to x < 0
- `!(x < 0) ∧ !(x == 0) ∧ !(x > 0)` — UNSAT


In **FDNF mode**, each implication produces 3 full clauses, and the cross-product yields nominally 3×3×3 = 27 FDNF clauses. Incremental pruning eliminates 20 contradictory clauses (with contradictory equalities for `r`), leaving only **7 clauses** to solve (3 SAT, 4 UNSAT).


### Decomposition of existential quantifiers

Existential quantifiers represent repeated disjunctions, that can be also decomposed into multiple clauses.
Single-variable existential quantifiers of the form `exists k :: lo <= k < hi && P(k)` are automatically decomposed into 3 clauses representing boundary and middle cases:

1. **Left boundary**: `lo < hi && P(lo)` — property holds at first position (guaranteed to exist)
2. **Middle range**: `exists k :: lo+1 <= k < hi-1 && P(k)` — property holds somewhere in the middle
3. **Right boundary**: `lo < hi && P(hi-1)` — property holds at last position (guaranted to exist)

These clauses feed into the same DNF/FDNF analysis, so they combine with other pre- and postcondition clauses via cross-product. Negated `forall` quantifiers (`!(forall k :: range ==> P(k))`, equivalent to `exists k :: range && !P(k)`) are handled similarly. 

Consider the following example:

```dafny
method FindMax(a: array<int>) returns (max: int)
  requires a.Length > 0
  ensures exists k :: 0 <= k < a.Length && max == a[k]
  ensures forall k :: 0 <= k < a.Length ==> max >= a[k]
```

The `exists` clause decomposes into: max at position 0 (left), max in middle, max at position a.Length-1 (right). These are combined with the `forall` clause via FDNF cross-product, producing distinct test scenarios for each structural case.

### Predicate and function inlining  

User-defined predicates and functions referenced in contracts are automatically inlined before DNF/FDNF conversion and SMT generation via **2-pass inlining** — substituting bodies into contract expressions to expose branching for DNF.

All predicates and functions with bodies — both recursive and non-recursive — are inlined through **two textual substitution passes**. Each pass replaces every call site with the function body (with parameters substituted). This achieves up to **2 levels of nesting**: the first pass expands top-level calls, the second pass expands calls introduced by the first. Any remaining residual calls (in recursive or non-recursisve functions and predicates) are left as **uninterpreted functions** in SMT — Z3 can freely assign their values, which preserves branch diversity (both branches of a recursive `if-then-else` remain satisfiable) while avoiding infinite expansion.

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

Pass 1 substitutes `IsFirstOdd(a, index)` with its body, producing an `if C then A else B` expression that the DNF engine splits into two clauses. Pass 2 inlines the nested `IsOdd` calls. Result: `(index == -1 && ∀i. ¬(a[i] % 2 == 1))` and `(index ≠ -1 && a[index] % 2 == 1 && ∀i < index. ¬(a[i] % 2 == 1))`.

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

Pass 1 expands `filter(a, b)` → `if |a| == 0 then a else if a[|a|-1] in b then filter(a[..|a|-1], b) else filter(a[..|a|-1], b) + [a[|a|-1]]`. Pass 2 expands the inner `filter(a[..|a|-1], b)` calls one more level. Residual `filter(...)` calls (3rd level) become uninterpreted in SMT.

The DNF engine splits `X == (if C then A else B)` into `(C && X == A) || (!C && X == B)`, producing three top-level clauses:

1. `|a| == 0 && diff == a` — empty input
2. `|a| > 0 && a[|a|-1] in b && diff == filter(...)` — last element **removed** (in `b`)
3. `|a| > 0 && a[|a|-1] !in b && diff == filter(...) + [a[|a|-1]]` — last element **kept** (not in `b`)

The **structural conditions** (`|a| > 0`, `a[|a|-1] in b`) guide Z3 to find inputs exercising each branch. For the `expect` assertions, when the postcondition has the form `output == expr`, the spec expression is emitted directly (e.g., `expect diff == filter(a, b)`) and evaluated by Dafny at runtime.


## Boundary Value Analysis

BVA complements equivalence class partitioning by testing at the **edges** of each equivalence class. DafnyTestGen extracts numeric bounds from contracts and generates boundary tiers:

- **Integer ranges**: for `requires -100 <= x <= 100`, generates tests at x = -100, -99, 0, 1, 99, 100
- **Array/sequence sizes**: generates tests with different sizes (length 0, 1, 2, 3, ...), with distinct elements within each tier
- **Relational bounds**: for `requires 0 <= k <= s.Length`, generates boundary tiers `k=0`, `k=1`, and `k==s.Length` (mapped to the SMT length variable). This exercises all three regions of the precondition: lower boundary, upper boundary, and interior. Relational tiers are prioritized first in the cross-product ordering
- **Output boundary tiers**: return values and mutable scalar class fields are automatically constrained to explore different output regions. For scalar types — `nat`: `=0`, `=1`, `≥2`; `int`: `>0`, `<0`, `=0`; `bool`: `true`, `false`; `real`: `>0`, `<0`, `=0`. Tuple components are decomposed and each component gets its own tiers. Sequence return values get length tiers: `|f|≥3`, `|f|≥2`, `|f|=1`. Set, multiset, and map return values get cardinality tiers: `|f|≥3`, `|f|≥2`, `|f|≥1`. Non-trivial tiers are prioritized first since Z3 naturally gravitates toward minimal values. This is particularly useful when postconditions don't uniquely determine the output — e.g., `MaxDistEqual` where Z3 defaults to `maxDist=0` for all input tiers, output boundary tiers force exploration of `maxDist=1`, `maxDist≥2`; or `PrimeFactors` where seq-length tiers force `|f|≥2` (composite numbers like `n=35 → f==[5,7]`) and `|f|≥3` (`n=539 → f==[7,7,11]`)

- **Input boundary tiers for enum datatypes**: for enum datatypes, i.e., datatypes where all constructors are parameterless (e.g., `datatype Color = Red | White | Blue`), boundary analysis generates one tier per constructor (encoded as integers) for exhaustive value coverage.

- **Nested sequence inner-length floor tiers**: for `seq<seq<T>>` and `seq<string>` parameters, additional tiers constrain the **minimum inner sublist length**. Without these, Z3 gravitates to empty inner sublists (length 0), producing tests where min-length results are always 0. Two floor tiers are added:
  - `inner>=1`: all active sublists have length ≥ 1 (forces min-length results like `v >= 1`)
  - `inner>=2`: all active sublists have length ≥ 2 (forces `v >= 2`)

  These are placed **before** the outer-length tiers in the tier list, so the progressive strategy picks them up early and produces diverse output values. They are alternative entries (not cross-producted with outer-length tiers) to avoid conflicts with the exclusion mechanism that blocks previously-seen input values. Z3 freely chooses the outer length for each floor tier.
- **Ordering shape tiers**: when a precondition constrains an array or sequence with a non-strict ordering (`<=` or `>=`), the weak ordering is decomposed into structurally distinct cases:
  - **constant** (`a-shape=const`): all elements are equal (e.g., `[3, 3, 3]`)
  - **strictly ordered** (`a-shape=strict-asc` or `strict-desc`): all consecutive pairs are strictly ordered, no duplicates (e.g., `[-3, -2, -1]`)

  This is detected from: `IsSorted(a[..])` predicate calls, `forall i, j :: ... ==> a[i] <= a[j]` (two-variable), and `forall i :: ... ==> a[i] <= a[i+1]` (consecutive pairs). The same applies for `>=` (descending). Shape tiers are cross-producted with size tiers and other boundary parameters. When shape tiers are present for a parameter, element distinctness constraints are omitted from its size tiers (since the shape tiers control element relationships more precisely).

The `--tiers <n>` option (default: 4) controls the number of array/sequence size tiers. For example, `-t 5` generates arrays of length 0 through 4.

BVA is **combined with DNF/FDNF**: each equivalence class (clause) is tested at each applicable boundary tier. For example, with 3 SAT clauses and 4 boundary tiers, up to 12 tests are generated.

## Repetition (`-r`)

The `--repeat <n>` option generates **N distinct test cases** per scenario. After finding a satisfying assignment, Z3 is asked again with an additional constraint excluding the previous solution, producing a different input. This is useful for increasing confidence that a scenario works across multiple input values, not just the first one Z3 happens to find.


## Progressive Auto Strategy (default)

When no explicit strategy flag (`-a`, `-b`, `-s`, `-r`) is given, DafnyTestGen uses a **progressive strategy** that escalates until enough tests are generated (controlled by `--min-tests`, default 4):

1. **Phase 1 — DNF clauses**: All clauses are solved directly using short-circuit safe DNF decomposition. Syntactic contradiction detection prunes infeasible clauses before Z3. Duplicate literals across ensures clauses are deduplicated during cross-product.

2. **Phase 2 — Input boundary analysis** (only when phase 1 < minTests and n ≤ 10): Add input boundary value tiers crossed with clauses. The boundary cross-product is capped at 64 tiers; when the full cross-product exceeds this limit, parameters with the most tiers are greedily dropped until it fits.

3. **Phase 2b — Output boundary analysis** (only when still < minTests): Add output boundary tiers for scalar return values and mutable scalar class fields. Each tier constrains an output variable to a specific range (e.g., `maxDist ≥ 2`), forcing Z3 to find inputs that produce diverse output values. Non-trivial tiers are tried first (Z3 naturally produces minimal values without guidance). Collection outputs (arrays, sequences, sets) are skipped — their diversity is driven by input boundary tiers.

4. **Phase 3 — Repeats**: Generate additional distinct inputs per condition (up to 3 per condition) until the minimum is reached.

Each phase only runs if the minimum test count has not yet been reached (except phase 1, which always runs). This ensures methods with rich disjunctive postconditions get good coverage from phase 1 alone, while methods with a single postcondition clause automatically get boundary, output diversity, and repeat coverage. The `--min-tests 0` option runs only phase 1 (clauses without escalation).

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

# Thorough: FDNF + boundary + 3 tests per scenario
dotnet run -- test/correct_progs/in/BinarySearch.dfy -o test/correct_progs/out/ -a -b -r 3

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

### Command-Line Options

| Option | Alias | Description |
|--------|-------|-------------|
| `--output <path>` | `-o` | Output file or directory |
| `--method <name>` | `-m` | Target a specific method (default: all) |
| `--verbose` | `-v` | Show debug info (contracts, DNF, SMT queries) |
| `--all-combinations` | `-a` | One test per FDNF clause |
| `--boundary` | `-b` | Boundary value analysis on inputs |
| `--simple` | `-s` | One test per DNF clause (default) |
| `--tiers <n>` | `-t` | Sequence/array size tiers for boundary analysis (default: 4) |
| `--check` | `-c` | Run each test with Dafny, split output into Passing/Failing (not supported for programs with bodyless methods) |
| `--repeat <n>` | `-r` | Generate N distinct test cases per scenario (default: 1) |
| `--min-tests <n>` | `-n` | Minimum test count for progressive auto strategy (default: 4) |
| `--max-tests <n>` | `-x` | Maximum number of generated tests per method (0 = unlimited) |
| `--timeout <n>` | | Timeout in seconds for test generation per method (0 = unlimited) |
| `--skip-bodyless` | `-p` | Skip bodyless methods instead of generating spec-only tests (default: generate spec-only tests with call/expects commented out) |
| `--trust-unknown` | | Trust Z3 output values when uniqueness check returns 'unknown' (default: true). When true, concrete values are emitted even when Z3 can't fully prove uniqueness but found no counter-example. Set to false to fall back to postcondition literals for undecidable cases |
| `--z3-path <path>` | | Path to Z3 executable (default: auto-discover) |

### Z3 Path Resolution

DafnyTestGen needs the Z3 SMT solver. The path is resolved using this priority chain:

1. **`--z3-path <path>`** CLI option (highest priority)
2. **`Z3_PATH`** environment variable
3. **Auto-discovery**: searches the Dafny VS Code extension directory (`~/.vscode/extensions/dafny-lang.ide-vscode-*/`), then `DAFNY_HOME`, then common system install locations
4. **PATH fallback**: assumes `z3` is on the system PATH

The resolved path is printed at startup (e.g., `[DafnyTestGen] Z3: /path/to/z3`).

## Generated Output

Given a Dafny method with a single non-disjunctive postcondition, the progressive auto strategy escalates through boundary analysis and repeats to reach the minimum test count. Tests emit `expect` assertions using the postcondition expression:

```dafny
method CalcFact(n: nat) returns (f: nat)
  ensures f == Fact(n)
```

```dafny
  // Test case for combination 1/Bn=0:
  {
    var n := 0;
    var f := CalcFact(n);
    expect f == Fact(n);
  }

  // Test case for combination 1/Bn=1:
  {
    var n := 1;
    var f := CalcFact(n);
    expect f == Fact(n);
  }
```

When postconditions involve quantifiers or predicates that cannot be directly used as `expect` assertions, Z3-computed **concrete expected values** are emitted instead. This applies to scalar return values, tuple return values, mutable array parameters (post-state), and mutable scalar class fields — whenever Z3 uniquely determines the output, the concrete value is used:

```dafny
  // Scalar return value (FindMax)
  {
    var a := new real[2] [0.5, 0.0];
    var max := FindMax(a);
    expect max == 0.5;
  }

  // Mutable array post-state (BubbleSort)
  {
    var a := new int[2] [-38, 7681];
    var maxDist := BubbleSort(a);
    expect a[..] == [-38, 7681];
  }

  // Tuple return value (ArrayTupleOps)
  {
    var a := new (int, int)[2] [(4, 6), (3, 5)];
    var r := SumPairs(a);
    expect r == (4, 6);
  }

  // Mutable scalar class field (Counter)
  {
    var obj := new Counter();
    obj.count := 2;
    obj.Increment();
    expect obj.count == 3;
  }
```

A second Z3 call with a blocking clause checks **output uniqueness**: if the postcondition uniquely determines the output given the inputs (UNSAT with negated outputs), concrete values are emitted; otherwise, the original postcondition literals are used as `expect` assertions. This covers scalar outputs, tuple components, array post-states, and mutable class fields.

### Spec-Only Tests for Bodyless Methods

By default, bodyless methods (declared without an implementation body) generate **spec-only tests**: Z3 finds concrete inputs satisfying the preconditions, but the method call and expects are commented out since there is no implementation to invoke:

```dafny
method CalcFact(n: nat) returns (f: nat)
  ensures f == Fact(n)
```

```dafny
  // Test case for combination {1}:
  //   POST: f == Fact(n)
  {
    var n := 0;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}:
  //   POST: !(n == 0)
  //   POST: f == n * (if n - 1 == 0 then 1 else ...)
  {
    var n := 1;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }
```

This is useful for **test-driven development with Dafny**: write the contracts first, generate test scaffolding from the spec, then implement the method body and uncomment the calls. Use `--skip-bodyless` (`-p`) to revert to the old behavior of skipping bodyless methods entirely.

## Check Mode (`-c`)

When `--check` is enabled, DafnyTestGen compiles all tests into a **single** Dafny file with `dafny build --no-verify` (one compilation), then runs the compiled binary. Each `expect` is replaced with a `CheckExpect` helper that prints `FAIL:N` / `DONE:N` markers instead of aborting, so all tests run to completion. If a test crashes (e.g., `IndexOutOfRangeException`) or times out (e.g., infinite loop), the remaining incomplete tests are automatically **re-checked individually** using the same compiled binary with a test index argument — no recompilation needed. The output is split into two methods:

- **`Passing()`** &mdash; tests that pass at runtime (expects remain active)
- **`Failing()`** &mdash; tests that fail at runtime (expects are commented out)

When postconditions use recursive or ghost functions (e.g., `expect f == Fact(n);`), check mode captures the actual output values at runtime and injects them as concrete literals in the final test file (e.g., `expect f == 120;`). The same mechanism applies to postconditions with quantifiers over sets (e.g., `r == (forall x :: x in S ==> x > 0)`) where Z3 cannot evaluate the quantifier to a concrete boolean — the check phase runs the expression via Dafny and injects the result (e.g., `expect r == true;`).

**Runtime value injection for untranslatable postconditions.** When Z3 cannot encode certain operations in SMT (e.g., bitvector XOR `^`, higher-order ghost functions like `Filter(s, p)`), the postconditions are used as runtime `expect` assertions. Since the check phase compiles and runs the tests, the actual output values are captured via `print` statements (`VAL:` markers) during execution. When a test passes — meaning all postcondition expects hold — the captured runtime value is injected as a concrete `expect` in the final test, replacing the postcondition literals. For example, `BitwiseXOR([3], [4])` with postcondition `forall i :: result[i] == a[i] ^ b[i]` produces `expect result == [7];` after the check phase. For string outputs (`seq<char>`), a helper prints values in parseable `['a', 'b']` format since Dafny's default `print` outputs raw text for strings. Note that the injected value is one valid output that satisfies the postconditions — there may be other valid values for specifications that don't uniquely determine the result. This is a weaker guarantee than Z3's uniqueness proof, but it produces readable concrete tests even for features beyond Z3's SMT encoding.

This is useful for evaluating buggy implementations against their contracts.

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
  unsupported_progs/     # Programs with features not fully supported (nested seqs with complex quantifiers, etc.)
```

The pipeline flows as: **DafnyParser** → **DnfEngine** → **BoundaryAnalysis** + **SmtTranslator** → **Z3Runner** → **TypeUtils** (model parsing) → **TestEmitter** → **TestValidator** (optional).

## Supported Dafny Features

- Integer, natural, real, char, bool types
- Arrays and sequences (including `array<T>`, `seq<T>`, `string`)
- **Simple enum datatypes**: datatypes where all constructors are parameterless (e.g., `datatype Color = Red | White | Blue`) are supported. Constructors are mapped to bounded integers in SMT (Red→0, White→1, Blue→2) with range constraints, and mapped back to constructor names in generated test code. Boundary analysis generates one tier per constructor for exhaustive value coverage. This works for direct parameters (`c: Color`), arrays (`array<Color>`), and sequences (`seq<Color>`)
- Quantifiers (`forall`, `exists`)
- Implications, logical operators, chain comparisons
- `IsSorted` predicate (built-in translation)
- `old()` expressions in postconditions (array params captured as sequences before method call, supporting quantifier-bound indices)
- **`set<T>` input parameters**: sets are encoded as `(Array Int Bool)` characteristic functions in SMT with a bounded element universe (8 values). The universe is element-type-dependent: `int` uses `{-2, -1, 0, 1, 2, 3, 4, 5}`, `nat` uses `{0..7}`, `char` uses `{'a'..'h'}` (codes 97–104), and enum datatypes use ordinals `{0..min(N,8)-1}`. Membership (`x in S`), cardinality (`|S|`), union (`+`), intersection (`*`), difference (`-`), and subset (`<=`) are all supported. Boundary analysis generates cardinality tiers (0, 1, 2, 3 elements), capped at the number of constructors + 1 for enum element types. Set literals are emitted as Dafny set display expressions with proper formatting (e.g., `{-1, 0, 3}` for int, `{'a', 'c'}` for char, `{Red, Blue}` for enums, `{"a", "c"}` for string). Supported element types: `int`, `nat`, `char`, `string`, enum datatypes, and generic `T` (treated as int). For `set<string>`, the SMT encoding uses `(Array (Seq Int) Bool)` with a bounded universe of 8 short string constants (`""`, `"a"`, ..., `"g"`); string parameters that interact with string sets are constrained to this universe
- **`multiset<T>` parameters**: multisets are encoded as `(Array Int Int)` count functions in SMT with the same element-type-dependent bounded universe as sets, where each element maps to its multiplicity. Multiset variables are constructed from a zero-default base array with per-element variables, ensuring out-of-universe indices are always 0 without quantifier constraints. Membership (`x in M`), cardinality (`|M|`), element count (`M[x]`), union (`+`), intersection (`*`), difference (`-`), and subset (`<=`) are all supported. Operations are expanded pointwise over the bounded universe. Boundary analysis generates cardinality tiers (0, 1, 2, 3 elements). Multiset literals are emitted as Dafny multiset display expressions with proper formatting (e.g., `multiset{0, 2, 2, 5}` for int, `multiset{0, 3, 3}` for nat). Supported element types: `int`, `nat`, `char`, enum datatypes, and generic `T` (treated as int)
- **`map<K,V>` parameters**: maps are encoded as two parallel SMT arrays — a domain `(Array K Bool)` for key presence and a values `(Array K V)` for values at each key — over the same bounded key universe as sets. Membership (`k in m`), cardinality (`|m|`), key lookup (`m[k]`), and map merge (`a + b`) are translated to SMT constraints on the domain/values arrays. Map update (`m[k := v]`), key removal (`m - {k}`), and `m.Keys` are handled via runtime evaluation: postconditions of the form `r == <expr>` capture the RHS before the method call and use Dafny's own evaluation for the `expect` assertion. Boundary analysis generates cardinality tiers (0, 1, 2, 3 keys), capped at the number of constructors + 1 for enum key types. Map literals are emitted as Dafny map display expressions (e.g., `map[-1 := 5, 0 := 3]`). Supported key types: `int`, `nat`, `char`, enum datatypes, and generic `T`. Supported value types: `int`, `nat`, `bool`, `real`, `char`, enum datatypes
- **Tuple types** (e.g., `(int, int)`, `(real, real)`): supported as standalone parameters, return types, array element types (`array<(T, U)>`), and sequence element types (`seq<(T, U)>`). Tuple components are decomposed into separate SMT variables (e.g., `t: (int, int)` → `t_0: Int`, `t_1: Int`; `a: array<(real, real)>` → parallel component sequences `a_seq_0: (Seq Real)`, `a_seq_1: (Seq Real)` with equal-length constraints). Tuple field access (`t.0`, `a[i].1`) is translated to the corresponding component variable or sequence element. Generated test code uses Dafny tuple literals (e.g., `var t := (3, 5);`, `var a := new (real, real)[2] [(1.0, 2.0), (3.0, 4.0)];`). Supported component types: `int`, `nat`, `real`, `char`, `bool`. Nested tuples and tuples in sets/maps are not yet supported
- **Pre/post state splitting** for `modifies` methods: mutable array parameters get separate pre-state (input) and post-state (output) SMT variables, so postconditions like `IsSorted(a[..])` don't constrain inputs
- Uninterpreted functions (postcondition literals used as assertions)
- **Nested sequence types** (`seq<seq<T>>`, `seq<string>`): nested sequences with scalar inner element types (`int`, `nat`, `real`, `char`, `bool`) are encoded using Z3's native `(Seq (Seq T))` sort. Outer sequence length is bounded to 8, inner sequence lengths to 4. Inner length and element values are extracted from Z3 models via nested `get-value` queries (e.g., `(seq.len (seq.nth s i))`, `(seq.nth (seq.nth s i) j)`). Chained bracket access in postconditions (e.g., `l[i][|l[i]| - 1]` from inlining `Last(l[i])`) is handled by a bracket-depth-aware parser that splits on the rightmost `[...]` and recursively translates both parts. After forall unrolling substitutes concrete indices, the post-processing pass rewrites `(seq.nth l 0)` → `l_0` for the flat encoding. Test code emits Dafny nested seq literals (e.g., `var s: seq<seq<int>> := [[1, 2], [3]];`) or string seq literals (e.g., `var l: seq<string> := ["abc", "de"];`). Note: postconditions with multi-variable quantifiers over nested seqs often cause Z3 to return `unknown`, limiting test coverage for complex contracts

### Class Method Support

Methods inside Dafny classes are supported in three tiers, with increasing complexity. In all cases, fields are treated as synthetic mutable parameters with pre/post SMT variables; test code constructs a fresh object, assigns Z3-derived values to fields, captures `old()` state, calls the method, and asserts postconditions with `obj.field` references. Classes with trait parents or unsupported field types are auto-skipped.

**Simple classes** — classes with `modifies this` whose non-ghost fields all have supported types (int, nat, bool, real, char, arrays, sequences, sets, multisets, enums). No `Valid()` predicate is required.

**`{:autocontracts}` classes** — classes with the `{:autocontracts}` attribute. `Valid()` is automatically injected as both an implicit precondition and postcondition (its body is inlined for SMT translation, constraining both pre-state and post-state). Constructor parameters are extracted and used for object construction (e.g., `new StackOfInt(capacity)`). `const` array fields (e.g., `const elems: array<int>`) are handled as mutable-content arrays linked to constructor parameters via `ensures` clauses. Parameterless member predicates like `isEmpty()` and `isFull()` are inlined in preconditions.

**Non-autocontracts classes with `requires Valid()`** — classes that use a manual `Valid()` predicate (without `{:autocontracts}`), including those with ghost fields, `modifies Repr`, and class-level type parameters. `Valid()` is not treated specially — it is handled like any other predicate in the contracts (inlined if its body is simple enough, otherwise used as a literal). Heap ownership constraints (`this in Repr`, `data in Repr`) are automatically stripped during SMT encoding — when one conjunct of a `&&` chain is untranslatable, it is silently dropped while preserving the remaining constraints.

#### Ghost Field Handling

Ghost fields (`ghost var`, `ghost const`) in classes are fully supported. In the generated test file:

- `ghost` is stripped from all field and constant declarations, converting them to concrete (compilable) variables, so that test code can directly assign and read ghost state
- Ghost sequence fields (e.g., `ghost var s1: seq<T>`) are assigned from Z3 model values as sequence literals; for `{:autocontracts}` classes these fields (e.g., `ghost var Elements: seq<int>`) are also included as Z3 inputs and assigned accordingly
- Ghost constants already set by the constructor (e.g., `ghost const N: nat`) are left unchanged
- The `Repr` field is reconstructed as `{obj}` plus all object-typed (array) fields
- `old()` wrappers are stripped from method bodies (invalid for non-ghost variables in compiled code — semantics are preserved because `old(x)` in an assignment refers to `x`'s value before the method call, which is still the current value at the assignment point)
- Ghost functions and predicates have their `ghost` keyword stripped to make them callable in `expect` assertions
- Member predicates and functions (e.g., `Empty()`, `Full()`) referenced inside `old()` in postconditions are captured in a pre-call variable (e.g., `var old_Empty := obj.Empty();`) so `old(Empty())` can be tested at runtime

## Not Testable (Auto-Skipped)

The following are detected and automatically skipped because there is nothing to test. A message is printed when a method or file is skipped.

- **Bodyless methods**: by default, abstract methods (without an implementation body) generate **spec-only tests** — Z3 finds concrete inputs from the contracts, but the method call and expects are commented out (see [Spec-Only Tests for Bodyless Methods](#spec-only-tests-for-bodyless-methods)). Use `--skip-bodyless` (`-p`) to skip them entirely instead. Other methods in the same file that do have bodies are always tested normally. Note: when a program contains bodyless methods, the `--check` (`-c`) option is not supported (since `dafny build` fails on bodyless methods); unchecked tests are written instead with a warning
- **Bodyless functions/predicates in contracts**: methods whose `requires` or `ensures` clauses reference a function or predicate without a body (abstract/opaque) are skipped — the function's semantics are unknown

## Not Currently Supported (Auto-Skipped)

The following are auto-detected and skipped. Some may be addressed in the future.

- **Trait methods and classes with traits**: require dynamic dispatch and inheritance handling (classes with trait parents are auto-skipped)
- **Twostate predicates/functions in contracts**: reference two heap states (old and new) that cannot be translated to SMT or used as `expect` assertions
- **Function-typed parameters** (e.g., `P: T -> bool`, `f: int ~> int`): cannot be represented in SMT
- **Complex datatype parameters**: non-enum datatypes (e.g., `List<T> = Nil | Cons(head: T, tail: List<T>)`, `Tree = Node(int, Tree, Tree)`) — including when nested in generics
- **Class/reference-typed method parameters** (e.g., `method foo(m: Message, addr: Address)`): methods whose parameters include user-defined class or reference types are auto-skipped — such values cannot be synthesised by Z3
- **Nested collection types** other than `seq<seq<T>>`, `seq<string>`, and `set<string>` (e.g., `array<seq<T>>`, `set<seq<int>>`, `seq<set<int>>`)
- **Multi-dimensional arrays** (e.g., `array2<int>`, `array3<real>`)
- **Classes with collection fields containing class element types** (e.g., `var messages: set<Message>`, `var recipients: seq<Address>`, `var cache: map<int, Entry>`): the class is auto-skipped because its field values cannot be synthesised by Z3
- **Classes with tuple-typed collection fields** (e.g., `var pairs: map<int, (int, int)>`): same reason — tuple element types in class fields are not yet supported
- **iset/imap input parameters** (`iset<T>`, `imap<K,V>`). Note: these types as **return types** work fine when the input parameters are of supported types — the postcondition is used as the `expect` assertion and Dafny evaluates the expressions at runtime
- **Variable-indexed sequence slices in contracts** (e.g., `multiset(b[..i+j])`, `forall k :: b[..i+j][k] <= ...`) — produce unsolvable SMT constraints. Instead of skipping the method entirely, the tool falls back to **precondition-only test generation**: inputs are generated satisfying only preconditions (with boundary analysis for diversity), and the full postconditions are checked at runtime via `expect` assertions

## Supported with Limitations

- Generic type parameters are mapped to `Int` in SMT
- Complex quantifier nesting may cause Z3 timeouts (5-second limit per query). A per-method timeout (default 60s, configurable via `--timeout`) prevents indefinite hangs
- Multi-variable quantifiers (`exists i, j :: ...`) are not decomposed into boundary cases (treated as atomic literals)
- **Recursive functions in postconditions** (e.g., `ensures result == Fact(n)`): recursive functions that are not fully inlined after 2 passes become uninterpreted in SMT — Z3 can freely assign their values, so concrete output values may be incorrect. When the postcondition has the form `output == expr`, the spec expression is emitted directly (e.g., `expect f == Fact(n)`), evaluated by Dafny at runtime (ghost functions are made callable by stripping the `ghost` keyword). With `--check` mode, expects of the form `var == func(...)` have their actual values captured at runtime and injected as concrete literals in the final test (e.g., `expect f == 120;`)
- When postconditions constrain the results implicitly (e.g., `ensures a <= r <= b`) rather than explicitly (e.g., `ensures result == expression`), a **uniqueness check** determines if Z3's concrete output is the only valid one: a second Z3 call with the same inputs but a blocking clause on all output values checks UNSAT. If unique, concrete `expect` statements are emitted (e.g., `expect r == 5;`, `expect a[..] == [-38, 7681];`, `expect obj.count == 3;`). If Z3 returns `unknown` (can't decide but found no counter-example), values are trusted by default (controllable via `--trust-unknown`). If Z3 returns `sat` (found a different valid output), the original postcondition literals are used as `expect` assertions with the concrete values in comments. The uniqueness check covers scalar returns, tuple components, sequence returns, mutable array post-states, and mutable scalar class fields.
- **Ghost predicates with unbounded quantifiers**: when DafnyTestGen strips the `ghost` keyword from predicates to make them callable in `expect` assertions, predicates containing unbounded quantifiers (e.g., `forall r': int | r' > r :: ...`) will cause Dafny compilation errors — the compiler cannot enumerate infinite domains at runtime
- Not all Dafny expressions are translatable to SMT2. Preconditions that cannot be converted to SMT (e.g., those referencing recursove predicates) are emitted as runtime `expect` checks with `// PRE-CHECK` markers. In `--check` mode, test cases whose preconditions are violated at runtime are automatically discarded (reported as `SKIP`) rather than counted as failures. This handles cases where Z3 picks input values that satisfy the translated constraints but violate untranslated preconditions.

## License

MIT
