#!/usr/bin/env python3
"""
Convert basic blocks to SSA (Static Single Assignment) form.
This conversion is local to each basic block - no phi nodes needed.
Each register assignment gets a unique version number.
"""

import os
import re
import argparse
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from util import is_register, analyze_instruction

class SSAConverter:
    """Convert RISC-V assembly basic blocks to SSA form"""

    def __init__(self):
        # Map of register names to their current version numbers
        self.register_versions: Dict[str, int] = {}

    def reset(self):
        """Reset converter state for a new basic block"""
        self.register_versions = {}

    def get_next_version(self, reg: str) -> str:
        """Get next SSA version for a register definition"""
        if reg not in self.register_versions:
            self.register_versions[reg] = 0
        else:
            self.register_versions[reg] += 1
        return f"{reg}_{self.register_versions[reg]}"

    def get_current_version(self, reg: str) -> str:
        """Get current SSA version for a register use"""
        if reg not in self.register_versions:
            # First use - initialize to version 0
            self.register_versions[reg] = 0
        return f"{reg}_{self.register_versions[reg]}"

    def parse_instruction_parts(self, line: str) -> Tuple[str, List[str], Optional[str]]:
        """
        Parse instruction into opcode, operands, and comment.

        Returns:
            Tuple of (opcode, operands_list, comment)
        """
        # Remove leading/trailing whitespace
        line = line.strip()
        if not line:
            return "", [], None

        # Extract comment if present
        comment = None
        if '#' in line:
            parts = line.split('#', 1)
            line = parts[0].strip()
            comment = '#' + parts[1]

        # Split into opcode and operands
        parts = line.split(None, 1)
        if not parts:
            return "", [], comment

        opcode = parts[0]
        operands_str = parts[1] if len(parts) > 1 else ""

        # Parse operands
        operands = []
        if operands_str:
            # Handle memory operations like "0(sp)" but preserve special formats like %pcrel_hi(symbol)
            # Split by comma first to separate different operands
            raw_operands = [op.strip() for op in operands_str.split(',')]
            for op in raw_operands:
                # Check if this operand contains memory access format: offset(register)
                # But not special formats like %pcrel_hi(symbol) or %hi(symbol)
                if '(' in op and ')' in op and not op.startswith('%'):
                    # Memory access format: split into offset and register
                    parts = op.replace('(', ',').replace(')', '').split(',')
                    operands.extend([p.strip() for p in parts if p.strip()])
                else:
                    # Keep as-is (includes %pcrel_hi(symbol), %hi(symbol), %lo(symbol), etc.)
                    if op:
                        operands.append(op)

        return opcode, operands, comment

    def is_register(self, s: str) -> bool:
        """Check if a string is a register name"""
        return is_register(s)

    def identify_def_use_registers(self, opcode: str, operands: List[str]) -> Tuple[Optional[str], List[str]]:
        """
        Identify which registers are defined (written) and used (read) by an instruction.
        Uses util.analyze_instruction for standard RV32IM instructions.

        Returns:
            Tuple of (def_register, [use_registers])
        """
        # Use the util module's analyze_instruction function
        use_regs_set, def_regs_set = analyze_instruction(opcode, operands)
        
        # Convert sets to the expected format
        # def_reg: single register or None
        def_reg = list(def_regs_set)[0] if def_regs_set else None
        # use_regs: list of registers
        use_regs = list(use_regs_set)
        
        return def_reg, use_regs

    def convert_instruction_to_ssa(self, line: str) -> str:
        """
        Convert a single instruction to SSA form.

        Args:
            line: Original instruction line

        Returns:
            Instruction with SSA register names
        """
        # Parse the instruction
        opcode, operands, comment = self.parse_instruction_parts(line)

        if not opcode:
            return line

        # Identify def and use registers
        def_reg, use_regs = self.identify_def_use_registers(opcode, operands)

        # Convert operands to SSA form
        ssa_operands = []
        for i, operand in enumerate(operands):
            if self.is_register(operand):
                # Check if this is the defining occurrence
                if operand == def_reg and i == 0:  # Definition is typically first operand
                    # But first check if it's also used (like in addi sp, sp, -16)
                    if operand in use_regs:
                        # Get current version for use in the computation
                        use_version = self.get_current_version(operand)
                        # Now create new version for definition
                        def_version = self.get_next_version(operand)
                        ssa_operands.append(def_version)
                    else:
                        # Just a definition
                        ssa_operands.append(self.get_next_version(operand))
                elif operand in use_regs:
                    # This is a use
                    ssa_operands.append(self.get_current_version(operand))
                else:
                    # Register not used or defined (shouldn't happen usually)
                    ssa_operands.append(operand)
            else:
                # Not a register (immediate, label, etc.)
                ssa_operands.append(operand)

        # Special case: for instructions like "addi sp, sp, -16", fix the second operand
        if def_reg and def_reg in use_regs:
            # Find uses of the defined register and use previous version
            for i in range(1, len(operands)):  # Skip first (definition)
                if operands[i] == def_reg and self.is_register(operands[i]):
                    # Use the previous version (current - 1)
                    version_num = self.register_versions[def_reg] - 1
                    if version_num >= 0:
                        ssa_operands[i] = f"{def_reg}_{version_num}"

        # Reconstruct the instruction
        if ssa_operands:
            # Handle memory operation format
            if opcode in ['lw', 'lh', 'lb', 'lhu', 'lbu', 'sw', 'sh', 'sb'] and len(ssa_operands) >= 3:
                # Reconstruct as "op rd, imm(rs)" format
                result = f"{opcode} {ssa_operands[0]}, {ssa_operands[1]}({ssa_operands[2]})"
            else:
                result = f"{opcode} " + ", ".join(ssa_operands)
        else:
            result = opcode

        # # Add comment back if present
        # if comment:
        #     result = result + "  " + comment

        return result

    def convert_block_to_ssa(self, lines: List[str]) -> List[str]:
        """
        Convert a basic block to SSA form.

        Args:
            lines: List of instruction lines

        Returns:
            List of SSA-form instructions
        """
        self.reset()
        ssa_lines = []

        for line in lines:
            ssa_line = self.convert_instruction_to_ssa(line)
            ssa_lines.append(ssa_line)

        return ssa_lines


def process_block_file(input_path: Path, output_path: Optional[Path] = None,
                       verbose: bool = False) -> int:
    """
    Process a single basic block file to SSA form.

    Args:
        input_path: Path to input block file
        output_path: Path to output file (if None, creates file in basic_blocks_ssa directory)
        verbose: Print detailed information

    Returns:
        Number of instructions processed
    """
    converter = SSAConverter()

    # Read input file
    with open(input_path, 'r') as f:
        lines = [line.rstrip('\n') for line in f]

    # Convert to SSA
    ssa_lines = converter.convert_block_to_ssa(lines)

    # Determine output path
    if output_path is None:
        # Check if input is in a basic_blocks directory
        if input_path.parent.name == 'basic_blocks':
            # Create basic_blocks_ssa directory at the same level
            ssa_dir = input_path.parent.parent / 'basic_blocks_ssa'
            ssa_dir.mkdir(exist_ok=True)
            output_path = ssa_dir / input_path.name  # Keep same filename
        else:
            # Fallback: create .ssa file in same directory
            output_path = input_path.with_suffix('.ssa')

    # Write output
    with open(output_path, 'w') as f:
        for line in ssa_lines:
            f.write(line + '\n')

    if verbose:
        print(f"  {input_path.name} -> {output_path.name} ({len(lines)} instructions)")

    return len(lines)


def process_program_directory(program_path: Path, verbose: bool = False) -> int:
    """
    Process all blocks in output/program_name/basic_blocks/*.txt
    Output to output/program_name/basic_blocks_ssa/*.txt
    
    Returns:
        Total number of instructions processed
    """
    # Input: basic_blocks directory
    bb_dir = program_path / 'basic_blocks'
    if not bb_dir.exists():
        print(f"Error: basic_blocks directory not found: {bb_dir}")
        return 0
    
    # Output: basic_blocks_ssa directory
    ssa_dir = program_path / 'basic_blocks_ssa'
    ssa_dir.mkdir(exist_ok=True)
    
    # Find all numbered block files
    block_files = []
    for file_path in bb_dir.iterdir():
        if file_path.suffix == '.txt' and file_path.stem.isdigit():
            block_files.append(file_path)
    
    # Sort by block number
    block_files.sort(key=lambda x: int(x.stem))
    
    if verbose:
        print(f"Processing program: {program_path.name}")
        print(f"  Found {len(block_files)} blocks")
    
    # Process each block
    total_instructions = 0
    for block_file in block_files:
        output_file = ssa_dir / block_file.name
        count = process_block_file(block_file, output_file, verbose)
        total_instructions += count
    
    return total_instructions


def main():
    parser = argparse.ArgumentParser(
        description='Convert RISC-V basic blocks to SSA form',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Convert single program: output/program_name/basic_blocks/*.txt -> output/program_name/basic_blocks_ssa/*.txt
  python convert_to_ssa.py output/dijkstra_small_O3_clean

  # Verbose mode
  python convert_to_ssa.py output/dijkstra_small_O3_clean -v
  
  # Run test examples
  python convert_to_ssa.py --test
        '''
    )

    parser.add_argument('input', nargs='?', help='Program directory (e.g., output/program_name)')
    parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')
    parser.add_argument('--test', action='store_true', help='Run test examples')

    args = parser.parse_args()

    if args.test:
        # Run test examples
        print("Testing SSA conversion:")
        test_blocks = [
            [
                "srl a5, a2, s3",
                "add s4, s4, a5",
                "lbu a5, 0(s4)",
                "add a5, a5, s3",
                "li a4, 32",
                "sub s3, a4, a5",
                "beq a4, a5, 80002064"
            ],
            [
                "addi sp, sp, -16",
                "sw ra, 12(sp)",
                "sw s0, 8(sp)",
                "addi s0, sp, 16",
                "lw a5, 0(a0)",
                "addi a5, a5, 1",
                "sw a5, 0(a0)"
            ]
        ]

        converter = SSAConverter()
        for i, block in enumerate(test_blocks):
            print(f"\nTest Block {i+1}:")
            print("Original:")
            for line in block:
                print(f"  {line}")

            print("SSA form:")
            converter.reset()
            ssa_block = converter.convert_block_to_ssa(block)
            for line in ssa_block:
                print(f"  {line}")

        print("\nTest completed!")
        return 0

    if not args.input:
        parser.print_help()
        return 1

    input_path = Path(args.input)

    if not input_path.exists():
        print(f"Error: Input path does not exist: {input_path}")
        return 1
    
    if not input_path.is_dir():
        print(f"Error: Input must be a directory: {input_path}")
        return 1
    
    # Check if it has basic_blocks subdirectory
    bb_dir = input_path / 'basic_blocks'
    if not bb_dir.exists():
        print(f"Error: basic_blocks directory not found in {input_path}")
        print("Expected structure: output/program_name/basic_blocks/*.txt")
        return 1
    
    # Process the program
    count = process_program_directory(input_path, args.verbose)
    print(f"✓ Converted {count} instructions")
    print(f"  Output: {input_path}/basic_blocks_ssa/")
    
    return 0


if __name__ == "__main__":
    exit(main())
