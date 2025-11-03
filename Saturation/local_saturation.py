from __future__ import annotations
from data_structure import *
from egglog import *
import os
import argparse
import sys


def create_register_datatype_egglog(registers: set) -> str:
    """Create egglog datatype declaration for registers"""
    if not registers:
        return "(datatype Reg)"

    # Sort registers for consistent output
    sorted_regs = sorted(registers)

    lines = ["(datatype Reg"]
    for reg in sorted_regs:
        lines.append(f"  ({reg})")
    lines.append(")")

    return "\n".join(lines)


def convert_instruction_to_egglog(inst: text_inst, reg_values: dict) -> tuple:
    """
    Convert a text_inst to egglog expression using base.egg definitions.
    Returns (result_reg, expression) or (None, comment) for unsupported instructions.
    """
    op = inst.op_name.lower()

    # Helper to get register reference - use existing value or create RegVal with string
    def get_reg_ref(reg_name):
        if reg_name in reg_values:
            return reg_values[reg_name]
        else:
            # For registers not yet defined (shouldn't happen in correct SSA)
            return f"(RegVal \"{reg_name}\")"

    # Helper to format immediate value (handles both numeric and symbolic)
    def format_imm(imm_value):
        if imm_value is None:
            raise ValueError(f"Immediate value is None for instruction: {inst}")
        if isinstance(imm_value, int):
            # Numeric immediate
            return f"(ImmVal {imm_value})"
        elif isinstance(imm_value, str):
            # Symbolic immediate (e.g., %hi(.LC1), %lo(.LC1))
            return f"(ImmLabel \"{imm_value}\")"
        else:
            raise ValueError(f"Invalid immediate type {type(imm_value)} for instruction: {inst}")


    # Handle special cases and pseudo-instructions
    if op == 'li':  # li rd, imm -> LoadImm
        if not inst.rd:
            raise ValueError(f"li instruction missing rd: {inst}")
        if inst.imm is None:
            raise ValueError(f"li instruction missing imm: {inst}")
        return inst.rd, f"(LoadImm {format_imm(inst.imm)})"
    elif op == 'mv':  # mv rd, rs -> addi rd, rs, 0
        if not inst.rd:
            raise ValueError(f"mv instruction missing rd: {inst}")
        if not inst.rs1:
            raise ValueError(f"mv instruction missing rs1: {inst}")
        return inst.rd, f"(Addi {get_reg_ref(inst.rs1)} (ImmVal 0))"
    elif op == 'ret':  # ret -> jalr x0, ra, 0
        # ret uses ra_0 which should be an input register
        return None, f"(Jalr {get_reg_ref('ra_0')} (ImmVal 0))"

    # Register-Register instructions (R-type)
    elif op in ['add', 'sub', 'and', 'or', 'xor', 'sll', 'srl', 'sra', 'slt', 'sltu']:
        if not inst.rd:
            raise ValueError(f"{op} instruction missing rd: {inst}")
        if not inst.rs1:
            raise ValueError(f"{op} instruction missing rs1: {inst}")
        if not inst.rs2:
            raise ValueError(f"{op} instruction missing rs2: {inst}")
        return inst.rd, f"({op.capitalize()} {get_reg_ref(inst.rs1)} {get_reg_ref(inst.rs2)})"
    elif op in ['mul', 'mulh', 'mulhsu', 'mulhu', 'div', 'divu', 'rem', 'remu']:
        if not inst.rd:
            raise ValueError(f"{op} instruction missing rd: {inst}")
        if not inst.rs1:
            raise ValueError(f"{op} instruction missing rs1: {inst}")
        if not inst.rs2:
            raise ValueError(f"{op} instruction missing rs2: {inst}")
        return inst.rd, f"({op.capitalize()} {get_reg_ref(inst.rs1)} {get_reg_ref(inst.rs2)})"

    # Register-Immediate instructions (I-type)
    elif op in ['addi', 'slti', 'sltiu', 'xori', 'ori', 'andi']:
        if not inst.rd:
            raise ValueError(f"{op} instruction missing rd: {inst}")
        if not inst.rs1:
            raise ValueError(f"{op} instruction missing rs1: {inst}")
        if inst.imm is None:
            raise ValueError(f"{op} instruction missing imm: {inst}")
        return inst.rd, f"({op.capitalize()} {get_reg_ref(inst.rs1)} {format_imm(inst.imm)})"
    elif op in ['slli', 'srli', 'srai']:
        if not inst.rd:
            raise ValueError(f"{op} instruction missing rd: {inst}")
        if not inst.rs1:
            raise ValueError(f"{op} instruction missing rs1: {inst}")
        if inst.imm is None:
            raise ValueError(f"{op} instruction missing imm: {inst}")
        return inst.rd, f"({op.capitalize()} {get_reg_ref(inst.rs1)} {format_imm(inst.imm)})"

    # Load instructions
    elif op in ['lw', 'lh', 'lb', 'lhu', 'lbu']:
        if not inst.rd:
            raise ValueError(f"{op} instruction missing rd: {inst}")
        if not inst.rs1:
            raise ValueError(f"{op} instruction missing rs1: {inst}")
        if inst.imm is None:
            raise ValueError(f"{op} instruction missing imm: {inst}")
        op_map = {'lw': 'Lw', 'lh': 'Lh', 'lb': 'Lb', 'lhu': 'Lhu', 'lbu': 'Lbu'}
        return inst.rd, f"({op_map[op]} {get_reg_ref(inst.rs1)} {format_imm(inst.imm)})"

    # Store instructions
    elif op in ['sw', 'sh', 'sb']:
        if not inst.rs2:
            raise ValueError(f"{op} instruction missing rs2: {inst}")
        if not inst.rs1:
            raise ValueError(f"{op} instruction missing rs1: {inst}")
        if inst.imm is None:
            raise ValueError(f"{op} instruction missing imm: {inst}")
        op_map = {'sw': 'Sw', 'sh': 'Sh', 'sb': 'Sb'}
        # Note: Store doesn't produce a result
        return None, f"({op_map[op]} {get_reg_ref(inst.rs1)} {get_reg_ref(inst.rs2)} {format_imm(inst.imm)})"

    # Upper immediate instructions
    elif op == 'lui':
        if not inst.rd:
            raise ValueError(f"lui instruction missing rd: {inst}")
        if inst.imm is None:
            raise ValueError(f"lui instruction missing imm: {inst}")
        return inst.rd, f"(Lui {format_imm(inst.imm)})"
    elif op == 'auipc':
        if not inst.rd:
            raise ValueError(f"auipc instruction missing rd: {inst}")
        if inst.imm is None:
            raise ValueError(f"auipc instruction missing imm: {inst}")
        return inst.rd, f"(Auipc {format_imm(inst.imm)})"

    # Branch instructions
    elif op in ['beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu']:
        if not inst.rs1:
            raise ValueError(f"{op} instruction missing rs1: {inst}")
        if not inst.rs2:
            raise ValueError(f"{op} instruction missing rs2: {inst}")
        if inst.imm is None:
            raise ValueError(f"{op} instruction missing imm: {inst}")
        return None, f"({op.capitalize()} {get_reg_ref(inst.rs1)} {get_reg_ref(inst.rs2)} {format_imm(inst.imm)})"
    elif op == 'bnez':  # bnez rs, imm -> bne rs, x0, imm
        if not inst.rs1:
            raise ValueError(f"bnez instruction missing rs1: {inst}")
        if inst.imm is None:
            raise ValueError(f"bnez instruction missing imm: {inst}")
        return None, f"(Bne {get_reg_ref(inst.rs1)} (RegVal \"x0\") {format_imm(inst.imm)})"
    elif op == 'beqz':  # beqz rs, imm -> beq rs, x0, imm
        if not inst.rs1:
            raise ValueError(f"beqz instruction missing rs1: {inst}")
        if inst.imm is None:
            raise ValueError(f"beqz instruction missing imm: {inst}")
        return None, f"(Beq {get_reg_ref(inst.rs1)} (RegVal \"x0\") {format_imm(inst.imm)})"

    # Jump instructions
    elif op == 'jal':
        if not inst.rd:
            raise ValueError(f"jal instruction missing rd: {inst}")
        if inst.imm is None:
            raise ValueError(f"jal instruction missing imm: {inst}")
        return inst.rd, f"(Jal {format_imm(inst.imm)})"
    elif op == 'jalr':
        if not inst.rd:
            raise ValueError(f"jalr instruction missing rd: {inst}")
        if not inst.rs1:
            raise ValueError(f"jalr instruction missing rs1: {inst}")
        if inst.imm is None:
            raise ValueError(f"jalr instruction missing imm: {inst}")
        return inst.rd, f"(Jalr {get_reg_ref(inst.rs1)} {format_imm(inst.imm)})"
    elif op == 'j':  # j imm -> jal x0, imm
        if inst.imm is None:
            raise ValueError(f"j instruction missing imm: {inst}")
        return None, f"(Jal {format_imm(inst.imm)})"

    # For unsupported instructions, raise an error instead of silently marking as unsupported
    raise ValueError(f"Unsupported or improperly parsed instruction: {inst}")


def process_basic_block_to_egglog(block: text_basic_block, section_name: str) -> str:
    """Process a basic block and generate egglog file"""

    # Get input and output registers separately
    input_registers, output_registers = block.get_input_output_registers()

    # Create output for this block
    egglog_lines = []

    # Add header comment
    egglog_lines.append(f"; EGraph for {section_name} - Block {block.block_idx}")
    egglog_lines.append(f"; Total instructions: {len(block.inst_list)}")
    egglog_lines.append(f"; Input registers: {len(input_registers)}, Output registers: {len(output_registers)}")
    egglog_lines.append("")

    # Add include for base.egg (contains Inst definitions)
    # Path is relative from outputs/<prog>/sections/<section>/basic_blocks_egglog/
    # to Saturation/base.egg (5 levels up: egglog/section/sections/prog/outputs, then Saturation/)
    egglog_lines.append("(include \"../../../../../Saturation/base.egg\")")
    egglog_lines.append("")

    # Declare input registers as let bindings
    if input_registers:
        egglog_lines.append("; Input register declarations (used but not defined in this block)")
        for reg in sorted(input_registers):
            egglog_lines.append(f"(let {reg} (RegVal \"{reg}\"))")
        egglog_lines.append("")

    # Track register values as we build the DAG
    # Pre-populate with input registers (they're already let-bound)
    reg_values = {reg: reg for reg in input_registers}

    # Track all instruction let bindings for eclass extraction
    instruction_let_names = []

    # Convert instructions to egglog expressions
    egglog_lines.append("; ============================================")
    egglog_lines.append("; Instruction sequence as a DAG")
    egglog_lines.append("; ============================================")
    egglog_lines.append("")

    for i, inst in enumerate(block.inst_list):
        result_reg, egglog_expr = convert_instruction_to_egglog(inst, reg_values)

        if egglog_expr and not egglog_expr.startswith(";"):
            # Add comment showing original instruction
            egglog_lines.append(f";; Step {i+1}: {inst}")

            if result_reg:
                # This instruction produces a result, bind it with let and _val suffix
                let_name = f"{result_reg}_val"
                egglog_lines.append(f"(let {let_name} {egglog_expr})")
                # Track this register's value for future references
                reg_values[result_reg] = let_name  # Reference by _val name
                # Track for eclass extraction
                instruction_let_names.append(let_name)
            else:
                # This instruction doesn't produce a result (store, branch, etc.)
                inst_name = f"inst_{i}"
                egglog_lines.append(f"(let {inst_name} {egglog_expr})")
                # Track for eclass extraction
                instruction_let_names.append(inst_name)

            egglog_lines.append("")
        else:
            # Add as comment if unsupported - no let binding, no eclass
            egglog_lines.append(f";; Step {i+1}: {inst}")
            egglog_lines.append(egglog_expr)
            egglog_lines.append("")
            # Track as None for this instruction (no eclass)
            instruction_let_names.append(None)

    egglog_lines.append("; ============================================")
    egglog_lines.append("; Run saturation to apply rewrite rules")
    egglog_lines.append("; ============================================")
    egglog_lines.append("(run 10)")
    egglog_lines.append("")

    # Add print-eclass-id commands for each instruction
    # This uses the custom print-eclass-id implementation in the egglog build
    egglog_lines.append("; ============================================")
    egglog_lines.append("; Print eclass IDs for each instruction")
    egglog_lines.append("; ============================================")
    for let_name in instruction_let_names:
        if let_name:  # Skip unsupported instructions
            egglog_lines.append(f"(print-eclass-id {let_name})")

    return "\n".join(egglog_lines)


def process_program(sections_path: str, program_name: str, verbose: bool = False,
                   max_sections: int = None, max_blocks_per_section: int = None):
    """
    Process a program and generate egglog files

    Args:
        sections_path: Path to the sections directory (e.g., ../SSA/outputs/prog/sections)
        program_name: Name of the program
        verbose: Print detailed output
        max_sections: Limit number of sections to process (None = all)
        max_blocks_per_section: Limit blocks per section (None = all)
    """
    if not os.path.exists(sections_path):
        print(f"Error: Directory {sections_path} not found")
        return 0

    # Load and parse the program
    program = text_program(program_name)
    program.from_directory(sections_path, suffix="_ssa")

    if not program.sections:
        print(f"Error: No sections found in {sections_path}")
        return 0

    # Process sections
    section_count = 0
    total_blocks_processed = 0

    for section_name in sorted(program.sections.keys()):
        if max_sections and section_count >= max_sections:
            break

        section = program.sections[section_name]
        print(f"\nProcessing Section: {section_name}")

        # Create output directory: <section>/basic_blocks_egglog/
        # This goes alongside basic_blocks/ and basic_blocks_ssa/
        section_dir = os.path.join(sections_path, section_name)
        egglog_output_dir = os.path.join(section_dir, "basic_blocks_egglog")
        os.makedirs(egglog_output_dir, exist_ok=True)

        block_count = 0
        for block in section.basic_blocks:
            if max_blocks_per_section and block_count >= max_blocks_per_section:
                break

            if verbose:
                print(f"  Processing Block {block.block_idx}...")

            # Generate egglog content
            egglog_content = process_basic_block_to_egglog(block, section_name)

            # Write to file: <section>/basic_blocks_egglog/<block_num>.egg
            output_file = os.path.join(egglog_output_dir, f"{block.block_idx}.egg")
            with open(output_file, 'w') as f:
                f.write(egglog_content)

            if verbose:
                print(f"    -> Generated: {output_file}")

                # Show registers used
                input_regs, output_regs = block.get_input_output_registers()
                print(f"    -> Input registers: {len(input_regs)}, Output registers: {len(output_regs)}")

            block_count += 1
            total_blocks_processed += 1

        if not verbose:
            print(f"  Generated {block_count} egglog files in {egglog_output_dir}")

        section_count += 1

    print(f"\nTotal: {section_count} sections, {total_blocks_processed} blocks processed")
    return total_blocks_processed


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Convert SSA basic blocks to egglog format',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Process bitcnts_small_O3 program
  python local_saturation.py ../SSA/outputs/bitcnts_small_O3/sections

  # Process with verbose output
  python local_saturation.py ../SSA/outputs/bitcnts_small_O3/sections -v

  # Process only first 3 sections
  python local_saturation.py ../SSA/outputs/bitcnts_small_O3/sections --max-sections 3

  # Process first 2 blocks per section
  python local_saturation.py ../SSA/outputs/bitcnts_small_O3/sections --max-blocks 2

Output structure:
  SSA/outputs/<program>/sections/<section>/
    ├── basic_blocks/       (original)
    ├── basic_blocks_ssa/   (SSA converted)
    └── basic_blocks_egglog/ (generated .egg files)
        '''
    )

    parser.add_argument('input', nargs='?',
                       default='../SSA/outputs/bitcnts_small_O3/sections',
                       help='Path to sections directory (default: ../SSA/outputs/bitcnts_small_O3/sections)')
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Verbose output')
    parser.add_argument('--max-sections', type=int, default=None,
                       help='Maximum number of sections to process')
    parser.add_argument('--max-blocks', type=int, default=None,
                       help='Maximum blocks per section')

    args = parser.parse_args()

    # Extract program name from path
    # Path format: ../SSA/outputs/<program_name>/sections
    sections_path = args.input
    program_name = os.path.basename(os.path.dirname(sections_path))

    total = process_program(
        sections_path,
        program_name,
        args.verbose,
        args.max_sections,
        args.max_blocks
    )

    if total == 0:
        sys.exit(1)

