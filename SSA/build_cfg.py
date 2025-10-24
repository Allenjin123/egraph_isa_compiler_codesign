#!/usr/bin/env python3
"""
Build Control Flow Graph (CFG)
Extract address information and control flow relationships from section.txt and basic_blocks/*.txt
"""

import os
import re
import json
import argparse
from pathlib import Path
from typing import Dict, List, Set, Optional, Tuple
import sys

# Add current directory to path for imports
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))

from util import BRANCH_INSTRUCTIONS, is_branch_mnemonic


class CFGBuilder:
    """Build Control Flow Graph"""
    
    def __init__(self, verbose=False):
        self.verbose = verbose
        self.branch_instructions = BRANCH_INSTRUCTIONS
    
    def extract_address(self, line: str) -> Optional[str]:
        """Extract address from assembly line
        Example: "  100b4:	ff010113  ..." -> "100b4"
        """
        match = re.match(r'^\s*([0-9a-fA-F]+):', line)
        if match:
            return match.group(1).lower()
        return None
    
    def parse_instruction_line(self, line: str) -> Optional[Tuple[str, str, str]]:
        """Parse instruction line, returns (address, mnemonic, operands)
        Example: "  100b4:	ff010113  	addi	sp,sp,-16" 
                 -> ("100b4", "addi", "sp,sp,-16")
        """
        parts = line.split('\t')
        if len(parts) < 3:
            return None
        
        addr = self.extract_address(line)
        if not addr:
            return None
        
        mnemonic = parts[2].strip()
        operands = parts[3].strip() if len(parts) > 3 else ""
        
        return addr, mnemonic, operands
    
    def extract_jump_target(self, operands: str) -> Optional[str]:
        """Extract jump target address from operands
        Examples: 
            "ra,14194 <__call_exitprocs>" -> "14194"
            "a5,zero,100d8 <exit+0x24>" -> "100d8"
            "zero,101dc <main+0xfc>" -> "101dc"
        """
        # Match hex address (4-8 digits) optionally followed by symbol info
        # Look for pattern: hex_digits followed by optional whitespace and <symbol>
        match = re.search(r'\b([0-9a-fA-F]{4,8})(?:\s+<[^>]+>)?', operands)
        if match:
            return match.group(1).lower()
        
        # Fallback: match any hex number that looks like an address
        match = re.search(r'\b([0-9a-fA-F]{4,8})\b', operands)
        if match:
            addr = match.group(1).lower()
            # Filter out small numbers that are likely offsets, not addresses
            if len(addr) >= 4:
                return addr
        
        return None
    
    def build_address_map(self, section_file: Path) -> Dict[str, int]:
        """Build address-to-line-number mapping from section.txt"""
        address_to_line = {}
        
        with open(section_file, 'r') as f:
            for line_num, line in enumerate(f):
                addr = self.extract_address(line)
                if addr:
                    address_to_line[addr] = line_num
        
        if self.verbose:
            print(f"  Found {len(address_to_line)} instruction addresses")
        
        return address_to_line
    
    def get_block_start_addresses(self, bb_dir: Path, section_file: Path) -> Dict[int, str]:
        """Get start address for each basic block by counting instructions"""
        block_start_addresses = {}
        
        # 1. Extract addresses from section.txt
        section_addresses = []
        with open(section_file, 'r') as f:
            for line in f:
                addr = self.extract_address(line)
                if addr:
                    section_addresses.append(addr)
        
        # 2. Count instructions in each basic block (sorted by block ID)
        block_files = sorted([f for f in bb_dir.iterdir() 
                            if f.suffix == '.txt' and f.stem.isdigit()],
                            key=lambda f: int(f.stem))
        
        section_idx = 0
        for block_file in block_files:
            block_id = int(block_file.stem)
            # Count non-empty lines in this block
            with open(block_file, 'r') as f:
                inst_count = sum(1 for line in f if line.strip())
            
            # Record start address and skip instructions
            if section_idx < len(section_addresses):
                block_start_addresses[block_id] = section_addresses[section_idx]
                section_idx += inst_count
        
        if self.verbose:
            print(f"  Mapped {len(block_start_addresses)} blocks to addresses")
        
        return block_start_addresses
    
    def analyze_block_terminator(self, block_file: Path) -> Tuple[str, Optional[str]]:
        """Analyze the terminator instruction of a basic block (last instruction)
        Returns: (terminator_type, jump_target)
        terminator_type: 'conditional', 'unconditional', 'call', 'return', 'fallthrough'
        """
        with open(block_file, 'r') as f:
            lines = [line.strip() for line in f if line.strip()]
        
        if not lines:
            return 'fallthrough', None
        
        # Only analyze the last instruction
        last_line = lines[-1]
        
        # Clean comments and symbols
        clean_line = re.sub(r'#.*$', '', last_line).strip()
        clean_line = re.sub(r'<[^>]+>', '', clean_line).strip()
        
        parts = clean_line.split()
        if not parts:
            return 'fallthrough', None
        
        mnemonic = parts[0]
        operands = ' '.join(parts[1:]) if len(parts) > 1 else ""
        
        # Check if it's a branch instruction (this will also record pseudo instructions)
        if is_pseudo_mnemonic(mnemonic):
            raise ValueError(f"Pseudo instruction detected: {mnemonic}")
        
        # jalr can be either return or indirect jump/call
        if mnemonic == 'jalr':
            # jalr zero,0(ra) or jalr ra - this is a return
            if 'zero' in operands:
                if 'ra' in operands:
                    return 'return', None
                else: # jalr zero,0(a5) - indirect jump
                    return 'unconditional', None
            # jalr ra,... - indirect call (will return)
            elif operands.startswith('ra,'):
                return 'call', None
        
        
        if mnemonic == 'jal':
            # Check if target register is zero/x0 (unconditional jump)
            operand_parts = operands.split(',', 1)
            if operand_parts and operand_parts[0].strip() in ['zero', 'x0']:
                target = self.extract_jump_target(operands)
                if target:
                    return 'unconditional', target
            # Otherwise if it uses ra register (function call)
            elif operand_parts and operand_parts[0].strip() == 'ra':
                target = self.extract_jump_target(operands)
                return 'call', target
        
        
        # Conditional branch
        if mnemonic in ['beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu']:
            target = self.extract_jump_target(operands)
            return 'conditional', target
        
        # Default: fall-through
        return 'fallthrough', None
    
    def build_cfg(self, section_path: Path) -> Dict:
        """Build complete CFG for a section"""
        section_file = section_path / 'section.txt'
        bb_dir = section_path / 'basic_blocks'
        
        if not section_file.exists():
            raise FileNotFoundError(f"section.txt not found: {section_file}")
        
        if not bb_dir.exists():
            raise FileNotFoundError(f"basic_blocks directory not found: {bb_dir}")
        
        if self.verbose:
            print(f"\nBuilding CFG for: {section_path.name}")
        
        # 1. Build address mapping
        address_to_line = self.build_address_map(section_file)
        
        # 2. Get start address for each block
        block_start_addresses = self.get_block_start_addresses(bb_dir, section_file)
        
        # 3. Build reverse mapping from address to block ID
        address_to_block = {addr: block_id for block_id, addr in block_start_addresses.items()}
        
        # 4. Analyze successors for each block
        cfg = {}
        block_files = sorted([f for f in bb_dir.iterdir() 
                            if f.suffix == '.txt' and f.stem.isdigit()])
        
        for block_file in block_files:
            block_id = int(block_file.stem)
            
            # Get start address of the block
            start_addr = block_start_addresses.get(block_id, "unknown")
            
            # Analyze terminator instruction
            terminator_type, jump_target = self.analyze_block_terminator(block_file)
            
            # Determine successor blocks
            successors = []
            
            if terminator_type == 'conditional':
                # Conditional branch: two successors (jump target + fall-through)
                if jump_target and jump_target in address_to_block:
                    successors.append(address_to_block[jump_target])
                # Fall-through to next block
                if block_id + 1 < len(block_files):
                    successors.append(block_id + 1)
            
            elif terminator_type == 'unconditional':
                # Unconditional jump: only jump target
                if jump_target and jump_target in address_to_block:
                    successors.append(address_to_block[jump_target])
            
            elif terminator_type == 'call':
                # Function call: fall-through to next block
                if block_id + 1 < len(block_files):
                    successors.append(block_id + 1)
            
            elif terminator_type == 'return':
                # Return: no successors
                pass
            
            elif terminator_type == 'fallthrough':
                # Fall-through: next block
                if block_id + 1 < len(block_files):
                    successors.append(block_id + 1)
            
            cfg[block_id] = {
                'start_address': start_addr,
                'terminator_type': terminator_type,
                'jump_target': jump_target,
                'successors': successors,
                'predecessors': []  # Fill in later
            }
        
        # 5. Fill in predecessors
        for block_id, info in cfg.items():
            for succ_id in info['successors']:
                if succ_id in cfg:
                    cfg[succ_id]['predecessors'].append(block_id)
        
        if self.verbose:
            print(f"  Built CFG with {len(cfg)} blocks")
            print(f"  Entry block: 0")
            exit_blocks = [bid for bid, info in cfg.items() if not info['successors']]
            print(f"  Exit blocks: {exit_blocks}")
        
        return {
            'address_to_block': address_to_block,
            'block_start_addresses': block_start_addresses,
            'cfg': cfg
        }
    
    def save_cfg(self, cfg_data: Dict, output_file: Path):
        """Save CFG to JSON file"""
        with open(output_file, 'w') as f:
            json.dump(cfg_data, f, indent=2)
        
        if self.verbose:
            print(f"\n✓ Saved CFG to: {output_file}")


def process_section(section_path: Path, verbose=False):
    """Process a single section"""
    builder = CFGBuilder(verbose=verbose)
    cfg_data = builder.build_cfg(section_path)
    
    # Save to section directory
    output_file = section_path / 'cfg.json'
    builder.save_cfg(cfg_data, output_file)
    
    return cfg_data


def process_all_sections(sections_dir: Path, verbose=False):
    """Process all sections"""
    print(f"Processing sections in: {sections_dir}")
    
    processed = 0
    for section_name in sorted(os.listdir(sections_dir)):
        section_path = sections_dir / section_name
        if section_path.is_dir():
            try:
                process_section(section_path, verbose)
                processed += 1
            except Exception as e:
                print(f"Error processing {section_name}: {e}")
    
    print(f"\n✓ Processed {processed} sections")


def main():
    parser = argparse.ArgumentParser(
        description='Build Control Flow Graph (CFG)',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Build CFG for a single section
  python build_cfg.py outputs/dhrystone.riscv/sections/__umoddi3/
  
  # Build CFG for all sections
  python build_cfg.py outputs/dhrystone.riscv/sections/
  
  # Verbose output
  python build_cfg.py outputs/dhrystone.riscv/sections/__umoddi3/ -v
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

