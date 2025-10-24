#!/usr/bin/env python3
"""
Liveness Analysis
Based on CFG and DEF/USE information, compute LIVE_IN and LIVE_OUT for each basic block
"""

import os
import json
import argparse
from pathlib import Path
from typing import Dict, Set
import sys

# Add current directory to path for imports
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))


class LivenessAnalyzer:
    """Liveness Analyzer"""
    
    def __init__(self, verbose=False):
        self.verbose = verbose
        
        # RISC-V ABI conventions
        self.caller_saved = {
            'ra', 'a0', 'a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7',
            't0', 't1', 't2', 't3', 't4', 't5', 't6'
        }
        self.callee_saved = {
            'sp', 's0', 's1', 's2', 's3', 's4', 's5', 's6',
            's7', 's8', 's9', 's10', 's11', 'fp'
        }
    
    def load_cfg(self, cfg_file: Path) -> Dict:
        """Load CFG"""
        with open(cfg_file, 'r') as f:
            return json.load(f)
    
    def load_defuse(self, defuse_file: Path) -> Dict:
        """Load DEF/USE information"""
        with open(defuse_file, 'r') as f:
            data = json.load(f)
        
        # Convert keys to integers, values to sets
        result = {}
        for block_id_str, info in data.items():
            block_id = int(block_id_str)
            result[block_id] = {
                'GEN': set(info['GEN']),
                'KILL': set(info['KILL']),
                'USE_all': set(info['USE_all']),
                'DEF_all': set(info['DEF_all'])
            }
        return result
    
    def initialize_liveness(self, cfg: Dict, defuse: Dict) -> Dict:
        """Initialize LIVE_IN and LIVE_OUT"""
        liveness = {}
        
        for block_id_str in cfg.keys():
            block_id = int(block_id_str)
            liveness[block_id] = {
                'LIVE_IN': set(),
                'LIVE_OUT': set()
            }
        
        # Special handling: exit blocks
        for block_id_str, info in cfg.items():
            block_id = int(block_id_str)
            if not info['successors']:  # Exit block
                # Return value registers and callee-saved registers must be live
                liveness[block_id]['LIVE_OUT'] = {'a0', 'a1', 'sp', 'ra'}
                if self.verbose:
                    print(f"  Exit block {block_id}: LIVE_OUT = {liveness[block_id]['LIVE_OUT']}")
        
        return liveness
    
    def compute_liveness(self, cfg: Dict, defuse: Dict) -> Dict:
        """Compute liveness (dataflow iteration)"""
        if self.verbose:
            print("\nStarting liveness analysis...")
        
        # Initialize
        liveness = self.initialize_liveness(cfg, defuse)
        
        # Track exit blocks (LIVE_OUT is fixed)
        exit_blocks = set()
        for block_id_str, info in cfg.items():
            if not info['successors']:
                exit_blocks.add(int(block_id_str))
        
        # Iterate until convergence
        changed = True
        iteration = 0
        
        while changed:
            changed = False
            iteration += 1
            
            if self.verbose and iteration % 5 == 0:
                print(f"  Iteration {iteration}...")
            
            # Traverse in reverse order (faster convergence)
            for block_id in reversed(sorted([int(bid) for bid in cfg.keys()])):
                block_id_str = str(block_id)
                
                # Compute LIVE_OUT: ⋃(s ∈ successors) LIVE_IN(s)
                # Exit block's LIVE_OUT stays at initial value
                if block_id not in exit_blocks:
                    new_live_out = set()
                    for succ_id in cfg[block_id_str]['successors']:
                        new_live_out |= liveness[succ_id]['LIVE_IN']
                else:
                    # Exit block: LIVE_OUT is fixed
                    new_live_out = liveness[block_id]['LIVE_OUT']
                
                # Compute LIVE_IN: GEN ⋃ (LIVE_OUT - KILL)
                GEN = defuse[block_id]['GEN']
                KILL = defuse[block_id]['KILL']
                new_live_in = GEN | (new_live_out - KILL)
                
                # Check if changed
                if new_live_in != liveness[block_id]['LIVE_IN'] or \
                   new_live_out != liveness[block_id]['LIVE_OUT']:
                    changed = True
                    liveness[block_id]['LIVE_IN'] = new_live_in
                    liveness[block_id]['LIVE_OUT'] = new_live_out
        
        if self.verbose:
            print(f"✓ Converged at iteration {iteration}")
        
        return liveness
    
    def compute_free_registers(self, liveness: Dict) -> Dict:
        """Compute free registers at each block exit"""
        all_registers = {
            'zero', 'ra', 'sp', 'gp', 'tp',
            'a0', 'a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7',
            't0', 't1', 't2', 't3', 't4', 't5', 't6',
            's0', 's1', 's2', 's3', 's4', 's5', 's6', 's7', 's8', 's9', 's10', 's11',
            'fp'
        }
        
        free_regs = {}
        for block_id, info in liveness.items():
            # Free registers = all registers - live registers
            free_regs[block_id] = all_registers - info['LIVE_OUT']
            # Remove zero (always 0) and gp/tp (global pointers)
            free_regs[block_id] -= {'zero', 'gp', 'tp'}
        
        return free_regs
    
    def analyze_section(self, section_path: Path) -> Dict:
        """Analyze liveness for a section"""
        if self.verbose:
            print(f"\n{'='*60}")
            print(f"Liveness Analysis: {section_path.name}")
            print(f"{'='*60}")
        
        cfg_file = section_path / 'cfg.json'
        defuse_file = section_path / 'defuse.json'
        
        if not cfg_file.exists():
            raise FileNotFoundError(f"CFG file not found: {cfg_file}\nPlease run build_cfg.py first")
        
        if not defuse_file.exists():
            raise FileNotFoundError(f"DEF/USE file not found: {defuse_file}\nPlease run analyze_defuse.py first")
        
        # Load data
        cfg_data = self.load_cfg(cfg_file)
        cfg = cfg_data['cfg']
        defuse = self.load_defuse(defuse_file)
        
        # Compute liveness
        liveness = self.compute_liveness(cfg, defuse)
        
        # Compute free registers
        free_regs = self.compute_free_registers(liveness)
        
        # Merge all information
        result = {}
        for block_id in sorted(liveness.keys()):
            result[block_id] = {
                'LIVE_IN': sorted(list(liveness[block_id]['LIVE_IN'])),
                'LIVE_OUT': sorted(list(liveness[block_id]['LIVE_OUT'])),
                'FREE_at_exit': sorted(list(free_regs[block_id])),
                'GEN': sorted(list(defuse[block_id]['GEN'])),
                'KILL': sorted(list(defuse[block_id]['KILL']))
            }
        
        if self.verbose:
            print(f"\nStatistics:")
            avg_live_in = sum(len(r['LIVE_IN']) for r in result.values()) / len(result)
            avg_live_out = sum(len(r['LIVE_OUT']) for r in result.values()) / len(result)
            avg_free = sum(len(r['FREE_at_exit']) for r in result.values()) / len(result)
            print(f"  Average LIVE_IN registers: {avg_live_in:.1f}")
            print(f"  Average LIVE_OUT registers: {avg_live_out:.1f}")
            print(f"  Average free registers: {avg_free:.1f}")
        
        return result
    
    def save_liveness(self, liveness_data: Dict, output_file: Path):
        """Save liveness information to JSON file"""
        with open(output_file, 'w') as f:
            json.dump(liveness_data, f, indent=2)
        
        if self.verbose:
            print(f"\n✓ Saved to: {output_file}")


def process_section(section_path: Path, verbose=False):
    """Process a single section"""
    analyzer = LivenessAnalyzer(verbose=verbose)
    liveness_data = analyzer.analyze_section(section_path)
    
    # Save to section directory
    output_file = section_path / 'liveness.json'
    analyzer.save_liveness(liveness_data, output_file)
    
    return liveness_data


def process_all_sections(sections_dir: Path, verbose=False):
    """Process all sections"""
    print(f"Analyzing liveness: {sections_dir}\n")
    
    processed = 0
    failed = 0
    
    for section_name in sorted(os.listdir(sections_dir)):
        section_path = sections_dir / section_name
        if section_path.is_dir():
            try:
                process_section(section_path, verbose)
                processed += 1
            except Exception as e:
                print(f"Error {section_name}: {e}")
                failed += 1
    
    print(f"\n{'='*60}")
    print(f"✓ Success: {processed} sections")
    if failed > 0:
        print(f"✗ Failed: {failed} sections")
    print(f"{'='*60}")


def main():
    parser = argparse.ArgumentParser(
        description='Liveness Analysis',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Analyze a single section
  python analyze_liveness.py outputs/dhrystone.riscv/sections/__umoddi3/
  
  # Analyze all sections
  python analyze_liveness.py outputs/dhrystone.riscv/sections/
  
  # Verbose output
  python analyze_liveness.py outputs/dhrystone.riscv/sections/__umoddi3/ -v
        '''
    )
    
    parser.add_argument('path', help='Section directory or sections root directory')
    parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')
    
    args = parser.parse_args()
    
    path = Path(args.path)
    if not path.exists():
        print(f"Error: Path does not exist: {path}")
        return 1
    
    # Determine if it's a single section or sections root directory
    if (path / 'section.txt').exists():
        # Single section
        process_section(path, args.verbose)
    else:
        # Sections root directory
        process_all_sections(path, args.verbose)
    
    return 0


if __name__ == "__main__":
    sys.exit(main())

