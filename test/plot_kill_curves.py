#!/usr/bin/env python3
"""
plot_kill_curves.py — mutation kill curves from DafnyCBT execution logs.

For each input log (one per strategy), parses the Test N/M [method]: STATUS
lines and computes, per (program, method), the first test index (within that
method) that killed the mutant. Plots the kill curves (y = #methods with
first_kill ≤ x) vs. x = per-method test budget, one line per strategy.

Usage
-----
    python plot_kill_curves.py <log1> <log2> ... [-o out.png]
    python plot_kill_curves.py <log1>:<label> <log2>:<label> ...

Examples
--------
    python test/plot_kill_curves.py \\
        test/buggy_progs_log.txt:default \\
        test/buggy_progs_no_bias_log.txt:no-bias \\
        test/buggy_progs_no_relevance_log.txt:no-relevance \\
        -o test/kill_curves.png

Options
-------
    --per-program       Aggregate per program instead of per method
                        (a program is killed if ANY of its methods is killed).
    --no-crash          Do not count SKIP (exception from implementation) as
                        a kill. Default: crashes count as kills.
    -o / --output PATH  Output image file (default: kill_curves.png).
    --csv PATH          Also write a CSV dump of per-method data.
"""
from __future__ import annotations

import argparse
import re
import sys
from collections import defaultdict
from pathlib import Path

# Matches: "  Test 3/10 [methodName]: PASS" or "  Test 5/9 [Merge]: SKIP (...)".
TEST_LINE_RE = re.compile(r'^\s*Test\s+(\d+)/(\d+)\s+\[([^\]]+)\]:\s*(\S.*)$')
INPUT_RE = re.compile(r'\[DafnyCBT\]\s+Input:\s+(.+)$')
RESULTS_RE = re.compile(r'\[DafnyCBT\]\s+Results:.*\[([^\]]+)\]\s*$')


def parse_log(path: Path):
    """Return {(program, method): [(global_idx, local_idx, status), ...]}.
    global_idx is the 1-based position of the test within the PROGRAM
    (across all methods); local_idx is 1-based within the METHOD."""
    result: dict[tuple[str, str], list[tuple[int, int, str]]] = defaultdict(list)
    current_program: str | None = None
    method_idx: dict[tuple[str, str], int] = defaultdict(int)
    with open(path, 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            m = INPUT_RE.search(line)
            if m:
                current_program = Path(m.group(1).strip()).stem
                continue
            m = RESULTS_RE.search(line)
            if m:
                current_program = m.group(1).strip()
                continue
            m = TEST_LINE_RE.match(line)
            if m and current_program is not None:
                global_idx = int(m.group(1))
                method = m.group(3).strip()
                status = m.group(4).strip()
                key = (current_program, method)
                method_idx[key] += 1
                result[key].append((global_idx, method_idx[key], status))
    return dict(result)


def is_kill(status: str, count_crash: bool = True) -> bool:
    if status.startswith('FAIL'):
        return True
    if count_crash and 'exception from implementation' in status:
        return True
    return False


def per_method_summary(tests, count_crash: bool = True):
    """→ {(program, method): (total_tests, first_kill_idx or None)}.
    Both values use the LOCAL (per-method) index."""
    out = {}
    for key, ts in tests.items():
        total = len(ts)
        fk = next((local for _g, local, s in ts if is_kill(s, count_crash)), None)
        out[key] = (total, fk)
    return out


def per_program_summary(tests, count_crash: bool = True):
    """Collapse methods: use the GLOBAL (per-program) index. A program is
    killed at global_idx x iff any test at global_idx <= x failed, regardless
    of which method it was for. total_tests is the total number of tests
    emitted for the program."""
    # Gather all tests per program as (global_idx, status).
    by_prog: dict[str, list[tuple[int, str]]] = defaultdict(list)
    for (prog, _method), ts in tests.items():
        for g, _local, s in ts:
            by_prog[prog].append((g, s))
    out = {}
    for prog, items in by_prog.items():
        total = max(g for g, _ in items) if items else 0
        kills = sorted(g for g, s in items if is_kill(s, count_crash))
        first_kill = kills[0] if kills else None
        out[(prog, '<any>')] = (total, first_kill)
    return out


def kill_curve(summary, max_x: int) -> list[int]:
    return [sum(1 for (_t, fk) in summary.values()
                if fk is not None and fk <= x)
            for x in range(1, max_x + 1)]


def sample_sizes(summary, max_x: int) -> list[int]:
    return [sum(1 for (t, _fk) in summary.values() if t >= x)
            for x in range(1, max_x + 1)]


def auc(ys) -> int:
    return sum(ys)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('logs', nargs='+',
                    help='log files; path or path:label')
    ap.add_argument('-o', '--output', default='kill_curves.png')
    ap.add_argument('--per-program', action='store_true')
    ap.add_argument('--no-crash', action='store_true',
                    help='exclude SKIP (exception) from kills')
    ap.add_argument('--csv', help='write per-method CSV dump')
    ap.add_argument('--max-x', type=int, default=0,
                    help='cap the x-axis at this value (e.g. match the '
                         '-n budget used in the run). Horizontal dashed '
                         'lines mark each strategy final kill count beyond.')
    args = ap.parse_args()

    count_crash = not args.no_crash
    summarize = per_program_summary if args.per_program else per_method_summary

    strategies = []  # [(label, summary)]
    for spec in args.logs:
        path, _, label = spec.partition(':')
        if not label:
            label = Path(path).stem
        tests = parse_log(Path(path))
        summary = summarize(tests, count_crash)
        strategies.append((label, summary))

    if not strategies:
        print('No strategies parsed.', file=sys.stderr)
        return 1

    # Full range (for final kill counts) vs. plot range (chart x-axis cap).
    full_x = max(
        (max((t for t, _ in s.values()), default=0) for _, s in strategies),
        default=0)
    if full_x == 0:
        print('No test data found. Check the log format.', file=sys.stderr)
        return 1
    plot_x = args.max_x if args.max_x > 0 else full_x
    max_x = plot_x  # keep the name used later in this function

    unit = 'program' if args.per_program else 'method'
    # Denominator: union of keys across strategies (usually identical).
    all_keys = set().union(*(s.keys() for _, s in strategies))
    denom = len(all_keys)

    print(f'Strategies: {len(strategies)}   Total {unit}s: {denom}   full_x={full_x}   plot_x={plot_x}')
    print(f'{"strategy":<20} {"tested":>7} {"killed":>7} {"kill@1":>7} {"AUC":>6}')
    for label, summary in strategies:
        killed = sum(1 for _t, fk in summary.values() if fk is not None)
        kill_at_1 = sum(1 for _t, fk in summary.values() if fk == 1)
        a = auc(kill_curve(summary, full_x))
        print(f'{label:<20} {len(summary):>7} {killed:>7} {kill_at_1:>7} {a:>6}')

    if args.csv:
        with open(args.csv, 'w', encoding='utf-8') as f:
            f.write(f'strategy,program,{unit},total_tests,first_kill\n')
            for label, summary in strategies:
                for (prog, m), (total, fk) in sorted(summary.items()):
                    fk_s = '' if fk is None else str(fk)
                    f.write(f'{label},{prog},{m},{total},{fk_s}\n')
        print(f'CSV written: {args.csv}')

    # Plot
    try:
        import matplotlib.pyplot as plt
    except ImportError:
        print('matplotlib not installed; skipping plot. pip install matplotlib',
              file=sys.stderr)
        return 0

    xs = list(range(1, max_x + 1))
    fig, ax = plt.subplots(figsize=(9.5, 5.8))
    colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd']
    # Distinct markers per strategy so curves remain distinguishable when they
    # overlap (common on small corpora where kill counts coincide).
    markers = ['o', 's', '^', 'D', 'v']
    # Small vertical offset per strategy to separate otherwise-coincident lines.
    # Offsets are ±0.06, chosen small enough not to misread the integer counts.
    n_strat = len(strategies)

    capped = plot_x < full_x
    for i, (label, summary) in enumerate(strategies):
        ys = kill_curve(summary, plot_x)
        killed = sum(1 for _t, fk in summary.values() if fk is not None)
        kill_at_1 = sum(1 for _t, fk in summary.values() if fk == 1)
        pretty = (f'{label} (kill@1={kill_at_1}, killed@{plot_x}={ys[-1]},'
                  f' killed={killed}/{denom})'
                  if capped else
                  f'{label} (kill@1={kill_at_1}, killed={killed}/{denom})')
        c = colors[i % len(colors)]
        m = markers[i % len(markers)]
        # Center offsets around 0: for n=4 → [-0.09, -0.03, 0.03, 0.09].
        dy = 0.06 * (i - (n_strat - 1) / 2.0)
        ys_off = [y + dy for y in ys]
        ax.plot(xs, ys_off, drawstyle='steps-post', label=pretty,
                color=c, linewidth=2, marker=m, markersize=5,
                markerfacecolor='white', markeredgewidth=1.4)
        # Sample-size: fainter, no markers, no jitter. No label — explained
        # by a single generic legend entry added below.
        sizes = sample_sizes(summary, plot_x)
        ax.step(xs, sizes, where='post', color=c, linestyle='--',
                alpha=0.35, linewidth=1.0, label='_nolegend_')
        # When the x-axis is capped below the full data range, mark each
        # strategy's eventual kill count as a horizontal dashed line at the
        # right edge of the chart so readers see the "final number".
        if capped:
            ax.axhline(killed + dy, xmin=0.96, xmax=1.0,
                       color=c, linestyle=':', linewidth=1.5, alpha=0.9)
            ax.text(plot_x + 0.25, killed + dy, f'→{killed}',
                    color=c, fontsize=8, va='center')
    # Single generic legend entry for dashed lines (gray proxy line, not tied
    # to any strategy colour).
    from matplotlib.lines import Line2D
    legend_proxy = Line2D([0], [0], color='gray', linestyle='--',
                          alpha=0.55, linewidth=1.2,
                          label=f'dashed: # {unit}s with ≥ x tests (per strategy)')

    ax.set_xlabel(f'Test budget per {unit} (cumulative)')
    ax.set_ylabel(f'# {unit}s  (solid: killed;  dashed: with ≥ x tests)')
    ax.set_title(
        f'Mutation kill curves (per {unit}; crashes {"counted" if count_crash else "excluded"})')
    ax.grid(True, alpha=0.3)
    ax.set_ylim(-0.3, denom + 0.5)
    # Leave a small right margin when capped, to host the "→N" final labels.
    ax.set_xlim(1, plot_x + (1.0 if capped else 0))
    ax.set_xticks(range(1, plot_x + 1))
    # Integer y-ticks only.
    import math
    ax.set_yticks(range(0, denom + 1, max(1, denom // 10)))
    # Combine auto-legend entries with the generic dashed-line proxy.
    handles, labels = ax.get_legend_handles_labels()
    handles.append(legend_proxy)
    labels.append(legend_proxy.get_label())
    ax.legend(handles, labels, loc='lower right', fontsize=8)
    plt.tight_layout()
    plt.savefig(args.output, dpi=150)
    print(f'Saved: {args.output}')
    return 0


if __name__ == '__main__':
    sys.exit(main())
