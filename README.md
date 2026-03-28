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

The `--tiers <n>` option (default: 4) controls the number of array/sequence size tiers. For example, `-t 5` generates arrays of length 0 through 4.

BVA is **combined with DNF**: each equivalence class (DNF scenario) is tested at each applicable boundary tier. For example, with 3 SAT clauses and 4 boundary tiers, up to 12 tests are generated.

#### Repetition (`-r`)

The `--repeat <n>` option generates **N distinct test cases** per scenario. After finding a satisfying assignment, Z3 is asked again with an additional constraint excluding the previous solution, producing a different input. This is useful for increasing confidence that a scenario works across multiple input values, not just the first one Z3 happens to find.

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
    in/                  #   Source files (28 files)
    out/                 #   Generated test files
  buggy_progs/           # Buggy programs for --check mode
    in/                  #   Source files with known bugs
    out/                 #   Check mode output (Passing/Failing split)
  unsupported_progs/     # Programs not currently supported (tuple types, recursive functions in postconditions, etc.)
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
- **Pre/post state splitting** for `modifies` methods: mutable array parameters get separate pre-state (input) and post-state (output) SMT variables, so postconditions like `IsSorted(a[..])` don't constrain inputs
- Uninterpreted functions (postcondition literals used as assertions)

### Class Method Support

Methods inside Dafny classes are supported in three tiers, with increasing complexity. In all cases, fields are treated as synthetic mutable parameters with pre/post SMT variables; test code constructs a fresh object, assigns Z3-derived values to fields, captures `old()` state, calls the method, and asserts postconditions with `obj.field` references. Classes with trait parents or unsupported field types are auto-skipped.

**Simple classes** — classes with `modifies this` whose non-ghost fields all have supported types (int, nat, bool, real, char, arrays, sequences, sets, multisets, enums). No `Valid()` predicate is required.

**`{:autocontracts}` classes** — classes with the `{:autocontracts}` attribute. `Valid()` is automatically injected as both an implicit precondition and postcondition (its body is inlined for SMT translation, constraining both pre-state and post-state). Constructor parameters are extracted and used for object construction (e.g., `new StackOfInt(capacity)`). `const` array fields (e.g., `const elems: array<int>`) are handled as mutable-content arrays linked to constructor parameters via `ensures` clauses. Parameterless member predicates like `isEmpty()` and `isFull()` are inlined in preconditions.

**Non-autocontracts classes with `requires Valid()`** — classes that use a manual `Valid()` predicate (without `{:autocontracts}`), including those with ghost fields, `modifies Repr`, and class-level type parameters. `Valid()` is not treated specially — it is handled like any other predicate in the contracts (inlined if its body is simple enough, otherwise used as a literal). Heap ownership constraints (`this in Repr`, `data in Repr`) are automatically stripped during SMT encoding — when one conjunct of a `&&` chain is untranslatable, it is silently dropped while preserving the remaining constraints.

#### Ghost Field Handling

Ghost fields (`ghost var`, `ghost const`) in classes are fully supported. In the generated test file:

- `ghost` is stripped from all field and constant declarations, converting them to concrete (compilable) variables, so that test code can directly assign and read ghost state
- Ghost sequence fields (e.g., `ghost var s1: seq<T>`) are assigned from Z3 model values as sequence literals
- Ghost constants already set by the constructor (e.g., `ghost const N: nat`) are left unchanged
- The `Repr` field is reconstructed as `{obj}` plus all object-typed (array) fields
- `old()` wrappers are stripped from method bodies (invalid for non-ghost variables in compiled code — semantics are preserved because `old(x)` in an assignment refers to `x`'s value before the method call, which is still the current value at the assignment point)
- Ghost functions and predicates have their `ghost` keyword stripped to make them callable in `expect` assertions

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
- **Tuple types** (e.g., `(real, real)`)
- **Nested collection types** (e.g., `seq<seq<int>>`, `array<seq<T>>`)
- **Multi-dimensional arrays** (e.g., `array2<int>`, `array3<real>`)
- **iset/map/imap input parameters** (`iset<T>`, `map<K,V>`, `imap<K,V>`). Note: these types as **return types** work fine when the input parameters are of supported types — the postcondition is used as the `expect` assertion and Dafny evaluates the expressions at runtime. `set<T>` and `multiset<T>` are now supported for element types int, nat, char, enum, and generic T — see above
- **Variable-indexed sequence slices in contracts** (e.g., `multiset(b[..i+j])`, `forall k :: b[..i+j][k] <= ...`) — produce unsolvable SMT constraints

## Supported with Limitations

- Generic type parameters are mapped to `Int` in SMT
- Complex quantifier nesting may cause Z3 timeouts (5-second limit per query). A per-method timeout (default 60s, configurable via `--timeout`) prevents indefinite hangs
- Multi-variable quantifiers (`exists i, j :: ...`) are not decomposed into boundary cases (treated as atomic literals)
- Recursive functions in postconditions (e.g., `ensures result == Fact(n)`) cannot be decomposed into DNF branches by the SMT solver. Instead, inputs are generated from preconditions and boundary analysis only, and the full original postcondition is used as the `expect` assertion at runtime (ghost functions are made callable by stripping the `ghost` keyword). With `--check` mode, expects of the form `var == func(...)` have their actual values captured at runtime and injected as concrete literals in the final test (e.g., `expect f == 120;`). Predicates that transitively call other predicates (e.g., `isSubstringPred` -> `isPrefixPred`) are also treated this way to avoid exponential SMT expansion from nested quantifier inlining
- When a postcondition allows multiple valid outputs (e.g., `ensures a <= r <= b`), the generated `expect` uses the concrete value from Z3 (e.g., `expect r == 5`), not the range condition. If the implementation returns a different valid value, this causes a false negative in check mode (test moved to `Failing` even though the method is correct). Output variables not mentioned in any active postcondition literal are already handled (no `expect` emitted)
- **Ghost predicates with unbounded quantifiers**: when DafnyTestGen strips the `ghost` keyword from predicates to make them callable in `expect` assertions, predicates containing unbounded quantifiers (e.g., `forall r': int | r' > r :: ...`) will cause Dafny compilation errors — the compiler cannot enumerate infinite domains at runtime
- Not all Dafny expressions are translatable to SMT2

## License

MIT
