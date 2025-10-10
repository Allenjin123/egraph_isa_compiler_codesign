#!/usr/bin/env python3
"""
General-purpose SSA processing pipeline for RISC-V assembly dumps.
Processes dump files through: Parse Sections -> Split Basic Blocks -> Strip Prefixes
"""

import os
import sys
import argparse
from pathlib import Path

# Add current directory to path for imports
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))

# Import the existing modules
from parse_sections import parse_dump_file, create_folders_and_files
from split_basic_blocks import BasicBlockSplitter
from strip_prefixes import process_block_file, iter_block_files


def process_single_dump(dump_file, output_base_dir=None, verbose=False):
    """
    Process a single dump file through the complete SSA pipeline.

    Args:
        dump_file: Path to the .dump file
        output_base_dir: Base directory for output (default: SSA/outputs/<filename>)
        verbose: Print detailed progress

    Returns:
        Dictionary with processing statistics
    """
    dump_path = Path(dump_file)
    if not dump_path.exists():
        print(f"Error: Dump file not found: {dump_file}")
        return None

    # Setup output directory
    if output_base_dir is None:
        output_base_dir = CURRENT_DIR / "outputs" / dump_path.stem
    else:
        output_base_dir = Path(output_base_dir)

    sections_dir = output_base_dir / "sections"
    sections_dir.mkdir(parents=True, exist_ok=True)

    stats = {
        'input_file': str(dump_path),
        'output_dir': str(output_base_dir),
        'sections': 0,
        'basic_blocks': 0,
        'processed_files': 0
    }

    print(f"\n{'='*60}")
    print(f"Processing: {dump_path.name}")
    print(f"Output directory: {output_base_dir}")
    print(f"{'='*60}")

    # Step 1: Parse sections
    if verbose:
        print("\n[1/3] Parsing sections...")
    sections = parse_dump_file(str(dump_path))
    create_folders_and_files(sections, str(sections_dir))
    stats['sections'] = len(sections)
    print(f"✓ Created {len(sections)} section folders")

    # Step 2: Split into basic blocks
    if verbose:
        print("\n[2/3] Splitting into basic blocks...")
    splitter = BasicBlockSplitter()
    total_blocks = 0
    for section_name in os.listdir(sections_dir):
        section_path = sections_dir / section_name
        if section_path.is_dir():
            bb_count = splitter.process_section_file(str(section_path))
            if bb_count:
                total_blocks += bb_count
                if verbose:
                    print(f"  - {section_name}: {bb_count} blocks")
    stats['basic_blocks'] = total_blocks
    print(f"✓ Created {total_blocks} basic blocks total")

    # Step 3: Strip prefixes
    if verbose:
        print("\n[3/3] Stripping prefixes...")
    count_files = 0
    for file_path in iter_block_files(sections_dir):
        process_block_file(file_path)
        count_files += 1
    stats['processed_files'] = count_files
    print(f"✓ Cleaned {count_files} basic block files")

    # Generate summary
    print(f"\n{'='*60}")
    print("Processing Complete!")
    print(f"  Sections: {stats['sections']}")
    print(f"  Basic Blocks: {stats['basic_blocks']}")
    print(f"  Output: {output_base_dir}")
    print(f"{'='*60}\n")

    return stats


def list_basic_blocks(output_dir, max_display=10):
    """
    List all basic blocks in the processed output directory.

    Args:
        output_dir: Directory containing processed sections
        max_display: Maximum number of blocks to display content for
    """
    sections_dir = Path(output_dir) / "sections"
    if not sections_dir.exists():
        print(f"Error: Sections directory not found: {sections_dir}")
        return

    print(f"\n{'='*60}")
    print("BASIC BLOCKS SUMMARY")
    print(f"{'='*60}\n")

    total_blocks = 0
    block_list = []

    # Collect all basic blocks
    for section_name in sorted(os.listdir(sections_dir)):
        section_path = sections_dir / section_name
        if not section_path.is_dir():
            continue

        blocks = []
        for file in sorted(section_path.iterdir()):
            if file.suffix == '.txt' and file.stem.isdigit():
                blocks.append(int(file.stem))

        if blocks:
            blocks.sort()
            print(f"Section: {section_name}")
            print(f"  Basic blocks: {len(blocks)} ({', '.join(map(str, blocks))})")

            for block_num in blocks:
                block_path = section_path / f"{block_num}.txt"
                block_list.append((section_name, block_num, block_path))
                total_blocks += 1
            print()

    print(f"Total basic blocks: {total_blocks}")

    # Display sample block contents
    if block_list and max_display > 0:
        print(f"\n{'='*60}")
        print(f"SAMPLE BASIC BLOCKS (first {min(max_display, len(block_list))})")
        print(f"{'='*60}\n")

        for i, (section, block_num, path) in enumerate(block_list[:max_display]):
            print(f"[{section}/block_{block_num}]")
            with open(path, 'r') as f:
                content = f.read().strip()
                if content:
                    for line in content.split('\n')[:5]:  # Show first 5 lines
                        print(f"  {line}")
                    lines = content.split('\n')
                    if len(lines) > 5:
                        print(f"  ... ({len(lines) - 5} more lines)")
                else:
                    print("  (empty block)")
            print()


def process_all_dumps(input_dir, output_base=None, pattern="*.dump", verbose=False):
    """
    Process all dump files in a directory.

    Args:
        input_dir: Directory containing dump files
        output_base: Base output directory
        pattern: Glob pattern for dump files
        verbose: Print detailed progress
    """
    input_path = Path(input_dir)
    dump_files = list(input_path.glob(pattern))

    if not dump_files:
        print(f"No dump files found matching '{pattern}' in {input_dir}")
        return

    print(f"Found {len(dump_files)} dump file(s) to process")

    results = []
    for dump_file in dump_files:
        stats = process_single_dump(dump_file, output_base, verbose)
        if stats:
            results.append(stats)

    # Summary
    if results:
        print(f"\n{'='*60}")
        print("BATCH PROCESSING COMPLETE")
        print(f"{'='*60}")
        print(f"Processed {len(results)} files")
        total_sections = sum(r['sections'] for r in results)
        total_blocks = sum(r['basic_blocks'] for r in results)
        print(f"Total sections: {total_sections}")
        print(f"Total basic blocks: {total_blocks}")


def main():
    parser = argparse.ArgumentParser(
        description='Process RISC-V assembly dumps through SSA pipeline',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Process single file
  python process_dump.py sample_inputs/dhrystone.riscv.dump

  # Process with custom output directory
  python process_dump.py input.dump --output my_output

  # Process all dumps in a directory
  python process_dump.py --batch sample_inputs/

  # List basic blocks from processed output
  python process_dump.py --list SSA/outputs/dhrystone.riscv
        '''
    )

    parser.add_argument('input', nargs='?', help='Input dump file or directory (for batch mode)')
    parser.add_argument('-o', '--output', help='Output directory')
    parser.add_argument('-b', '--batch', action='store_true',
                       help='Process all dump files in input directory')
    parser.add_argument('-l', '--list', metavar='DIR',
                       help='List basic blocks from processed output directory')
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Print detailed progress')
    parser.add_argument('--max-display', type=int, default=10,
                       help='Maximum number of blocks to display (default: 10)')

    args = parser.parse_args()

    # List mode
    if args.list:
        list_basic_blocks(args.list, args.max_display)
        return 0

    # Batch mode
    if args.batch:
        if not args.input:
            print("Error: Input directory required for batch mode")
            return 1
        process_all_dumps(args.input, args.output, verbose=args.verbose)
        return 0

    # Single file mode
    if not args.input:
        parser.print_help()
        return 1

    stats = process_single_dump(args.input, args.output, args.verbose)
    if stats and not args.output:
        # List the basic blocks for convenience
        list_basic_blocks(stats['output_dir'], args.max_display)

    return 0 if stats else 1


if __name__ == "__main__":
    sys.exit(main())