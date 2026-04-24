#!/usr/bin/env python3
"""
plot_timing.py — wall-clock timing comparison from DafnyCBT execution logs.

Parses the `gen=X.Xs check=X.Xs` suffix of each Results line and produces:
  - a box-plot per strategy for generation time and check time,
  - a bar chart of total time summed across the corpus,
  - a textual summary (median / mean / total / max, Z3 unknown/timeout counts).

Usage
-----
    python plot_timing.py <log1>[:label1] <log2>[:label2] ... [-o out.png]

Example
-------
    python test/plot_timing.py \\
        test/buggy_progs_full_log.txt:full \\
        test/buggy_progs_no_bias_log.txt:no-bias \\
        -o test/timing_buggy.png
"""
from __future__ import annotations

import argparse
import re
import sys
from collections import defaultdict
from pathlib import Path

# `... gen=1.0s check=2.3s [program_name]`
RESULTS_LINE_RE = re.compile(
    r'\[DafnyCBT\]\s+Results:.*?gen=([\d.]+)s\s+check=([\d.]+)s\s*\[([^\]]+)\]'
)


def parse_log(path: Path):
    """Return list of (program, gen_s, check_s)."""
    out = []
    with open(path, 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            m = RESULTS_LINE_RE.search(line)
            if m:
                gen = float(m.group(1))
                check = float(m.group(2))
                prog = m.group(3).strip()
                out.append((prog, gen, check))
    return out


def summary(data):
    """median, mean, max, total, count over a list of floats."""
    if not data:
        return (0.0, 0.0, 0.0, 0.0, 0)
    xs = sorted(data)
    n = len(xs)
    med = xs[n // 2] if n % 2 == 1 else 0.5 * (xs[n // 2 - 1] + xs[n // 2])
    mean = sum(xs) / n
    return (med, mean, max(xs), sum(xs), n)


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('logs', nargs='+')
    ap.add_argument('-o', '--output', default='timing.png')
    ap.add_argument('--csv', help='also write per-program timing CSV')
    args = ap.parse_args()

    strategies = []
    for spec in args.logs:
        path, _, label = spec.partition(':')
        if not label:
            label = Path(path).stem
        rows = parse_log(Path(path))
        strategies.append((label, rows))

    if not strategies:
        print('No strategies parsed.', file=sys.stderr)
        return 1

    # Text summary
    print(f'{"strategy":<18} {"n":>5}  {"gen_med":>8} {"gen_mean":>8} {"gen_max":>8} {"gen_sum":>9}  {"chk_med":>8} {"chk_mean":>8} {"chk_sum":>9}')
    for label, rows in strategies:
        gens = [g for _, g, _ in rows]
        chks = [c for _, _, c in rows]
        gm, gmn, gmx, gs, n = summary(gens)
        cm, cmn, _, cs, _ = summary(chks)
        print(f'{label:<18} {n:>5}  {gm:>8.2f} {gmn:>8.2f} {gmx:>8.2f} {gs:>9.1f}  {cm:>8.2f} {cmn:>8.2f} {cs:>9.1f}')

    if args.csv:
        with open(args.csv, 'w', encoding='utf-8') as f:
            f.write('strategy,program,gen_s,check_s\n')
            for label, rows in strategies:
                for prog, g, c in rows:
                    f.write(f'{label},{prog},{g},{c}\n')
        print(f'CSV: {args.csv}')

    # Plot
    try:
        import matplotlib.pyplot as plt
    except ImportError:
        print('matplotlib not installed; skipping plot.', file=sys.stderr)
        return 0

    labels = [lab for lab, _ in strategies]
    gen_data = [[g for _, g, _ in rows] for _, rows in strategies]
    chk_data = [[c for _, _, c in rows] for _, rows in strategies]
    gen_sums = [sum(gs) for gs in gen_data]
    chk_sums = [sum(cs) for cs in chk_data]

    fig, axes = plt.subplots(1, 3, figsize=(13, 4.5),
                              gridspec_kw={'width_ratios': [3, 3, 2]})

    # Boxplot: generation time
    ax0 = axes[0]
    ax0.boxplot(gen_data, tick_labels=labels, showmeans=True, meanline=True,
                patch_artist=True,
                boxprops=dict(facecolor='#cfe2f3', alpha=0.8),
                medianprops=dict(color='darkblue', linewidth=1.5),
                meanprops=dict(color='red', linewidth=1.3, linestyle=':'))
    ax0.set_ylabel('Generation time (s) per program')
    ax0.set_title('Generation time (log scale)')
    ax0.set_yscale('log')
    ax0.grid(True, which='both', alpha=0.3, axis='y')

    # Boxplot: check time
    ax1 = axes[1]
    ax1.boxplot(chk_data, tick_labels=labels, showmeans=True, meanline=True,
                patch_artist=True,
                boxprops=dict(facecolor='#f9cb9c', alpha=0.8),
                medianprops=dict(color='darkorange', linewidth=1.5),
                meanprops=dict(color='red', linewidth=1.3, linestyle=':'))
    ax1.set_ylabel('Check time (s) per program')
    ax1.set_title('Check time (log scale)')
    ax1.set_yscale('log')
    ax1.grid(True, which='both', alpha=0.3, axis='y')

    # Bar chart: corpus totals (stacked gen + check)
    ax2 = axes[2]
    x = range(len(labels))
    b1 = ax2.bar(x, gen_sums, color='#1f77b4', label='gen', alpha=0.85)
    b2 = ax2.bar(x, chk_sums, bottom=gen_sums, color='#ff7f0e', label='check', alpha=0.85)
    ax2.set_xticks(list(x))
    ax2.set_xticklabels(labels)
    ax2.set_ylabel('Corpus total (s)')
    ax2.set_title('Total wall-clock')
    ax2.legend(loc='upper right', fontsize=8)
    ax2.grid(True, alpha=0.3, axis='y')
    # Numeric labels above each bar
    for xi, (g, c) in enumerate(zip(gen_sums, chk_sums)):
        total = g + c
        ax2.text(xi, total, f' {total:.0f}s', ha='center', va='bottom', fontsize=8)

    fig.suptitle(f'DafnyCBT timing comparison ({sum(len(rows) for _, rows in strategies) // len(strategies)} programs per strategy)',
                 fontsize=11)
    plt.tight_layout(rect=(0, 0, 1, 0.96))
    plt.savefig(args.output, dpi=150)
    print(f'Saved: {args.output}')
    return 0


if __name__ == '__main__':
    sys.exit(main())
