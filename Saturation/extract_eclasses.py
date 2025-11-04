#!/usr/bin/env python3
"""
Extract eclass information using egglog's print-eclass-id command.

This script:
1. Runs egglog on .egg files (which have print-eclass-id commands)
2. Captures stdout to get eclass IDs
3. Reads original SSA instructions
4. Matches and annotates with eclasses
5. Outputs to basic_blocks_eclass/ with format: instruction; eclass_id
"""

import os
import sys
import subprocess
import argparse
from pathlib import Path


def run_egglog_get_eclasses(egg_file_path, egglog_binary='/home/allenjin/egglog/target/release/egglog'):
    """
    Run egglog on .egg file and capture print-eclass-id output.

    Returns:
        List of eclass IDs in order
    """
    try:
        # Run egglog and capture stdout
        # Run from the egg file's directory and use just the filename
        result = subprocess.run(
            [egglog_binary, '--max-functions', '1000', '--max-calls-per-function', '1000', egg_file_path.name],
            capture_output=True,
            text=True,
            timeout=300,  # 5 minute timeout per file
            cwd=egg_file_path.parent  # Run from egg file directory for relative paths
        )

        if result.returncode != 0:
            print(f"Error running egglog: {result.stderr}")
            return []

        # Parse stdout - each line with format like "Inst-12" is an eclass ID
        eclasses = []
        for line in result.stdout.strip().split('\n'):
            line = line.strip()
            # Match eclass IDs like "Inst-12", "Math-0", etc.
            if line and '-' in line:
                eclasses.append(line)

        return eclasses

    except subprocess.TimeoutExpired:
        print(f"Timeout running egglog on {egg_file_path}")
        return []
    except Exception as e:
        print(f"Exception running egglog: {e}")
        return []


def read_ssa_instructions(ssa_file_path):
    """
    Read original SSA instruction file.

    Returns:
        List of instruction strings
    """
    with open(ssa_file_path, 'r') as f:
        return [line.strip() for line in f if line.strip()]


def create_annotated_file(ssa_instructions, eclasses, output_file_path):
    """
    Create annotated instruction file with eclass IDs.

    Format: instruction; eclass_id
    """
    with open(output_file_path, 'w') as f:
        for i, inst in enumerate(ssa_instructions):
            if i < len(eclasses) and eclasses[i]:
                f.write(f"{inst}; {eclasses[i]}\n")
            else:
                f.write(f"{inst}; unknown\n")


def process_block(program_dir, block_num, output_subdir='basic_blocks_eclass',
                  egglog_binary='/home/allenjin/egglog/target/release/egglog', verbose=False):
    """
    Process a single basic block to extract eclass annotations.

    Args:
        program_dir: Path to program directory
        block_num: Block number
        output_subdir: Output subdirectory name (default: 'basic_blocks_eclass')
        egglog_binary: Path to egglog binary
        verbose: Verbose output
    """
    # File paths
    egg_file = program_dir / "basic_blocks_egglog" / f"{block_num}.egg"
    ssa_file = program_dir / "basic_blocks_ssa" / f"{block_num}.txt"
    output_dir = program_dir / output_subdir
    output_file = output_dir / f"{block_num}.txt"

    # Check files exist
    if not egg_file.exists():
        if verbose:
            print(f"  Skipping block {block_num}: .egg file not found")
        return False

    if not ssa_file.exists():
        if verbose:
            print(f"  Skipping block {block_num}: SSA file not found")
        return False

    # Run egglog and get eclasses
    eclasses = run_egglog_get_eclasses(egg_file, egglog_binary)

    if not eclasses:
        if verbose:
            print(f"  Skipping block {block_num}: No eclass output from egglog")
        return False

    # Read SSA instructions
    ssa_instructions = read_ssa_instructions(ssa_file)

    # Create output directory
    output_dir.mkdir(exist_ok=True)

    # Write annotated file
    create_annotated_file(ssa_instructions, eclasses, output_file)

    if verbose:
        print(f"  ✓ Block {block_num}: {len(ssa_instructions)} instructions, {len(eclasses)} eclasses")

    return True


def process_program(program_dir, output_subdir='basic_blocks_eclass',
                   egglog_binary='/home/allenjin/egglog/target/release/egglog', verbose=False):
    """
    Process all blocks in a program.

    Args:
        program_dir: Path to program directory
        output_subdir: Output subdirectory name
        egglog_binary: Path to egglog binary
        verbose: Verbose output
    """
    program_name = program_dir.name

    # Find all .egg files in basic_blocks_egglog
    egglog_dir = program_dir / "basic_blocks_egglog"
    if not egglog_dir.exists():
        if verbose:
            print(f"Skipping {program_name}: no basic_blocks_egglog directory")
        return 0

    egg_files = sorted(egglog_dir.glob("*.egg"))
    if not egg_files:
        if verbose:
            print(f"Skipping {program_name}: no .egg files found")
        return 0

    print(f"Processing program: {program_name}")

    success_count = 0
    for egg_file in egg_files:
        block_num = egg_file.stem
        if process_block(program_dir, block_num, output_subdir, egglog_binary, verbose):
            success_count += 1

    if not verbose:
        print(f"  Processed {success_count}/{len(egg_files)} blocks")

    return success_count


def main():
    parser = argparse.ArgumentParser(
        description='Extract eclass annotations using egglog print-eclass-id command',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Process program directory
  python extract_eclasses.py ../output/frontend/dijkstra_small_O3

  # Process with verbose output
  python extract_eclasses.py ../output/frontend/dijkstra_small_O3 -v

  # Custom output directory name
  python extract_eclasses.py ../output/frontend/dijkstra_small_O3 -o my_eclass_output

  # Use custom egglog binary
  python extract_eclasses.py ../output/frontend/dijkstra_small_O3 --egglog ~/egglog/target/release/egglog

Prerequisites:
  1. .egg files must exist in basic_blocks_egglog/ (run local_saturation.py first)
  2. .egg files must have (print-eclass-id ...) commands
  3. egglog binary with print-eclass-id support

Output:
  Creates annotated files in <output_subdir>/ (default: basic_blocks_eclass/) with format:
    addi sp_1, sp_0, -96; Inst-15
        '''
    )

    parser.add_argument('directory', nargs='?', default='.',
                       help='Path to program directory (default: current directory)')
    parser.add_argument('-o', '--output', default='basic_blocks_eclass',
                       help='Output subdirectory name (default: basic_blocks_eclass)')
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Verbose output')
    parser.add_argument('--egglog', default='/home/allenjin/egglog/target/release/egglog',
                       help='Path to egglog binary (default: /home/allenjin/egglog/target/release/egglog)')

    args = parser.parse_args()

    program_dir = Path(args.directory)

    if not program_dir.exists():
        print(f"Error: Directory does not exist: {program_dir}")
        return 1

    # Check egglog binary exists
    if not Path(args.egglog).exists():
        print(f"Error: egglog binary not found: {args.egglog}")
        print("Please compile egglog or specify path with --egglog")
        return 1

    # Check if this is a program directory (has basic_blocks_egglog/)
    if not (program_dir / "basic_blocks_egglog").exists():
        print(f"Error: No basic_blocks_egglog/ directory found in {program_dir}")
        print(f"Please run local_saturation.py first to generate .egg files")
        return 1

    # Process the program
    total_blocks = process_program(program_dir, args.output, args.egglog, args.verbose)

    print(f"\nTotal: {total_blocks} blocks annotated with eclasses")
    print(f"Output: {program_dir}/{args.output}/<block>.txt")

    return 0


if __name__ == "__main__":
    sys.exit(main())
