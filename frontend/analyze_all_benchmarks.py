#!/usr/bin/env python3
"""
Batch analyze all .s files in benchmark directory
Output to saturation_output/<program_name>/
"""

import os
import sys
from pathlib import Path
from typing import List

# Add current directory to path for imports
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))

from analyze_asm_blocks import analyze_single_file


def find_all_asm_files(benchmark_dir: Path) -> List[Path]:
    """Find all .s files in benchmark directory recursively"""
    asm_files = []
    
    for root, dirs, files in os.walk(benchmark_dir):
        for file in files:
            if file.endswith('.s'):
                asm_files.append(Path(root) / file)
    
    return sorted(asm_files)


def analyze_all_benchmarks(benchmark_dir: Path, output_dir: Path, verbose=False):
    """Analyze all .s files in benchmark directory
    
    Args:
        benchmark_dir: Directory containing benchmark .s files
        output_dir: Output directory (saturation_output/)
        verbose: Verbose output
    """
    # Find all .s files
    asm_files = find_all_asm_files(benchmark_dir)
    
    if not asm_files:
        print(f"No .s files found in {benchmark_dir}")
        return
    
    print(f"Found {len(asm_files)} .s files in {benchmark_dir}")
    print("=" * 70)
    
    # Analyze each file
    total_blocks = 0
    success_count = 0
    failed_files = []
    
    for i, asm_file in enumerate(asm_files, 1):
        print(f"\n[{i}/{len(asm_files)}] Processing: {asm_file.relative_to(benchmark_dir)}")
        
        try:
            block_count = analyze_single_file(asm_file, output_dir, verbose)
            if block_count:
                total_blocks += block_count
                success_count += 1
            else:
                failed_files.append(asm_file)
        except Exception as e:
            print(f"  ✗ Error: {e}")
            failed_files.append(asm_file)
            if verbose:
                import traceback
                traceback.print_exc()
    
    # Summary
    print("\n" + "=" * 70)
    print("SUMMARY")
    print("=" * 70)
    print(f"Total files: {len(asm_files)}")
    print(f"Successfully processed: {success_count}")
    print(f"Failed: {len(failed_files)}")
    print(f"Total basic blocks created: {total_blocks}")
    
    if failed_files:
        print("\nFailed files:")
        for f in failed_files:
            print(f"  - {f.relative_to(benchmark_dir)}")
    
    print(f"\n✓ Results saved to: {output_dir}")


def main():
    import argparse
    
    parser = argparse.ArgumentParser(
        description='Batch analyze all .s files in benchmark directory',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Analyze all .s files in benchmark directory
  python analyze_all_benchmarks.py
  
  # Specify custom benchmark directory
  python analyze_all_benchmarks.py -b /path/to/benchmark
  
  # Specify custom output directory
  python analyze_all_benchmarks.py -o /path/to/output
  
  # Verbose output
  python analyze_all_benchmarks.py -v
        '''
    )
    
    parser.add_argument('-b', '--benchmark-dir', 
                       help='Benchmark directory (default: ../benchmark)',
                       default=None)
    parser.add_argument('-o', '--output-dir',
                       help='Output directory (default: ../saturation_output)',
                       default=None)
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Verbose output')
    
    args = parser.parse_args()
    
    # Default paths relative to script location
    script_dir = Path(__file__).resolve().parent
    
    if args.benchmark_dir:
        benchmark_dir = Path(args.benchmark_dir)
    else:
        benchmark_dir = script_dir.parent / 'benchmark'
    
    # If user specified an output dir, place results under <that>/basic_blocks.
    # Otherwise default to frontend/output/basic_blocks (script_dir/output/basic_blocks)
    if args.output_dir:
        output_dir = Path(args.output_dir) 
    else:
        output_dir = script_dir / 'output'
    
    if not benchmark_dir.exists():
        print(f"Error: Benchmark directory not found: {benchmark_dir}")
        return 1
    
    print(f"Benchmark directory: {benchmark_dir}")
    print(f"Output directory: {output_dir}")
    
    try:
        analyze_all_benchmarks(benchmark_dir, output_dir, args.verbose)
        return 0
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        return 1


if __name__ == "__main__":
    sys.exit(main())
