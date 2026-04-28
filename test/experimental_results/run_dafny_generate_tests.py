#!/usr/bin/env python3
"""
run_dafny_generate_tests.py — run `dafny generate-tests` on a corpus and emit
a log compatible with plot_kill_curves.py / first_fail_phase.py for direct
side-by-side comparison with DafnyCBT runs.

Pipeline per .dfy file:

  1. `dafny generate-tests <Mode> <file>` (default Path; Block also useful)
     captured to <out>/<prog>_dafnyTests.dfy. Wall-clock measured as gen=Xs.
  2. `dafny test --no-verify <file>` to run all `{:test}` methods. Timed as
     check=Ys. Parser extracts PASS/FAIL per test.
  3. Source-method attribution: each generated test body typically calls
     exactly one source method. We grep for that call pattern to give the
     log a meaningful [method] tag (so per-method kill@k aggregation lines
     up with DafnyCBT logs). Falls back to the test method name when the
     pattern is ambiguous.

Output log format mirrors DafnyCBT:
    [DafnyCBT] Input: <abs path>
      Test N/M [method]: PASS|FAIL
      ...
    [DafnyCBT] Results: P passing, F failing, syntax OK, gen=Xs check=Ys [program]
    (blank line between programs)

Failure modes (still emit a Results line so plot scripts skip cleanly):
  * generate-tests returns non-zero or times out → "generation failed"
  * dafny test returns non-zero or times out      → "run failed"
  * No tests produced (empty file)                → "no tests generated"

Usage
-----
    python run_dafny_generate_tests.py <input_dir> <output_dir> <log_path> \\
        [--mode Block|Path|InlinedBlock] [--dafny <path>] \\
        [--timeout-gen 60] [--timeout-run 60] [--resume]

Caveats
-------
* **Known Dafny 4.11.0 issue.** Smoke-tested against the bundled VS Code
  extension's Dafny: every program (including trivial ones like Factorial)
  fails generation with `Prover error: Could not parse any models / Invalid
  model: invalid element name 0.0` followed by `*** Error: No tests were
  generated, because no code points could be proven reachable`. This is a
  Boogie/Dafny internal model-parser bug, not a script issue. Try a newer
  Dafny build (4.12+ may have it fixed) or a different solver via
  `--solver-path` to work around. The script logs the failure per program
  so a partial run is still meaningful.
* The Dafny `generate-tests` CLI surface has shifted across versions; this
  script targets Dafny 4.11.0 syntax (`generate-tests <Mode> <file>`).
  Adjust `_run_generate` if your version differs.
* Source preprocessing: `dafny generate-tests` requires (a) the file
  wrapped in a `module M { ... }` declaration and (b) a `{:testEntry}`
  attribute on every method to be tested. The script rewrites each input
  on the fly into `<output_dir>/_preprocessed/` to satisfy both.
* `dafny test` runs every `{:test}`-marked method and prints a one-liner per
  test. The parser tolerates the two output dialects we've observed (the
  `Test method <name> ... PASSED/FAILED` style and the `<name>: PASSED`
  style). If your Dafny prints a third format, extend `_parse_test_output`.
* Test budget is whatever generate-tests emits — typically 2–6 tests per
  method in Block mode, more in Path mode. There is no `-n 10` equivalent,
  so kill@max is the meaningful comparison; kill@k for fixed k may be
  misleading.
"""
from __future__ import annotations

import argparse
import os
import re
import subprocess
import sys
import time
from pathlib import Path

# Match a top-level `method <Name>(...) ... ensures ...` declaration.
# We only annotate methods that have an ensures clause (matching DafnyCBT's
# discovery rule) and that are not already attribute-decorated. The pattern
# is forgiving — captures everything from `method` up to the next `ensures`
# keyword on the same or following lines.
METHOD_DECL_RE = re.compile(
    r'^(\s*)method\s+(\w+)\s*(?=\(.*?\)(?:[^{]*?\bensures\b))',
    re.MULTILINE,
)
MODULE_RE = re.compile(r'^\s*(?:abstract\s+)?module\s+\w', re.MULTILINE)

# Each {:test} method header — captures the test method name.
TEST_DECL_RE = re.compile(r'method\s+(?:\{:[^}]+\}\s+)*(\w+)\s*\(\s*\)')
# Calls inside a test body of the form `var x := SourceMethod(...)` or
# `SourceMethod(...);`. Filter out built-ins and assertion helpers later.
CALL_RE = re.compile(r'\b([A-Z][A-Za-z0-9_]*)\s*\(')

# Known stdlib / framework names to ignore when guessing the source method.
IGNORE_CALLS = {
    'Main', 'Print', 'print', 'expect', 'assert', 'assume',
    'Length', 'Concat',
}

# Test-runner output dialects:
#   "Test method <Mod>.<Name> ... ... PASSED"
#   "Test method <Mod>.<Name> ... ... FAILED"
#   "<Name>: PASSED" / "<Name>: FAILED"
# Also accept lowercase "passed" / "failed" with optional ":" separator.
RUN_OUTCOME_RE = re.compile(
    r'(?:Test method\s+)?'
    r'([\w.]+?)'
    r'\s*[:\s]'
    r'.*?'
    r'\b(PASSED|FAILED|passed|failed)\b',
    re.IGNORECASE,
)


def _preprocess_source(src_text: str) -> str:
    """`dafny generate-tests` requires (1) the code wrapped in a module,
    and (2) `{:testEntry}` on every method to be tested. The buggy_progs
    corpus is flat (no module, no annotations), so we rewrite each source
    on the fly. Methods are annotated only when they have an ensures clause,
    matching DafnyCBT's discovery rule."""
    # 1. Annotate methods with {:testEntry}.
    def annotate(m: re.Match) -> str:
        indent, name = m.group(1), m.group(2)
        return f'{indent}method {{:testEntry}} {name}'
    annotated = METHOD_DECL_RE.sub(annotate, src_text)
    # 2. Wrap in a module if not already inside one.
    if not MODULE_RE.search(annotated):
        annotated = 'module CBT {\n' + annotated + '\n}\n'
    return annotated


def _run_generate(dafny: str, src: Path, mode: str, timeout_sec: int,
                  preprocess_dir: Path, solver_path: str | None,
                  extra_args: list[str] | None = None) -> tuple[float, str | None, str]:
    """Run `dafny generate-tests`. Returns (elapsed_s, generated_text or None, stderr).
    The source is first rewritten under preprocess_dir to add the module wrapper
    and {:testEntry} annotations that `dafny generate-tests` requires."""
    src_text = src.read_text(encoding='utf-8', errors='ignore')
    rewritten = _preprocess_source(src_text)
    rewritten_path = preprocess_dir / src.name
    rewritten_path.write_text(rewritten, encoding='utf-8')

    cmd = [dafny, 'generate-tests', mode, str(rewritten_path)]
    if solver_path:
        cmd.append(f'--solver-path={solver_path}')
    if extra_args:
        cmd.extend(extra_args)

    t0 = time.time()
    try:
        r = subprocess.run(
            cmd,
            capture_output=True, text=True, timeout=timeout_sec,
            encoding='utf-8', errors='ignore',
        )
    except subprocess.TimeoutExpired:
        return time.time() - t0, None, 'timeout'
    except FileNotFoundError:
        return time.time() - t0, None, f'dafny binary not found: {dafny}'
    elapsed = time.time() - t0

    # Dafny prints errors to stdout (not stderr) for parse/type errors.
    # Combine both streams and pick the most informative line for the log.
    combined = ((r.stdout or '') + '\n' + (r.stderr or '')).strip()

    if r.returncode != 0 or not r.stdout.strip():
        # Dump the FULL combined output to a sibling file for offline inspection
        # — the truncated message in the log is just for at-a-glance.
        log_dump = rewritten_path.with_suffix('.dfy.gen_error.txt')
        try:
            log_dump.write_text(combined, encoding='utf-8')
        except Exception:
            pass
        # Collect error and warning lines separately. Prefer reporting Errors;
        # fall back to Warnings only if no Errors exist. Skip the summary
        # "Test generation returned N errors" line — it's a counter, not a
        # diagnosis.
        SUMMARY_RE = re.compile(r'Test generation returned \d+ (error|warning)s?\b', re.IGNORECASE)
        errors: list[str] = []
        warnings: list[str] = []
        first_any = ''
        for line in combined.splitlines():
            line = line.strip()
            if not line:
                continue
            if not first_any:
                first_any = line
            if SUMMARY_RE.search(line):
                continue
            is_error = (
                line.startswith(('*** Error:', 'Error:'))
                or '): Error' in line or '): error' in line
            )
            is_warning = (
                line.startswith('Warning:')
                or '): Warning' in line or '): warning' in line
            )
            if is_error and len(errors) < 3:
                errors.append(line)
            elif is_warning and len(warnings) < 3:
                warnings.append(line)
            if len(errors) >= 3:
                break
        if errors:
            err_line = ' | '.join(errors)
        elif warnings:
            err_line = ' | '.join(warnings)
        elif first_any:
            err_line = first_any
        else:
            err_line = 'non-zero exit / empty output'
        return elapsed, None, err_line
    return elapsed, r.stdout, ''


def _run_tests(dafny: str, test_file: Path, timeout_sec: int) -> tuple[float, str | None, str]:
    """Run `dafny test` on a generated file. Returns (elapsed_s, combined_output, stderr)."""
    t0 = time.time()
    try:
        r = subprocess.run(
            [dafny, 'test', '--no-verify', str(test_file)],
            capture_output=True, text=True, timeout=timeout_sec,
            encoding='utf-8', errors='ignore',
        )
    except subprocess.TimeoutExpired:
        return time.time() - t0, None, 'timeout'
    elapsed = time.time() - t0
    combined = (r.stdout or '') + '\n' + (r.stderr or '')
    return elapsed, combined, '' if r.returncode == 0 else f'exit {r.returncode}'


def _parse_test_output(text: str) -> list[tuple[str, str]]:
    """Return [(test_name, 'PASS'|'FAIL'), ...] from `dafny test` output."""
    out: list[tuple[str, str]] = []
    seen: set[str] = set()
    for line in text.splitlines():
        m = RUN_OUTCOME_RE.search(line)
        if not m:
            continue
        name = m.group(1).split('.')[-1]
        verdict = m.group(2).upper()
        status = 'PASS' if verdict == 'PASSED' else 'FAIL'
        # Skip duplicate hits (some Dafny versions echo the line twice).
        key = (name, status)
        if key in seen:
            continue
        seen.add(key)
        out.append((name, status))
    return out


def _attribute_test_to_method(generated: str, test_name: str) -> str:
    """Best-effort: find the source method called inside `test_name`'s body.
    If we can't isolate one unique call, return `test_name` as the fallback."""
    # Find the body of the {:test} method (very forgiving brace matching).
    pat = re.compile(
        r'method\s+(?:\{:[^}]+\}\s+)*' + re.escape(test_name) +
        r'\s*\(\s*\)\s*(?:returns[^{]*)?\{(.*?)^\}',
        re.DOTALL | re.MULTILINE,
    )
    m = pat.search(generated)
    if not m:
        return test_name
    body = m.group(1)
    candidates = [c for c in CALL_RE.findall(body) if c not in IGNORE_CALLS]
    # Heuristic: if exactly one distinct user-defined call appears, that's
    # the source method under test. Otherwise punt.
    distinct = list(dict.fromkeys(candidates))  # order-preserving dedup
    if len(distinct) == 1:
        return distinct[0]
    return test_name


def _strip_dafny_diagnostics(generated: str) -> tuple[str, list[str]]:
    """Dafny generate-tests prints warnings/errors on stdout BEFORE the actual
    Dafny test code. The actual code starts with the first `include "..."`
    line (or `module ...` if no include). Returns (clean_dafny_code, [stripped lines])."""
    lines = generated.splitlines()
    for i, line in enumerate(lines):
        s = line.lstrip()
        if s.startswith('include "') or s.startswith('module '):
            return ('\n'.join(lines[i:]) + '\n', lines[:i])
    # No include / module marker found — return as-is, treat all of stdout
    # as test code (likely won't compile, but let `dafny test` give the
    # canonical error).
    return generated, []


def process_one(src: Path, out_dir: Path, preprocess_dir: Path, args, logf) -> None:
    prog = src.stem
    logf.write(f'[DafnyCBT] Input: {src}\n')
    logf.flush()

    gen_time, generated, gen_err = _run_generate(
        args.dafny, src, args.mode, args.timeout_gen, preprocess_dir,
        args.solver_path, args.extra_gen_args)
    if generated is None:
        # Cap the inline error at 300 chars (joins of 3 specific errors fit);
        # the full output is in <prepname>.dfy.gen_error.txt.
        snippet = gen_err if len(gen_err) <= 300 else gen_err[:297] + '...'
        logf.write(
            f'[DafnyCBT] Results: 0 passing, 0 failing, generation failed '
            f'({snippet}), gen={gen_time:.1f}s check=0.0s [{prog}]\n\n'
        )
        return

    # Split off Dafny's leading warnings/errors from the actual test code.
    clean, stripped = _strip_dafny_diagnostics(generated)
    test_file = out_dir / f'{prog}_dafnyTests.dfy'
    test_file.write_text(clean, encoding='utf-8')
    if stripped:
        # Persist the diagnostics for offline inspection.
        diag_file = out_dir / f'{prog}_dafnyTests.diag.txt'
        diag_file.write_text('\n'.join(stripped) + '\n', encoding='utf-8')

    check_time, output, run_err = _run_tests(args.dafny, test_file, args.timeout_run)
    if output is None:
        logf.write(
            f'[DafnyCBT] Results: 0 passing, 0 failing, run failed '
            f'({run_err[:80]}), gen={gen_time:.1f}s check={check_time:.1f}s [{prog}]\n\n'
        )
        return

    results = _parse_test_output(output)
    if not results:
        logf.write(
            f'[DafnyCBT] Results: 0 passing, 0 failing, no tests generated, '
            f'gen={gen_time:.1f}s check={check_time:.1f}s [{prog}]\n\n'
        )
        return

    n = len(results)
    passing = sum(1 for _, s in results if s == 'PASS')
    failing = sum(1 for _, s in results if s == 'FAIL')
    for i, (test_name, status) in enumerate(results, 1):
        method = _attribute_test_to_method(generated, test_name)
        logf.write(f'  Test {i}/{n} [{method}]: {status}\n')
    logf.write(
        f'[DafnyCBT] Results: {passing} passing, {failing} failing, syntax OK, '
        f'gen={gen_time:.1f}s check={check_time:.1f}s [{prog}]\n\n'
    )
    logf.flush()


def main() -> int:
    ap = argparse.ArgumentParser(
        description='Run `dafny generate-tests` on a corpus and emit a log compatible '
                    'with plot_kill_curves.py / first_fail_phase.py. See module docstring '
                    'for full pipeline + caveats.')
    ap.add_argument('input_dir', help='directory of .dfy files')
    ap.add_argument('output_dir', help='where generated <prog>_dafnyTests.dfy files go')
    ap.add_argument('log', help='output log path (compatible with plot_kill_curves.py)')
    ap.add_argument('--mode', default='Path', choices=['Block', 'Path', 'InlinedBlock'],
                    help='dafny generate-tests coverage mode (default: Path)')
    ap.add_argument('--dafny', default=os.environ.get('DAFNY', 'dafny'),
                    help='path to the dafny binary (default: $DAFNY or `dafny`)')
    ap.add_argument('--solver-path', default=os.environ.get('Z3_PATH'),
                    help='path to a specific Z3 binary to use, via dafny generate-tests '
                         '`--solver-path`. Useful when the bundled Z3 hits the Boogie '
                         'model-parser bug; try Z3 4.13+ or 4.10 to dodge it. Default: '
                         'use whichever Z3 Dafny finds.')
    ap.add_argument('--gen-tests-extra-args', default='',
                    help='extra arguments passed verbatim to `dafny generate-tests`. '
                         'Space-separated. Example: '
                         "--gen-tests-extra-args='--ignore-warnings --length-limit=5'. "
                         'Disabling --enforce-determinism is possible but produces '
                         'spurious kills on havoc-using programs (see README).')
    ap.add_argument('--timeout-gen', type=int, default=60,
                    help='per-program timeout for generate-tests, seconds (default 60)')
    ap.add_argument('--timeout-run', type=int, default=60,
                    help='per-program timeout for the test runner, seconds (default 60)')
    ap.add_argument('--resume', action='store_true',
                    help='skip programs already present in the existing log')
    args = ap.parse_args()
    # Split the extra-args string into argv tokens (simple whitespace split;
    # users wanting paths with spaces can quote them as a single shell arg
    # that becomes a single token here, e.g. "--option=value with spaces").
    args.extra_gen_args = args.gen_tests_extra_args.split() if args.gen_tests_extra_args else []

    in_dir = Path(args.input_dir)
    out_dir = Path(args.output_dir)
    if not in_dir.is_dir():
        print(f'Not a directory: {in_dir}', file=sys.stderr)
        return 1
    out_dir.mkdir(parents=True, exist_ok=True)
    preprocess_dir = out_dir / '_preprocessed'
    preprocess_dir.mkdir(parents=True, exist_ok=True)

    already_done: set[str] = set()
    if args.resume and Path(args.log).exists():
        for line in Path(args.log).read_text(encoding='utf-8', errors='ignore').splitlines():
            m = re.search(r'\[DafnyCBT\] Results:.*\[([^\]]+)\]\s*$', line)
            if m:
                already_done.add(m.group(1))

    mode_log = 'a' if args.resume else 'w'
    with open(args.log, mode_log, encoding='utf-8') as logf:
        for src in sorted(in_dir.glob('*.dfy')):
            prog = src.stem
            if prog in already_done:
                continue
            print(f'[{time.strftime("%H:%M:%S")}] {prog}', flush=True)
            try:
                process_one(src, out_dir, preprocess_dir, args, logf)
            except Exception as e:  # noqa: BLE001 — keep going on any per-program crash
                logf.write(
                    f'[DafnyCBT] Results: 0 passing, 0 failing, harness error '
                    f'({type(e).__name__}: {str(e)[:80]}), gen=0.0s check=0.0s [{prog}]\n\n'
                )
                logf.flush()

    return 0


if __name__ == '__main__':
    sys.exit(main())
