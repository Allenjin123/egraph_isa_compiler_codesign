from __future__ import annotations
#from egglog import *
import os
import re
from typing import Optional, List, Dict

class text_inst():
    """Data structure for text format of a single RISC-V instruction"""

    def __init__(self, op_name: str, rd: Optional[str] = None, rs1: Optional[str] = None,
                 rs2: Optional[str] = None, imm: Optional[int] = None):
        self.op_name = op_name
        self.rd = rd
        self.rs1 = rs1
        self.rs2 = rs2
        self.imm = imm

    def __str__(self):
        """String representation of the instruction"""
        parts = [self.op_name]
        if self.rd:
            parts.append(f"rd={self.rd}")
        if self.rs1:
            parts.append(f"rs1={self.rs1}")
        if self.rs2:
            parts.append(f"rs2={self.rs2}")
        if self.imm is not None:
            parts.append(f"imm={self.imm}")
        return f"    {' '.join(parts)}"

    @staticmethod
    def parse_immediate(value_str: str, is_branch_or_jump: bool = False) -> Optional[int]:
        """Parse immediate value from string, handling different formats.

        Args:
            value_str: String representation of the immediate value
            is_branch_or_jump: If True, treat bare hex values (like '102f0') as hex
                              If False, treat as decimal unless prefixed with 0x

        Returns:
            Parsed integer value, or None if parsing fails
        """
        if not value_str:
            return None

        value_str = value_str.strip()

        try:
            # Handle explicit hex prefix (0x)
            if value_str.startswith('0x') or value_str.startswith('-0x'):
                return int(value_str, 16)

            # For branch/jump instructions, try to parse as hex if it looks like hex
            if is_branch_or_jump:
                # Check if all characters are valid hex digits (after removing optional negative sign)
                test_str = value_str[1:] if value_str.startswith('-') else value_str
                if all(c in '0123456789abcdefABCDEF' for c in test_str):
                    # It's a valid hex string, parse as hex
                    return int(value_str, 16)

            # Otherwise, parse as decimal (int with base 0 handles both decimal and 0x prefix)
            return int(value_str, 0)

        except (ValueError, AttributeError):
            return None

    @classmethod
    def parse_instruction(cls, line: str) -> Optional['text_inst']:
        """Parse a single instruction line from cleaned SSA format"""
        line = line.strip()
        if not line or line.startswith('#'):
            return None

        # Common instruction patterns
        # R-type: op rd, rs1, rs2
        # I-type: op rd, rs1, imm
        # S-type: op rs2, offset(rs1)
        # B-type: op rs1, rs2, label
        # U-type: op rd, imm
        # J-type: op rd, label

        # Remove comments
        if '#' in line:
            line = line[:line.index('#')].strip()

        # Split by whitespace first to get opcode
        parts = line.split(None, 1)
        if not parts:
            return None

        op_name = parts[0]
        operands = parts[1] if len(parts) > 1 else ""

        # Initialize instruction components
        rd, rs1, rs2, imm = None, None, None, None

        # Handle pseudo-instructions with no operands
        if op_name == 'ret':
            # ret -> jalr x0, ra, 0
            # Mark that ra is used (as rs1)
            # In SSA form, ret uses ra_0 (the input ra value)
            rs1 = 'ra_0'
            imm = 0
        elif op_name == 'nop':
            # nop is a no-op, no registers used
            pass

        # Parse operands based on instruction type
        if operands:
            # Check if operands match memory operation format (e.g., "lw rd, offset(rs1)")
            mem_match = re.match(r'(\w+),\s*(-?\d+)\((\w+)\)', operands)

            # Determine instruction format based on opcode using pattern matching
            match op_name:
                # Load instructions (I-type with memory addressing)
                case 'lb' | 'lh' | 'lw' | 'lbu' | 'lhu':
                    if mem_match:
                        rd = mem_match.group(1)
                        imm = cls.parse_immediate(mem_match.group(2))
                        rs1 = mem_match.group(3)
                    else:
                        ops = [op.strip() for op in operands.split(',')]
                        if len(ops) >= 1:
                            rd = ops[0]
                        if len(ops) >= 2:
                            rs1 = ops[1]
                        if len(ops) >= 3:
                            imm = cls.parse_immediate(ops[2])

                # Store instructions (S-type with memory addressing)
                case 'sb' | 'sh' | 'sw':
                    if mem_match:
                        rs2 = mem_match.group(1)
                        imm = cls.parse_immediate(mem_match.group(2))
                        rs1 = mem_match.group(3)
                    else:
                        ops = [op.strip() for op in operands.split(',')]
                        if len(ops) >= 1:
                            rs2 = ops[0]
                        if len(ops) >= 2:
                            # Try to parse offset(base) format
                            store_match = re.match(r'(-?\d+)\((\w+)\)', ops[1])
                            if store_match:
                                imm = cls.parse_immediate(store_match.group(1))
                                rs1 = store_match.group(2)

                # U-type instructions
                case 'lui' | 'auipc':
                    ops = [op.strip() for op in operands.split(',')]
                    if len(ops) >= 1:
                        rd = ops[0]
                    if len(ops) >= 2:
                        imm = cls.parse_immediate(ops[1])

                # J-type: jal
                case 'jal':
                    ops = [op.strip() for op in operands.split(',')]
                    if len(ops) == 1:  # jal offset (treat as branch/jump)
                        imm = cls.parse_immediate(ops[0], is_branch_or_jump=True)
                    elif len(ops) == 2:  # jal rd, offset
                        rd = ops[0]
                        imm = cls.parse_immediate(ops[1], is_branch_or_jump=True)

                # J-type: jalr
                # Format: jalr rd, imm, rs1 (offset comes before base register)
                case 'jalr':
                    ops = [op.strip() for op in operands.split(',')]
                    if len(ops) >= 1:
                        rd = ops[0]
                    if len(ops) >= 2:
                        # ops[1] is the immediate offset
                        imm = cls.parse_immediate(ops[1], is_branch_or_jump=True)
                    if len(ops) >= 3:
                        # ops[2] is the base register
                        rs1 = ops[2]

                # Pseudo branch instructions
                case 'beqz' | 'bnez':
                    # beqz rs, offset -> beq rs, x0, offset
                    # bnez rs, offset -> bne rs, x0, offset
                    ops = [op.strip() for op in operands.split(',')]
                    if len(ops) >= 1:
                        rs1 = ops[0]
                    if len(ops) >= 2:
                        imm = cls.parse_immediate(ops[1], is_branch_or_jump=True)
                    # For pseudo-instructions, rs2 is implicitly x0

                # B-type branch instructions
                case 'beq' | 'bne' | 'blt' | 'bge' | 'bltu' | 'bgeu':
                    ops = [op.strip() for op in operands.split(',')]
                    if len(ops) >= 1:
                        rs1 = ops[0]
                    if len(ops) >= 2:
                        rs2 = ops[1]
                    if len(ops) >= 3:
                        # Branch instructions use immediate as target offset (parse as hex)
                        imm = cls.parse_immediate(ops[2], is_branch_or_jump=True)

                # I-type arithmetic/logic instructions
                case 'addi' | 'slti' | 'sltiu' | 'xori' | 'ori' | 'andi' | \
                     'slli' | 'srli' | 'srai':
                    ops = [op.strip() for op in operands.split(',')]
                    if len(ops) >= 1:
                        rd = ops[0]
                    if len(ops) >= 2:
                        rs1 = ops[1]
                    if len(ops) >= 3:
                        imm = cls.parse_immediate(ops[2])

                # Pseudo instruction: mv rd, rs -> addi rd, rs, 0
                case 'mv':
                    ops = [op.strip() for op in operands.split(',')]
                    if len(ops) >= 1:
                        rd = ops[0]
                    if len(ops) >= 2:
                        rs1 = ops[1]

                # Pseudo instruction: li rd, imm -> addi rd, x0, imm
                case 'li':
                    ops = [op.strip() for op in operands.split(',')]
                    if len(ops) >= 1:
                        rd = ops[0]
                    if len(ops) >= 2:
                        imm = cls.parse_immediate(ops[1])

                # R-type and other instructions (default case)
                case _:
                    ops = [op.strip() for op in operands.split(',')]
                    if len(ops) >= 1:
                        rd = ops[0]
                    if len(ops) >= 2:
                        rs1 = ops[1]
                    if len(ops) >= 3:
                        # Could be rs2 or immediate
                        parsed_imm = cls.parse_immediate(ops[2])
                        if parsed_imm is not None:
                            imm = parsed_imm
                        else:
                            rs2 = ops[2]

        return cls(op_name, rd, rs1, rs2, imm)


class text_basic_block():
    """Data structure for a basic block that stores a sequence of instructions.
    One basic block should correspond to one egraph."""

    def __init__(self, block_name: str):
        self.block_name = block_name
        self.block_idx = None
        self.inst_list: List[text_inst] = []

    def add_inst(self, inst: text_inst):
        """Add an instruction to the basic block"""
        if inst:
            self.inst_list.append(inst)

    def from_file(self, file_path: str):
        """Load instructions from a file"""
        # Extract block index from filename (e.g., "0.txt" -> 0)
        filename = os.path.basename(file_path)
        if filename.endswith('.txt'):
            try:
                self.block_idx = int(filename[:-4])
            except:
                self.block_idx = -1

        with open(file_path, 'r') as f:
            for line in f:
                inst = text_inst.parse_instruction(line)
                if inst:
                    self.add_inst(inst)

    def _is_register(self, val):
        """Check if a value is a register name (not an immediate/constant)"""
        if not val:
            return False
        # Check if it's a pure number (immediate value)
        if val.isdigit() or (val.startswith('-') and val[1:].isdigit()):
            return False
        # Check if it's a hex address
        if val.startswith('0x') or (len(val) > 4 and all(c in '0123456789abcdef' for c in val)):
            return False
        # Otherwise, it's likely a register
        return True

    def get_used_registers(self) -> set:
        """Get all register names used in this basic block.

        Returns:
            A set of all register names (rd, rs1, rs2) used in this block.
            For SSA form, this includes versioned names like 'sp_1', 'a0_2', etc.
            Filters out immediates and constants.
        """
        registers = set()

        for inst in self.inst_list:
            # Add destination register if it exists and is a register
            if inst.rd and self._is_register(inst.rd):
                registers.add(inst.rd)

            # Add source register 1 if it exists and is a register
            if inst.rs1 and self._is_register(inst.rs1):
                registers.add(inst.rs1)

            # Add source register 2 if it exists and is a register
            if inst.rs2 and self._is_register(inst.rs2):
                registers.add(inst.rs2)

        return registers

    def get_input_output_registers(self) -> tuple:
        """Get input and output registers separately.

        Returns:
            (input_registers, output_registers) where:
            - input_registers: registers used (rs1/rs2) but never defined (rd) in this block
            - output_registers: registers defined (rd) in this block
        """
        output_registers = set()
        used_registers = set()

        for inst in self.inst_list:
            # Collect output registers (defined by rd)
            if inst.rd and self._is_register(inst.rd):
                output_registers.add(inst.rd)

            # Collect all used registers (rs1, rs2)
            if inst.rs1 and self._is_register(inst.rs1):
                used_registers.add(inst.rs1)
            if inst.rs2 and self._is_register(inst.rs2):
                used_registers.add(inst.rs2)

        # Input registers are used but never defined in this block
        input_registers = used_registers - output_registers

        return input_registers, output_registers

    def __str__(self):
        """String representation of the basic block"""
        lines = [f"  Block {self.block_idx} ({self.block_name}): {len(self.inst_list)} instructions"]
        for inst in self.inst_list:
            lines.append(str(inst))
        return '\n'.join(lines)


class text_section():
    """Data structure for a section that stores multiple basic blocks"""

    def __init__(self, section_name: str):
        self.section_name = section_name
        self.basic_blocks: List[text_basic_block] = []

    def add_basic_block(self, block: text_basic_block):
        """Add a basic block to the section"""
        self.basic_blocks.append(block)

    def from_directory(self, dir_path: str, suffix: str = ""):
        """Read all basic block files in the directory and populate basic_blocks

        Args:
            dir_path: Path to section directory
            suffix: Suffix to append to "basic_blocks" directory name (e.g., "","_ssa","_json")
        """
        # Determine which subdirectory to read from


        blocks_dir = os.path.join(dir_path, f"basic_blocks{suffix}")

        # Fallback to old structure if new structure doesn't exist
        if not os.path.exists(blocks_dir):
            blocks_dir = dir_path  # Old structure: files directly in section dir

        if not os.path.exists(blocks_dir):
            return  # No blocks found

        block_files = []

        for filename in os.listdir(blocks_dir):
            full_path = os.path.join(blocks_dir, filename)
            if os.path.isfile(full_path) and filename.endswith('.txt'):
                # Only process numbered block files (e.g., "0.txt", "1.txt")
                try:
                    block_num = int(filename[:-4])
                    block_files.append((block_num, filename, full_path))
                except:
                    # Skip non-numbered files like "section.txt"
                    continue

        # Sort by block number to maintain order
        block_files.sort(key=lambda x: x[0])

        for block_num, filename, full_path in block_files:
            block = text_basic_block(filename)
            block.from_file(full_path)
            self.add_basic_block(block)

    def __str__(self):
        """String representation of the section"""
        lines = [f"\nSection: {self.section_name} ({len(self.basic_blocks)} blocks)"]
        for block in self.basic_blocks:
            lines.append(str(block))
        return '\n'.join(lines)


class text_program():
    """Data structure for a program that stores multiple sections"""

    def __init__(self, program_name: str):
        self.program_name = program_name
        self.sections: Dict[str, text_section] = {}

    def add_section(self, section: text_section):
        """Add a section to the program"""
        self.sections[section.section_name] = section

    def from_directory(self, dir_path: str, suffix: str = ""):
        """Read all section directories in the directory and populate sections

        Args:
            dir_path: Path to sections directory
            suffix: Suffix to append to "basic_blocks" directory name (e.g., "","_ssa","_json")
        """
        if not os.path.exists(dir_path):
            print(f"Error: Directory {dir_path} does not exist")
            return

        section_names = []
        for section_name in os.listdir(dir_path):
            section_path = os.path.join(dir_path, section_name)
            if os.path.isdir(section_path):
                section_names.append(section_name)

        # Sort section names for consistent output
        section_names.sort()

        for section_name in section_names:
            section_path = os.path.join(dir_path, section_name)
            section = text_section(section_name)
            section.from_directory(section_path, suffix=suffix)
            if section.basic_blocks:  # Only add non-empty sections
                self.add_section(section)

    def __str__(self):
        """String representation of the program"""
        lines = [f"{'='*60}"]
        lines.append(f"Program: {self.program_name}")
        lines.append(f"Total sections: {len(self.sections)}")
        lines.append(f"{'='*60}")

        # Sort sections by name for consistent output
        sorted_sections = sorted(self.sections.items())
        for section_name, section in sorted_sections:
            lines.append(str(section))

        return '\n'.join(lines)

    def print_summary(self):
        """Print a summary of the program structure"""
        print(f"\n{'='*60}")
        print(f"PROGRAM SUMMARY: {self.program_name}")
        print(f"{'='*60}")
        print(f"Total sections: {len(self.sections)}")

        total_blocks = 0
        total_instructions = 0

        print(f"\n{'Section':<30} {'Blocks':>10} {'Instructions':>15}")
        print(f"{'-'*60}")

        for section_name in sorted(self.sections.keys()):
            section = self.sections[section_name]
            num_blocks = len(section.basic_blocks)
            num_instructions = sum(len(block.inst_list) for block in section.basic_blocks)
            total_blocks += num_blocks
            total_instructions += num_instructions
            print(f"{section_name:<30} {num_blocks:>10} {num_instructions:>15}")

        print(f"{'-'*60}")
        print(f"{'TOTAL':<30} {total_blocks:>10} {total_instructions:>15}")
        print(f"{'='*60}\n")


def test_parsing():
    """Test the parsing with a small example"""
    print("Testing instruction parsing...")
    test_instructions = [
        "add a0, a1, a2",
        "addi sp, sp, -16",
        "lw a5, 0(s4)",
        "sw a0, 4(sp)",
        "beq a0, a1, label1",
        "jal ra, function",
        "lui t0, 0x10000",
        "slli a0, a1, 5",
        "mul a0, a1, a2",
    ]

    for line in test_instructions:
        inst = text_inst.parse_instruction(line)
        if inst:
            print(f"  {line:30} -> {inst}")
    print()


def test_register_extraction():
    """Test register extraction from a basic block"""
    print("Testing register extraction from basic block...")

    # Create a test basic block with SSA-form instructions
    test_block = text_basic_block("test_block")

    # Add some instructions with SSA versioning
    test_ssa_instructions = [
        "addi sp_1, sp_0, -16",
        "sw ra_0, 12(sp_1)",
        "sw s0_0, 8(sp_1)",
        "addi s0_1, sp_1, 16",
        "lw a5_0, 0(a0_0)",
        "addi a5_1, a5_0, 1",
        "sw a5_1, 0(a0_0)",
        "add a0_1, a1_0, a2_0",
        "mul s1_1, s2_0, s3_0",
    ]

    for line in test_ssa_instructions:
        inst = text_inst.parse_instruction(line)
        if inst:
            test_block.add_inst(inst)

    # Get all used registers
    used_registers = test_block.get_used_registers()

    print(f"  Total instructions: {len(test_block.inst_list)}")
    print(f"  Total unique registers: {len(used_registers)}")
    print(f"  Registers used: {sorted(used_registers)}")

    # Group by base register name (without version number)
    base_registers = {}
    for reg in used_registers:
        if '_' in reg:
            base_name = reg.split('_')[0]
            version = reg.split('_')[1]
            if base_name not in base_registers:
                base_registers[base_name] = []
            base_registers[base_name].append(int(version))

    print("\n  Register versions by base name:")
    for base_name in sorted(base_registers.keys()):
        versions = sorted(base_registers[base_name])
        print(f"    {base_name}: versions {versions}")
    print()


if __name__ == "__main__":
    # Test parsing first
    test_parsing()

    # Test register extraction
    test_register_extraction()

    # Check if the expected directory exists
    dhrystone_path = "../SSA/outputs_ssa/dhrystone.riscv/sections"

    # Try alternative paths
    if not os.path.exists(dhrystone_path):
        dhrystone_path = "SSA/outputs/dhrystone.riscv/sections"

    if not os.path.exists(dhrystone_path):
        # Try to find any processed output
        print("Looking for processed outputs...")
        search_paths = [
            "../SSA/outputs",
            "SSA/outputs",
            "../SSA",
            "SSA"
        ]

        for search_path in search_paths:
            if os.path.exists(search_path):
                print(f"Found directory: {search_path}")
                subdirs = [d for d in os.listdir(search_path) if os.path.isdir(os.path.join(search_path, d))]
                if subdirs:
                    print(f"Available outputs: {', '.join(subdirs)}")
                    # Use the first available output
                    first_output = subdirs[0]
                    dhrystone_path = os.path.join(search_path, first_output, "sections")
                    if os.path.exists(dhrystone_path):
                        print(f"Using: {dhrystone_path}")
                        break

    if os.path.exists(dhrystone_path):
        # Load and parse the program
        program = text_program("dhrystone")
        program.from_directory(dhrystone_path, suffix="_ssa")

        # Print summary
        program.print_summary()

        # Print detailed structure for first few sections/blocks as example
        print("\n" + "="*60)
        print("DETAILED VIEW (first 2 sections, first 2 blocks each)")
        print("="*60)

        section_count = 0
        for section_name in sorted(program.sections.keys()):
            if section_count >= 2:
                break
            section = program.sections[section_name]
            print(f"\nSection: {section_name}")

            block_count = 0
            for block in section.basic_blocks:
                if block_count >= 2:
                    break
                print(f"\n  Block {block.block_idx}:")

                # Show used registers for this block
                used_regs = block.get_used_registers()
                print(f"    Used registers ({len(used_regs)}): {sorted(used_regs)}")

                # Show first few instructions
                print(f"    Instructions (showing first 5):")
                for i, inst in enumerate(block.inst_list[:5]):
                    print(f"      {inst}")
                if len(block.inst_list) > 5:
                    print(f"      ... ({len(block.inst_list) - 5} more instructions)")

                block_count += 1
            section_count += 1

        print("\n" + "="*60)
        print("Full program structure loaded successfully!")
        print("Use 'print(program)' to see the complete structure")
        print("="*60)
    else:
        print(f"Error: Could not find processed output directory")
        print(f"Expected path: {dhrystone_path}")
        print("\nPlease run the SSA processing pipeline first:")
        print("  cd SSA")
        print("  python process_dump.py ../benchmark/im_inputs/dhrystone.riscv.dump")


# #### Below are egraph data structure (keep as reference) ####
# class Reg(Expr):
#     def __init__(self, name: StringLike) -> None: ...

# class Inst(Expr):
#     def __init__(self, name: StringLike, rd: Reg, rs1: Reg, rs2: Reg, imm: i64Like) -> None: ...

# class Num(Expr):
#     def __init__(self, value: i64Like) -> None: ...

#     @classmethod
#     def var(cls, name: StringLike) -> Num:  ...

#     def __add__(self, other: Num) -> Num: ...

#     def __mul__(self, other: Num) -> Num: ...

# egraph = EGraph()

# expr1 = egraph.let("expr1", Num(2) * (Num.var("x") + Num(3)))
# expr2 = egraph.let("expr2", Num(6) + Num(2) * Num.var("x"))

# @egraph.register
# def _num_rule(a: Num, b: Num, c: Num, i: i64, j: i64):
#     yield rewrite(a + b).to(b + a)
#     yield rewrite(a * (b + c)).to((a * b) + (a * c))
#     yield rewrite(Num(i) + Num(j)).to(Num(i + j))
#     yield rewrite(Num(i) * Num(j)).to(Num(i * j))

# egraph.saturate()
# egraph.check(expr1 == expr2)
# egraph.extract(expr1)