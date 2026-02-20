#!/usr/bin/env python3
"""
Analyze unique full instructions (opcode + registers + immediates) per program.
Estimates the theoretical minimal custom ISA encoding width:
  If a program uses N unique instruction words, a custom decoder could
  natively encode each instruction in ceil(log2(N)) bits instead of 32 bits.

  Minimal ISA code size = total_instr * ceil(log2(N_unique)) / 8 bytes

Usage:
    python analyze_unique_instructions.py [output_csv]

Default output: unique_instructions.csv

  Minimal ISA compression (no codebook — just a custom decoder):                                                                                                                 
                                                                                                                                                                                 
  ┌────────────────────────┬─────────────────────┬─────────────────────┐
  │                        │      Original       │      Rewritten      │                                                                                                         
  ├────────────────────────┼─────────────────────┼─────────────────────┤
  │ Avg bits/instruction   │ 9.8                 │ 10.3                │
  ├────────────────────────┼─────────────────────┼─────────────────────┤
  │ Minimal / 32-bit ratio │ 0.307 (69% smaller) │ 0.321 (68% smaller) │
  └────────────────────────┴─────────────────────┴─────────────────────┘

  Rewritten + minimal ISA vs Original 32-bit:
  - Average normalized size: 0.873 (12.7% smaller than original)
  - 16/22 programs end up with smaller code than the original 32-bit program
  - Best case: primecount at 0.342x (66% smaller), qsort-str at 0.362x
  - Worst case: basicmath at 3.62x (heavy mul/div emulation inflates instruction count beyond what narrower encoding can recover)

  The takeaway: despite rewriting increasing instruction count by ~2x on average (for mul/div software emulation), a custom minimal ISA encoding (8-12 bits) recovers most of
  that overhead and often produces smaller code than the original 32-bit program.

"""

import sys
import os
import re
import json
import csv
import math
from pathlib import Path
from collections import Counter
from typing import Dict, List, Optional, Tuple
import scienceplots
import matplotlib.pyplot as plt
plt.style.use(['science', 'no-latex'])
import seaborn as sns
import numpy as np


# RISC-V ABI register alias → canonical name
_REG_ALIASES = {
    'zero': 'x0',
    'ra': 'x1', 'sp': 'x2', 'gp': 'x3', 'tp': 'x4',
    'fp': 'x8', 's0': 'x8',
}
# Also generate numeric mappings for t0-t6, s1-s11, a0-a7
for _i in range(3):
    _REG_ALIASES[f't{_i}'] = f'x{_i + 5}'
for _i in range(8):
    _REG_ALIASES[f'a{_i}'] = f'x{_i + 10}'
for _i in range(1, 12):
    _REG_ALIASES[f's{_i}'] = f'x{_i + 17}' if _i >= 2 else 'x9'
for _i in range(3, 7):
    _REG_ALIASES[f't{_i}'] = f'x{_i + 25}'

# Pre-compile regex: match whole-word register names (not inside larger tokens)
_REG_PATTERN = re.compile(
    r'\b(' + '|'.join(sorted(_REG_ALIASES.keys(), key=len, reverse=True)) + r')\b'
)


def normalize_instruction(line: str) -> Optional[str]:
    """Normalize an instruction line to a canonical string representing its 32-bit encoding.

    Returns None for non-instruction lines (empty, comments, labels).
    """
    line = line.strip()
    if not line or line.startswith('#') or line.startswith('.'):
        return None

    # Remove inline comments
    if '#' in line:
        line = line[:line.index('#')].strip()

    # Split opcode from operands
    parts = line.split(None, 1)
    if not parts:
        return None

    opcode = parts[0]
    operands = parts[1] if len(parts) > 1 else ''

    # Normalize operands: collapse whitespace around commas
    operands = re.sub(r'\s*,\s*', ',', operands)
    operands = re.sub(r'\s+', ' ', operands).strip()

    # Normalize register names to x-numbers for consistent comparison
    operands = _REG_PATTERN.sub(lambda m: _REG_ALIASES[m.group(0)], operands)

    return f"{opcode} {operands}" if operands else opcode


def collect_instructions_from_dir(block_dir: Path) -> Tuple[List[str], Counter]:
    """Collect all normalized instructions from a basic-blocks directory.

    Returns:
        (all_instructions, counter_of_unique)
    """
    all_instr: List[str] = []

    if not block_dir.exists():
        return all_instr, Counter()

    for filename in os.listdir(block_dir):
        if not filename.endswith('.txt'):
            continue
        try:
            int(filename[:-4])
        except ValueError:
            continue

        with open(block_dir / filename, 'r') as f:
            for line in f:
                norm = normalize_instruction(line)
                if norm is not None:
                    all_instr.append(norm)

    return all_instr, Counter(all_instr)


def bits_needed(n_unique: int) -> int:
    """Minimum bits to encode n_unique symbols.  Special case: 0 or 1 → 0."""
    if n_unique <= 1:
        return 0
    return math.ceil(math.log2(n_unique))


# ── finding result JSONs & variant mapping ──────────────────────────────────

def find_all_result_jsons(backend_dir: Path) -> List[Path]:
    json_files = []
    if not backend_dir.exists():
        return json_files
    for program_dir in backend_dir.iterdir():
        if program_dir.is_dir():
            json_file = program_dir / "analysis_results.json"
            if json_file.exists():
                json_files.append(json_file)
    return sorted(json_files)


def get_min_instr_variant(json_path: Path) -> Optional[Dict]:
    """Return the variant with fewest unique opcode types (excluding original/gp)."""
    with open(json_path, 'r') as f:
        data = json.load(f)
    best = None
    for v in data.get('variants', []):
        if v.get('constraint_type') in ('gp', 'original'):
            continue
        if best is None or v['num_instructions'] < best['num_instructions']:
            best = v
    return best


# ── per-program analysis ────────────────────────────────────────────────────

def analyze_program(program_name: str, frontend_dir: Path,
                    variant_info: Optional[Dict]) -> Optional[Dict]:
    prog_dir = frontend_dir / program_name

    # ── original ──
    orig_instrs, orig_counts = collect_instructions_from_dir(prog_dir / "basic_blocks")
    if not orig_instrs:
        return None

    orig_total = len(orig_instrs)
    orig_unique = len(orig_counts)
    orig_bits = bits_needed(orig_unique)

    result = {
        'application': program_name,
        'orig_total_instr': orig_total,
        'orig_unique_instr': orig_unique,
        'orig_bits_per_instr': orig_bits,
        'orig_code_bytes_32': orig_total * 4,
        'orig_code_bytes_minimal': orig_total * orig_bits / 8,
    }

    # ── rewritten variant ──
    if variant_info is not None:
        base_variant = variant_info.get('base_variant')
        rewrite_dir = prog_dir / "basic_blocks_rewrite" / f"variant_{base_variant}"
        rewr_instrs, rewr_counts = collect_instructions_from_dir(rewrite_dir)
        rewr_total = len(rewr_instrs)
        rewr_unique = len(rewr_counts)
        rewr_bits = bits_needed(rewr_unique)

        result.update({
            'rewr_variant': variant_info['variant_id'],
            'rewr_num_opcode_types': variant_info['num_instructions'],
            'rewr_total_instr': rewr_total,
            'rewr_unique_instr': rewr_unique,
            'rewr_bits_per_instr': rewr_bits,
            'rewr_code_bytes_32': rewr_total * 4,
            'rewr_code_bytes_minimal': rewr_total * rewr_bits / 8,
        })
    else:
        for key in ('rewr_variant', 'rewr_num_opcode_types',
                     'rewr_total_instr', 'rewr_unique_instr',
                     'rewr_bits_per_instr', 'rewr_code_bytes_32',
                     'rewr_code_bytes_minimal'):
            result[key] = None

    return result


# ── CSV output ──────────────────────────────────────────────────────────────

def generate_csv(summaries: List[Dict], output_path: str):
    fieldnames = [
        'application',
        'orig_total_instr', 'orig_unique_instr', 'orig_bits_per_instr',
        'orig_code_bytes_32', 'orig_code_bytes_minimal',
        'rewr_variant', 'rewr_num_opcode_types',
        'rewr_total_instr', 'rewr_unique_instr', 'rewr_bits_per_instr',
        'rewr_code_bytes_32', 'rewr_code_bytes_minimal',
    ]
    with open(output_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames, extrasaction='ignore')
        writer.writeheader()
        writer.writerows(summaries)
    print(f"CSV written to: {output_path}")


# ── visualization ───────────────────────────────────────────────────────────

def visualize_results(summaries: List[Dict], output_path: str):
    NAME_MAPPING = {
        'basicmath_small_O3': 'basicmath', 'bitcnts_O3': 'bitcnts',
        'dijkstra_small_O3': 'dijkstra', 'matmult-int': 'matmult-int',
        'qsort_large_O3': 'qsort-num', 'qsort_small_O3': 'qsort-str',
        'sha_O3': 'sha', 'patricia_O3': 'patricia',
        'picojpeg_test': 'picojpeg', 'rijndael_Oz': 'rijndael',
        'libhuffbench': 'huffbench', 'combined': 'combined',
        'libedn': 'edn', 'libnsichneu': 'nsichneu', 'libslre': 'slre',
        'libstatemate': 'statemate', 'libud': 'ud',
        'libwikisort': 'wikisort', 'md5': 'md5sum',
    }

    valid = [s for s in summaries if s.get('rewr_unique_instr') is not None]
    if not valid:
        print("No valid rewrite data to visualize!")
        return

    apps = [NAME_MAPPING.get(s['application'], s['application']) for s in valid]
    orig_32      = np.array([s['orig_code_bytes_32'] for s in valid], dtype=float)
    orig_minimal = np.array([s['orig_code_bytes_minimal'] for s in valid], dtype=float)
    rewr_32      = np.array([s['rewr_code_bytes_32'] for s in valid], dtype=float)
    rewr_minimal = np.array([s['rewr_code_bytes_minimal'] for s in valid], dtype=float)

    # Normalize: each program's original 32-bit = 1.0
    norm_orig_32      = orig_32 / orig_32          # always 1.0
    norm_orig_minimal = orig_minimal / orig_32
    norm_rewr_32      = rewr_32 / orig_32
    norm_rewr_minimal = rewr_minimal / orig_32

    # Fixed benchmark order: sorted by code-size blowup ratio (ascending),
    # shared across all plots so figures are consistent
    BENCHMARK_ORDER = [
        'qsort-str', 'sha', 'rijndael', 'statemate', 'huffbench',
        'nsichneu', 'md5sum', 'slre', 'patricia', 'primecount',
        'wikisort', 'picojpeg', 'combined', 'edn', 'bitcnts',
        'matmult-int', 'qsort-num', 'tarfind', 'ud', 'dijkstra',
        'mont64', 'basicmath',
    ]
    order_map = {name: i for i, name in enumerate(BENCHMARK_ORDER)}
    idx = sorted(range(len(apps)), key=lambda i: order_map.get(apps[i], 999))
    apps              = [apps[i] for i in idx]
    norm_orig_32      = norm_orig_32[idx]
    norm_orig_minimal = norm_orig_minimal[idx]
    norm_rewr_32      = norm_rewr_32[idx]
    norm_rewr_minimal = norm_rewr_minimal[idx]

    # Append "Average" at the end
    apps.append('Average')
    norm_orig_32      = np.append(norm_orig_32,      np.mean(norm_orig_32))
    norm_orig_minimal = np.append(norm_orig_minimal,  np.mean(norm_orig_minimal))
    norm_rewr_32      = np.append(norm_rewr_32,      np.mean(norm_rewr_32))
    norm_rewr_minimal = np.append(norm_rewr_minimal,  np.mean(norm_rewr_minimal))

    sns.set_palette("Set2")
    colors = sns.color_palette("Set2", 4)
    fig, ax = plt.subplots(figsize=(16, 6))
    x = np.arange(len(apps))
    w = 0.2

    Y_MAX = 3.0

    # Clip bars for display; we'll annotate clipped ones
    clip_orig_32      = np.minimum(norm_orig_32, Y_MAX)
    clip_orig_minimal = np.minimum(norm_orig_minimal, Y_MAX)
    clip_rewr_32      = np.minimum(norm_rewr_32, Y_MAX)
    clip_rewr_minimal = np.minimum(norm_rewr_minimal, Y_MAX)

    bars1 = ax.bar(x - 1.5*w, clip_orig_32,      w, label='Original (32-bit)',
                   color=colors[0], edgecolor='black', linewidth=0.5, alpha=0.85)
    bars2 = ax.bar(x - 0.5*w, clip_orig_minimal,  w, label='Original (theoretical minimal ISA)',
                   color=colors[1], edgecolor='black', linewidth=0.5, alpha=0.85, hatch='//')
    bars3 = ax.bar(x + 0.5*w, clip_rewr_32,      w, label='Rewritten (32-bit)',
                   color=colors[2], edgecolor='black', linewidth=0.5, alpha=0.85)
    bars4 = ax.bar(x + 1.5*w, clip_rewr_minimal,  w, label='Rewritten (theoretical minimal ISA)',
                   color=colors[3], edgecolor='black', linewidth=0.5, alpha=0.85, hatch='//')

    # Annotate bars that exceed Y_MAX with their actual value
    for bars, vals, offset in [(bars1, norm_orig_32, -1.5*w),
                                (bars2, norm_orig_minimal, -0.5*w),
                                (bars3, norm_rewr_32, 0.5*w),
                                (bars4, norm_rewr_minimal, 1.5*w)]:
        for i, val in enumerate(vals):
            if val > Y_MAX:
                ax.text(x[i] + offset, Y_MAX + 0.05, f'{val:.1f}',
                        ha='center', va='bottom', fontsize=8, fontweight='bold')

    # Reference line at 1.0
    ax.axhline(y=1.0, color='black', linestyle='--', linewidth=0.8, alpha=0.5)

    # Vertical separator before Average
    avg_idx = len(apps) - 1
    ax.axvline(x=avg_idx - 0.5, color='black', linestyle='-', linewidth=0.8, alpha=0.4)

    # Bold the "Average" x-tick label
    ax.set_ylim(0, Y_MAX + 0.3)
    ax.set_ylabel('Normalized Code Size\n(1.0 = Original 32-bit)', fontsize=16, fontweight='bold')
    ax.set_xticks(x)
    xlabels = ax.set_xticklabels(apps, rotation=45, ha='right', fontsize=14)
    xlabels[-1].set_fontweight('bold')
    ax.tick_params(axis='y', labelsize=14)
    ax.grid(axis='y', alpha=0.3, linestyle='--')
    ax.legend(loc='upper left', framealpha=0.9, fontsize=13)

    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    print(f"Visualization saved to: {output_path}")
    plt.close()


# ── main ────────────────────────────────────────────────────────────────────

def main():
    output_csv = sys.argv[1] if len(sys.argv) > 1 else "unique_instructions.csv"

    script_dir = Path(__file__).parent
    backend_dir = script_dir / "output" / "backend"
    frontend_dir = script_dir / "output" / "frontend"

    print("=" * 90)
    print("Unique Instruction Analysis — Theoretical Dictionary Compression")
    print("=" * 90)

    json_files = find_all_result_jsons(backend_dir)
    print(f"Found {len(json_files)} programs\n")

    summaries = []
    for json_path in json_files:
        program_name = json_path.parent.name
        variant_info = get_min_instr_variant(json_path)
        result = analyze_program(program_name, frontend_dir, variant_info)
        if result is None:
            print(f"  {program_name}: skipped")
            continue
        summaries.append(result)

        # Print one-line summary
        o_tot = result['orig_total_instr']
        o_uniq = result['orig_unique_instr']
        o_bits = result['orig_bits_per_instr']
        r_tot = result.get('rewr_total_instr', 0)
        r_uniq = result.get('rewr_unique_instr', 0)
        r_bits = result.get('rewr_bits_per_instr', 0)
        print(f"  {program_name:<25}  orig: {o_tot:>5} instr, {o_uniq:>4} unique -> {o_bits:>2} bits  |  "
              f"rewr: {r_tot:>5} instr, {r_uniq:>4} unique -> {r_bits:>2} bits")

    print()

    # ── CSV ──
    generate_csv(summaries, output_csv)

    # ── Visualization ──
    plot_path = output_csv.replace('.csv', '.pdf')
    visualize_results(summaries, plot_path)

    # ── Aggregate statistics ──
    print()
    print("=" * 90)
    print("Summary Statistics")
    print("=" * 90)

    valid = [s for s in summaries if s.get('rewr_unique_instr') is not None]

    print(f"\n{'':>25}  {'Original':>30}  {'Rewritten (min-instr)':>30}")
    print(f"{'':>25}  {'─'*30}  {'─'*30}")

    def stat_line(label, orig_vals, rewr_vals):
        print(f"  {label:<23}  "
              f"min={min(orig_vals):>7.0f}  max={max(orig_vals):>7.0f}  avg={sum(orig_vals)/len(orig_vals):>8.1f}  │  "
              f"min={min(rewr_vals):>7.0f}  max={max(rewr_vals):>7.0f}  avg={sum(rewr_vals)/len(rewr_vals):>8.1f}")

    stat_line("Total instructions",
              [s['orig_total_instr'] for s in valid],
              [s['rewr_total_instr'] for s in valid])
    stat_line("Unique instructions",
              [s['orig_unique_instr'] for s in valid],
              [s['rewr_unique_instr'] for s in valid])
    stat_line("Bits per instruction",
              [s['orig_bits_per_instr'] for s in valid],
              [s['rewr_bits_per_instr'] for s in valid])
    stat_line("Code size, 32-bit (B)",
              [s['orig_code_bytes_32'] for s in valid],
              [s['rewr_code_bytes_32'] for s in valid])
    stat_line("Code size, minimal (B)",
              [s['orig_code_bytes_minimal'] for s in valid],
              [s['rewr_code_bytes_minimal'] for s in valid])

    # ── Per-program detailed table ──
    print(f"\n{'─'*100}")
    print(f"  {'Application':<20} │ {'Orig':>5} │ {'Orig':>5} │ {'Orig':>4} │ {'Orig':>8} │ "
          f"{'Rewr':>5} │ {'Rewr':>5} │ {'Rewr':>4} │ {'Rewr':>8} │ {'Rewr':>10}")
    print(f"  {'':20} │ {'total':>5} │ {'uniq':>5} │ {'bits':>4} │ {'min(B)':>8} │ "
          f"{'total':>5} │ {'uniq':>5} │ {'bits':>4} │ {'32b(B)':>8} │ {'min(B)':>10}")
    print(f"  {'─'*20}─┼─{'─'*5}─┼─{'─'*5}─┼─{'─'*4}─┼─{'─'*8}─┼─"
          f"{'─'*5}─┼─{'─'*5}─┼─{'─'*4}─┼─{'─'*8}─┼─{'─'*10}")

    for s in valid:
        print(f"  {NAME_MAPPING.get(s['application'], s['application']):<20} │ "
              f"{s['orig_total_instr']:>5} │ {s['orig_unique_instr']:>5} │ {s['orig_bits_per_instr']:>4} │ {s['orig_code_bytes_minimal']:>8.0f} │ "
              f"{s['rewr_total_instr']:>5} │ {s['rewr_unique_instr']:>5} │ {s['rewr_bits_per_instr']:>4} │ "
              f"{s['rewr_code_bytes_32']:>8.0f} │ {s['rewr_code_bytes_minimal']:>10.0f}")

    # ── Compression ratio summary ──
    print(f"\n{'─'*100}")
    print("Minimal ISA code size / 32-bit code size:")
    ratios_orig = [s['orig_code_bytes_minimal'] / s['orig_code_bytes_32'] for s in valid]
    ratios_rewr = [s['rewr_code_bytes_minimal'] / s['rewr_code_bytes_32'] for s in valid]
    print(f"  Original:  min={min(ratios_orig):.3f}  max={max(ratios_orig):.3f}  avg={sum(ratios_orig)/len(ratios_orig):.3f}")
    print(f"  Rewritten: min={min(ratios_rewr):.3f}  max={max(ratios_rewr):.3f}  avg={sum(ratios_rewr)/len(ratios_rewr):.3f}")

    # Cross comparison: rewritten minimal vs original 32-bit
    cross = [s['rewr_code_bytes_minimal'] / s['orig_code_bytes_32'] for s in valid]
    print(f"\n  Rewritten minimal ISA vs Original 32-bit:")
    print(f"    min={min(cross):.3f}  max={max(cross):.3f}  avg={sum(cross)/len(cross):.3f}")
    smaller = [s for s, r in zip(valid, cross) if r < 1.0]
    print(f"    {len(smaller)}/{len(valid)} programs have rewritten minimal ISA smaller than original 32-bit")

    print("=" * 90)


# Need NAME_MAPPING at module level for the stats table
NAME_MAPPING = {
    'basicmath_small_O3': 'basicmath', 'bitcnts_O3': 'bitcnts',
    'dijkstra_small_O3': 'dijkstra', 'matmult-int': 'matmult-int',
    'qsort_large_O3': 'qsort-num', 'qsort_small_O3': 'qsort-str',
    'sha_O3': 'sha', 'patricia_O3': 'patricia',
    'picojpeg_test': 'picojpeg', 'rijndael_Oz': 'rijndael',
    'libhuffbench': 'huffbench', 'combined': 'combined',
    'libedn': 'edn', 'libnsichneu': 'nsichneu', 'libslre': 'slre',
    'libstatemate': 'statemate', 'libud': 'ud',
    'libwikisort': 'wikisort', 'md5': 'md5sum',
}


if __name__ == "__main__":
    main()
