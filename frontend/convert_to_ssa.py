#!/usr/bin/env python3
"""
Convert basic blocks to SSA (Static Single Assignment) form.
This conversion is local to each basic block - no phi nodes needed.
Each register assignment gets a unique version number.
"""

import argparse
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Set

from util import is_register, analyze_instruction, parse_instruction

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

    def convert_operand_to_ssa(self, operand: str, use_regs: Set[str]) -> str:
        """
        Convert a single operand to SSA form.
        
        Args:
            operand: Original operand (register, immediate, or symbol)
            use_regs: Set of registers being used in this instruction
            
        Returns:
            SSA version of the operand
        """
        if is_register(operand):
            # Simple register - convert to SSA version if it's being used
            if operand in use_regs:
                return self.get_current_version(operand)
            else:
                # Not used, keep as-is (shouldn't happen normally)
                return operand
        else:
            # Not a register - keep as-is (immediate, label, %hi(symbol), etc.)
            return operand

    def convert_instruction_to_ssa(self, line: str) -> str:
        """
        Convert a single instruction to SSA form.

        Args:
            line: Original instruction line

        Returns:
            Instruction with SSA register names
        """
        # Parse the instruction using util.parse_instruction
        opcode, operands = parse_instruction(line)

        if not opcode:
            return line

        # Analyze def/use registers
        use_regs_set, def_regs_set = analyze_instruction(opcode, operands)
        
        # Get def register (at most one)
        def_reg = list(def_regs_set)[0] if def_regs_set else None

        # Special handling for registers that are both defined and used
        # e.g., "addi sp, sp, -16" - the def should get new version, use should get old version
        if def_reg and def_reg in use_regs_set:
            # Record the version to use for "use" occurrences (before incrementing)
            use_version = self.get_current_version(def_reg)
        else:
            use_version = None

        # Convert operands to SSA form
        ssa_operands = []
        for i, operand in enumerate(operands):
            if is_register(operand):
                # First operand is usually the definition
                if operand == def_reg and i == 0:
                    # Create new version for definition
                    # If it's also used, we already recorded the old version above
                    ssa_operands.append(self.get_next_version(operand))
                elif operand in use_regs_set:
                    # Register is being used
                    if operand == def_reg and use_version is not None:
                        # This is the def reg being used - use the old version we recorded
                        ssa_operands.append(use_version)
                    else:
                        # Normal use
                        ssa_operands.append(self.get_current_version(operand))
                else:
                    # This shouldn't happen - every register should be in use or def sets
                    raise ValueError(f"Register {operand} in instruction '{line}' not in use/def sets")
            else:
                # Not a register - keep as-is
                ssa_operands.append(operand)

        # Reconstruct the instruction
        return self.reconstruct_instruction(opcode, ssa_operands)

    def reconstruct_instruction(self, opcode: str, operands: List[str]) -> str:
        """
        Reconstruct instruction from opcode and SSA operands.
        
        Args:
            opcode: Instruction mnemonic
            operands: List of SSA operands (already parsed by parse_instruction)
            
        Returns:
            Formatted instruction string
        """
        if not operands:
            return opcode
        
        # For load/store instructions with 3 operands: rd/rs, offset, base_reg
        # Reconstruct as "opcode rd/rs, offset(base_reg)"
        if opcode in ['lw', 'lh', 'lb', 'lhu', 'lbu', 'sw', 'sh', 'sb']:
            if len(operands) == 3:
                return f"{opcode} {operands[0]}, {operands[1]}({operands[2]})"
            elif len(operands) == 2:
                # Just rd/rs and offset (no base register)
                return f"{opcode} {operands[0]}, {operands[1]}"
        
        # For all other instructions, join with commas
        return f"{opcode} " + ", ".join(operands)

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
    Process all blocks in <program_path>/basic_blocks/*.txt
    Output to <program_path>/basic_blocks_ssa/*.txt
    
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
  # Convert single program: output/frontend/program_name/basic_blocks/*.txt -> output/frontend/program_name/basic_blocks_ssa/*.txt
  python convert_to_ssa.py output/frontend/dijkstra_small_O3_clean

  # Verbose mode
  python convert_to_ssa.py output/frontend/dijkstra_small_O3_clean -v
  
  # Run test examples
  python convert_to_ssa.py --test
        '''
    )

    parser.add_argument('input', nargs='?', help='Program directory (e.g., output/frontend/program_name)')
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
        print("Expected structure: output/frontend/program_name/basic_blocks/*.txt")
        return 1
    
    # Process the program
    count = process_program_directory(input_path, args.verbose)
    print(f"✓ Converted {count} instructions")
    print(f"  Output: {input_path}/basic_blocks_ssa/")
    
    return 0


if __name__ == "__main__":
    exit(main())
