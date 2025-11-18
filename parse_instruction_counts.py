#!/usr/bin/env python3
"""
Parse instruction counts from analysis results and generate CSV summary.
Shows number of unique instructions used in original vs minimal area variant.

Usage:
    python parse_instruction_counts.py [output_csv]

Default output: instruction_counts.csv
"""

import sys
import json
import csv
from pathlib import Path
from typing import Dict, List, Optional, Tuple
import scienceplots
# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent))
import Saturation.data_structure as ds
import matplotlib.pyplot as plt
plt.style.use(['science','no-latex'])
import seaborn as sns
import numpy as np


def calculate_muldiv_percentage(program_name: str, frontend_dir: Path) -> Tuple[float, float]:
    """Calculate percentage of mul and div group instructions in program execution.

    Args:
        program_name: Name of the program
        frontend_dir: Path to frontend output directory

    Returns:
        Tuple of (mul_group_pct, div_group_pct)
    """
    try:
        prog_dir = frontend_dir / program_name
        if not prog_dir.exists():
            return 0.0, 0.0

        prog = ds.text_program(program_name)
        prog.from_directory(str(prog_dir), suffix='', base_program_name=program_name)

        mul_group = {'mul', 'mulh', 'mulhsu', 'mulhu'}
        div_group = {'div', 'divu', 'rem', 'remu'}

        mul_weighted = 0
        div_weighted = 0
        total_weighted = 0

        for block in prog.basic_blocks:
            exec_count = getattr(block, 'execution_count', 1)
            for instr in block.inst_list:
                total_weighted += exec_count
                if instr.op_name in mul_group:
                    mul_weighted += exec_count
                elif instr.op_name in div_group:
                    div_weighted += exec_count

        mul_pct = (mul_weighted / total_weighted * 100) if total_weighted > 0 else 0.0
        div_pct = (div_weighted / total_weighted * 100) if total_weighted > 0 else 0.0

        return mul_pct, div_pct

    except Exception as e:
        print(f"  Warning: Could not calculate mul/div % for {program_name}: {e}", file=sys.stderr)
        return 0.0, 0.0


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


def parse_instruction_counts(json_path: Path, frontend_dir: Path) -> Optional[Dict]:
    """Parse instruction counts from a single analysis_results.json file."""
    try:
        with open(json_path, 'r') as f:
            data = json.load(f)

        program_name = data.get('program_name', 'unknown')
        variants = data.get('variants', [])

        if not variants:
            return None

        # Find original, min area variant, and min instruction variant
        original_data = None
        min_area_variant = None
        min_instr_variant = None

        for variant in variants:
            variant_id = variant['variant_id']
            constraint_type = variant.get('constraint_type', 'single')

            if variant_id == 'original' or constraint_type == 'original':
                original_data = variant
            else:
                # Consider all non-original, non-gp variants
                if constraint_type not in ['gp', 'original']:
                    # Track min area variant
                    if min_area_variant is None or variant['area'] < min_area_variant['area']:
                        min_area_variant = variant
                    # Track min instruction variant
                    if min_instr_variant is None or variant['num_instructions'] < min_instr_variant['num_instructions']:
                        min_instr_variant = variant

        # Extract values
        original_instr_count = original_data['num_instructions'] if original_data else None

        min_area_variant_name = min_area_variant['variant_id'] if min_area_variant else None
        min_area_instr_count = min_area_variant['num_instructions'] if min_area_variant else None
        min_area_value = min_area_variant['area'] if min_area_variant else None
        min_area_latency = min_area_variant['latency'] if min_area_variant else None

        min_instr_variant_name = min_instr_variant['variant_id'] if min_instr_variant else None
        min_instr_count = min_instr_variant['num_instructions'] if min_instr_variant else None
        min_instr_area = min_instr_variant['area'] if min_instr_variant else None
        min_instr_latency = min_instr_variant['latency'] if min_instr_variant else None

        # Calculate mul/div instruction execution percentages
        mul_pct, div_pct = calculate_muldiv_percentage(program_name, frontend_dir)

        summary = {
            'application': program_name,
            'original_num_instructions': original_instr_count,
            'min_area_variant': min_area_variant_name,
            'min_area_num_instructions': min_area_instr_count,
            'min_area_value': min_area_value,
            'min_area_latency': min_area_latency,
            'min_instr_variant': min_instr_variant_name,
            'min_instr_count': min_instr_count,
            'min_instr_area': min_instr_area,
            'min_instr_latency': min_instr_latency,
            'mul_group_pct': mul_pct,
            'div_group_pct': div_pct,
        }

        return summary

    except Exception as e:
        print(f"Error parsing {json_path}: {e}", file=sys.stderr)
        return None


def generate_csv(summaries: List[Dict], output_path: str):
    """Generate CSV file from summaries."""
    if not summaries:
        print("No valid results found!")
        return

    fieldnames = [
        'application',
        'original_num_instructions',
        'mul_group_pct',
        'div_group_pct',
        'min_area_variant',
        'min_area_num_instructions',
        'min_area_value',
        'min_area_latency',
        'min_instr_variant',
        'min_instr_count',
        'min_instr_area',
        'min_instr_latency'
    ]

    with open(output_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(summaries)

    print(f"CSV written to: {output_path}")
    print(f"Total programs: {len(summaries)}")


def visualize_results(summaries: List[Dict], output_path: str = "instruction_analysis.pdf"):
    """Create bar chart visualization of instruction counts and mul/div percentages.

    Args:
        summaries: List of summary dictionaries
        output_path: Path to save the plot
    """
    if not summaries:
        print("No data to visualize!")
        return

    # Set seaborn style and color palette
    sns.set_palette("Set2")

    # Optional: Name mapping for cleaner display names
    # Customize this dictionary to rename benchmarks in the plot
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
        # Add more mappings as needed
    }

    # Prepare data
    applications = [NAME_MAPPING.get(s['application'], s['application']) for s in summaries]
    orig_instr = [s['original_num_instructions'] for s in summaries]
    min_instr = [s['min_instr_count'] if s['min_instr_count'] else 0 for s in summaries]

    # Get mul/div percentages
    mul_pct = [s['mul_group_pct'] for s in summaries]
    div_pct = [s['div_group_pct'] for s in summaries]

    # Sort by mul_group_pct ascending (high mul/div programs on the right)
    sorted_indices = np.argsort(mul_pct)
    applications = [applications[i] for i in sorted_indices]
    orig_instr = [orig_instr[i] for i in sorted_indices]
    min_instr = [min_instr[i] for i in sorted_indices]
    mul_pct = [mul_pct[i] for i in sorted_indices]
    div_pct = [div_pct[i] for i in sorted_indices]

    # Create figure with dual y-axes
    fig, ax1 = plt.subplots(figsize=(16, 6))
    ax2 = ax1.twinx()

    # X-axis positions
    x = np.arange(len(applications))
    width = 0.23  # Thinner bars

    # Plot instruction counts on left y-axis
    colors = sns.color_palette("Set2", 4)
    bars1 = ax1.bar(x - 1.5*width, orig_instr, width, label='Inst Usage in Original Program',
                    color=colors[0], alpha=0.8, edgecolor='black', linewidth=0.5)
    bars2 = ax1.bar(x - 0.5*width, min_instr, width, label='Inst Usage in Rewritten Program',
                    color=colors[1], alpha=0.8, edgecolor='black', linewidth=0.5)

    # Plot mul/div percentages on right y-axis with hatching
    bars3 = ax2.bar(x + 0.5*width, mul_pct, width, label='Mul Group %',
                    color=colors[2], alpha=0.8, edgecolor='black', linewidth=0.5, hatch='//')
    bars4 = ax2.bar(x + 1.5*width, div_pct, width, label='Div Group %',
                    color=colors[3], alpha=0.8, edgecolor='black', linewidth=0.5, hatch='\\\\')

    # Configure left y-axis (instruction counts)
    ax1.set_ylabel('Number of Instructions', fontsize=16, fontweight='bold')
    ax1.set_xticks(x)
    ax1.set_xticklabels(applications, rotation=45, ha='right', fontsize=14)
    ax1.tick_params(axis='y', labelcolor='black', labelsize=14)
    ax1.grid(axis='y', alpha=0.3, linestyle='--')

    # Configure right y-axis (percentages) with fixed range
    ax2.set_ylabel('Mul/Div Group Percentage (%)', fontsize=16, fontweight='bold')
    ax2.set_ylim(0, 40)  # Fixed range from 0% to 40%
    ax2.tick_params(axis='y', labelcolor='black', labelsize=14)

    # Combine legends from both axes
    lines1, labels1 = ax1.get_legend_handles_labels()
    lines2, labels2 = ax2.get_legend_handles_labels()
    ax1.legend(lines1 + lines2, labels1 + labels2, loc='upper right', framealpha=0.9, fontsize=14)

    # Adjust layout
    plt.tight_layout()

    # Save figure
    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    print(f"Visualization saved to: {output_path}")
    plt.close()

    # Calculate and output instruction usage statistics for paper
    print()
    print("="*80)
    print("Instruction Usage Statistics (for paper):")
    print("="*80)

    # Calculate statistics for original programs
    orig_valid = [o for o in orig_instr if o is not None]
    if orig_valid:
        print(f"Original Programs:")
        print(f"  Min instructions:     {min(orig_valid)}")
        print(f"  Max instructions:     {max(orig_valid)}")
        print(f"  Average instructions: {sum(orig_valid)/len(orig_valid):.1f}")

    # Calculate statistics for min instruction variants
    min_instr_valid = [m for m in min_instr if m is not None and m > 0]
    if min_instr_valid:
        print(f"\nMin Instruction Variants:")
        print(f"  Min instructions:     {min(min_instr_valid)}")
        print(f"  Max instructions:     {max(min_instr_valid)}")
        print(f"  Average instructions: {sum(min_instr_valid)/len(min_instr_valid):.1f}")

    # Calculate reduction statistics
    reductions = []
    for i, o in enumerate(orig_instr):
        m = min_instr[i]
        if o and m and o > 0:
            reduction_pct = ((o - m) / o) * 100
            reductions.append(reduction_pct)

    if reductions:
        print(f"\nInstruction Count Reduction:")
        print(f"  Min reduction:        {min(reductions):.1f}%")
        print(f"  Max reduction:        {max(reductions):.1f}%")
        print(f"  Average reduction:    {sum(reductions)/len(reductions):.1f}%")

    print("="*80)


def main():
    # Parse command line arguments
    output_csv = sys.argv[1] if len(sys.argv) > 1 else "instruction_counts.csv"

    # Find project root
    script_dir = Path(__file__).parent
    backend_dir = script_dir / "output" / "backend"
    frontend_dir = script_dir / "output" / "frontend"

    print("="*80)
    print("Parsing Instruction Counts from Analysis Results")
    print("="*80)
    print(f"Backend directory: {backend_dir}")
    print(f"Frontend directory: {frontend_dir}")
    print(f"Output CSV: {output_csv}")
    print("="*80)
    print()

    # Find all JSON files
    json_files = find_all_result_jsons(backend_dir)
    print(f"Found {len(json_files)} analysis result files")
    print()

    # Parse each JSON
    summaries = []
    for json_path in json_files:
        program_name = json_path.parent.name
        print(f"Parsing {program_name}...", end=" ")

        summary = parse_instruction_counts(json_path, frontend_dir)
        if summary:
            summaries.append(summary)
            print("✓")
        else:
            print("✗ (skipped)")

    print()

    # Generate CSV
    generate_csv(summaries, output_csv)

    print()

    # Generate visualization
    plot_path = output_csv.replace('.csv', '.pdf')
    visualize_results(summaries, plot_path)

    print()
    print("✓ Analysis complete!")


if __name__ == "__main__":
    main()
