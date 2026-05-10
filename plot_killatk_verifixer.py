"""kill@k plot for the verifixer batch run (test/verifixer_log_n10.txt).

For each realistically-killable mutant (200 - 28 incompetent - 25 equivalent
= 147), find the smallest test index k such that Test k FAILed. Plot
kill@k = #mutants killed by some Test_i with i ≤ k.

Two curves:
- Strict kill: requires an explicit FAIL in the test output.
- Generous kill: explicit FAIL OR a build/safety-check failure (no Test
  lines at all but the runner reported the mutant as killed in the log).
  Approximated here by mutants where Phase 1 generated no tests but the
  log still reports failures (none in this batch — kept for symmetry).
"""
import re, os, collections
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

LOG = r"test/verifixer_log_n10_v3.txt"
INC = r"test/verifixer_mutants/incompetent"
EQU = r"test/verifixer_mutants/equivalent"
OUT = r"test/verifixer_mutants/killatk_verifixer.png"

incompetent = {f for f in os.listdir(INC) if f.endswith(".dfy")} if os.path.isdir(INC) else set()
equivalent = {f for f in os.listdir(EQU) if f.endswith(".dfy")} if os.path.isdir(EQU) else set()
print(f"incompetent: {len(incompetent)}, equivalent: {len(equivalent)}")

proc_re = re.compile(r"^= Processing: (\S+\.dfy)\s")
test_re = re.compile(r"Test (\d+)/\d+ \[[^\]]+\]: (PASS|FAIL)")
results_re = re.compile(r"Results: (\d+) passing, (\d+) failing")

mutants = {}
cur = None
with open(LOG, encoding="utf-8", errors="replace") as f:
    for line in f:
        m = proc_re.search(line)
        if m:
            cur = m.group(1)
            mutants[cur] = {"first_fail": None, "n_test": 0, "passing": 0, "failing": 0}
            continue
        if cur is None:
            continue
        m = test_re.search(line)
        if m:
            idx = int(m.group(1))
            st = m.group(2)
            mutants[cur]["n_test"] = max(mutants[cur]["n_test"], idx)
            if st == "FAIL" and mutants[cur]["first_fail"] is None:
                mutants[cur]["first_fail"] = idx
            continue
        m = results_re.search(line)
        if m:
            mutants[cur]["passing"] = int(m.group(1))
            mutants[cur]["failing"] = int(m.group(2))

# Restrict to realistically-killable: 200 - incompetent - equivalent
clean = [m for m in mutants if m not in incompetent and m not in equivalent]
print(f"total mutants: {len(mutants)}, realistically-killable: {len(clean)}")

killed = [m for m in clean if mutants[m]["first_fail"] is not None]
survived = [m for m in clean if mutants[m]["first_fail"] is None and mutants[m]["failing"] == 0]
print(f"killed: {len(killed)}, survived: {len(survived)}")
print(f"survivors: {[m for m in survived]}")

# Distribution
dist = collections.Counter(mutants[m]["first_fail"] for m in killed)
print("\nDistribution of smallest-FAIL test index:")
for k in sorted(dist):
    print(f"  k={k}: {dist[k]} mutants")
max_k = max(dist) if dist else 1
print(f"max kill index: {max_k}")

# Compute kill@k curve
N_BUDGET = 10
curve = [0] * (N_BUDGET + 1)
for m in killed:
    ff = mutants[m]["first_fail"]
    for k in range(ff, N_BUDGET + 1):
        curve[k] += 1

# Print
print(f"\nkill@k (denom = {len(clean)} realistically-killable):")
for k in [1, 2, 3, 5, 7, 10]:
    if k <= N_BUDGET:
        print(f"  k={k}: {curve[k]} ({100*curve[k]/len(clean):.1f}%)")

# Plot
fig, ax = plt.subplots(figsize=(9.5, 5.5))
ks = list(range(0, N_BUDGET + 1))
label = (
    f"DafnyCBT on verifixer (-n {N_BUDGET})    "
    f"@1={curve[1]:>3d}   @5={curve[5]:>3d}   @10={curve[10]:>3d}"
)
ax.plot(ks, curve, marker="o", color="#27ae60", label=label)
# Per-point data labels: cumulative kill count, slightly above each marker.
for k, y in zip(ks, curve):
    ax.annotate(str(y), xy=(k, y), xytext=(0, 6), textcoords="offset points",
                ha="center", va="bottom", fontsize=7, color="#1a5530")
ax.annotate(f"->{curve[-1]}", xy=(N_BUDGET, curve[-1]),
            xytext=(N_BUDGET + 0.15, curve[-1]),
            color="#27ae60", fontsize=9, va="center")
# Denominator line
ax.axhline(len(clean), color="#888", linestyle="--", linewidth=0.8)
ax.text(0.0, len(clean) + 1.5,
        f"realistically-killable = {len(clean)}",
        color="#444", fontsize=8, ha="left")

ax.set_xlabel("k (per-method test budget — first k tests in the generated suite)")
ax.set_ylabel("Mutants killed")
ax.set_title("DafnyCBT verifixer kill@k")
ax.set_xticks(range(0, N_BUDGET + 1))
ax.set_xlim(-0.3, N_BUDGET + 1.3)
ax.set_ylim(0, len(clean) + 8)
ax.grid(alpha=0.3)
ax.legend(loc="lower right", prop={"family": "monospace", "size": 9})
fig.tight_layout()
fig.savefig(OUT, dpi=150, bbox_inches="tight")
print(f"\nWrote {OUT}")
