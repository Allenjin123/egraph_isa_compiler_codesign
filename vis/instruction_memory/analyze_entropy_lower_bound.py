#!/usr/bin/env python3
"""
Analyze instruction memory lower bound using Shannon entropy.

Unlike analyze_unique_instructions.py which uses uniform encoding
(ceil(log2(N_unique)) bits per instruction), this script computes the
theoretical absolute lower bound using Shannon entropy:

    H = -Σ p_i * log2(p_i)     (bits per instruction)

where p_i = count_i / total_instructions for each unique instruction i.

Shannon's source coding theorem (1948) proves that no lossless encoding
can achieve fewer than H bits per symbol on average.  Practical schemes
like Huffman coding get within 1 bit of H, and arithmetic coding can
approach H arbitrarily closely.

    Minimal code size = total_instr * H / 8  bytes

The entropy bound is always <= the uniform bound, with equality only when
every unique instruction appears with the same frequency.

Usage:
    python analyze_entropy_lower_bound.py [output_csv]

Default output: entropy_lower_bound.csv

MiBench figure:                                                                                                                                                                    

Fig. X shows the normalized instruction memory size for 8 MiBench benchmarks under four encoding schemes, normalized to the original 32-bit program. Instruction rewriting incurs a
geometric mean code size blowup of 2.45× at 32-bit encoding, primarily due to software emulation of multiply/divide operations. However, applying Shannon entropy-based 
encoding—which assigns shorter codewords to frequently occurring instructions—reduces the rewritten code to a geometric mean of 0.64× the original 32-bit size, a 35.6% reduction.
The average entropy is 8.68 bits/instruction for original programs and 8.45 bits/instruction for rewritten programs, representing a 72–73% reduction from the fixed 32-bit width.
Six of eight benchmarks achieve a rewritten entropy-coded size smaller than the original 32-bit program. Compared to uniform dictionary encoding, entropy coding provides an
additional 16% size reduction for rewritten programs by exploiting instruction frequency skew.

Embench figure:

Fig. Y shows the same analysis for 14 Embench-IoT benchmarks. Rewriting increases 32-bit code size by a geometric mean of 1.95×, a smaller overhead than MiBench due to fewer
multiply/divide-heavy programs. Under entropy-optimal encoding, the rewritten programs shrink to a geometric mean of 0.52× the original 32-bit size—a 47.6% reduction—with 13 of 14
benchmarks achieving smaller code than the original 32-bit program. The average entropy is 8.99 bits/instruction for original programs and 8.67 bits/instruction for rewritten
variants. Entropy coding yields an additional 17% reduction over uniform dictionary encoding for rewritten programs, confirming that instruction frequency distributions in
embedded workloads exhibit significant skew that variable-length encoding can exploit.


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


# ── register normalization (shared with analyze_unique_instructions.py) ──────

_REG_ALIASES = {
    'zero': 'x0',
    'ra': 'x1', 'sp': 'x2', 'gp': 'x3', 'tp': 'x4',
    'fp': 'x8', 's0': 'x8',
}
for _i in range(3):
    _REG_ALIASES[f't{_i}'] = f'x{_i + 5}'
for _i in range(8):
    _REG_ALIASES[f'a{_i}'] = f'x{_i + 10}'
for _i in range(1, 12):
    _REG_ALIASES[f's{_i}'] = f'x{_i + 17}' if _i >= 2 else 'x9'
for _i in range(3, 7):
    _REG_ALIASES[f't{_i}'] = f'x{_i + 25}'

_REG_PATTERN = re.compile(
    r'\b(' + '|'.join(sorted(_REG_ALIASES.keys(), key=len, reverse=True)) + r')\b'
)


def normalize_instruction(line: str) -> Optional[str]:
    """Normalize an instruction line to a canonical string."""
    line = line.strip()
    if not line or line.startswith('#') or line.startswith('.'):
        return None
    if '#' in line:
        line = line[:line.index('#')].strip()
    parts = line.split(None, 1)
    if not parts:
        return None
    opcode = parts[0]
    operands = parts[1] if len(parts) > 1 else ''
    operands = re.sub(r'\s*,\s*', ',', operands)
    operands = re.sub(r'\s+', ' ', operands).strip()
    operands = _REG_PATTERN.sub(lambda m: _REG_ALIASES[m.group(0)], operands)
    return f"{opcode} {operands}" if operands else opcode


def collect_instructions_from_dir(block_dir: Path) -> Tuple[List[str], Counter]:
    """Collect all normalized instructions from a basic-blocks directory."""
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


# ── entropy computation ─────────────────────────────────────────────────────

def shannon_entropy(counts: Counter) -> float:
    """Compute Shannon entropy H = -Σ p_i * log2(p_i) in bits per symbol.

    Returns 0.0 if there are 0 or 1 unique symbols.
    """
    total = sum(counts.values())
    if total == 0:
        return 0.0
    n_unique = len(counts)
    if n_unique <= 1:
        return 0.0
    H = 0.0
    for count in counts.values():
        p = count / total
        H -= p * math.log2(p)
    return H


def huffman_avg_bits(counts: Counter) -> float:
    """Compute average bits per symbol under optimal Huffman coding.

    Builds a Huffman tree from frequency counts and returns
    L = Σ p_i * l_i, where l_i is the codeword length for symbol i.
    Guaranteed: H ≤ L < H + 1  (Huffman 1952).
    """
    import heapq
    total = sum(counts.values())
    if total == 0:
        return 0.0
    if len(counts) <= 1:
        return 0.0

    # Build Huffman tree: heap of (frequency, tie-breaker, bit-lengths-dict)
    heap = []
    for i, (sym, cnt) in enumerate(counts.items()):
        heapq.heappush(heap, (cnt, i, {sym: 0}))

    counter = len(counts)
    while len(heap) > 1:
        freq1, _, lengths1 = heapq.heappop(heap)
        freq2, _, lengths2 = heapq.heappop(heap)
        # Increment all bit lengths by 1 for both subtrees
        merged = {}
        for sym, bits in lengths1.items():
            merged[sym] = bits + 1
        for sym, bits in lengths2.items():
            merged[sym] = bits + 1
        heapq.heappush(heap, (freq1 + freq2, counter, merged))
        counter += 1

    _, _, final_lengths = heap[0]
    avg = sum(final_lengths[sym] * counts[sym] for sym in counts) / total
    return avg


def bits_needed_uniform(n_unique: int) -> int:
    """Minimum bits for uniform encoding (ceil(log2(N)))."""
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
    orig_uniform_bits = bits_needed_uniform(orig_unique)
    orig_entropy = shannon_entropy(orig_counts)
    orig_huffman = huffman_avg_bits(orig_counts)

    result = {
        'application': program_name,
        'orig_total_instr': orig_total,
        'orig_unique_instr': orig_unique,
        'orig_uniform_bits': orig_uniform_bits,
        'orig_entropy_bits': orig_entropy,
        'orig_huffman_bits': orig_huffman,
        'orig_code_bytes_32': orig_total * 4,
        'orig_code_bytes_uniform': orig_total * orig_uniform_bits / 8,
        'orig_code_bytes_entropy': orig_total * orig_entropy / 8,
        'orig_code_bytes_huffman': orig_total * orig_huffman / 8,
    }

    # ── rewritten variant ──
    if variant_info is not None:
        base_variant = variant_info.get('base_variant')
        rewrite_dir = prog_dir / "basic_blocks_rewrite" / f"variant_{base_variant}"
        rewr_instrs, rewr_counts = collect_instructions_from_dir(rewrite_dir)
        rewr_total = len(rewr_instrs)
        rewr_unique = len(rewr_counts)
        rewr_uniform_bits = bits_needed_uniform(rewr_unique)
        rewr_entropy = shannon_entropy(rewr_counts)
        rewr_huffman = huffman_avg_bits(rewr_counts)

        result.update({
            'rewr_variant': variant_info['variant_id'],
            'rewr_num_opcode_types': variant_info['num_instructions'],
            'rewr_total_instr': rewr_total,
            'rewr_unique_instr': rewr_unique,
            'rewr_uniform_bits': rewr_uniform_bits,
            'rewr_entropy_bits': rewr_entropy,
            'rewr_huffman_bits': rewr_huffman,
            'rewr_code_bytes_32': rewr_total * 4,
            'rewr_code_bytes_uniform': rewr_total * rewr_uniform_bits / 8,
            'rewr_code_bytes_entropy': rewr_total * rewr_entropy / 8,
            'rewr_code_bytes_huffman': rewr_total * rewr_huffman / 8,
        })
    else:
        for key in ('rewr_variant', 'rewr_num_opcode_types',
                     'rewr_total_instr', 'rewr_unique_instr',
                     'rewr_uniform_bits', 'rewr_entropy_bits', 'rewr_huffman_bits',
                     'rewr_code_bytes_32', 'rewr_code_bytes_uniform',
                     'rewr_code_bytes_entropy', 'rewr_code_bytes_huffman'):
            result[key] = None

    return result


# ── CSV output ──────────────────────────────────────────────────────────────

def generate_csv(summaries: List[Dict], output_path: str):
    fieldnames = [
        'application',
        'orig_total_instr', 'orig_unique_instr',
        'orig_uniform_bits', 'orig_entropy_bits', 'orig_huffman_bits',
        'orig_code_bytes_32', 'orig_code_bytes_uniform',
        'orig_code_bytes_entropy', 'orig_code_bytes_huffman',
        'rewr_variant', 'rewr_num_opcode_types',
        'rewr_total_instr', 'rewr_unique_instr',
        'rewr_uniform_bits', 'rewr_entropy_bits', 'rewr_huffman_bits',
        'rewr_code_bytes_32', 'rewr_code_bytes_uniform',
        'rewr_code_bytes_entropy', 'rewr_code_bytes_huffman',
    ]
    with open(output_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames, extrasaction='ignore')
        writer.writeheader()
        writer.writerows(summaries)
    print(f"CSV written to: {output_path}")


# ── benchmark suite membership ──────────────────────────────────────────────

MIBENCH_NAMES = {
    'basicmath', 'bitcnts', 'dijkstra', 'patricia',
    'qsort-num', 'qsort-str', 'rijndael', 'sha',
}

EMBENCH_NAMES = {
    'combined', 'edn', 'huffbench', 'matmult-int', 'md5sum', 'mont64',
    'nsichneu', 'picojpeg', 'primecount', 'slre', 'statemate',
    'tarfind', 'ud', 'wikisort',
}


# ── visualization ───────────────────────────────────────────────────────────

def visualize_results(summaries: List[Dict], output_path: str):
    from matplotlib.patches import Patch

    valid = [s for s in summaries if s.get('rewr_unique_instr') is not None]
    if not valid:
        print("No valid rewrite data to visualize!")
        return

    apps = [NAME_MAPPING.get(s['application'], s['application']) for s in valid]
    orig_32       = np.array([s['orig_code_bytes_32'] for s in valid], dtype=float)
    orig_entropy  = np.array([s['orig_code_bytes_entropy'] for s in valid], dtype=float)
    rewr_32       = np.array([s['rewr_code_bytes_32'] for s in valid], dtype=float)
    rewr_entropy  = np.array([s['rewr_code_bytes_entropy'] for s in valid], dtype=float)

    # Normalize to original 32-bit
    norm_orig_32       = orig_32 / orig_32
    norm_orig_entropy  = orig_entropy / orig_32
    norm_rewr_32       = rewr_32 / orig_32
    norm_rewr_entropy  = rewr_entropy / orig_32

    def _gmean(arr):
        return np.exp(np.mean(np.log(arr)))

    avg_orig_32       = _gmean(norm_orig_32)
    avg_orig_entropy  = _gmean(norm_orig_entropy)
    avg_rewr_32       = _gmean(norm_rewr_32)
    avg_rewr_entropy  = _gmean(norm_rewr_entropy)

    # Sort all benchmarks by rewritten 32-bit ratio (ascending)
    sort_idx = sorted(range(len(apps)), key=lambda i: norm_rewr_32[i])
    apps              = [apps[i] for i in sort_idx]
    norm_orig_32      = norm_orig_32[sort_idx]
    norm_orig_entropy = norm_orig_entropy[sort_idx]
    norm_rewr_32      = norm_rewr_32[sort_idx]
    norm_rewr_entropy = norm_rewr_entropy[sort_idx]

    # Append Geomean
    apps.append('Geomean')
    norm_orig_32      = np.append(norm_orig_32,      avg_orig_32)
    norm_orig_entropy = np.append(norm_orig_entropy,  avg_orig_entropy)
    norm_rewr_32      = np.append(norm_rewr_32,      avg_rewr_32)
    norm_rewr_entropy = np.append(norm_rewr_entropy,  avg_rewr_entropy)

    n = len(apps)
    sns.set_palette("Set2")
    colors = sns.color_palette("Set2", 4)
    fig, ax = plt.subplots(figsize=(7, 3.5))
    x = np.arange(n)
    w = 0.18

    Y_MAX = 3.0

    # Bar 1: Original 32-bit
    clip_orig_32 = np.minimum(norm_orig_32, Y_MAX)
    ax.bar(x - 1.5*w, clip_orig_32, w,
           color=colors[0], edgecolor='black', linewidth=0.4, alpha=0.85)

    # Bar 2: Original entropy lower bound
    clip_orig_entropy = np.minimum(norm_orig_entropy, Y_MAX)
    ax.bar(x - 0.5*w, clip_orig_entropy, w,
           color=colors[1], edgecolor='black', linewidth=0.4, alpha=0.85)

    # Bar 3: Rewritten 32-bit
    clip_rewr_32 = np.minimum(norm_rewr_32, Y_MAX)
    ax.bar(x + 0.5*w, clip_rewr_32, w,
           color=colors[2], edgecolor='black', linewidth=0.4, alpha=0.85)

    # Bar 4: Rewritten entropy lower bound
    clip_rewr_entropy = np.minimum(norm_rewr_entropy, Y_MAX)
    ax.bar(x + 1.5*w, clip_rewr_entropy, w,
           color=colors[3], edgecolor='black', linewidth=0.4, alpha=0.85)

    # Annotate clipped bars
    for vals, offset in [(norm_orig_32, -1.5*w),
                          (norm_orig_entropy, -0.5*w),
                          (norm_rewr_32, 0.5*w),
                          (norm_rewr_entropy, 1.5*w)]:
        for i, val in enumerate(vals):
            if val > Y_MAX:
                ax.text(x[i] + offset, Y_MAX + 0.03, f'{val:.1f}',
                        ha='center', va='bottom', fontsize=7, fontweight='bold')

    ax.axhline(y=1.0, color='black', linestyle='--', linewidth=0.8, alpha=0.5)

    avg_idx = n - 1
    ax.axvline(x=avg_idx - 0.5, color='black', linestyle='-', linewidth=0.8, alpha=0.4)

    ax.set_xlim(-0.6, n - 0.4)
    ax.set_ylim(0, Y_MAX + 0.25)
    ax.set_ylabel('Normalized Code Size', fontsize=11, fontweight='bold')
    ax.set_xticks(x)
    xlabels = ax.set_xticklabels(apps, rotation=60, ha='right', fontsize=10)
    xlabels[-1].set_fontweight('bold')
    ax.tick_params(axis='y', labelsize=9)
    ax.grid(axis='y', alpha=0.3, linestyle='--')

    legend_handles = [
        Patch(facecolor=colors[0], edgecolor='black', linewidth=0.5,
              label='Original (32-bit)'),
        Patch(facecolor=colors[1], edgecolor='black', linewidth=0.5,
              label='Original (entropy lower bound)'),
        Patch(facecolor=colors[2], edgecolor='black', linewidth=0.5,
              label='Rewritten (32-bit)'),
        Patch(facecolor=colors[3], edgecolor='black', linewidth=0.5,
              label='Rewritten (entropy lower bound)'),
    ]
    ax.legend(handles=legend_handles, loc='upper left', framealpha=0.9, fontsize=7)

    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    print(f"Visualization saved to: {output_path}")
    plt.close()


# ── main ────────────────────────────────────────────────────────────────────

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


def main():
    script_dir = Path(__file__).resolve().parent
    output_csv = sys.argv[1] if len(sys.argv) > 1 else str(script_dir / "entropy_lower_bound.csv")

    project_root = Path(__file__).resolve().parent.parent.parent
    backend_dir = project_root / "output" / "backend"
    frontend_dir = project_root / "output" / "frontend"

    print("=" * 90)
    print("Instruction Memory Lower Bound — Shannon Entropy Analysis")
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

        o_tot = result['orig_total_instr']
        o_uniq = result['orig_unique_instr']
        o_unif = result['orig_uniform_bits']
        o_ent = result['orig_entropy_bits']
        r_tot = result.get('rewr_total_instr', 0)
        r_uniq = result.get('rewr_unique_instr', 0)
        r_unif = result.get('rewr_uniform_bits', 0)
        r_ent = result.get('rewr_entropy_bits', 0.0)
        print(f"  {program_name:<25}  orig: {o_tot:>5} instr, {o_uniq:>4} unique, "
              f"uniform={o_unif:>2}b, H={o_ent:.2f}b  |  "
              f"rewr: {r_tot:>5} instr, {r_uniq:>4} unique, "
              f"uniform={r_unif:>2}b, H={r_ent:.2f}b")

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

    print(f"\n{'':>25}  {'Original':>40}  {'Rewritten (min-instr)':>40}")
    print(f"{'':>25}  {'─'*40}  {'─'*40}")

    def stat_line(label, orig_vals, rewr_vals, fmt='.0f'):
        print(f"  {label:<23}  "
              f"min={min(orig_vals):>8{fmt}}  max={max(orig_vals):>8{fmt}}  "
              f"avg={sum(orig_vals)/len(orig_vals):>9{fmt}}  │  "
              f"min={min(rewr_vals):>8{fmt}}  max={max(rewr_vals):>8{fmt}}  "
              f"avg={sum(rewr_vals)/len(rewr_vals):>9{fmt}}")

    stat_line("Total instructions",
              [s['orig_total_instr'] for s in valid],
              [s['rewr_total_instr'] for s in valid])
    stat_line("Unique instructions",
              [s['orig_unique_instr'] for s in valid],
              [s['rewr_unique_instr'] for s in valid])
    stat_line("Uniform bits/instr",
              [s['orig_uniform_bits'] for s in valid],
              [s['rewr_uniform_bits'] for s in valid])
    stat_line("Entropy bits/instr",
              [s['orig_entropy_bits'] for s in valid],
              [s['rewr_entropy_bits'] for s in valid], fmt='.2f')
    stat_line("Code size, 32-bit (B)",
              [s['orig_code_bytes_32'] for s in valid],
              [s['rewr_code_bytes_32'] for s in valid])
    stat_line("Code size, uniform (B)",
              [s['orig_code_bytes_uniform'] for s in valid],
              [s['rewr_code_bytes_uniform'] for s in valid])
    stat_line("Code size, entropy (B)",
              [s['orig_code_bytes_entropy'] for s in valid],
              [s['rewr_code_bytes_entropy'] for s in valid])

    # ── Per-program detailed table ──
    print(f"\n{'─'*130}")
    print(f"  {'Application':<20} │ {'Orig':>5} │ {'Orig':>5} │ {'Unif':>4} │ "
          f"{'Entr':>5} │ {'Orig':>8} │ {'Orig':>8} │ "
          f"{'Rewr':>5} │ {'Rewr':>5} │ {'Unif':>4} │ "
          f"{'Entr':>5} │ {'Rewr':>8} │ {'Rewr':>8}")
    print(f"  {'':20} │ {'total':>5} │ {'uniq':>5} │ {'bits':>4} │ "
          f"{'bits':>5} │ {'unif(B)':>8} │ {'entr(B)':>8} │ "
          f"{'total':>5} │ {'uniq':>5} │ {'bits':>4} │ "
          f"{'bits':>5} │ {'unif(B)':>8} │ {'entr(B)':>8}")
    print(f"  {'─'*20}─┼─{'─'*5}─┼─{'─'*5}─┼─{'─'*4}─┼─"
          f"{'─'*5}─┼─{'─'*8}─┼─{'─'*8}─┼─"
          f"{'─'*5}─┼─{'─'*5}─┼─{'─'*4}─┼─"
          f"{'─'*5}─┼─{'─'*8}─┼─{'─'*8}")

    for s in valid:
        print(f"  {NAME_MAPPING.get(s['application'], s['application']):<20} │ "
              f"{s['orig_total_instr']:>5} │ {s['orig_unique_instr']:>5} │ "
              f"{s['orig_uniform_bits']:>4} │ {s['orig_entropy_bits']:>5.2f} │ "
              f"{s['orig_code_bytes_uniform']:>8.0f} │ {s['orig_code_bytes_entropy']:>8.0f} │ "
              f"{s['rewr_total_instr']:>5} │ {s['rewr_unique_instr']:>5} │ "
              f"{s['rewr_uniform_bits']:>4} │ {s['rewr_entropy_bits']:>5.2f} │ "
              f"{s['rewr_code_bytes_uniform']:>8.0f} │ {s['rewr_code_bytes_entropy']:>8.0f}")

    # ── Compression ratio summary ──
    print(f"\n{'─'*130}")
    print("Entropy lower bound / 32-bit code size:")
    ratios_orig = [s['orig_code_bytes_entropy'] / s['orig_code_bytes_32'] for s in valid]
    ratios_rewr = [s['rewr_code_bytes_entropy'] / s['rewr_code_bytes_32'] for s in valid]
    print(f"  Original:  min={min(ratios_orig):.3f}  max={max(ratios_orig):.3f}  "
          f"avg={sum(ratios_orig)/len(ratios_orig):.3f}")
    print(f"  Rewritten: min={min(ratios_rewr):.3f}  max={max(ratios_rewr):.3f}  "
          f"avg={sum(ratios_rewr)/len(ratios_rewr):.3f}")

    # ── Entropy vs uniform comparison ──
    print(f"\nEntropy savings over uniform encoding (entropy / uniform):")
    ent_vs_unif_orig = [s['orig_code_bytes_entropy'] / s['orig_code_bytes_uniform']
                        for s in valid if s['orig_code_bytes_uniform'] > 0]
    ent_vs_unif_rewr = [s['rewr_code_bytes_entropy'] / s['rewr_code_bytes_uniform']
                        for s in valid if s['rewr_code_bytes_uniform'] > 0]
    if ent_vs_unif_orig:
        print(f"  Original:  min={min(ent_vs_unif_orig):.3f}  max={max(ent_vs_unif_orig):.3f}  "
              f"avg={sum(ent_vs_unif_orig)/len(ent_vs_unif_orig):.3f}")
    if ent_vs_unif_rewr:
        print(f"  Rewritten: min={min(ent_vs_unif_rewr):.3f}  max={max(ent_vs_unif_rewr):.3f}  "
              f"avg={sum(ent_vs_unif_rewr)/len(ent_vs_unif_rewr):.3f}")

    # Cross comparison: rewritten entropy vs original 32-bit
    cross = [s['rewr_code_bytes_entropy'] / s['orig_code_bytes_32'] for s in valid]
    print(f"\n  Rewritten entropy lower bound vs Original 32-bit:")
    print(f"    min={min(cross):.3f}  max={max(cross):.3f}  avg={sum(cross)/len(cross):.3f}")
    smaller = [s for s, r in zip(valid, cross) if r < 1.0]
    print(f"    {len(smaller)}/{len(valid)} programs have rewritten entropy bound "
          f"smaller than original 32-bit")

    print("=" * 90)


if __name__ == "__main__":
    main()
