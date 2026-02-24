#!/usr/bin/env python3
"""
Profile non-LW load and non-SW store instructions across benchmark assembly files.

Goal: Determine how many lb/lbu/lh/lhu/sb/sh instructions use constant numeric
offsets vs symbolic (%lo) offsets, to assess feasibility of the load/store
decomposition rewrite rules in base.egg.

We skip lw (target for load rewrites) and sw (target for store rewrites).
We also skip *_rewrite_variant_*.s and *_placeholder.s files to profile only
original compiler output.
"""

import re
import os
import sys
from collections import defaultdict
from pathlib import Path

# Instructions we care about (excludes lw/sw which are the rewrite targets)
LOAD_INSTRS = {"lb", "lbu", "lh", "lhu"}
STORE_INSTRS = {"sb", "sh"}
TARGET_INSTRS = LOAD_INSTRS | STORE_INSTRS

# Pattern: instruction reg, offset(reg)
# Matches both numeric offsets like "4(a5)" and symbolic like "%lo(sym)(a5)"
MEMOP_RE = re.compile(
    r"^\s*(?P<instr>lb|lbu|lh|lhu|sb|sh)\s+"
    r"(?P<rd>\w+)\s*,\s*"
    r"(?P<offset>[^(]+)"       # offset part (number or %lo(...))
    r"\((?P<base>\w+)\)",
    re.IGNORECASE,
)

# Numeric offset: optional minus, digits
NUMERIC_RE = re.compile(r"^-?\d+$")


def classify_offset(offset_str):
    """Classify an offset as 'numeric' or 'symbolic'."""
    offset_str = offset_str.strip()
    if NUMERIC_RE.match(offset_str):
        return "numeric", int(offset_str)
    else:
        return "symbolic", offset_str


def is_original_asm(path):
    """Filter out rewrite variants and placeholders."""
    name = os.path.basename(path)
    if "_rewrite_variant_" in name:
        return False
    if "_placeholder" in name:
        return False
    return True


def profile_file(filepath):
    """Profile a single assembly file. Returns per-instruction stats."""
    stats = defaultdict(lambda: {
        "numeric": 0, "symbolic": 0,
        "aligned_offsets": [],    # numeric offsets divisible by 4
        "unaligned_offsets": [],  # numeric offsets NOT divisible by 4
        "symbolic_labels": [],
        "total": 0,
    })

    with open(filepath, "r") as f:
        for line in f:
            m = MEMOP_RE.match(line)
            if not m:
                continue
            instr = m.group("instr").lower()
            offset_str = m.group("offset")

            kind, val = classify_offset(offset_str)
            s = stats[instr]
            s["total"] += 1
            s[kind] += 1

            if kind == "numeric":
                if val % 4 == 0:
                    s["aligned_offsets"].append(val)
                else:
                    s["unaligned_offsets"].append(val)
            else:
                s["symbolic_labels"].append(val)

    return stats


def main():
    benchmark_dir = Path(__file__).parent

    # Collect all original .s files
    asm_files = sorted(
        p for p in benchmark_dir.rglob("*.s")
        if is_original_asm(str(p))
    )

    if not asm_files:
        print("No assembly files found!")
        sys.exit(1)

    # Aggregate stats
    grand = defaultdict(lambda: {
        "numeric": 0, "symbolic": 0, "total": 0,
        "aligned": 0, "unaligned": 0,
    })
    per_file_results = []

    print("=" * 80)
    print("LOAD/STORE INSTRUCTION OFFSET PROFILING")
    print(f"Scanning: {benchmark_dir}")
    print(f"Instructions profiled: {', '.join(sorted(TARGET_INSTRS))}")
    print(f"Skipped (rewrite targets): lw, sw")
    print("=" * 80)

    for fpath in asm_files:
        stats = profile_file(fpath)
        if not stats:
            continue

        rel = fpath.relative_to(benchmark_dir)
        file_total = sum(s["total"] for s in stats.values())
        file_numeric = sum(s["numeric"] for s in stats.values())
        file_symbolic = sum(s["symbolic"] for s in stats.values())

        per_file_results.append((rel, stats, file_total, file_numeric, file_symbolic))

        for instr, s in stats.items():
            g = grand[instr]
            g["numeric"] += s["numeric"]
            g["symbolic"] += s["symbolic"]
            g["total"] += s["total"]
            g["aligned"] += len(s["aligned_offsets"])
            g["unaligned"] += len(s["unaligned_offsets"])

    # --- Per-file summary ---
    print("\n" + "=" * 80)
    print("PER-FILE SUMMARY")
    print("=" * 80)
    print(f"{'File':<55} {'Total':>6} {'Numeric':>8} {'Symbolic':>9} {'%Numeric':>9}")
    print("-" * 80)

    for rel, stats, ft, fn, fs in per_file_results:
        pct = f"{fn/ft*100:.1f}%" if ft > 0 else "N/A"
        print(f"{str(rel):<55} {ft:>6} {fn:>8} {fs:>9} {pct:>9}")

    # --- Per-file instruction breakdown ---
    print("\n" + "=" * 80)
    print("PER-FILE INSTRUCTION BREAKDOWN")
    print("=" * 80)

    for rel, stats, ft, fn, fs in per_file_results:
        print(f"\n  {rel}")
        print(f"  {'Instr':<6} {'Total':>6} {'Numeric':>8} {'Symbolic':>9} "
              f"{'Aligned':>8} {'Unaligned':>10}")
        print(f"  {'-'*50}")
        for instr in sorted(stats.keys()):
            s = stats[instr]
            n_aligned = len(s["aligned_offsets"])
            n_unaligned = len(s["unaligned_offsets"])
            print(f"  {instr:<6} {s['total']:>6} {s['numeric']:>8} {s['symbolic']:>9} "
                  f"{n_aligned:>8} {n_unaligned:>10}")

            # Show unique symbolic labels if any
            if s["symbolic_labels"]:
                unique = sorted(set(s["symbolic_labels"]))
                print(f"         symbolic: {', '.join(unique)}")

    # --- Grand totals ---
    print("\n" + "=" * 80)
    print("AGGREGATE TOTALS (across all benchmarks)")
    print("=" * 80)

    total_all = sum(g["total"] for g in grand.values())
    total_numeric = sum(g["numeric"] for g in grand.values())
    total_symbolic = sum(g["symbolic"] for g in grand.values())
    total_aligned = sum(g["aligned"] for g in grand.values())
    total_unaligned = sum(g["unaligned"] for g in grand.values())

    print(f"\n  {'Instr':<6} {'Total':>6} {'Numeric':>8} {'Symbolic':>9} "
          f"{'Aligned':>8} {'Unaligned':>10} {'%Numeric':>9}")
    print(f"  {'-'*60}")

    for instr in sorted(grand.keys()):
        g = grand[instr]
        pct = f"{g['numeric']/g['total']*100:.1f}%" if g["total"] > 0 else "N/A"
        print(f"  {instr:<6} {g['total']:>6} {g['numeric']:>8} {g['symbolic']:>9} "
              f"{g['aligned']:>8} {g['unaligned']:>10} {pct:>9}")

    pct_all = f"{total_numeric/total_all*100:.1f}%" if total_all > 0 else "N/A"
    print(f"  {'-'*60}")
    print(f"  {'TOTAL':<6} {total_all:>6} {total_numeric:>8} {total_symbolic:>9} "
          f"{total_aligned:>8} {total_unaligned:>10} {pct_all:>9}")

    # --- Alignment analysis for numeric offsets ---
    print("\n" + "=" * 80)
    print("ALIGNMENT ANALYSIS (numeric offsets only)")
    print("=" * 80)
    print(f"\n  Word-aligned (off % 4 == 0): {total_aligned:>6}")
    print(f"  Unaligned    (off % 4 != 0): {total_unaligned:>6}")
    if total_numeric > 0:
        print(f"  Alignment rate:              {total_aligned/total_numeric*100:.1f}%")
    print()
    print("  Note: Unaligned byte/halfword offsets require the align-down + shift")
    print("  pattern from base.egg to decompose into LW. Aligned offsets can use")
    print("  a simpler LW + mask.")

    # --- Rewrite feasibility summary ---
    print("\n" + "=" * 80)
    print("REWRITE FEASIBILITY SUMMARY")
    print("=" * 80)
    print(f"""
  Total non-LW loads + non-SW stores:  {total_all}
  Coverable by ImmVal rules:           {total_numeric} ({pct_all})
  Requires ImmLabel support:           {total_symbolic} ({f'{total_symbolic/total_all*100:.1f}%' if total_all > 0 else 'N/A'})

  By instruction type:""")

    for instr in sorted(grand.keys()):
        g = grand[instr]
        if g["total"] == 0:
            continue
        label = "LOAD " if instr in LOAD_INSTRS else "STORE"
        pct = f"{g['numeric']/g['total']*100:.0f}%"
        print(f"    {label} {instr:<4}: {g['total']:>5} total, "
              f"{g['numeric']:>5} numeric ({pct}), "
              f"{g['symbolic']:>4} symbolic")

    print()


if __name__ == "__main__":
    main()
