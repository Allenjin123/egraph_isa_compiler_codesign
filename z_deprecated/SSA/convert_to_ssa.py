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
            # Handle memory operations like "0(sp)"
            operands_str = operands_str.replace('(', ',').replace(')', '')
            operands = [op.strip() for op in operands_str.split(',') if op.strip()]

        return opcode, operands, comment

    def is_register(self, s: str) -> bool:
        """Check if a string is a register name"""
        if not s:
            return False
        # Common RISC-V register names
        return (s in ['zero', 'ra', 'sp', 'gp', 'tp', 'fp'] or
               s.startswith('x') or s.startswith('a') or
               s.startswith('s') or s.startswith('t'))

    def identify_def_use_registers(self, opcode: str, operands: List[str]) -> Tuple[Optional[str], List[str]]:
        """
        Identify which registers are defined (written) and used (read) by an instruction.

        Returns:
            Tuple of (def_register, [use_registers])
        """
        def_reg = None
        use_regs = []

        # Skip if no operands
        if not operands:
            return def_reg, use_regs

        # Categorize instructions by their register usage patterns

        # R-type: rd = rs1 op rs2
        r_type = ['add', 'sub', 'and', 'or', 'xor', 'sll', 'srl', 'sra', 'slt', 'sltu',
                  'mul', 'mulh', 'mulhsu', 'mulhu', 'div', 'divu', 'rem', 'remu']

        # I-type arithmetic: rd = rs1 op imm
        i_type_arith = ['addi', 'slti', 'sltiu', 'xori', 'ori', 'andi', 'slli', 'srli', 'srai']

        # Load instructions: rd = mem[rs1 + imm]
        load_type = ['lb', 'lh', 'lw', 'lbu', 'lhu', 'ld']

        # Store instructions: mem[rs1 + imm] = rs2
        store_type = ['sb', 'sh', 'sw', 'sd']

        # Branch instructions: compare rs1, rs2
        branch_type = ['beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu', 'beqz', 'bnez']

        # Jump instructions
        jump_type = ['jal', 'jalr', 'j', 'jr', 'ret', 'call', 'tail']

        # U-type: rd = imm
        u_type = ['lui', 'auipc']

        # Pseudo-instructions
        if opcode == 'li':  # li rd, imm
            if len(operands) >= 1 and self.is_register(operands[0]):
                def_reg = operands[0]

        elif opcode == 'mv':  # mv rd, rs
            if len(operands) >= 2:
                if self.is_register(operands[0]):
                    def_reg = operands[0]
                if self.is_register(operands[1]):
                    use_regs.append(operands[1])

        elif opcode == 'la':  # la rd, label
            if len(operands) >= 1 and self.is_register(operands[0]):
                def_reg = operands[0]

        elif opcode in r_type:
            if len(operands) >= 3:
                if self.is_register(operands[0]):
                    def_reg = operands[0]
                if self.is_register(operands[1]):
                    use_regs.append(operands[1])
                if self.is_register(operands[2]):
                    use_regs.append(operands[2])

        elif opcode in i_type_arith:
            if len(operands) >= 2:
                if self.is_register(operands[0]):
                    def_reg = operands[0]
                if self.is_register(operands[1]):
                    use_regs.append(operands[1])

        elif opcode in load_type:
            if len(operands) >= 2:
                if self.is_register(operands[0]):
                    def_reg = operands[0]
                # operands[1] is immediate, operands[2] is base register (if present)
                if len(operands) >= 3 and self.is_register(operands[2]):
                    use_regs.append(operands[2])

        elif opcode in store_type:
            # Store has special format: sw rs2, imm(rs1) -> operands: [rs2, imm, rs1]
            if len(operands) >= 1 and self.is_register(operands[0]):
                use_regs.append(operands[0])  # rs2 (value to store)
            if len(operands) >= 3 and self.is_register(operands[2]):
                use_regs.append(operands[2])  # rs1 (base address)

        elif opcode in branch_type:
            # Branches don't define registers, only use them
            if opcode in ['beqz', 'bnez']:
                if len(operands) >= 1 and self.is_register(operands[0]):
                    use_regs.append(operands[0])
            else:
                if len(operands) >= 2:
                    if self.is_register(operands[0]):
                        use_regs.append(operands[0])
                    if self.is_register(operands[1]):
                        use_regs.append(operands[1])

        elif opcode in jump_type:
            if opcode == 'jal':
                # jal can have 1 or 2 operands: jal label or jal rd, label
                if len(operands) == 2 and self.is_register(operands[0]):
                    def_reg = operands[0]
                elif len(operands) == 1:
                    # Default is to set ra
                    def_reg = 'ra'
            elif opcode == 'jalr':
                if len(operands) >= 1 and self.is_register(operands[0]):
                    def_reg = operands[0]
                if len(operands) >= 2 and self.is_register(operands[1]):
                    use_regs.append(operands[1])
            elif opcode == 'jr':
                if len(operands) >= 1 and self.is_register(operands[0]):
                    use_regs.append(operands[0])

        elif opcode in u_type:
            if len(operands) >= 1 and self.is_register(operands[0]):
                def_reg = operands[0]

        # Compressed instructions (C extension)
        elif opcode.startswith('c.'):
            # Simplified handling for common compressed instructions
            if opcode in ['c.li', 'c.lui']:
                if len(operands) >= 1 and self.is_register(operands[0]):
                    def_reg = operands[0]
            elif opcode in ['c.addi', 'c.addiw', 'c.slli']:
                if len(operands) >= 1 and self.is_register(operands[0]):
                    def_reg = operands[0]
                    use_regs.append(operands[0])  # These modify existing value
            elif opcode in ['c.mv', 'c.add']:
                if len(operands) >= 2:
                    if self.is_register(operands[0]):
                        def_reg = operands[0]
                        if opcode == 'c.add':
                            use_regs.append(operands[0])  # c.add modifies rd
                    if self.is_register(operands[1]):
                        use_regs.append(operands[1])
            elif opcode in ['c.lw', 'c.ld', 'c.lwsp', 'c.ldsp']:
                if len(operands) >= 1 and self.is_register(operands[0]):
                    def_reg = operands[0]
                if len(operands) >= 3 and self.is_register(operands[2]):
                    use_regs.append(operands[2])
            elif opcode in ['c.sw', 'c.sd', 'c.swsp', 'c.sdsp']:
                if len(operands) >= 1 and self.is_register(operands[0]):
                    use_regs.append(operands[0])
                if len(operands) >= 3 and self.is_register(operands[2]):
                    use_regs.append(operands[2])
            elif opcode in ['c.beqz', 'c.bnez']:
                if len(operands) >= 1 and self.is_register(operands[0]):
                    use_regs.append(operands[0])
            elif opcode in ['c.j', 'c.jr', 'c.jalr']:
                if opcode == 'c.jalr' and len(operands) >= 1:
                    def_reg = 'ra'
                    if self.is_register(operands[0]):
                        use_regs.append(operands[0])
                elif opcode == 'c.jr' and len(operands) >= 1:
                    if self.is_register(operands[0]):
                        use_regs.append(operands[0])

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

        # Add comment back if present
        if comment:
            result = result + "  " + comment

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
        print(f"    Registers versioned: {', '.join(sorted(converter.register_versions.keys()))}")

    return len(lines)


def process_section_directory(section_path: Path, output_dir: Optional[Path] = None,
                            verbose: bool = False) -> int:
    """
    Process all blocks in a section directory.

    Returns:
        Total number of instructions processed
    """
    total_instructions = 0
    block_files = []

    # Check for basic_blocks subdirectory (new structure)
    bb_dir = section_path / 'basic_blocks'
    if bb_dir.exists() and bb_dir.is_dir():
        search_dir = bb_dir
    else:
        # Fallback to section directory itself (old structure)
        search_dir = section_path

    # Find all numbered block files
    for file_path in search_dir.iterdir():
        if file_path.suffix == '.txt' and file_path.stem.isdigit():
            block_files.append(file_path)

    # Sort by block number
    block_files.sort(key=lambda x: int(x.stem))

    if verbose:
        print(f"Processing section: {section_path.name}")

    # Determine output directory
    if output_dir:
        section_output = output_dir / section_path.name / 'basic_blocks_ssa'
        section_output.mkdir(parents=True, exist_ok=True)
    else:
        # Create basic_blocks_ssa directory in the section
        section_output = section_path / 'basic_blocks_ssa'
        section_output.mkdir(exist_ok=True)

    # Process each block
    for block_file in block_files:
        if output_dir:
            output_file = section_output / block_file.name
        else:
            output_file = None  # Will create in basic_blocks_ssa

        count = process_block_file(block_file, output_file, verbose)
        total_instructions += count

    return total_instructions


def process_program_directory(program_path: Path, output_dir: Optional[Path] = None,
                             verbose: bool = False) -> tuple:
    """
    Process all sections in a program directory.
    Returns (total_sections, total_instructions)
    """
    sections_path = program_path / "sections"
    if not sections_path.exists():
        sections_path = program_path

    if not sections_path.exists():
        print(f"Error: Sections directory not found: {sections_path}")
        return 0, 0

    # Determine output directory
    if output_dir:
        output_sections = output_dir / "sections"
        output_sections.mkdir(parents=True, exist_ok=True)
    else:
        output_sections = None

    print(f"Converting to SSA: {program_path.name}")
    total_sections = 0
    total_instructions = 0

    # Process each section
    for section_dir in sorted(sections_path.iterdir()):
        if section_dir.is_dir():
            count = process_section_directory(section_dir, output_sections, verbose)
            total_sections += 1
            total_instructions += count

    return total_sections, total_instructions


def process_outputs_directory(outputs_path: Path, output_dir: Optional[Path] = None,
                            verbose: bool = False) -> None:
    """
    Process all programs in an outputs directory.
    """
    print(f"Processing all programs in: {outputs_path}")
    total_programs = 0
    total_sections = 0
    total_instructions = 0

    # Process each program directory
    for program_dir in sorted(outputs_path.iterdir()):
        if program_dir.is_dir() and (program_dir / "sections").exists():
            # Create output directory for this program
            if output_dir:
                program_output = output_dir / program_dir.name
                program_output.mkdir(parents=True, exist_ok=True)
            else:
                program_output = None

            sections, instructions = process_program_directory(
                program_dir, program_output, verbose
            )
            total_programs += 1
            total_sections += sections
            total_instructions += instructions

    print(f"\nTotal: {total_programs} programs, {total_sections} sections, {total_instructions} instructions")
    if output_dir:
        print(f"Output written to: {output_dir}")
    else:
        print(f"SSA files created alongside original files (.ssa extension)")


def main():
    parser = argparse.ArgumentParser(
        description='Convert RISC-V basic blocks to SSA form',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Convert a single block file
  python convert_to_ssa.py outputs/dhrystone.riscv/sections/main/0.txt

  # Convert all blocks in a section
  python convert_to_ssa.py outputs/dhrystone.riscv/sections/main/

  # Convert entire program
  python convert_to_ssa.py outputs/dhrystone.riscv/

  # Convert ALL programs in outputs folder to a new folder
  python convert_to_ssa.py outputs -o outputs_ssa

  # Convert with custom output directory
  python convert_to_ssa.py outputs/dhrystone.riscv/ -o ssa_output/

  # Verbose mode
  python convert_to_ssa.py outputs/dhrystone.riscv/ -v
        '''
    )

    parser.add_argument('input', nargs='?', help='Input file, section directory, or program directory')
    parser.add_argument('-o', '--output', help='Output directory (default: create .ssa files in place)')
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
                "li a4, 32",
                "add a5, a5, s3",
                "sub s3, a4, a5",
                "beq a4, a5, 80002064"
            ],
            [
                "sll a3, s9, s3",
                "srl a5, s7, a5",
                "sll s5, a2, s3",
                "or s2, a5, a3",
                "sll s0, s7, s3"
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
        return

    if not args.input:
        parser.print_help()
        return 1

    input_path = Path(args.input)
    output_path = Path(args.output) if args.output else None

    if not input_path.exists():
        print(f"Error: Input path does not exist: {input_path}")
        return 1

    if input_path.is_file():
        # Process single file
        process_block_file(input_path, output_path, args.verbose)
        print(f"Converted {input_path} to SSA form")
    elif input_path.is_dir():
        # Check if it's a section directory (contains section.txt)
        is_section = (input_path / "section.txt").exists()
        
        # Check if it has basic_blocks subdirectory
        has_bb_subdir = (input_path / "basic_blocks").exists()
        
        # Check if it contains numbered .txt files directly
        has_blocks = any(f.suffix == '.txt' and f.stem.isdigit()
                        for f in input_path.iterdir() if f.is_file())

        if is_section or has_bb_subdir or has_blocks:
            # Process as section directory
            count = process_section_directory(input_path, output_path, args.verbose)
            print(f"Converted section {input_path.name}: {count} instructions")
        else:
            # Check if it has a sections subdirectory (single program)
            if (input_path / "sections").exists():
                # Process as single program directory
                sections, instructions = process_program_directory(input_path, output_path, args.verbose)
                print(f"Processed {sections} sections, {instructions} instructions")
                if output_path:
                    print(f"Output written to: {output_path}")
            else:
                # Check if it contains program directories (outputs folder)
                has_programs = any((d / "sections").exists()
                                 for d in input_path.iterdir() if d.is_dir())
                if has_programs:
                    # Process as outputs directory containing multiple programs
                    process_outputs_directory(input_path, output_path, args.verbose)
                else:
                    print(f"Error: {input_path} doesn't appear to contain RISC-V programs")
                    print("Expected structure: program_dir/sections/*/[0-9].txt")
                    return 1

    return 0


if __name__ == "__main__":
    exit(main())