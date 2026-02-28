#!/usr/bin/env python3
"""
Parse code size (total static instruction count) from frontend output.
Shows code size of original vs rewritten programs for min-area variants.

Usage:
    python parse_code_size.py [output_csv]

Default output: code_size.csv

  Dynamic compression logic:                                                                                                                                                                                                                            
  - ≤16 unique instructions → 29-bit encoding (6 programs: basicmath, dijkstra, ud, mont64, primecount, qsort-num)                                                                                                                                      
  - 17-32 unique instructions → 30-bit encoding (16 programs)                                                                                                                                                                                           
  32 → standard 32-bit (none in this dataset)                                                                                                                                                                                                           
                                                                                                                                                                                                                                                        
  Key findings:                                                                                                                                                                                                                                         

  ┌─────────────────────────────────────────────────────────────┬────────────────────────────────────────────────────────────────────┐
  │                           Metric                            │                               Value                                │
  ├─────────────────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────────┤
  │ Avg code size increase (rewritten 32-bit vs original)       │ +168.6%                                                            │
  ├─────────────────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────────┤
  │ Avg code size increase (rewritten + compressed vs original) │ +147.2%                                                            │
  ├─────────────────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────────┤
  │ Apps with smaller code after rewriting (32-bit)             │ 0/22                                                               │
  ├─────────────────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────────┤
  │ Apps with smaller code after rewriting + compression        │ 4/22 (qsort-str -3.0%, sha -4.6%, rijndael -0.3%, statemate -0.6%) │
  └─────────────────────────────────────────────────────────────┴────────────────────────────────────────────────────────────────────┘

"""

import sys
import os
import json
import csv
from pathlib import Path
from typing import Dict, List, Optional, Tuple
import scienceplots
import matplotlib.pyplot as plt
plt.style.use(['science', 'no-latex'])
import seaborn as sns
import numpy as np


def compressed_bits(num_unique_instr: int) -> int:
    """Determine compressed instruction bit-width based on number of unique instructions.

    <=16 instructions -> 4-bit opcode -> 29-bit instruction
    <=32 instructions -> 5-bit opcode -> 30-bit instruction
    >32  instructions -> standard 32-bit instruction (no savings)
    """
    if num_unique_instr <= 16:
        return 29
    elif num_unique_instr <= 32:
        return 30
    else:
        return 32


def count_instructions_in_dir(block_dir: Path) -> Tuple[int, int]:
    """Count total static instructions across all basic block .txt files in a directory.

    Args:
        block_dir: Path to directory containing numbered .txt basic block files

    Returns:
        Tuple of (total_instructions, num_blocks)
    """
    if not block_dir.exists():
        return 0, 0

    total_instructions = 0
    num_blocks = 0

    for filename in os.listdir(block_dir):
        if not filename.endswith('.txt'):
            continue
        try:
            int(filename[:-4])  # Only numbered files (e.g., "0.txt", "1.txt")
        except ValueError:
            continue

        num_blocks += 1
        filepath = block_dir / filename
        with open(filepath, 'r') as f:
            for line in f:
                line = line.strip()
                # Match parse_instruction logic: skip empty, comments, labels
                if not line or line.startswith('#') or line.startswith('.'):
                    continue
                total_instructions += 1

    return total_instructions, num_blocks


def find_all_result_jsons(backend_dir: Path) -> List[Path]:
    """Find all analysis_results.json files in backend directory."""
    json_files = []
    if not backend_dir.exists():
        return json_files

    for program_dir in backend_dir.iterdir():
        if program_dir.is_dir():
            json_file = program_dir / "analysis_results.json"
            if json_file.exists():
                json_files.append(json_file)

    return sorted(json_files)


def parse_code_size(json_path: Path, frontend_dir: Path) -> Optional[Dict]:
    """Parse code size for original and min-area variant of a program.

    Args:
        json_path: Path to analysis_results.json
        frontend_dir: Path to frontend output directory

    Returns:
        Dictionary with code size metrics, or None on error
    """
    try:
        with open(json_path, 'r') as f:
            data = json.load(f)

        program_name = data.get('program_name', 'unknown')
        variants = data.get('variants', [])

        if not variants:
            return None

        prog_dir = frontend_dir / program_name

        # Count original code size from basic_blocks/
        orig_code_size, orig_num_blocks = count_instructions_in_dir(
            prog_dir / "basic_blocks"
        )

        if orig_code_size == 0:
            print(f"  Warning: No original basic blocks found for {program_name}",
                  file=sys.stderr)
            return None

        # Find min-area variant and min-instruction variant (excluding original and gp)
        min_area_variant = None
        min_instr_variant = None

        for variant in variants:
            constraint_type = variant.get('constraint_type', 'single')
            if constraint_type in ('gp', 'original'):
                continue

            if min_area_variant is None or variant['area'] < min_area_variant['area']:
                min_area_variant = variant
            if min_instr_variant is None or variant['num_instructions'] < min_instr_variant['num_instructions']:
                min_instr_variant = variant

        # For each variant, find the base_variant number to locate the rewrite directory
        results = {
            'application': program_name,
            'original_code_size': orig_code_size,
            'original_num_blocks': orig_num_blocks,
        }

        rewrite_dir = prog_dir / "basic_blocks_rewrite"

        for label, variant in [('min_area', min_area_variant), ('min_instr', min_instr_variant)]:
            if variant is None:
                results[f'{label}_variant'] = None
                results[f'{label}_code_size'] = None
                results[f'{label}_num_blocks'] = None
                results[f'{label}_area'] = None
                results[f'{label}_num_unique_instr'] = None
                continue

            base_variant = variant.get('base_variant')
            variant_id = variant['variant_id']

            # Count rewritten code size
            variant_block_dir = rewrite_dir / f"variant_{base_variant}"
            rewritten_size, rewritten_blocks = count_instructions_in_dir(variant_block_dir)

            results[f'{label}_variant'] = variant_id
            results[f'{label}_code_size'] = rewritten_size if rewritten_size > 0 else None
            results[f'{label}_num_blocks'] = rewritten_blocks if rewritten_blocks > 0 else None
            results[f'{label}_area'] = variant['area']
            results[f'{label}_num_unique_instr'] = variant['num_instructions']

        return results

    except Exception as e:
        print(f"Error parsing {json_path}: {e}", file=sys.stderr)
        import traceback
        traceback.print_exc(file=sys.stderr)
        return None


def generate_csv(summaries: List[Dict], output_path: str):
    """Generate CSV file from summaries."""
    if not summaries:
        print("No valid results found!")
        return

    # Convert instruction counts to bytes for CSV
    BYTES_32 = 32 / 8
    for s in summaries:
        s['original_code_size_bytes'] = s['original_code_size'] * BYTES_32
        for label in ('min_area', 'min_instr'):
            instr_count = s.get(f'{label}_code_size')
            num_uniq = s.get(f'{label}_num_unique_instr')
            if instr_count is not None:
                s[f'{label}_code_size_bytes'] = instr_count * BYTES_32
                bits = compressed_bits(num_uniq) if num_uniq else 32
                s[f'{label}_compressed_bits'] = bits
                s[f'{label}_compressed_size_bytes'] = instr_count * bits / 8
            else:
                s[f'{label}_code_size_bytes'] = None
                s[f'{label}_compressed_bits'] = None
                s[f'{label}_compressed_size_bytes'] = None

    fieldnames = [
        'application',
        'original_code_size',
        'original_code_size_bytes',
        'original_num_blocks',
        'min_area_variant',
        'min_area_code_size',
        'min_area_code_size_bytes',
        'min_area_num_unique_instr',
        'min_area_compressed_bits',
        'min_area_compressed_size_bytes',
        'min_area_num_blocks',
        'min_area_area',
        'min_instr_variant',
        'min_instr_code_size',
        'min_instr_code_size_bytes',
        'min_instr_num_unique_instr',
        'min_instr_compressed_bits',
        'min_instr_compressed_size_bytes',
        'min_instr_num_blocks',
        'min_instr_area',
    ]

    with open(output_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(summaries)

    print(f"CSV written to: {output_path}")
    print(f"Total programs: {len(summaries)}")


def visualize_results(summaries: List[Dict], output_path: str = "code_size_analysis.pdf"):
    """Create bar chart visualization of code size before and after rewriting.

    Args:
        summaries: List of summary dictionaries
        output_path: Path to save the plot
    """
    if not summaries:
        print("No data to visualize!")
        return

    sns.set_palette("Set2")

    NAME_MAPPING = {
        'basicmath_small_O3': 'basicmath',
        'bitcnts_O3': 'bitcnts',
        'dijkstra_small_O3': 'dijkstra',
        'matmult-int': 'matmult-int',
        'qsort_large_O3': 'qsort-num',
        'qsort_small_O3': 'qsort-str',
        'sha_O3': 'sha',
        'patricia_O3': 'patricia',
        'picojpeg_test': 'picojpeg',
        'rijndael_Oz': 'rijndael',
        'libhuffbench': 'huffbench',
        'combined': 'combined',
        'libedn': 'edn',
        'libnsichneu': 'nsichneu',
        'libslre': 'slre',
        'libstatemate': 'statemate',
        'libud': 'ud',
        'libwikisort': 'wikisort',
        'md5': 'md5sum',
    }

    # Filter to summaries with valid rewritten code size (use min_instr variant)
    valid = [s for s in summaries if s.get('min_instr_code_size') is not None]
    if not valid:
        print("No valid rewrite data to visualize!")
        return

    applications = [NAME_MAPPING.get(s['application'], s['application']) for s in valid]
    # Convert instruction counts to bytes:
    #   Original & Rewritten: 32-bit (4 bytes) per instruction
    #   Compressed: dynamic bit-width based on unique instruction count
    BYTES_PER_INSTR_32 = 32 / 8       # 4.0
    orig_size = [s['original_code_size'] * BYTES_PER_INSTR_32 for s in valid]
    rewritten_size = [s['min_instr_code_size'] * BYTES_PER_INSTR_32 for s in valid]
    comp_bits = [compressed_bits(s['min_instr_num_unique_instr']) for s in valid]
    compressed_size = [s['min_instr_code_size'] * b / 8 for s, b in zip(valid, comp_bits)]
    num_unique = [s['min_instr_num_unique_instr'] for s in valid]

    # Sort by rewritten size (ascending)
    sorted_indices = np.argsort(rewritten_size)
    applications = [applications[i] for i in sorted_indices]
    orig_size = [orig_size[i] for i in sorted_indices]
    rewritten_size = [rewritten_size[i] for i in sorted_indices]
    compressed_size = [compressed_size[i] for i in sorted_indices]
    comp_bits = [comp_bits[i] for i in sorted_indices]
    num_unique = [num_unique[i] for i in sorted_indices]

    # Create figure — single-column, all 22 benchmarks
    n = len(applications)
    fig, ax1 = plt.subplots(figsize=(7, 3.5))

    x = np.arange(n)
    width = 0.25

    colors = sns.color_palette("Set2", 3)
    ax1.bar(x - width, orig_size, width, label='Original (32-bit)',
            color=colors[0], alpha=0.8, edgecolor='black', linewidth=0.4)
    ax1.bar(x, rewritten_size, width, label='Rewritten (32-bit)',
            color=colors[1], alpha=0.8, edgecolor='black', linewidth=0.4)
    ax1.bar(x + width, compressed_size, width, label='Rewritten + Compressed (29/30-bit)',
            color=colors[2], alpha=0.8, edgecolor='black', linewidth=0.4, hatch='//')

    # Tighten x-axis
    ax1.set_xlim(-0.6, n - 0.4)

    # Configure y-axis
    ax1.set_ylabel('Code Size (Bytes)', fontsize=11, fontweight='bold')
    ax1.set_xticks(x)
    ax1.set_xticklabels(applications, rotation=60, ha='right', fontsize=9)
    ax1.tick_params(axis='y', labelcolor='black', labelsize=9)
    ax1.grid(axis='y', alpha=0.3, linestyle='--')

    ax1.legend(loc='upper left', framealpha=0.9, fontsize=8)

    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    print(f"Visualization saved to: {output_path}")
    plt.close()

    # Print statistics
    print()
    print("=" * 80)
    print("Code Size Statistics in Bytes (for paper):")
    print("=" * 80)

    print(f"\nOriginal Programs (32-bit instructions):")
    print(f"  Min code size:     {min(orig_size):.0f} B")
    print(f"  Max code size:     {max(orig_size):.0f} B")
    print(f"  Average code size: {sum(orig_size)/len(orig_size):.0f} B")

    print(f"\nRewritten Programs (32-bit instructions, Min Instr Variant):")
    print(f"  Min code size:     {min(rewritten_size):.0f} B")
    print(f"  Max code size:     {max(rewritten_size):.0f} B")
    print(f"  Average code size: {sum(rewritten_size)/len(rewritten_size):.0f} B")

    print(f"\nRewritten + Compressed (29/30-bit, Min Instr Variant):")
    print(f"  Min code size:     {min(compressed_size):.0f} B")
    print(f"  Max code size:     {max(compressed_size):.0f} B")
    print(f"  Average code size: {sum(compressed_size)/len(compressed_size):.0f} B")

    # Average code size increase
    n = len(orig_size)
    rewr_increase = [(r - o) / o * 100 for o, r in zip(orig_size, rewritten_size)]
    comp_increase = [(c - o) / o * 100 for o, c in zip(orig_size, compressed_size)]

    print(f"\n--- Average Code Size Increase ---")
    print(f"  Rewritten (32-bit) vs Original:       {sum(rewr_increase)/n:+.1f}%")
    print(f"  Rewritten + Compressed vs Original:   {sum(comp_increase)/n:+.1f}%")

    # Applications with code size reduction (compressed < original)
    smaller_rewr = [(app, o, r) for app, o, r in zip(applications, orig_size, rewritten_size) if r < o]
    smaller_comp = [(app, o, c) for app, o, c in zip(applications, orig_size, compressed_size) if c < o]

    print(f"\n--- Applications with Smaller Code After Rewriting (32-bit) ---")
    if smaller_rewr:
        print(f"  {len(smaller_rewr)}/{n} applications have smaller rewritten code:")
        for app, o, r in smaller_rewr:
            print(f"    {app:<20} {o:.0f}B -> {r:.0f}B  ({(r-o)/o*100:+.1f}%)")
    else:
        print(f"  0/{n} applications (none have smaller code at 32-bit)")

    print(f"\n--- Applications with Smaller Code After Rewriting + Compression ---")
    if smaller_comp:
        print(f"  {len(smaller_comp)}/{n} applications have smaller compressed code:")
        for app, o, c in smaller_comp:
            print(f"    {app:<20} {o:.0f}B -> {c:.0f}B  ({(c-o)/o*100:+.1f}%)")
    else:
        print(f"  0/{n} applications (none have smaller code with compression)")

    # Per-program breakdown
    print(f"\nPer-program breakdown:")
    print(f"  {'Application':<20} {'Orig (B)':>10} {'Rewr (B)':>10} {'#Uniq':>6} {'Bits':>5} {'Compr (B)':>10}")
    print(f"  {'-'*20} {'-'*10} {'-'*10} {'-'*6} {'-'*5} {'-'*10}")
    for app, orig, rewr, nu, cb, comp in zip(applications, orig_size, rewritten_size, num_unique, comp_bits, compressed_size):
        print(f"  {app:<20} {orig:>10.0f} {rewr:>10.0f} {nu:>6} {cb:>5} {comp:>10.0f}")

    print("=" * 80)


def main():
    script_dir = Path(__file__).resolve().parent
    output_csv = sys.argv[1] if len(sys.argv) > 1 else str(script_dir / "code_size.csv")

    project_root = script_dir.parent.parent
    backend_dir = project_root / "output" / "backend"
    frontend_dir = project_root / "output" / "frontend"

    print("=" * 80)
    print("Parsing Code Size from Frontend Output")
    print("=" * 80)
    print(f"Backend directory: {backend_dir}")
    print(f"Frontend directory: {frontend_dir}")
    print(f"Output CSV: {output_csv}")
    print("=" * 80)
    print()

    # Find all analysis result JSONs (to identify programs and their variants)
    json_files = find_all_result_jsons(backend_dir)
    print(f"Found {len(json_files)} analysis result files")
    print()

    # Parse each program
    summaries = []
    for json_path in json_files:
        program_name = json_path.parent.name
        print(f"Parsing {program_name}...", end=" ")

        summary = parse_code_size(json_path, frontend_dir)
        if summary:
            summaries.append(summary)
            orig = summary['original_code_size']
            rewr = summary.get('min_instr_code_size')
            n_uniq = summary.get('min_instr_num_unique_instr')
            if rewr and n_uniq:
                bits = compressed_bits(n_uniq)
                print(f"original={orig*4}B, rewritten={rewr*4}B, "
                      f"compressed({bits}b)={rewr*bits/8:.0f}B [{n_uniq} uniq instr]")
            else:
                print(f"original={orig*4}B, rewritten=N/A")
        else:
            print("(skipped)")

    print()

    # Generate CSV
    generate_csv(summaries, output_csv)
    print()

    # Generate visualization
    plot_path = output_csv.replace('.csv', '.pdf')
    visualize_results(summaries, plot_path)

    print()
    print("Analysis complete!")


if __name__ == "__main__":
    main()
