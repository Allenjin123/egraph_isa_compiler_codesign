from __future__ import annotations
from data_structure import *
from egglog import *
import os


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

    # Helper to get register reference - use existing value or create RegVal
    def get_reg_ref(reg_name):
        if reg_name in reg_values:
            return reg_values[reg_name]
        else:
            return f"(RegVal ({reg_name}))"

    # Helper to convert address to immediate
    def addr_to_imm(addr):
        # Convert hex address to decimal if needed
        if addr and addr.startswith('0x'):
            return f"(ImmVal {int(addr, 16)})"
        elif addr and addr.startswith('8'):  # Likely hex without 0x
            return f"(ImmVal {int(addr, 16)})"
        else:
            return f"(ImmVal 0)"  # Default for missing addresses

    # Handle special cases and pseudo-instructions
    if op == 'li':  # li rd, imm -> LoadImm
        if inst.rd and (inst.imm is not None or inst.rs1 == '0'):
            imm_val = inst.imm if inst.imm is not None else 0
            return inst.rd, f"(LoadImm (ImmVal {imm_val}))"
    elif op == 'mv':  # mv rd, rs -> addi rd, rs, 0
        if inst.rd and inst.rs1:
            return inst.rd, f"(Addi {get_reg_ref(inst.rs1)} (ImmVal 0))"
    elif op == 'ret':  # ret -> jalr x0, ra, 0
        return None, "(Jalr (RegVal (ra_0)) (ImmVal 0))"

    # Register-Register instructions (R-type)
    elif op in ['add', 'sub', 'and', 'or', 'xor', 'sll', 'srl', 'sra']:
        if inst.rd and inst.rs1 and inst.rs2:
            return inst.rd, f"({op.capitalize()} {get_reg_ref(inst.rs1)} {get_reg_ref(inst.rs2)})"
    elif op in ['mul', 'mulh', 'mulhsu', 'mulhu', 'div', 'divu', 'rem', 'remu']:
        if inst.rd and inst.rs1 and inst.rs2:
            return inst.rd, f"({op.capitalize()} {get_reg_ref(inst.rs1)} {get_reg_ref(inst.rs2)})"

    # Register-Immediate instructions (I-type)
    elif op in ['addi', 'slti', 'sltiu', 'xori', 'ori', 'andi']:
        if inst.rd and inst.rs1 and inst.imm is not None:
            return inst.rd, f"({op.capitalize()} {get_reg_ref(inst.rs1)} (ImmVal {inst.imm}))"
    elif op in ['slli', 'srli', 'srai']:
        if inst.rd and inst.rs1 and inst.imm is not None:
            return inst.rd, f"({op.capitalize()} {get_reg_ref(inst.rs1)} (ImmVal {inst.imm}))"

    # Load instructions
    elif op in ['lw', 'lh', 'lb', 'lhu', 'lbu']:
        if inst.rd and inst.rs1 and inst.imm is not None:
            op_map = {'lw': 'Lw', 'lh': 'Lh', 'lb': 'Lb', 'lhu': 'Lhu', 'lbu': 'Lbu'}
            return inst.rd, f"({op_map[op]} {get_reg_ref(inst.rs1)} (ImmVal {inst.imm}))"

    # Store instructions
    elif op in ['sw', 'sh', 'sb']:
        if inst.rs2 and inst.rs1 and inst.imm is not None:
            op_map = {'sw': 'Sw', 'sh': 'Sh', 'sb': 'Sb'}
            # Note: Store doesn't produce a result
            return None, f"({op_map[op]} {get_reg_ref(inst.rs1)} {get_reg_ref(inst.rs2)} (ImmVal {inst.imm}))"

    # Upper immediate instructions
    elif op == 'lui':
        if inst.rd and inst.imm is not None:
            return inst.rd, f"(Lui (ImmVal {inst.imm}))"
    elif op == 'auipc':
        if inst.rd and inst.imm is not None:
            return inst.rd, f"(Auipc (ImmVal {inst.imm}))"

    # Branch instructions
    elif op in ['beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu']:
        if inst.rs1 and inst.rs2 and inst.addr:
            return None, f"({op.capitalize()} {get_reg_ref(inst.rs1)} {get_reg_ref(inst.rs2)} {addr_to_imm(inst.addr)})"
    elif op == 'bnez':  # bnez rs, addr -> bne rs, x0, addr
        if inst.rs1 and inst.addr:
            return None, f"(Bne {get_reg_ref(inst.rs1)} (RegVal (x0)) {addr_to_imm(inst.addr)})"
    elif op == 'beqz':  # beqz rs, addr -> beq rs, x0, addr
        if inst.rs1 and inst.addr:
            return None, f"(Beq {get_reg_ref(inst.rs1)} (RegVal (x0)) {addr_to_imm(inst.addr)})"

    # Jump instructions
    elif op == 'jal':
        if inst.rd and inst.addr:
            return inst.rd, f"(Jal {addr_to_imm(inst.addr)})"
    elif op == 'jalr':
        if inst.rd and inst.rs1 and inst.imm is not None:
            return inst.rd, f"(Jalr {get_reg_ref(inst.rs1)} (ImmVal {inst.imm}))"
    elif op == 'j':  # j addr -> jal x0, addr
        if inst.addr:
            return None, f"(Jal {addr_to_imm(inst.addr)})"

    # For unsupported instructions, return as comment
    return None, f"; Unsupported: {inst}"


def process_basic_block_to_egglog(block: text_basic_block, section_name: str) -> str:
    """Process a basic block and generate egglog file"""

    # Get all used registers
    registers = block.get_used_registers()

    # Create output for this block
    egglog_lines = []

    # Add header comment
    egglog_lines.append(f"; EGraph for {section_name} - Block {block.block_idx}")
    egglog_lines.append(f"; Total instructions: {len(block.inst_list)}")
    egglog_lines.append(f"; Registers used: {len(registers)}")
    egglog_lines.append("")

    # Add include for base.egg (contains Inst definitions)
    egglog_lines.append("(include \"../../base.egg\")")
    egglog_lines.append("")

    # Add register datatype - this is what varies per block
    egglog_lines.append("; Register declarations for this basic block")
    egglog_lines.append(create_register_datatype_egglog(registers))
    egglog_lines.append("")

    # Track register values as we build the DAG
    reg_values = {}

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
                # This instruction produces a result, bind it with let
                egglog_lines.append(f"(let {result_reg} {egglog_expr})")
                # Track this register's value for future references
                reg_values[result_reg] = result_reg  # The let-bound name becomes the reference
            else:
                # This instruction doesn't produce a result (store, branch, etc.)
                egglog_lines.append(f"(let inst_{i} {egglog_expr})")

            egglog_lines.append("")
        else:
            # Add as comment if unsupported
            egglog_lines.append(f";; Step {i+1}: {inst}")
            egglog_lines.append(egglog_expr)
            egglog_lines.append("")

    egglog_lines.append("; ============================================")
    egglog_lines.append("; Run saturation to apply rewrite rules")
    egglog_lines.append("; ============================================")
    egglog_lines.append("(run 10)")

    return "\n".join(egglog_lines)


if __name__ == "__main__":

    # Check if the expected directory exists
    dhrystone_path = "../SSA/outputs_ssa/dhrystone.riscv/sections"

    # Create output directory for egglog files
    output_dir = "egglog_output"
    os.makedirs(output_dir, exist_ok=True)

    if os.path.exists(dhrystone_path):
        # Load and parse the program
        program = text_program("dhrystone")
        program.from_directory(dhrystone_path)

        # Process first few sections as examples
        section_count = 0
        total_blocks_processed = 0

        for section_name in sorted(program.sections.keys()):

            section = program.sections[section_name]
            print(f"\nProcessing Section: {section_name}")

            # Create section-specific output directory
            section_output_dir = os.path.join(output_dir, section_name)
            os.makedirs(section_output_dir, exist_ok=True)

            block_count = 0
            for block in section.basic_blocks:

                print(f"  Processing Block {block.block_idx}...")

                # Generate egglog content
                egglog_content = process_basic_block_to_egglog(block, section_name)

                # Write to file
                output_file = os.path.join(section_output_dir, f"block_{block.block_idx}.egg")
                with open(output_file, 'w') as f:
                    f.write(egglog_content)

                print(f"    -> Generated: {output_file}")

                # Show registers used
                registers = block.get_used_registers()
                print(f"    -> Registers: {sorted(registers)[:10]}{'...' if len(registers) > 10 else ''}")

                block_count += 1
                total_blocks_processed += 1

            section_count += 1

        print(f"\nTotal blocks processed: {total_blocks_processed}")
        print(f"Output directory: {output_dir}/")
        print("\nExample egglog file content (first block):")
        print("-" * 60)

        # Show example of first generated file
        first_section = sorted(program.sections.keys())[0]
        example_file = os.path.join(output_dir, first_section, "block_0.egg")
        if os.path.exists(example_file):
            with open(example_file, 'r') as f:
                lines = f.readlines()
                # Show first 50 lines as example
                for line in lines[:50]:
                    print(line.rstrip())
                if len(lines) > 50:
                    print("... (truncated)")
    else:
        print(f"Error: Directory {dhrystone_path} not found")
        print("Please run SSA conversion first:")
        print("  cd SSA")
        print("  python convert_to_ssa.py outputs -o outputs_ssa")

