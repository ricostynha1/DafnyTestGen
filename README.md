# DafnyCBT

Automatic contract-based test generation for [Dafny](https://dafny.org/) programs based on method preconditions and postconditions.

DafnyCBT analyzes `requires` and `ensures` clauses, converts them to Disjunctive Normal Form (DNF), and relies on the [Z3](https://github.com/Z3Prover/z3) SMT solver to find concrete test inputs and expected outputs that exercise different contract paths. Test generation combines equivalence class partitioning (via DNF analysis) with boundary value analysis.

> **Note:** DafnyCBT does not currently support traits, function-typed parameters, non-enum algebraic datatypes (e.g. `List<T> = Nil | Cons(...)`), multi-dimensional arrays, or class/reference-typed method parameters. See [Limitations](#limitations) for the full list.

## Use cases

- **Fault detection and localization** — generate tests from the specification (contracts) to help find and localize bugs in the implementation, when the Dafny verifier cannot prove (or disprove) correctness or cannot provide sufficient diagnostic information or counter-examples; in this use case, it is important to generate a test suite with high diversity in **both** the input/output values **and** the spec clause / boundary condition each test was derived from, so failures point at distinct fault classes.
- **Specification-based (black-box) regression and cross-language testing** — generate tests purely from contracts and run them against the same Dafny implementation across versions, or translate them to a target language (C#, Java, Python, JavaScript via Dafny's compilers) to test a port; in this use case, it is important to keep the test set deterministic across runs (fixed seed, output uniqueness enforced) and self-contained (no dependency on internal symbols).
- **Test-driven development** — generate test scaffolding from contracts before any implementation exists, to clarify requirements (not possible with white-box test generators that need code to extract paths); in this use case, it is important to generate a small, readable suite that covers the highest-yield spec partitions per test (Phase 1 / 1r witnesses preferred over BVA repetition variants).

## Key Differentiators

Most automated test generators for contract-equipped languages — such as Pex/IntelliTest (C#), AutoTest (Eiffel), and DART/CUTE — derive test diversity from *implementation paths* via dynamic symbolic execution (DSE) or random testing, using contracts only as runtime oracles. **Dafny's own `dafny generate-tests`** also operates on the implementation: it instruments method bodies and asks Z3 for inputs that reach each instrumented branch, so methods without bodies cannot be tested and the generated set varies with implementation rewrites. DafnyCBT takes a fundamentally different approach:

1. **Specification-driven partitioning, not code coverage.** Test scenarios are derived by decomposing *preconditions* and *postconditions* into Disjunctive Normal Form (DNF), treating each clause as a distinct equivalence class. A method with `ensures (if C then A else B)` produces two test scenarios regardless of implementation complexity. This is closer in spirit to the category-partition method, but fully automated via logical decomposition of formal contracts.

2. **Hybrid SMT / runtime architecture.** SMT solving generates both concrete *inputs* and expected *outputs*. When postconditions are not fully translatable to SMT (e.g., they involve recursive or uninterpreted functions) but have the explicit form `result == expression`, the expression can be evaluated by the Dafny runtime in check mode to obtain concrete output values that are injected back into the test code. As a last resort, the postcondition literals themselves are emitted as `expect` assertions. This layered approach sidesteps fundamental SMT limitations while still producing concrete, readable tests whenever possible.

3. **Output uniqueness analysis.** When postconditions are fully translated to SMT but only constrain outputs implicitly (not via explicit `result == expression` clauses), Z3 produces concrete output values that may not be the only valid ones. A second Z3 query pins the concrete inputs and asks whether a *different* output satisfies the spec. If UNSAT, the output is uniquely determined and a concrete `expect res == 5;` is emitted; otherwise, the postcondition literals are used instead (`expect a[index] == x;`). With `--uniqueness-rounds N`, the tool iteratively enumerates up to N alternative valid outputs; if exhausted, a disjunctive `expect index == 0 || index == 1;` is emitted — more precise than postcondition literals while still covering all valid outputs. This lightweight determinism analysis handles under-constrained specifications without requiring user annotations.

4. **Quantifier decomposition for boundary analysis.** Existential quantifiers `exists k :: lo <= k < hi && P(k)` are decomposed into boundary (k=lo, k=hi−1) and middle cases, with strict/non-strict inequality awareness. Universal quantifiers rely on BVA size tiers (|a|=0, |a|=1, |a|≥2 applied to every array/seq/set/multiset/map input and output) and the per-literal relevance check to force non-vacuous witnesses. These are combined with other contract clauses via cross-product.

5. **No implementation required.** Because test generation is purely specification-based, tests can be generated for bodyless methods — supporting test-driven development where contracts are written first and tests scaffold the implementation.

## How it works

1. **Parse** Dafny source files and discover methods with contracts (`requires`/`ensures` clauses).
2. **Decompose** preconditions and postconditions into DNF clauses (each clause = one equivalence class), with cross-product, simplification, and quantifier decomposition.
3. **Solve** SMT queries via Z3 for each clause to find satisfying inputs and expected outputs. A progressive pipeline escalates through six phases until a per-method test budget is reached:
   - **Phase 1** — one baseline test per DNF clause.
   - **Phase 1r** *(default ON)* — replaces Phase 1's query with a stronger one forcing each safe spec literal to actively prune the output space (a kind of MC/DC for postconditions). Disable with `--no-relevance`.
   - **Phase 1v** *(opt-in, `--vacuity`)* — finds inputs where one literal is implied by the others, useful for fault localisation. See [methodology §1v](docs/methodology.md#per-literal-vacuity-check---vacuity-to-enable).
   - **Phase 2** — refined-range BVA: per-clause-per-variable boundary values derived from clause literals.
   - **Phase 2b** — categorical type/size tiers (=0, >0, <0; |s|=0, |s|=1, |s|≥2; enum constructors; mutation pre/post pairs).
   - **Phase 3** — seeded random repetition to fill the remaining test budget.
4. **Emit** a Dafny test file with `expect` assertions, runtime value injection where SMT can't compute the RHS, and a `Main()` that runs all non-failing tests.

For decomposition rules, the relevance / vacuity formulations, BVA tier tables, output-uniqueness analysis, class support, and full test-emission details, see [`docs/methodology.md`](docs/methodology.md).

## Empirical evaluation

A 2×2 ablation study (bias × relevance, vacuity off) on the [`buggy_progs`](test/buggy_progs/in/) corpus of 314 mutated Dafny programs / 409 methods, run at `-n 10` with a fixed Z3 seed, is documented in [`docs/empirical-evaluation.md`](docs/empirical-evaluation.md). Headline numbers:

| Strategy | killed | kill@1 | kill@10 | gen total |
|---|---:|---:|---:|---:|
| baseline (no refinements) | 177 | 65 | 172 | 2206s |
| +bias only | 182 | 84 | 176 | 2754s |
| +relevance only | 186 | 84 | 181 | 2365s |
| **default (+bias +rel)** | **190** | **108** | **184** | 2857s |

**Reading**: *kill@k* = number of methods whose first failing test is among the first `k` generated tests for that method (per-method local index); *killed* = kill@max at `n = 10`. Each refinement on its own lifts kill@1 from 65 to 84 (+19); together they reach 108. Naive sum predicts 65 + 19 + 19 = 103, but observed is **108 — a super-additive +5 boost** from the interaction. Toward the ceiling, bias's marginal contribution shrinks (+5 at kill@max) while relevance's is preserved (+9), so bias mostly buys *speed* and relevance buys *coverage*. Phase 1 + Phase 1r together account for **75% of all first-failures using only 20% of the test budget** — a ~4× yield over the corpus average. Median wall-clock per method is ~4 s in all configurations. Vacuity (Phase 1v) is opt-in because it adds nothing to the kill rate at this budget; its value is for fault localisation (see [`docs/empirical-evaluation.md` §Vacuity](docs/empirical-evaluation.md#vacuity)).

## Comparison with `dafny generate-tests`

Dafny ships a built-in test generator (`dafny generate-tests`) that complements DafnyCBT rather than overlapping with it:

| | `dafny generate-tests` | DafnyCBT |
|---|---|---|
| What's analysed | Method bodies (instrumented branches) | Contracts (`requires` / `ensures`) |
| Coverage target | Implementation paths (block / branch / path) | Spec partitions (DNF clauses + BVA tiers) |
| Bodyless methods | Cannot test | Generates spec-only test scaffolding (TDD support) |
| Stability under impl rewrite | Test set changes | Test set unchanged |
| Cross-language portability | Tied to Dafny | Generated tests run against any conforming implementation |
| Implementation-bug-finding strength | Targets paths the impl has | Independent of impl; targets the spec, so missed-cases bugs surface |
| Fault localisation | Branch-level | Spec-clause + boundary-condition level |
| External SMT | Internal (via Boogie) | Direct Z3 invocation |

The two are complementary: `dafny generate-tests` is the right tool when you have a stable implementation and want to chase implementation paths; DafnyCBT is the right tool when the spec is the source of truth — for TDD, for cross-version regression, for cross-language porting, and for catching the class of bugs where the impl misses spec-mandated cases entirely.

## Prerequisites

- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [Dafny](https://github.com/dafny-lang/dafny) 4.11.0 (for `--check` mode and for running generated tests; parsing uses the `Microsoft.Dafny` NuGet package, which is bundled with the build)
- Z3 SMT solver (auto-discovered from the Dafny VS Code extension, or configurable via `--z3-path` / `Z3_PATH` env var)

## Build

The project file is not committed to the repository (it embeds a local user path under `<DafnyDir>` and is excluded for anonymisation). Copy the template and set `<DafnyDir>` to your local Dafny 4.11.0 install path:

```bash
cp DafnyCBT/DafnyCBT.csproj.template DafnyCBT/DafnyCBT.csproj
# then edit DafnyCBT/DafnyCBT.csproj and replace PATH_TO_YOUR_LOCAL_DAFNY_INSTALL
```

With the VS Code Dafny extension installed, the path typically looks like `<USER>/.vscode/extensions/dafny-lang.ide-vscode-3.5.2/out/resources/4.11.0/github/dafny`. The directory must contain `DafnyCore.dll`, `DafnyPipeline.dll`, the `Boogie.*` DLLs, `System.CommandLine.dll`, and the `Microsoft.Extensions.*` DLLs referenced inside the template.

Then build:

```bash
cd DafnyCBT
dotnet build
```

Or publish a self-contained standalone executable to the `publish/` folder:

```bash
dotnet publish -c Release -o ../publish
```

This produces `publish/DafnyCBT.exe` (Windows) or `publish/DafnyCBT` (Linux/macOS), which can be run directly without .NET installed on the target machine.

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
publish\DafnyCBT.exe test/correct_progs/in/Factorial.dfy -o test/correct_progs/out/
publish\DafnyCBT.exe test/correct_progs/in/ -o test/correct_progs/out/

# Linux / macOS
publish/DafnyCBT test/correct_progs/in/Factorial.dfy -o test/correct_progs/out/
```

### Generated test format

A typical generated test looks like:

```dafny
method TestsForFindMax()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: max == a[k] for some k
  //   POST Q2: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[2] [0.5, 0.0];
    var max := FindMax(a);
    expect max == 0.5;
  }
  ...
}
```

Each test is preceded by a comment naming the **clause label** (e.g. `{1}/Rel` for a relevance test, `{2}/B|a|=0` for a boundary tier) and the spec literals it satisfies. See [`docs/methodology.md` §Test Emission](docs/methodology.md#test-emission) for the full grouping and check-mode mechanics, and the worked examples for class-method tests, output uniqueness, and runtime value injection.

### Command-line options

Core flags most users will need:

| Option | Alias | Description |
|--------|-------|-------------|
| `--output <path>` | `-o` | Output file or directory |
| `--method <name>` | `-m` | Target a specific method (default: all) |
| `--verbose` | `-v` | Show debug info (contracts, DNF, SMT queries) |
| `--check` | `-c` | Validate each test at runtime (default: ON; auto-disabled when bodyless methods are present) |
| `--no-check` | | Disable runtime validation |
| `--min-tests <n>` | `-n` | Minimum test count for progressive auto strategy (default: 4) |
| `--max-tests <n>` | `-x` | Maximum number of generated tests per method (0 = unlimited) |
| `--repeat <n>` | `-r` | Generate N distinct test cases per scenario (default: 1) |
| `--timeout <n>` | | Timeout in seconds for test generation per method (0 = unlimited, default: 60) |
| `--seed <n>` | | Force a fixed Z3 random seed for reproducibility (default: per-method hash) |
| `--grouping <mode>` | `-g` | Test grouping: `by-method` (default) or `by-status` |
| `--skip-bodyless` | `-p` | Skip bodyless methods instead of generating spec-only scaffolding |
| `--all-combinations` | `-a` | Use FDNF instead of DNF (more clauses; loses short-circuit safety — see [methodology §DNF vs FDNF](docs/methodology.md#dnf-vs-fdnf-and-the--a-flag)) |
| `--boundary` | `-b` | Force boundary value analysis on inputs |
| `--simple` | `-s` | One test per DNF clause |
| `--tiers <n>` | `-t` | Sequence/array/set/multiset/map size tiers for boundary analysis (default: 4) |
| `--uniqueness-rounds <n>` | `-u` | Max rounds of uniqueness checking to enumerate alternative outputs (default: 2) |
| `--no-bias` | `-nb` | Disable anti-trivial bias (soft constraints + randomized seed) |
| `--no-relevance` | `-nr` | Disable per-literal relevance check (Phase 1r) |
| `--vacuity` | `-v1v` | Enable per-literal vacuity check (Phase 1v) — for fault localisation |
| `--vacuity-isolated` | `-v1vi` | Tighten Phase 1v: emit `/Vi{k}` only when `Qk` is the *only* vacuous literal on the witness |
| `--z3-path <path>` | | Path to Z3 executable (default: auto-discover) |

#### Advanced flags (debugging / ablation)

| Option | Alias | Description |
|--------|-------|-------------|
| `--relevance-mode <m>` | | Phase 1r shadow-block strategy: `combined` / `group` / `ladder` (default). See [methodology §1r modes](docs/methodology.md#modes---relevance-mode) |
| `--no-exists-decomposition` | `-ned` | Disable decomposition of single-variable existentials into boundary cases (ablation) |
| `--reverse-bva-order` | `-rbva` | Run Phase 2b before Phase 2 instead of after (ablation) |
| `--trust-unknown` | | Trust Z3 output values when uniqueness check returns 'unknown' (default: false) |
| `--drop-post-wf-guards <bool>` | | Internal: control treatment of well-formedness guards generated for postcondition accesses (default: true). Pass `false` only to reproduce legacy behaviour |
| `--skip-on-exception` | | In `--check` mode, treat tests crashing with an unhandled exception as `SKIP` instead of `FAIL` |
| `--comment-uncompilable` | | In `--check` mode, when `dafny build` fails on uncompilable `expect` expressions, comment them out and retry |

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

### Automatically skipped

At method discovery time, DafnyCBT skips:

- **Ghost methods** (`ghost method …`) and **lemmas** — not intended to be compiled/executed.
- **Methods without `ensures` clauses** — there's no postcondition to check at runtime. This also excludes `Main`, test drivers, and unspec'd helpers.
- **Methods with `test`/`Test` in the name** — assumed to be existing test drivers.
- **Verifier-style methods using havoc (`x := *`, `x, y := *, *`)** — these are proof encodings (typically havoc + `assume` invariant + one-iteration + `assume false` to replace a `while` loop during verification). Dafny's compiler treats `*` as a no-op at runtime, so the compiled code diverges from the spec and every test would be a false-positive failure. A message like `Skipping 1 verifier-style method(s) using havoc (:= *): bar` is printed during discovery. The fix in the source: rewrite the proof encoding as an actual `while` loop, or mark the method as `ghost method` / `lemma`.

### Supported with limitations

- **Complex quantifier nesting** may cause Z3 timeouts (5-second limit per query); a per-method timeout (default 60s, `--timeout`) prevents indefinite hangs.
- **Postconditions with multi-variable quantifiers over nested seqs** often cause Z3 to return `unknown`, limiting coverage.
- **Ghost predicates with unbounded quantifiers** — when `ghost` is stripped to make the predicate callable from `expect`, a predicate body like `forall r': int | r' > r :: ...` causes Dafny compilation errors (infinite domain cannot be enumerated at runtime).
- **Untranslatable preconditions** (e.g., referencing recursive predicates) are emitted as runtime `expect` checks marked `// PRE-CHECK`. In `--check` mode, tests whose preconditions are violated at runtime are automatically discarded (reported as `SKIP`).
- **Uncompilable `expect` expressions** (unbounded quantifiers Dafny can't enumerate at runtime, `old()` leaking into non-ghost contexts, etc.) cause `dafny build` to fail in `--check` mode. By default the check phase fails hard so the user sees the Dafny error; enable `--comment-uncompilable` to keep the run going.

## Project Structure

```
DafnyCBT/
  DafnyCBT.csproj.template  # Project file template (real .csproj is gitignored)
  Program.cs                # CLI, orchestration, test generation loop
  DafnyParser.cs            # Dafny AST parsing, method discovery
  DnfEngine.cs              # DNF decomposition, quantifier boundary decomposition
  SmtTranslator.cs          # Dafny-to-SMT2 translation, query building
  BoundaryAnalysis.cs       # Boundary value tiers, numeric/relational bounds extraction
  TestEmitter.cs            # Dafny test code generation, old() capture handling
  TestValidator.cs          # --check mode: run tests, split into Passing/Failing
  TypeUtils.cs              # Type checks, Z3 model parsing, value normalization
  Z3Runner.cs               # Z3 process execution
docs/
  methodology.md            # Decomposition rules, phases, BVA, test emission
  empirical-evaluation.md   # buggy_progs ablation results
test/
  correct_progs/in/         # Correct Dafny programs (regression suite)
  buggy_progs/in/           # Mutated programs (DafnyBench + MutDafny)
run_tests_buggy_progs_comparison.sh  # Ablation runner (also gitignored copy in /publish)
```

The pipeline flows as: **DafnyParser** → **DnfEngine** → **BoundaryAnalysis** + **SmtTranslator** → **Z3Runner** → **TypeUtils** (model parsing) → **TestEmitter** → **TestValidator** (optional).

## License

See `LICENSE` (when present).
