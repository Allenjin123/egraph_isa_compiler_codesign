#!/usr/bin/env python3
"""
Analyze DEF/USE information for basic blocks
Compute GEN, KILL, DEF_all, USE_all for each block
"""

import os
import re
import json
import argparse
from pathlib import Path
from typing import Dict, List, Set, Tuple, Optional
import sys

# Add current directory to path for imports
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))

from util import (
    is_register, is_standard_instruction, 
    is_r_type_instruction, is_i_type_instruction,
    is_load_instruction, is_store_instruction, is_csr_instruction, is_branch_instruction
)


class DefUseAnalyzer:
    """Analyze DEF/USE relationships"""
    
    def __init__(self, verbose=False):
        self.verbose = verbose
    
    def parse_instruction(self, line: str) -> Tuple[str, List[str]]:
        """Parse instruction, returns (mnemonic, operands_list)
        
        Example transformations:
            "lw a0, 8(sp)  # comment" → ("lw", ["a0", "8", "sp"])
            "jal ra, 10400 <main>"    → ("jal", ["ra", "10400"])
            "add a0, a1, a2"          → ("add", ["a0", "a1", "a2"])
        """
        # Remove comments (everything after #)
        # "lw a0, 0(sp)  # comment" → "lw a0, 0(sp)"
        clean = re.sub(r'#.*$', '', line).strip()
        
        # Remove symbol references (<...>)
        # "jal ra, 10400 <main>" → "jal ra, 10400"
        clean = re.sub(r'<[^>]+>', '', clean).strip()
        
        # Split mnemonic and operands (split only once)
        # "add a0, a1, a2".split(None, 1) → ["add", "a0, a1, a2"]
        parts = clean.split(None, 1)
        if not parts:
            return "", []
        
        mnemonic = parts[0]
        operands_str = parts[1] if len(parts) > 1 else ""
        
        # Parse operands (handle memory operations with offset(base) format)
        operands = []
        if operands_str:
            # Convert offset(base) to offset,base
            # "a0, 8(sp)".replace('(', ',').replace(')', '') → "a0, 8,sp"
            operands_str = operands_str.replace('(', ',').replace(')', '')
            
            # Split by comma and strip whitespace
            # "a0, 8,sp".split(',') → ["a0", "8", "sp"]
            operands = [op.strip() for op in operands_str.split(',') if op.strip()]
        
        return mnemonic, operands
    
    def analyze_instruction(self, mnemonic: str, operands: List[str]) -> Tuple[Set[str], Set[str]]:
        """Analyze USE and DEF registers for an instruction
        Returns: (use_regs, def_regs)
        """
        use_regs = set()
        def_regs = set()
        
        if not operands:
            return use_regs, def_regs
        if not is_standard_instruction(mnemonic):
            return use_regs, def_regs
        # R-type: rd, rs1, rs2 (add, sub, and, or, xor, sll, srl, sra, slt, sltu)
        if is_r_type_instruction(mnemonic):
            if len(operands) >= 3:
                if is_register(operands[0]):
                    def_regs.add(operands[0])
                if is_register(operands[1]):
                    use_regs.add(operands[1])
                if is_register(operands[2]):
                    use_regs.add(operands[2])
        
        # I-type: rd, rs1, imm (addi, andi, ori, xori, slti, sltiu, slli, srli, srai)
        elif is_i_type_instruction(mnemonic):
            if len(operands) >= 2:
                if is_register(operands[0]):
                    def_regs.add(operands[0])
                if is_register(operands[1]):
                    use_regs.add(operands[1])
        
        # Load: rd, offset(rs1)
        elif is_load_instruction(mnemonic):
            if len(operands) >= 2:
                if is_register(operands[0]):
                    def_regs.add(operands[0])
                # offset(rs1) parsed as [rd, offset, rs1]
                if is_register(operands[-1]):
                    use_regs.add(operands[-1])
        
        # Store: rs2, offset(rs1)
        elif is_store_instruction(mnemonic):
            if len(operands) >= 2:
                if is_register(operands[0]):
                    use_regs.add(operands[0])
                # offset(rs1)
                if is_register(operands[-1]):
                    use_regs.add(operands[-1])
        
        # Branch: rs1, rs2, target
        elif is_branch_instruction(mnemonic):
            if len(operands) >= 2:
                if is_register(operands[0]):
                    use_regs.add(operands[0])
                if is_register(operands[1]):
                    use_regs.add(operands[1])
        
        # JAL: rd, target
        elif mnemonic == 'jal':
            if operands and is_register(operands[0]):
                def_regs.add(operands[0])
        
        # JALR: rd, rs1, offset
        elif mnemonic == 'jalr':
            if len(operands) >= 2:
                if is_register(operands[0]):
                    def_regs.add(operands[0])
                if is_register(operands[1]):
                    use_regs.add(operands[1])
        
        # LUI/AUIPC: rd, imm
        elif mnemonic in ['lui', 'auipc']:
            if operands and is_register(operands[0]):
                def_regs.add(operands[0])
        
        # CSR instructions: rd, csr, rs1/imm
        elif is_csr_instruction(mnemonic):
            if len(operands) >= 2:
                # rd is always defined (reads old CSR value)
                if is_register(operands[0]):
                    def_regs.add(operands[0])
                # For csrrw/csrrs/csrrc: rs1 is used
                # For csrrwi/csrrsi/csrrci: immediate is used (no register)
                if mnemonic in ['csrrw', 'csrrs', 'csrrc']:
                    if len(operands) >= 3 and is_register(operands[2]):
                        use_regs.add(operands[2])
        
        # Fence: none
        elif mnemonic in ['fence', 'fence.i', 'ecall', 'ebreak']:
            pass
        
        else:
            raise ValueError(f"Unknown instruction: {mnemonic}")
            
        return use_regs, def_regs
    
    def analyze_block(self, block_file: Path) -> Dict:
        """Analyze a basic block"""
        GEN = set()
        KILL = set()
        USE_all = set()
        DEF_all = set()
        defined_so_far = set()
        
        with open(block_file, 'r') as f:
            lines = [line.strip() for line in f if line.strip()]
        
        for line in lines:
            mnemonic, operands = self.parse_instruction(line)
            if not mnemonic:
                continue
            
            use_regs, def_regs = self.analyze_instruction(mnemonic, operands)
            
            # Accumulate USE_all and DEF_all
            USE_all.update(use_regs)
            DEF_all.update(def_regs)
            
            # GEN: registers used before being defined
            for reg in use_regs:
                if reg not in defined_so_far:
                    GEN.add(reg)
            
            # KILL: registers that are defined
            KILL.update(def_regs)
            defined_so_far.update(def_regs)
        
        return {
            'GEN': sorted(list(GEN)),
            'KILL': sorted(list(KILL)),
            'USE_all': sorted(list(USE_all)),
            'DEF_all': sorted(list(DEF_all))
        }
    
    def analyze_section(self, section_path: Path) -> Dict:
        """Analyze all basic blocks in a section"""
        bb_dir = section_path / 'basic_blocks'
        if not bb_dir.exists():
            raise FileNotFoundError(f"basic_blocks directory not found: {bb_dir}")
        
        if self.verbose:
            print(f"\nAnalyzing DEF/USE: {section_path.name}")
        
        defuse_info = {}
        
        block_files = sorted([f for f in bb_dir.iterdir() 
                            if f.suffix == '.txt' and f.stem.isdigit()],
                            key=lambda f: int(f.stem))
        
        for block_file in block_files:
            block_id = int(block_file.stem)
            defuse_info[block_id] = self.analyze_block(block_file)
        
        if self.verbose:
            print(f"  Analyzed {len(defuse_info)} blocks")
        
        return defuse_info
    
    def save_defuse(self, defuse_data: Dict, output_file: Path):
        """Save DEF/USE information to JSON file"""
        with open(output_file, 'w') as f:
            json.dump(defuse_data, f, indent=2)
        
        if self.verbose:
            print(f"✓ Saved to: {output_file}")


def process_section(section_path: Path, verbose=False):
    """Process a single section"""
    analyzer = DefUseAnalyzer(verbose=verbose)
    defuse_data = analyzer.analyze_section(section_path)
    
    # Save to section directory
    output_file = section_path / 'defuse.json'
    analyzer.save_defuse(defuse_data, output_file)
    
    return defuse_data


def process_all_sections(sections_dir: Path, verbose=False):
    """Process all sections"""
    print(f"Analyzing sections: {sections_dir}")
    
    processed = 0
    for section_name in sorted(os.listdir(sections_dir)):
        section_path = sections_dir / section_name
        if section_path.is_dir():
            try:
                process_section(section_path, verbose)
                processed += 1
            except Exception as e:
                print(f"Error {section_name}: {e}")
    
    print(f"\n✓ Processed {processed} sections")


def main():
    parser = argparse.ArgumentParser(
        description='Analyze DEF/USE information for basic blocks',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Analyze a single section
  python analyze_defuse.py outputs/dhrystone.riscv/sections/__umoddi3/
  
  # Analyze all sections
  python analyze_defuse.py outputs/dhrystone.riscv/sections/
  
  # Verbose output
  python analyze_defuse.py outputs/dhrystone.riscv/sections/__umoddi3/ -v
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

