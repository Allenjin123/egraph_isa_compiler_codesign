#!/usr/bin/env python3
"""
Analyze and display statistics about generated basic blocks from SSA processing.
"""

import os
import sys
from pathlib import Path
import argparse


def count_instructions(block_file):
    """Count non-empty instruction lines in a basic block."""
    with open(block_file, 'r') as f:
        lines = f.readlines()
    return sum(1 for line in lines if line.strip())


def analyze_basic_blocks(output_dir):
    """
    Analyze basic blocks and generate detailed statistics.

    Args:
        output_dir: Directory containing processed sections

    Returns:
        Dictionary with analysis results
    """
    sections_dir = Path(output_dir) / "sections"
    if not sections_dir.exists():
        print(f"Error: Sections directory not found: {sections_dir}")
        return None

    stats = {
        'total_blocks': 0,
        'total_instructions': 0,
        'sections': {},
        'largest_blocks': [],
        'smallest_blocks': [],
    }

    all_blocks = []

    # Analyze each section
    for section_name in sorted(os.listdir(sections_dir)):
        section_path = sections_dir / section_name
        if not section_path.is_dir():
            continue

        section_stats = {
            'blocks': 0,
            'instructions': 0,
            'block_sizes': []
        }

        # Check for basic_blocks subdirectory (new structure)
        bb_dir = section_path / 'basic_blocks'
        if bb_dir.exists() and bb_dir.is_dir():
            search_dir = bb_dir
        else:
            # Fallback to old structure (blocks directly in section dir)
            search_dir = section_path

        # Analyze each basic block
        for file in sorted(search_dir.iterdir()):
            if file.suffix == '.txt' and file.stem.isdigit():
                block_num = int(file.stem)
                instr_count = count_instructions(file)

                section_stats['blocks'] += 1
                section_stats['instructions'] += instr_count
                section_stats['block_sizes'].append(instr_count)

                all_blocks.append({
                    'section': section_name,
                    'block': block_num,
                    'instructions': instr_count,
                    'path': file
                })

        if section_stats['blocks'] > 0:
            section_stats['avg_block_size'] = section_stats['instructions'] / section_stats['blocks']
            stats['sections'][section_name] = section_stats
            stats['total_blocks'] += section_stats['blocks']
            stats['total_instructions'] += section_stats['instructions']

    # Find largest and smallest blocks
    all_blocks.sort(key=lambda x: x['instructions'], reverse=True)
    stats['largest_blocks'] = all_blocks[:10]
    stats['smallest_blocks'] = [b for b in all_blocks if b['instructions'] > 0][-10:]

    return stats


def print_analysis(stats):
    """Print detailed analysis of basic blocks."""
    if not stats:
        return

    print(f"\n{'='*70}")
    print("BASIC BLOCKS ANALYSIS REPORT")
    print(f"{'='*70}\n")

    # Overall statistics
    print("OVERALL STATISTICS:")
    print(f"  Total sections: {len(stats['sections'])}")
    print(f"  Total basic blocks: {stats['total_blocks']}")
    print(f"  Total instructions: {stats['total_instructions']}")
    if stats['total_blocks'] > 0:
        avg_block_size = stats['total_instructions'] / stats['total_blocks']
        print(f"  Average block size: {avg_block_size:.2f} instructions")

    # Section breakdown
    print(f"\n{'='*70}")
    print("SECTION BREAKDOWN (Top 10 by instruction count):")
    print(f"{'='*70}")
    print(f"{'Section':<30} {'Blocks':>10} {'Instructions':>15} {'Avg Size':>12}")
    print("-" * 70)

    # Sort sections by instruction count
    sorted_sections = sorted(
        stats['sections'].items(),
        key=lambda x: x[1]['instructions'],
        reverse=True
    )

    for section_name, section_stats in sorted_sections[:10]:
        avg_size = section_stats['avg_block_size']
        print(f"{section_name:<30} {section_stats['blocks']:>10} "
              f"{section_stats['instructions']:>15} {avg_size:>12.2f}")

    # Largest blocks
    print(f"\n{'='*70}")
    print("LARGEST BASIC BLOCKS:")
    print(f"{'='*70}")
    print(f"{'Section/Block':<40} {'Instructions':>15}")
    print("-" * 70)

    for block in stats['largest_blocks'][:10]:
        block_id = f"{block['section']}/block_{block['block']}"
        print(f"{block_id:<40} {block['instructions']:>15}")

    # Smallest non-empty blocks
    print(f"\n{'='*70}")
    print("SMALLEST NON-EMPTY BASIC BLOCKS:")
    print(f"{'='*70}")
    print(f"{'Section/Block':<40} {'Instructions':>15}")
    print("-" * 70)

    for block in stats['smallest_blocks'][:10]:
        block_id = f"{block['section']}/block_{block['block']}"
        print(f"{block_id:<40} {block['instructions']:>15}")

    # Distribution analysis
    print(f"\n{'='*70}")
    print("BLOCK SIZE DISTRIBUTION:")
    print(f"{'='*70}")

    all_sizes = []
    for section_stats in stats['sections'].values():
        all_sizes.extend(section_stats['block_sizes'])

    if all_sizes:
        size_ranges = {
            '1 instruction': 0,
            '2-5 instructions': 0,
            '6-10 instructions': 0,
            '11-20 instructions': 0,
            '21-50 instructions': 0,
            '51+ instructions': 0
        }

        for size in all_sizes:
            if size == 1:
                size_ranges['1 instruction'] += 1
            elif size <= 5:
                size_ranges['2-5 instructions'] += 1
            elif size <= 10:
                size_ranges['6-10 instructions'] += 1
            elif size <= 20:
                size_ranges['11-20 instructions'] += 1
            elif size <= 50:
                size_ranges['21-50 instructions'] += 1
            else:
                size_ranges['51+ instructions'] += 1

        for range_name, count in size_ranges.items():
            percentage = (count / len(all_sizes)) * 100
            print(f"  {range_name:<20} {count:>6} blocks ({percentage:>5.1f}%)")

    print(f"\n{'='*70}\n")


def export_block_list(stats, output_file):
    """Export complete list of basic blocks to a file."""
    with open(output_file, 'w') as f:
        f.write("# Basic Blocks List\n")
        f.write(f"# Total: {stats['total_blocks']} blocks, {stats['total_instructions']} instructions\n\n")

        for section_name in sorted(stats['sections'].keys()):
            section = stats['sections'][section_name]
            f.write(f"\n## {section_name}\n")
            f.write(f"# Blocks: {section['blocks']}, Instructions: {section['instructions']}\n")

            for i, size in enumerate(section['block_sizes']):
                f.write(f"  block_{i}: {size} instructions\n")


def main():
    parser = argparse.ArgumentParser(
        description='Analyze basic blocks generated by SSA processing'
    )
    parser.add_argument('output_dir', help='SSA output directory to analyze')
    parser.add_argument('--export', help='Export block list to file')
    parser.add_argument('--sections', help='Only analyze specific sections (comma-separated)')

    args = parser.parse_args()

    stats = analyze_basic_blocks(args.output_dir)
    if stats:
        print_analysis(stats)

        if args.export:
            export_block_list(stats, args.export)
            print(f"Block list exported to: {args.export}")

    return 0 if stats else 1


if __name__ == "__main__":
    sys.exit(main())