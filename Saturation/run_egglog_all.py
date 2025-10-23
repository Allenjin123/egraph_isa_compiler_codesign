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

    Returns:
        True if successful, False otherwise
    """
    try:
        cmd = ['egglog', '--to-svg', '--to-json', str(egg_file)]

        if verbose:
            print(f"  Running: {' '.join(cmd)}")

        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=60  # 60 second timeout per file
        )

        if result.returncode != 0:
            print(f"  ✗ Error: {egg_file}")
            if result.stderr:
                print(f"    {result.stderr.strip()}")
            return False

        if verbose:
            print(f"  ✓ Success: {egg_file}")

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

            # Check that outputs were created
            svg_file = egg_file.with_suffix('.svg')
            json_file = egg_file.with_suffix('.json')

            if verbose:
                if svg_file.exists():
                    print(f"    Generated: {svg_file.name}")
                if json_file.exists():
                    print(f"    Generated: {json_file.name}")
        else:
            fail_count += 1
            if not verbose:
                print("✗")

    print(f"{'='*60}")
    print(f"Results: {success_count} succeeded, {fail_count} failed")

    if success_count > 0:
        print(f"\nOutput files (.svg and .json) created alongside .egg files")


def main():
    parser = argparse.ArgumentParser(
        description='Run egglog on all .egg files in a directory',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Process all files in egglog_output
  python run_egglog_all.py egglog_output

  # Process with verbose output
  python run_egglog_all.py egglog_output -v

  # Process only first 10 files
  python run_egglog_all.py egglog_output --max 10

  # Process from Saturation directory (recommended)
  cd Saturation
  python run_egglog_all.py egglog_output
        '''
    )

    parser.add_argument('directory', nargs='?', default='egglog_output',
                       help='Directory to search for .egg files (default: egglog_output)')
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

    # Check if egglog is available
    try:
        subprocess.run(['egglog', '--version'], capture_output=True, check=True)
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("Error: egglog command not found")
        print("Please ensure egglog is installed and in your PATH")
        return 1

    process_directory(input_dir, args.verbose, args.max)

    return 0


if __name__ == "__main__":
    sys.exit(main())
