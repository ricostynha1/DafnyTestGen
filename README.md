# DafnyTestGen

Automatic test generation for [Dafny](https://dafny.org/) programs based on method contracts (preconditions and postconditions).

DafnyTestGen analyzes `requires` and `ensures` clauses, converts both preconditions and postconditions to Disjunctive Normal Form (DNF), and uses the [Z3](https://github.com/Z3Prover/z3) SMT solver to find concrete test inputs that exercise different contract paths.

## How It Works

1. **Parse** Dafny source files and discover methods with `ensures` clauses
2. **Analyze** postconditions in DNF to identify distinct test scenarios
3. **Solve** SMT queries via Z3 to find satisfying concrete inputs for each scenario
4. **Emit** a Dafny test file with `expect` assertions and a `Main()` method

### Test Strategies

- **Auto** (default): boundary mode if no disjunctive clauses, all-combinations otherwise
- **All-combinations** (`-a`): generates tests for all 2^n-1 non-empty truth combinations of DNF clauses
- **Boundary** (`-b`): boundary value analysis on inputs (integer bounds, sequence sizes). Extracts numeric ranges from preconditions (e.g., `-100 <= x <= 100` → tests at x=-100, -99, 0, 1, 99, 100)
- **Simple** (`-s`): one test per DNF clause
- **Disjunctive preconditions**: preconditions with disjunctions (e.g., `requires x > 0 || y > 0`) are decomposed into DNF branches, each tested independently with its own boundary values
- **Quantifier boundary decomposition**: single-variable `exists k :: lo <= k < hi && P(k)` is automatically decomposed into 3 DNF clauses — P(lo), exists in middle range, P(hi-1) — producing up to 7 combinations. Negated `forall` is handled similarly.

## Prerequisites

- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [Dafny](https://github.com/dafny-lang/dafny) (for the `--check` mode and for running generated tests)
- Z3 SMT solver (bundled with the Dafny VS Code extension)

## Build

```bash
cd DafnyTestGen
dotnet build
```

Or publish a standalone executable:

```bash
dotnet publish -c Release -o ../publish
```

## Usage

```bash
# Generate tests for a single file
dotnet run -- test/in/Factorial.dfy -o test/out/FactorialTests.dfy

# Generate tests for all files in a folder
dotnet run -- test/in/ -o test/out/

# Generate tests with verbose output (shows contracts, DNF, SMT queries)
dotnet run -- test/in/BinarySearch.dfy -o test/out/ -v

# Force boundary value analysis with 5 tiers
dotnet run -- test/in/Factorial.dfy -b -t 5

# Validate tests and split into Passing/Failing methods
dotnet run -- test/pass_fail_in/abs__121-127_COI.dfy -o test/pass_fail_out/ -c
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
| `--repeat <n>` | `-r` | Generate N distinct test cases per condition (default: 1) |

## Example

Given a Dafny method:

```dafny
method CalcFact(n: nat) returns (f: nat)
  ensures f == Fact(n)
{
  f := 1;
  for i := 1 to n + 1
    invariant f == Fact(i-1)
  { f := f * i; }
}
```

DafnyTestGen produces:

```dafny
method GeneratedTests_CalcFact()
{
  // Test case for combination 1/Bn=0:
  //   POST: f == Fact(n)
  {
    var n := 0;
    var f := CalcFact(n);
    expect f == Fact(n);
  }

  // Test case for combination 1/Bn=1:
  //   POST: f == Fact(n)
  {
    var n := 1;
    var f := CalcFact(n);
    expect f == Fact(n);
  }
}
```

## Check Mode (`-c`)

When `--check` is enabled, each generated test is executed with `dafny run --no-verify` to determine if it passes or fails. The output is split into two methods:

- **`Passing()`** &mdash; tests that pass at runtime (expects remain active)
- **`Failing()`** &mdash; tests that fail at runtime (expects are commented out)

This is useful for evaluating buggy implementations against their contracts.

## Project Structure

```
DafnyTestGen/
  DafnyTestGen.csproj    # C# project file (.NET 8.0)
  Program.cs             # Main source (~1900 lines)
DafnyTestGen.sln         # Solution file
test/
  in/                    # Sample Dafny input programs (26 files)
  out/                   # Generated test files
  pass_fail_in/          # Buggy programs for --check mode
  pass_fail_out/         # Check mode output (Passing/Failing split)
  failed/                # Programs where test generation times out
```

## Supported Dafny Features

- Integer, natural, real, char, bool types
- Arrays and sequences (including `array<T>`, `seq<T>`, `string`)
- Quantifiers (`forall`, `exists`)
- Implications, logical operators, chain comparisons
- `IsSorted` predicate (built-in translation)
- `old()` expressions in postconditions (captured before method call)
- Ghost function/predicate removal for runtime use
- Uninterpreted functions (postcondition literals used as assertions)

## Limitations

- Generic type parameters are mapped to `Int` in SMT
- Complex quantifier nesting may cause Z3 timeouts (5-second limit per query)
- Multi-variable quantifiers (`exists i, j :: ...`) are not decomposed into boundary cases (treated as atomic literals)
- `fresh()` postconditions are specification-only and skipped
- Not all Dafny expressions are translatable to SMT2

## License

MIT
