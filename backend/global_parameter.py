"""
Global parameters for RISC-V backend analysis.

Contains instruction metadata including latency, area, and other characteristics.
"""

from typing import List

# RV32IM Instruction Metadata
# Key: instruction name (opcode)
# Value: dictionary with instruction characteristics
RV_INSTRUCTIONS = {
    # ========================================
    # RV32I Base Integer Instructions
    # ========================================

    # Integer Computation - Register-Immediate
    'addi':  {'latency': 1},
    'slti':  {'latency': 1},
    'sltiu': {'latency': 1},
    'xori':  {'latency': 1},
    'ori':   {'latency': 1},
    'andi':  {'latency': 1},
    'slli':  {'latency': 1},
    'srli':  {'latency': 1},
    'srai':  {'latency': 1},

    # Integer Computation - Register-Register
    'add':   {'latency': 1},
    'sub':   {'latency': 1},
    'slt':   {'latency': 1},
    'sltu':  {'latency': 1},
    'xor':   {'latency': 1},
    'or':    {'latency': 1},
    'and':   {'latency': 1},
    'sll':   {'latency': 1},
    'srl':   {'latency': 1},
    'sra':   {'latency': 1},

    # Upper Immediate
    'lui':   {'latency': 1},
    'auipc': {'latency': 1},

    # Load Instructions
    'lb':    {'latency': 1},
    'lh':    {'latency': 1},
    'lw':    {'latency': 1},
    'lbu':   {'latency': 1},
    'lhu':   {'latency': 1},

    # Store Instructions
    'sb':    {'latency': 1},
    'sh':    {'latency': 1},
    'sw':    {'latency': 1},

    # Branch Instructions
    'beq':   {'latency': 1},
    'bne':   {'latency': 1},
    'blt':   {'latency': 1},
    'bge':   {'latency': 1},
    'bltu':  {'latency': 1},
    'bgeu':  {'latency': 1},

    # Jump Instructions
    'jal':   {'latency': 1},
    'jalr':  {'latency': 1},

    # Pseudo-instructions (common ones)
    'beqz':  {'latency': 1},  # beq rs, x0, offset
    'bnez':  {'latency': 1},  # bne rs, x0, offset
    'li':    {'latency': 1},  # load immediate
    'mv':    {'latency': 1},  # move (addi rd, rs, 0)
    'nop':   {'latency': 1},  # no operation
    'ret':   {'latency': 1},  # return (jalr x0, ra, 0)
    'j':     {'latency': 1},  # jump (jal x0, offset)

    # ========================================
    # RV32M Standard Extension (Multiply/Divide)
    # ========================================

    'mul':    {'latency': 1},  # multiply
    'mulh':   {'latency': 1},  # multiply high signed
    'mulhsu': {'latency': 1},  # multiply high signed-unsigned
    'mulhu':  {'latency': 1},  # multiply high unsigned
    'div':    {'latency': 1},  # divide signed
    'divu':   {'latency': 1},  # divide unsigned
    'rem':    {'latency': 1},  # remainder signed
    'remu':   {'latency': 1},  # remainder unsigned
}

# RV32M Extension Instructions (for minimal ISA detection)
RV32M_INSTRUCTIONS = {
    'mul', 'mulh', 'mulhsu', 'mulhu',
    'div', 'divu', 'rem', 'remu'
}

# RV32I Base Instructions (everything else in RV_INSTRUCTIONS except RV32M)
RV32I_INSTRUCTIONS = {k for k in RV_INSTRUCTIONS.keys() if k not in RV32M_INSTRUCTIONS}


def get_required_set(subset: set) -> str:
    """
    Given a set of instructions, return the required minimal instruction set.
    Checks if RV32I is sufficient, else returns RV32IM.

    Args:
        subset: Set of instruction opcodes

    Returns:
        "RV32I" if only base instructions are used
        "RV32IM" if any multiply/divide instructions are used

    Raises:
        ValueError: If any instructions are not in RV32IM instruction set

    Example:
        get_required_set({'add', 'sub', 'lw'})
        'RV32I'
        get_required_set({'add', 'mul', 'div'})
        'RV32IM'
        get_required_set({'add', 'unknown_op'})
        Raises ValueError with unknown instructions
    """
    # Convert to lowercase for case-insensitive comparison
    subset_lower = {inst.lower() for inst in subset}

    # Check if any instruction is not in RV32IM
    unknown_instructions = subset_lower - RV_INSTRUCTIONS.keys()
    if unknown_instructions:
        # Found instructions outside RV32IM - raise error
        raise ValueError(
            f"Unknown instructions not in RV32IM: {sorted(unknown_instructions)}\n"
            f"Supported instruction sets: RV32I (base) + RV32M (multiply/divide)"
        )

    # Check if any instruction requires the M extension
    if subset_lower & RV32M_INSTRUCTIONS:
        return "RV32IM"

    # Only RV32I base instructions are used
    return "RV32I"


def get_removed_instructions(subset: set, required_set: str) -> List[str]:
    """
    Given a set of instructions and the required instruction set, return the instructions
    that can be removed (not implemented in hardware) while still satisfying the program's needs.

    This returns all instructions from the full RV32IM instruction set that are NOT used
    in the given subset. These instructions can be removed from the hardware implementation
    since they're not needed by the program.

    Args:
        subset: Set of instruction opcodes actually used by the program
        required_set: The required instruction set ("RV32I" or "RV32IM")

    Returns:
        Sorted list of instruction opcodes that can be removed/omitted from hardware

    Example:
        get_removed_instructions({'add', 'sub', 'lw'}, 'RV32I')
        # Returns all RV32IM instructions except 'add', 'sub', 'lw'
    """
    # Convert to lowercase for case-insensitive comparison
    subset_lower = {inst.lower() for inst in subset}

    # Validate that required_set is valid
    if required_set not in ['RV32I', 'RV32IM']:
        raise ValueError(f"Invalid required_set: {required_set}. Must be 'RV32I' or 'RV32IM'")

    # Get the base instruction set based on required_set
    if required_set == 'RV32I':
        # Only consider RV32I instructions (exclude M extension)
        base_instructions = RV32I_INSTRUCTIONS
    else:  # RV32IM
        # Consider all RV32IM instructions
        base_instructions = set(RV_INSTRUCTIONS.keys())

    # Instructions that can be removed are those in the base set but NOT used
    removable = base_instructions - subset_lower

    # Return as sorted list for consistent ordering
    return sorted(removable)