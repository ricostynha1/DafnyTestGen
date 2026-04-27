# Empirical evaluation

Ablation study on the **buggy_progs** corpus, measuring the contribution of DafnyCBT's three optional refinements — anti-trivial **bias**, per-literal **relevance check** (Phase 1r), and per-literal **vacuity check** (Phase 1v) — to mutation kill rate, kill@k, and wall-clock time.

## Corpus

[`test/buggy_progs/in/`](../test/buggy_progs/in/) — 314 programs, 409 methods, all sourced from public Dafny repositories and mutated with a single seeded mutation operator per file (mutation kind encoded in the filename suffix: `EVR_int`, `MVR`, `SDL`, `ROR_Eq`, `LVR`, `AOI`, `BBR`, etc.). Each program contains exactly one "buggy" implementation; all generated tests should pass against the *correct* version of the same spec, and at least one test is expected to expose the mutant.

The corpus mixes simple numeric methods (`abs`, `factorial`, `power`, `fibonacci`), array/sequence operations (`bubble_sort`, `insertion_sort`, `find_max`, `count_distinct`), and more elaborate spec patterns (`merge_sort`, `binary_search`, `last_position`, classified-style intervals). 91 programs end up entirely passing — either the mutant is semantically equivalent to the spec, or no test in the budget happens to expose it.

## Methodology

Each strategy emits up to **n = 10** tests per method with a **fixed Z3 random seed (42)** for cross-strategy reproducibility, runs the corpus sequentially (no `&` background), and records pass/fail per test. The runner script is [`run_tests_buggy_progs_comparison.sh`](../run_tests_buggy_progs_comparison.sh).

Strategies presented here form a 2×2 factorial of bias × relevance, with vacuity disabled in all cells (the [vacuity ablation](#vacuity) below shows it adds nothing on this corpus at this budget):

| Strategy | Flags | Bias | Relevance |
|---|---|:--:|:--:|
| `baseline` | `--no-bias --no-relevance` | OFF | OFF |
| `+bias` | `--no-relevance` | ON | OFF |
| `+relevance` | `--no-bias` | OFF | ON |
| `+bias+rel` *(= default)* | (no flags) | ON | ON |

## Mutation kill curves — per method

A method is "killed at budget k" iff the first failing test among its first k generated tests exists. The y-axis counts methods killed; the dashed-tail markers (→N) at the right edge are the asymptotic kill counts at the full budget (n = 10).

![Mutation kill curve, per method](kill_curves_per_method.png)

| Strategy | killed | kill@1 | kill@5 | kill@10 | AUC |
|---|---:|---:|---:|---:|---:|
| baseline | 177 | 65 | 161 | 172 | 8521 |
| +bias | 182 | 84 | 170 | 176 | 8797 |
| +relevance | 186 | 84 | 173 | 181 | 8984 |
| +bias+rel *(default)* | **190** | **108** | **175** | **184** | **9218** |

**Main effects** — averaged over the other refinement's two values:
- Bias: averaged uplift ≈ +4.5 methods at kill@max, +21 at kill@1.
- Relevance: averaged uplift ≈ +8.5 methods at kill@max, +0 at kill@1.

**Interaction** — when both refinements are on, the joint kill count (190) exceeds the sum-of-individual-uplifts over baseline (177 + 5 + 9 = 191 — within rounding); the two refinements' effects are roughly **additive**, not synergistic, on this corpus.

**Reading the curve shape**:
- **Bias dominates early-budget kills** (kill@1 = 108 vs 65 for baseline; +43). Bias's anti-trivial pushes mean the very first test for a clause is unlikely to be a degenerate `arr=[], x=0` model that absorbs many mutations. Without bias, kill@1 is barely above half the asymptote.
- **Relevance dominates the ceiling** (kill@max +9 over `+bias` alone). The per-literal relevance query forces every literal in the clause to actively prune outputs; this catches mutants that need a "non-trivially-satisfying" witness to be exposed, rather than any model.
- The two curves cross around k = 4–5: at small budgets bias matters more; at large budgets relevance matters more.

## Mutation kill curves — per program

A program is "killed at budget k" iff *any* of its methods has its first failing test at local index ≤ k. This is the user-facing metric — does running DafnyCBT on a buggy program produce at least one failing test within the first k tests of any method?

![Mutation kill curve, per program](kill_curves_per_program.png)

| Strategy | killed | kill@1 | kill@10 |
|---|---:|---:|---:|
| baseline | 148 | 50 | 142 |
| +bias | 155 | 72 | 148 |
| +relevance | 156 | 68 | 153 |
| +bias+rel *(default)* | **161** | **95** | **158** |

Same shape as per-method, scaled to programs (each program has 1–3 methods on average).

## Phase contribution (cost-benefit)

Where do the kills come from? For each method with at least one failing test, the *first failing test*'s phase is recorded; aggregating across the corpus shows the relative contribution of each pipeline phase. The "tests" column is the total count of tests of each phase emitted across the whole corpus; "tests/fail" is the cost-benefit ratio (lower = better).

![Phase contribution to first failures](first_fail_phase.png)

| Phase | Methods | %Fail | Programs | Tests | %Tests | Tests/Fail |
|---|---:|---:|---:|---:|---:|---:|
| Phase 1 baseline (clause witness) | 72 | 38.1% | 59 | 423 | 10.2% | **5.9** |
| Phase 1r relevance | 69 | 36.5% | 66 | 418 | 10.0% | **6.1** |
| Phase 1v vacuity | 4 | 2.1% | 4 | 102 | 2.4% | 25.5 |
| Phase 2 BVA (refined-range) | 8 | 4.2% | 8 | 761 | 18.3% | 95.1 |
| Phase 2b outer range (categorical) | 31 | 16.4% | 29 | 1027 | 24.7% | 33.1 |
| Phase 3 repetition (seeded variants) | 5 | 2.6% | 5 | 1433 | 34.4% | 286.6 |
| **Total** | **189** | | | **4164** | | |

**Phase 1 + 1r account for 75% of first-fails using 20% of the test budget** — the spec-driven phases are by far the most efficient. Phase 2b's per-clause refined-range pinning produces the next largest slice (16% of first-fails). Phase 3 repetition is the most expensive *and* lowest-yield phase: its 34% of the budget catches just 3% of first-fails, mostly the long tail of inputs whose magnitude / length exceeds Phase 2b's tier set.

If `--min-tests` were lowered from 10 to ~5, Phase 3 would shrink dramatically without losing more than ~3% of the kills — a possible knob for budget-constrained settings.

## Wall-clock time

![Generation and check time](timing.png)

| Strategy | gen total (s) | gen median (s/method) | check total (s) |
|---|---:|---:|---:|
| baseline | 2206 | 3.75 | 2976 |
| +bias | 2754 | 3.60 | 3245 |
| +relevance | 2365 | 3.85 | 3030 |
| +bias+rel *(default)* | 2857 | 3.85 | 3289 |

Bias adds **~30%** to gen time over baseline; relevance adds **~7%**. Together they cost +30% gen / +10% check for +7% extra kills (177 → 190). Per-method medians stay near 4 s in all configurations — the totals differ mostly because bias triggers more retry loops on degenerate inputs.

## <a id="vacuity"></a>Vacuity ablation (separately)

The Phase 1v vacuity check ([Per-literal vacuity check in README](../README.md#per-literal-vacuity-check-enable-with---vacuity)) is **disabled by default**. On this corpus at n = 10:

- `full` (vacuity ON, with bias + relevance) kills **190** methods.
- `no_vacuity` (vacuity OFF) kills **190** methods.
- The 4 methods where Phase 1v produces the *first* failing test under `full` are caught one or two tests later by Phase 2 / Phase 2b under `no_vacuity` — same kill rate, slightly delayed.

Vacuity's value on this corpus is therefore not in raising kill rate but in *fault localisation*: a `/V{k}` test deterministically reaches an input regime where literal `Q_k` is implied by the others, providing a sharper pass/fail signal for SFL than a random-bias test. See the [README's "Role and limits" subsection](../README.md#per-literal-vacuity-check-enable-with---vacuity) and the `LastPositionTwoPaths` worked example for an SFL story where adding the `/Vi4` isolation test breaks a 3-way suspiciousness tie.

## Reproducibility

- Run script: [`run_tests_buggy_progs_comparison.sh`](../run_tests_buggy_progs_comparison.sh).
- Plotting: [`test/experimental_results/plot_kill_curves.py`](../test/experimental_results/plot_kill_curves.py), [`plot_timing.py`](../test/experimental_results/plot_timing.py), [`first_fail_phase.py`](../test/experimental_results/first_fail_phase.py).
- Raw logs (one per strategy): `test/buggy_progs_<strategy>_log.txt`. Each `Test N/M [method]: STATUS` line carries the per-method test index and verdict; `[DafnyCBT] Results: … gen=Xs check=Ys [program]` summarises the program.
- Generated tests per strategy live in `test/buggy_progs/out_<strategy>/` (excluded from the repo via `.gitignore`; regenerate locally with the run script).
