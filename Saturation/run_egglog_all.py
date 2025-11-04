#!/usr/bin/env python3
"""
Script to run egglog on all .egg files in a directory
Generates SVG and JSON outputs for visualization
"""

import os
import sys
import subprocess
from pathlib import Path
import argparse


def run_egglog_on_file(egg_file: Path, verbose: bool = False) -> bool:
    """
    Run egglog with --to-svg --to-json on a single .egg file
    Moves outputs to separate directories: basic_blocks_svg/ and basic_blocks_json/

    Returns:
        True if successful, False otherwise
    """
    try:
        # Run egglog from the directory containing the .egg file
        # This ensures relative includes in the .egg file work correctly
        egg_dir = egg_file.parent
        egg_name = egg_file.name

        # Use custom egglog build with print-eclass-id support
        egglog_path = '/home/allenjin/egglog/target/release/egglog'
        cmd = [egglog_path, '--to-json', '--max-functions', '2000', '--max-calls-per-function', '2000', egg_name]

        if verbose:
            print(f"  Running: {' '.join(cmd)} (in {egg_dir})")

        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=300,  # 5 minute timeout per file
            cwd=str(egg_dir)  # Run from the .egg file's directory
        )

        if result.returncode != 0:
            print(f"  ✗ Error: {egg_file}")
            if result.stderr:
                print(f"    {result.stderr.strip()}")
            return False

        # Move generated files to separate directories
        # From: basic_blocks_egglog/0.svg -> To: basic_blocks_svg/0.svg
        # From: basic_blocks_egglog/0.json -> To: basic_blocks_json/0.json

        svg_file = egg_file.with_suffix('.svg')
        json_file = egg_file.with_suffix('.json')

        # Get the program directory (parent of basic_blocks_egglog/)
        program_dir = egg_file.parent.parent

        # Create output directories
        svg_dir = program_dir / "basic_blocks_svg"
        json_dir = program_dir / "basic_blocks_json"
        svg_dir.mkdir(exist_ok=True)
        json_dir.mkdir(exist_ok=True)

        # Move files
        svg_dest = None
        json_dest = None

        if svg_file.exists():
            svg_dest = svg_dir / svg_file.name
            svg_file.rename(svg_dest)

        if json_file.exists():
            json_dest = json_dir / json_file.name
            json_file.rename(json_dest)

        if verbose:
            print(f"  ✓ Success: {egg_file}")
            if svg_dest:
                print(f"    -> SVG: {svg_dest}")
            if json_dest:
                print(f"    -> JSON: {json_dest}")

        return True

    except subprocess.TimeoutExpired:
        print(f"  ✗ Timeout: {egg_file}")
        return False
    except Exception as e:
        print(f"  ✗ Exception: {egg_file} - {e}")
        return False


def process_directory(input_dir: Path, verbose: bool = False, max_files: int = None):
    """
    Process all .egg files in a directory recursively
    """
    # Find all .egg files
    egg_files = sorted(input_dir.rglob('*.egg'))

    if not egg_files:
        print(f"No .egg files found in {input_dir}")
        return

    print(f"Found {len(egg_files)} .egg files in {input_dir}")

    if max_files:
        egg_files = egg_files[:max_files]
        print(f"Processing first {max_files} files")

    print(f"{'='*60}")

    # Process each file
    success_count = 0
    fail_count = 0

    for i, egg_file in enumerate(egg_files, 1):
        # Get relative path for cleaner output
        rel_path = egg_file.relative_to(input_dir.parent)

        if not verbose:
            print(f"[{i}/{len(egg_files)}] {rel_path}...", end=' ', flush=True)
        else:
            print(f"\n[{i}/{len(egg_files)}] {rel_path}")

        success = run_egglog_on_file(egg_file, verbose)

        if success:
            success_count += 1
            if not verbose:
                print("✓")
        else:
            fail_count += 1
            if not verbose:
                print("✗")

    print(f"{'='*60}")
    print(f"Results: {success_count} succeeded, {fail_count} failed")

    if success_count > 0:
        print(f"\nOutput files organized in separate directories:")
        print(f"  - SVG files: <section>/basic_blocks_svg/")
        print(f"  - JSON files: <section>/basic_blocks_json/")


def main():
    parser = argparse.ArgumentParser(
        description='Run egglog on all .egg files in a directory',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Process all .egg files in a program
  python run_egglog_all.py ../output/frontend/dijkstra_small_O3

  # Process with verbose output
  python run_egglog_all.py ../output/frontend/dijkstra_small_O3 -v

  # Process only first 10 files
  python run_egglog_all.py ../output/frontend/dijkstra_small_O3 --max 10

Output structure:
  <program>/basic_blocks_egglog/  - Input .egg files
  <program>/basic_blocks_svg/     - Generated SVG visualizations
  <program>/basic_blocks_json/    - Generated JSON data
        '''
    )

    parser.add_argument('directory', nargs='?',
                       default='../output/frontend/dijkstra_small_O3',
                       help='Directory to search for .egg files (default: ../output/frontend/dijkstra_small_O3)')
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Verbose output')
    parser.add_argument('--max', type=int, default=None,
                       help='Maximum number of files to process')

    args = parser.parse_args()

    input_dir = Path(args.directory)

    if not input_dir.exists():
        print(f"Error: Directory does not exist: {input_dir}")
        return 1

    if not input_dir.is_dir():
        print(f"Error: Not a directory: {input_dir}")
        return 1

    # Check if custom egglog build is available
    egglog_path = '/home/allenjin/egglog/target/release/egglog'
    if not Path(egglog_path).exists():
        print(f"Error: Custom egglog build not found at {egglog_path}")
        print("Please build egglog with print-eclass-id support")
        return 1

    try:
        subprocess.run([egglog_path, '--version'], capture_output=True, check=True)
    except subprocess.CalledProcessError:
        print(f"Error: Failed to run egglog at {egglog_path}")
        return 1

    process_directory(input_dir, args.verbose, args.max)

    return 0


if __name__ == "__main__":
    sys.exit(main())
