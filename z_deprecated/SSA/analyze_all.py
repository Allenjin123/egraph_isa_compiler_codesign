#!/usr/bin/env python3
"""
Unified Analysis Pipeline
Automatically runs CFG -> DEF/USE -> Liveness analysis
"""

import os
import argparse
from pathlib import Path
import sys

# Add current directory to path for imports
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))

from build_cfg import CFGBuilder
from analyze_defuse import DefUseAnalyzer
from analyze_liveness import LivenessAnalyzer


def analyze_section(section_path: Path, verbose=False, force=False):
    """Analyze a single section (complete pipeline)"""
    section_name = section_path.name
    
    # Check if already analyzed
    cfg_file = section_path / 'cfg.json'
    defuse_file = section_path / 'defuse.json'
    liveness_file = section_path / 'liveness.json'
    
    if not force and cfg_file.exists() and defuse_file.exists() and liveness_file.exists():
        if verbose:
            print(f"⊙ {section_name}: already analyzed, skipping")
        return True
    
    if verbose:
        print(f"\n{'='*60}")
        print(f"Analyzing: {section_name}")
        print(f"{'='*60}")
    else:
        print(f"Analyzing: {section_name}...", end=' ', flush=True)
    
    try:
        # 1. Build CFG
        if force or not cfg_file.exists():
            if verbose:
                print("\n[1/3] Building CFG...")
            cfg_builder = CFGBuilder(verbose=verbose)
            cfg_data = cfg_builder.build_cfg(section_path)
            cfg_builder.save_cfg(cfg_data, cfg_file)
        elif verbose:
            print("\n[1/3] CFG already exists")
        
        # 2. Analyze DEF/USE
        if force or not defuse_file.exists():
            if verbose:
                print("\n[2/3] Analyzing DEF/USE...")
            defuse_analyzer = DefUseAnalyzer(verbose=verbose)
            defuse_data = defuse_analyzer.analyze_section(section_path)
            defuse_analyzer.save_defuse(defuse_data, defuse_file)
        elif verbose:
            print("\n[2/3] DEF/USE already exists")
        
        # 3. Analyze Liveness
        if force or not liveness_file.exists():
            if verbose:
                print("\n[3/3] Analyzing Liveness...")
            liveness_analyzer = LivenessAnalyzer(verbose=verbose)
            liveness_data = liveness_analyzer.analyze_section(section_path)
            liveness_analyzer.save_liveness(liveness_data, liveness_file)
        elif verbose:
            print("\n[3/3] Liveness already exists")
        
        if not verbose:
            print("✓")
        
        return True
        
    except Exception as e:
        if not verbose:
            print("✗")
        print(f"Error: {e}")
        if verbose:
            import traceback
            traceback.print_exc()
        return False


def analyze_all_sections(sections_dir: Path, verbose=False, force=False):
    """Analyze all sections"""
    print(f"\n{'='*60}")
    print(f"Batch Analysis: {sections_dir}")
    print(f"{'='*60}\n")
    
    # Collect all section directories
    sections = []
    for item in sorted(os.listdir(sections_dir)):
        section_path = sections_dir / item
        if section_path.is_dir() and (section_path / 'section.txt').exists():
            sections.append(section_path)
    
    if not sections:
        print("No section directories found")
        return
    
    print(f"Found {len(sections)} sections\n")
    
    # Analyze each section
    success = 0
    failed = 0
    skipped = 0
    
    for i, section_path in enumerate(sections, 1):
        if verbose:
            print(f"\n[{i}/{len(sections)}]")
        
        result = analyze_section(section_path, verbose, force)
        
        if result:
            success += 1
        else:
            failed += 1
    
    # Summary
    print(f"\n{'='*60}")
    print("Analysis Complete")
    print(f"{'='*60}")
    print(f"✓ Success: {success}")
    if failed > 0:
        print(f"✗ Failed: {failed}")
    print()


def main():
    parser = argparse.ArgumentParser(
        description='Unified Analysis Pipeline: CFG -> DEF/USE -> Liveness',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Analyze a single section
  python analyze_all.py outputs/dhrystone.riscv/sections/__umoddi3/
  
  # Analyze all sections
  python analyze_all.py outputs/dhrystone.riscv/sections/
  
  # Force re-analysis (even if results already exist)
  python analyze_all.py outputs/dhrystone.riscv/sections/ --force
  
  # Verbose output
  python analyze_all.py outputs/dhrystone.riscv/sections/__umoddi3/ -v
        '''
    )
    
    parser.add_argument('path', help='Section directory or sections root directory')
    parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')
    parser.add_argument('-f', '--force', action='store_true', help='Force re-analysis')
    
    args = parser.parse_args()
    
    path = Path(args.path)
    if not path.exists():
        print(f"Error: Path does not exist: {path}")
        return 1
    
    # Determine if it's a single section or sections root directory
    if (path / 'section.txt').exists():
        # Single section
        analyze_section(path, args.verbose, args.force)
    else:
        # Sections root directory
        analyze_all_sections(path, args.verbose, args.force)
    
    return 0


if __name__ == "__main__":
    sys.exit(main())

