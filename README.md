# DafnyTestGen

Automatic test generation for [Dafny](https://dafny.org/) programs based on method contracts (preconditions and postconditions).

DafnyTestGen analyzes `requires` and `ensures` clauses, converts both preconditions and postconditions to Disjunctive Normal Form (DNF), and uses the [Z3](https://github.com/Z3Prover/z3) SMT solver to find concrete test inputs that exercise different contract paths.

## How It Works

1. **Parse** Dafny source files and discover methods with contracts (`requires`/`ensures` clauses)
2. **Analyze** preconditions and postconditions in DNF to identify distinct test scenarios
3. **Solve** SMT queries via Z3 to find satisfying concrete inputs for each scenario
4. **Emit** a Dafny test file with `expect` assertions and a `Main()` method

### Test Strategies

DafnyTestGen uses method contracts to derive test scenarios, combining equivalence class partitioning (via DNF analysis) with boundary value analysis. Strategies can be selected explicitly or chosen automatically.

#### Equivalence Class Partitioning via DNF

The core idea: preconditions and postconditions define **equivalence classes** of inputs and expected behaviors. DafnyTestGen converts all contract clauses to **Disjunctive Normal Form (DNF)**, producing a set of clauses that partition the input/output space.

**How DNF decomposition works.** Each `ensures` clause with an implication `A ==> B` is rewritten as `!A || B`, producing two literals. When multiple `ensures` clauses exist, their cross-product forms the full DNF. Disjunctive preconditions (`requires A || B`) are decomposed similarly.

**Example — disjunctive postconditions** (`Classify`):

```dafny
method Classify(x: int) returns (r: int)
  requires -100 <= x <= 100
  ensures x < 0 ==> r == -1
  ensures x == 0 ==> r == 0
  ensures x > 0 ==> r == 1
```

Each implication produces 2 literals, and the cross-product of 3 ensures clauses yields 2×2×2 = **8 DNF clauses**. For example:
- Clause 2: `!(x < 0)` ∧ `!(x == 0)` ∧ `r == 1` — corresponds to x > 0
- Clause 3: `!(x < 0)` ∧ `r == 0` ∧ `!(x > 0)` — corresponds to x == 0
- Clause 5: `r == -1` ∧ `!(x == 0)` ∧ `!(x > 0)` — corresponds to x < 0

Many clauses are contradictory (e.g., clause 1: `!(x<0)` ∧ `!(x==0)` ∧ `!(x>0)` — impossible) and are detected as UNSAT by Z3.

**Example — disjunctive preconditions** (`Process`):

```dafny
method Process(x: int, y: int) returns (r: int)
  requires x > 0 || y > 0
  ensures r == x + y
```

The precondition `x > 0 || y > 0` is decomposed into 2 DNF branches. With all-combinations, this produces 3 precondition scenarios, each with exclusions to force the intended branch:
- P{1}: `x > 0` ∧ `!(y > 0)` — only x is positive
- P{2}: `!(x > 0)` ∧ `y > 0` — only y is positive
- P{1,2}: `x > 0` ∧ `y > 0` — both positive

Each precondition scenario is crossed with postcondition scenarios.

**Simple mode** (`-s`): generates one test per DNF clause. For the Classify example, this tries each of the 8 clauses individually, yielding 3 tests (clauses 2, 3, 5 are SAT).

**All-combinations mode** (`-a`): generates tests for all **2^n − 1** non-empty subsets of DNF clauses, testing which combinations can hold simultaneously. For each combination {i, j, ...}, the selected clauses are asserted and all non-selected clauses are **negated** (exclusions). For Classify with 8 clauses, this produces 255 combinations — but two pruning optimizations eliminate most of them without calling Z3:

1. **Syntactic contradiction detection**: Before invoking Z3, the merged literals are checked for obvious contradictions — direct complements (`L` ∧ `!(L)`), distinct equalities (`r == 0` ∧ `r == 1`), and incompatible relational constraints (`x < 0` ∧ `x > 0`), including numeric range analysis. For Classify, this instantly detects 7 contradictory combinations (e.g., clause {4} has `r == 0` ∧ `r == 1`).

2. **UNSAT superset pruning**: When a combination's literals are contradictory, any superset is also contradictory (adding more literals to a contradiction stays contradictory). The contradictory mask is recorded, and all 2^(n-k) supersets are instantly pruned. For Classify, this prunes 241 additional combinations.

Together, these reduce Z3 calls from **255 to just 7** (a 97% reduction), while producing the same 3 SAT results. The pruning is fully automatic and applies to all modes (all-combinations, simple, progressive).

With more complex contracts, all-combinations discovers scenarios where multiple clauses hold simultaneously. For example, FindMax with `ensures exists k :: ...` and `ensures forall k :: ...` produces combinations like {1,3} (max at both first and last position — a single-element array).

#### Quantifier Boundary Decomposition

Single-variable existential quantifiers of the form `exists k :: lo <= k < hi && P(k)` are automatically decomposed into **3 DNF clauses** representing boundary cases:

1. **Left boundary**: `P(lo)` — property holds at first position
2. **Middle**: `exists k :: lo+1 <= k < hi-1 && P(k)` — property holds somewhere in the middle
3. **Right boundary**: `P(hi-1)` — property holds at last position

These clauses feed into the same DNF analysis, so they combine with other postcondition clauses via simple or all-combinations mode. Negated `forall` quantifiers (`!(forall k :: range ==> P(k))`, equivalent to `exists k :: range && !P(k)`) are handled similarly.

**Example** (`FindMax`):

```dafny
ensures exists k :: 0 <= k < a.Length && max == a[k]
ensures forall k :: 0 <= k < a.Length ==> max >= a[k]
```

The `exists` clause decomposes into: max at position 0 (left), max in middle, max at position a.Length-1 (right). With all-combinations, this yields 7 combinations — {1}: max at left only, {2}: max in middle only, {3}: max at right only, {1,3}: max at both ends (single-element array), etc. Contradictory combinations (e.g., {1,2,3} with exclusions preventing all three) are UNSAT.

#### Boundary Value Analysis (`-b`)

BVA complements equivalence class partitioning by testing at the **edges** of each equivalence class. DafnyTestGen extracts numeric bounds from contracts and generates boundary tiers:

- **Integer ranges**: for `requires -100 <= x <= 100`, generates tests at x = -100, -99, 0, 1, 99, 100
- **Array/sequence sizes**: generates tests with different sizes (length 0, 1, 2, 3, ...), with distinct elements within each tier
- **Nested sequence inner-length floor tiers**: for `seq<seq<T>>` and `seq<string>` parameters, additional tiers constrain the **minimum inner sublist length**. Without these, Z3 gravitates to empty inner sublists (length 0), producing tests where min-length results are always 0. Two floor tiers are added:
  - `inner>=1`: all active sublists have length ≥ 1 (forces min-length results like `v >= 1`)
  - `inner>=2`: all active sublists have length ≥ 2 (forces `v >= 2`)

  These are placed **before** the outer-length tiers in the tier list, so the progressive strategy picks them up early and produces diverse output values. They are alternative entries (not cross-producted with outer-length tiers) to avoid conflicts with the exclusion mechanism that blocks previously-seen input values. Z3 freely chooses the outer length for each floor tier.
- **Ordering shape tiers**: when a precondition constrains an array or sequence with a non-strict ordering (`<=` or `>=`), the weak ordering is decomposed into structurally distinct cases:
  - **constant** (`a-shape=const`): all elements are equal (e.g., `[3, 3, 3]`)
  - **strictly ordered** (`a-shape=strict-asc` or `strict-desc`): all consecutive pairs are strictly ordered, no duplicates (e.g., `[-3, -2, -1]`)

  This is detected from: `IsSorted(a[..])` predicate calls, `forall i, j :: ... ==> a[i] <= a[j]` (two-variable), and `forall i :: ... ==> a[i] <= a[i+1]` (consecutive pairs). The same applies for `>=` (descending). Shape tiers are cross-producted with size tiers and other boundary parameters. When shape tiers are present for a parameter, element distinctness constraints are omitted from its size tiers (since the shape tiers control element relationships more precisely).

The `--tiers <n>` option (default: 4) controls the number of array/sequence size tiers. For example, `-t 5` generates arrays of length 0 through 4.

BVA is **combined with DNF**: each equivalence class (DNF scenario) is tested at each applicable boundary tier. For example, with 3 SAT clauses and 4 boundary tiers, up to 12 tests are generated.

#### Repetition (`-r`)

The `--repeat <n>` option generates **N distinct test cases** per scenario. After finding a satisfying assignment, Z3 is asked again with an additional constraint excluding the previous solution, producing a different input. This is useful for increasing confidence that a scenario works across multiple input values, not just the first one Z3 happens to find.

#### Recursive Function Finite Unrolling

Dafny postconditions often reference recursive functions (e.g., `ensures f == Fact(n)`). By default, Z3 treats these as uninterpreted — it knows `Fact` is a function but not its definition, so it cannot compute concrete expected values. DafnyTestGen automatically detects simple recursive functions and compiles them into finite SMT `define-fun` definitions, replacing the opaque declaration with a concrete nested `ite` (if-then-else) chain.

**Supported recursion patterns:**

| Pattern | Example | How it works |
|---------|---------|-------------|
| **IntCountdown** | `Fact(n)`, `Catalan(n)`, `SumOfDigits(n)` | Integer parameter counts down to base case. Values are precomputed by a C# mini-evaluator for n=0..10, producing a nested `ite` chain with concrete results |
| **SeqFold** | `SumSeq(s)`, `ProdB(s)` | Sequence parameter shrinks via slicing (`s[..len-1]`, `s[1..]`). A symbolic `ite` chain is built over `seq.len` for lengths 0..8, folding with `+` or `*` |
| **ArrayIndexedCountdown** | `SumOfNegatives(a, n)`, `ArraySum(a, n)` | Array + integer index parameter; index counts down. A symbolic `ite` chain is built over the index for n=0..8, with per-element array access via `seq.nth` on the array's sequence view |

**Detection criteria:** A function is eligible for unrolling when it is recursive (body contains exactly one self-call), has a scalar return type (`int`, `nat`, `real`, `bool`), and has no higher-order parameters (no `->` or `~>` types). Classification is based on parameter types: functions with `array<T>` parameters get `ArrayIndexedCountdown`, those with `seq<T>` get `SeqFold`, and the rest get `IntCountdown`.

**Example — Factorial:**

```dafny
function Fact(n: nat): nat { if n == 0 then 1 else n * Fact(n - 1) }
```

Generates the SMT definition:
```smt2
(define-fun Fact ((n Int)) Int
  (ite (= n 0) 1
  (ite (= n 1) 1
  (ite (= n 2) 2
  (ite (= n 3) 6
  (ite (= n 4) 24
  ... ))))))
```

This allows Z3 to constrain `f == Fact(n)` directly, producing tests like `expect f == 1;`, `expect f == 24;` with correct concrete values instead of leaving `Fact(n)` as an opaque assertion.

**Call-site array→seq substitution:** When a `define-fun` takes a `(Seq Int)` parameter but the postcondition passes an array handle (Int-typed in SMT), the call site is automatically rewritten to pass the `_seq` variable instead (e.g., `(Fact a)` → `(Fact a_seq)`), ensuring sort compatibility.

#### Progressive Auto Strategy (default)

When no explicit strategy flag (`-a`, `-b`, `-s`, `-r`) is given, DafnyTestGen uses a **progressive strategy** that escalates until enough tests are generated (controlled by `--min-tests`, default 4):

1. **Phase 1 — Tiered combinations**: Run DNF combinations with automatic tier escalation based on clause count:
   - **n ≤ 5 clauses**: full all-combinations (all 2^n − 1 subsets)
   - **n ≤ 8 clauses**: up to triples (3-way combinations)
   - **n ≤ 10 clauses**: up to pairs (2-way combinations)
   - **n > 10 clauses**: singletons only (one clause at a time)

   Higher tiers are also subject to a time budget — if earlier tiers consume too much time, later tiers are skipped.

2. **Phase 2 — Boundary analysis** (only when n ≤ 10): Add boundary value tiers crossed with singleton combinations. The boundary cross-product is capped at 64 tiers; when the full cross-product exceeds this limit, parameters with the most tiers are greedily dropped until it fits. This phase is skipped entirely for high-clause methods (n > 10) where singletons alone provide sufficient coverage.

3. **Phase 3 — Repeats**: Generate additional distinct inputs per condition (up to 3 per condition) until the minimum is reached.

This ensures methods with rich disjunctive postconditions get good coverage from phase 1 alone, while methods with a single postcondition clause automatically get boundary and repeat coverage. The `--min-tests 0` option runs only phase 1 (tiered combinations without escalation).

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

# Thorough: all combinations + boundary + 3 tests per scenario
dotnet run -- test/correct_progs/in/BinarySearch.dfy -o test/correct_progs/out/ -a -b -r 3

# Validate tests and split into Passing/Failing methods
dotnet run -- test/buggy_progs/in/abs__121-127_COI.dfy -o test/buggy_progs/out/ -c
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
| `--all-combinations` | `-a` | Test all non-empty truth combinations of DNF clauses |
| `--boundary` | `-b` | Boundary value analysis on inputs |
| `--simple` | `-s` | One test per DNF clause (overrides auto) |
| `--tiers <n>` | `-t` | Sequence/array size tiers for boundary analysis (default: 4) |
| `--check` | `-c` | Run each test with Dafny, split output into Passing/Failing |
| `--repeat <n>` | `-r` | Generate N distinct test cases per scenario (default: 1) |
| `--min-tests <n>` | `-n` | Minimum test count for progressive auto strategy (default: 4) |
| `--max-tests <n>` | `-x` | Maximum number of generated tests per method (0 = unlimited) |
| `--timeout <n>` | | Timeout in seconds for test generation per method (0 = unlimited) |
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

When postconditions involve quantifiers or predicates that cannot be directly used as `expect` assertions, Z3-computed **concrete expected values** are emitted instead:

```dafny
  // Test case for combination {1}: max at left boundary
  {
    var a := new real[2] [0.5, 0.0];
    var max := FindMax(a);
    expect max == 0.5;
  }
```

## Check Mode (`-c`)

When `--check` is enabled, DafnyTestGen compiles all tests into a **single** Dafny file with `dafny build --no-verify` (one compilation), then runs the compiled binary. Each `expect` is replaced with a `CheckExpect` helper that prints `FAIL:N` / `DONE:N` markers instead of aborting, so all tests run to completion. If a test crashes (e.g., `IndexOutOfRangeException`) or times out (e.g., infinite loop), the remaining incomplete tests are automatically **re-checked individually** using the same compiled binary with a test index argument — no recompilation needed. The output is split into two methods:

- **`Passing()`** &mdash; tests that pass at runtime (expects remain active)
- **`Failing()`** &mdash; tests that fail at runtime (expects are commented out)

When postconditions use recursive or ghost functions (e.g., `expect f == Fact(n);`), check mode captures the actual output values at runtime and injects them as concrete literals in the final test file (e.g., `expect f == 120;`). The same mechanism applies to postconditions with quantifiers over sets (e.g., `r == (forall x :: x in S ==> x > 0)`) where Z3 cannot evaluate the quantifier to a concrete boolean — the check phase runs the expression via Dafny and injects the result (e.g., `expect r == true;`).

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
- **`set<T>` input parameters**: sets are encoded as `(Array Int Bool)` characteristic functions in SMT with a bounded element universe (8 values). The universe is element-type-dependent: `int` uses `{-2, -1, 0, 1, 2, 3, 4, 5}`, `nat` uses `{0..7}`, `char` uses `{'a'..'h'}` (codes 97–104), and enum datatypes use ordinals `{0..min(N,8)-1}`. Membership (`x in S`), cardinality (`|S|`), union (`+`), intersection (`*`), difference (`-`), and subset (`<=`) are all supported. Boundary analysis generates cardinality tiers (0, 1, 2, 3 elements), capped at the number of constructors + 1 for enum element types. Set literals are emitted as Dafny set display expressions with proper formatting (e.g., `{-1, 0, 3}` for int, `{'a', 'c'}` for char, `{Red, Blue}` for enums). Supported element types: `int`, `nat`, `char`, enum datatypes, and generic `T` (treated as int)
- **`multiset<T>` parameters**: multisets are encoded as `(Array Int Int)` count functions in SMT with the same element-type-dependent bounded universe as sets, where each element maps to its multiplicity. Multiset variables are constructed from a zero-default base array with per-element variables, ensuring out-of-universe indices are always 0 without quantifier constraints. Membership (`x in M`), cardinality (`|M|`), element count (`M[x]`), union (`+`), intersection (`*`), difference (`-`), and subset (`<=`) are all supported. Operations are expanded pointwise over the bounded universe. Boundary analysis generates cardinality tiers (0, 1, 2, 3 elements). Multiset literals are emitted as Dafny multiset display expressions with proper formatting (e.g., `multiset{0, 2, 2, 5}` for int, `multiset{0, 3, 3}` for nat). Supported element types: `int`, `nat`, `char`, enum datatypes, and generic `T` (treated as int)
- **`map<K,V>` parameters**: maps are encoded as two parallel SMT arrays — a domain `(Array K Bool)` for key presence and a values `(Array K V)` for values at each key — over the same bounded key universe as sets. Membership (`k in m`), cardinality (`|m|`), key lookup (`m[k]`), and map merge (`a + b`) are translated to SMT constraints on the domain/values arrays. Map update (`m[k := v]`), key removal (`m - {k}`), and `m.Keys` are handled via runtime evaluation: postconditions of the form `r == <expr>` capture the RHS before the method call and use Dafny's own evaluation for the `expect` assertion. Boundary analysis generates cardinality tiers (0, 1, 2, 3 keys), capped at the number of constructors + 1 for enum key types. Map literals are emitted as Dafny map display expressions (e.g., `map[-1 := 5, 0 := 3]`). Supported key types: `int`, `nat`, `char`, enum datatypes, and generic `T`. Supported value types: `int`, `nat`, `bool`, `real`, `char`, enum datatypes
- **Tuple types** (e.g., `(int, int)`, `(real, real)`): supported as standalone parameters, return types, array element types (`array<(T, U)>`), and sequence element types (`seq<(T, U)>`). Tuple components are decomposed into separate SMT variables (e.g., `t: (int, int)` → `t_0: Int`, `t_1: Int`; `a: array<(real, real)>` → parallel component sequences `a_seq_0: (Seq Real)`, `a_seq_1: (Seq Real)` with equal-length constraints). Tuple field access (`t.0`, `a[i].1`) is translated to the corresponding component variable or sequence element. Generated test code uses Dafny tuple literals (e.g., `var t := (3, 5);`, `var a := new (real, real)[2] [(1.0, 2.0), (3.0, 4.0)];`). Supported component types: `int`, `nat`, `real`, `char`, `bool`. Nested tuples and tuples in sets/maps are not yet supported
- **Pre/post state splitting** for `modifies` methods: mutable array parameters get separate pre-state (input) and post-state (output) SMT variables, so postconditions like `IsSorted(a[..])` don't constrain inputs
- Uninterpreted functions (postcondition literals used as assertions)
- **Recursive function finite unrolling**: simple recursive functions in postconditions (e.g., `Fact(n)`, `SumSeq(s)`, `SumOfNegatives(a, n)`) are automatically detected, classified by recursion pattern, and compiled into finite SMT `define-fun` definitions — allowing Z3 to compute concrete expected values instead of treating the function as opaque (see [Recursive Function Finite Unrolling](#recursive-function-finite-unrolling) below)
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

- **Programs with bodyless methods**: if the source file contains any non-ghost method without a body, the entire file is skipped — such programs cannot be compiled by `dafny build`
- **Bodyless methods**: abstract methods (without an implementation body) are skipped — there is no code to test
- **Bodyless functions/predicates in contracts**: methods whose `requires` or `ensures` clauses reference a function or predicate without a body (abstract/opaque) are skipped — the function's semantics are unknown

## Not Currently Supported (Auto-Skipped)

The following are auto-detected and skipped. Some may be addressed in the future.

- **Trait methods and classes with traits**: require dynamic dispatch and inheritance handling (classes with trait parents are auto-skipped)
- **Twostate predicates/functions in contracts**: reference two heap states (old and new) that cannot be translated to SMT or used as `expect` assertions
- **Function-typed parameters** (e.g., `P: T -> bool`, `f: int ~> int`): cannot be represented in SMT
- **Complex datatype parameters**: non-enum datatypes (e.g., `List<T> = Nil | Cons(head: T, tail: List<T>)`, `Tree = Node(int, Tree, Tree)`) — including when nested in generics
- **Class/reference-typed method parameters** (e.g., `method foo(m: Message, addr: Address)`): methods whose parameters include user-defined class or reference types are auto-skipped — such values cannot be synthesised by Z3
- **Nested collection types** other than `seq<seq<T>>` and `seq<string>` (e.g., `array<seq<T>>`, `set<seq<int>>`, `seq<set<int>>`)
- **Multi-dimensional arrays** (e.g., `array2<int>`, `array3<real>`)
- **Classes with collection fields containing class element types** (e.g., `var messages: set<Message>`, `var recipients: seq<Address>`, `var cache: map<int, Entry>`): the class is auto-skipped because its field values cannot be synthesised by Z3
- **Classes with tuple-typed collection fields** (e.g., `var pairs: map<int, (int, int)>`): same reason — tuple element types in class fields are not yet supported
- **iset/imap input parameters** (`iset<T>`, `imap<K,V>`). Note: these types as **return types** work fine when the input parameters are of supported types — the postcondition is used as the `expect` assertion and Dafny evaluates the expressions at runtime
- **Variable-indexed sequence slices in contracts** (e.g., `multiset(b[..i+j])`, `forall k :: b[..i+j][k] <= ...`) — produce unsolvable SMT constraints

## Supported with Limitations

- Generic type parameters are mapped to `Int` in SMT
- Complex quantifier nesting may cause Z3 timeouts (5-second limit per query). A per-method timeout (default 60s, configurable via `--timeout`) prevents indefinite hangs
- Multi-variable quantifiers (`exists i, j :: ...`) are not decomposed into boundary cases (treated as atomic literals)
- **Recursive functions in postconditions** (e.g., `ensures result == Fact(n)`): simple recursive functions are automatically unrolled into finite SMT `define-fun` definitions, allowing Z3 to compute concrete expected values (see [Recursive Function Finite Unrolling](#recursive-function-finite-unrolling) below). Functions that don't match any supported recursion pattern are left as uninterpreted — inputs are generated from preconditions and boundary analysis only, and the full original postcondition is used as the `expect` assertion at runtime (ghost functions are made callable by stripping the `ghost` keyword). With `--check` mode, expects of the form `var == func(...)` have their actual values captured at runtime and injected as concrete literals in the final test (e.g., `expect f == 120;`). Predicates that transitively call other predicates (e.g., `isSubstringPred` -> `isPrefixPred`) are also treated this way to avoid exponential SMT expansion from nested quantifier inlining
- When postconditions constrain the results (returned values and final array or object states) implicitly (e.g., `ensures a <= r <= b`) and not explicitly (e.g., `ensures result == expression`),  an attempt is made to determine if a concrete result value provided by Z3 is unique (via a second call to Z3). If so, it is generated an `expect` statement using the concrete value from Z3 (e.g., `expect r == 5`). Otherwise, it are generated `expect` statements corresponding to the original postconditions, and the concrete value is included in comments.
- **Ghost predicates with unbounded quantifiers**: when DafnyTestGen strips the `ghost` keyword from predicates to make them callable in `expect` assertions, predicates containing unbounded quantifiers (e.g., `forall r': int | r' > r :: ...`) will cause Dafny compilation errors — the compiler cannot enumerate infinite domains at runtime
- Not all Dafny expressions are translatable to SMT2. Preconditions that cannot be converted to SMT (e.g., those referencing recursove predicates) are emitted as runtime `expect` checks with `// PRE-CHECK` markers. In `--check` mode, test cases whose preconditions are violated at runtime are automatically discarded (reported as `SKIP`) rather than counted as failures. This handles cases where Z3 picks input values that satisfy the translated constraints but violate untranslated preconditions.

## License

MIT
