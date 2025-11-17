import Saturation.data_structure as ds
import backend.global_parameter as gp
from typing import Optional
import re

def parse_latency(program_variant: ds.text_program, frequency: Optional[float] = None):
    """
    Extract latency information from the program variant.
    Each instruction's latency is multiplied by its basic block's execution count.

    Args:
        program_variant: text_program data structure containing instructions
        frequency: Optional frequency in MHz from synthesis. If provided, returns time in seconds.

    Returns:
        If frequency is None: Total latency in cycles (int)
        If frequency is provided: Total execution time in seconds (float)

    Raises:
        ValueError: If instruction is not in RV_INSTRUCTIONS or has no latency
    """
    # Library function call latencies (software emulation when hardware mul/div unavailable)
    LIBRARY_CALL_LATENCIES = {
        '__mul':                   320,  # Software multiply
        '__riscv_div_lib_divsi3':  400,  # Software signed division
        '__riscv_div_lib_udivsi3': 400,  # Software unsigned division
        '__riscv_div_lib_modsi3':  400,  # Software signed remainder
        '__riscv_div_lib_umodsi3': 400,  # Software unsigned remainder
    }

    latency_cycles = 0
    for block in program_variant.basic_blocks:
        # Get block execution count (defaults to 1 if not set)
        block_exec_count = getattr(block, 'execution_count', 1)

        for instr in block.inst_list:
            # Check if instruction exists in RV_INSTRUCTIONS
            if instr.op_name not in gp.RV_INSTRUCTIONS:
                raise ValueError(
                    f"Unknown instruction '{instr.op_name}' in block {block.block_idx}. "
                    f"Not found in RV32IM instruction set."
                )

            # Get instruction metadata
            instr_metadata = gp.RV_INSTRUCTIONS[instr.op_name]

            # Check if latency field exists
            if 'latency' not in instr_metadata:
                raise ValueError(
                    f"Instruction '{instr.op_name}' in block {block.block_idx} "
                    f"has no 'latency' field in metadata."
                )

            # Default instruction latency
            instr_latency = instr_metadata['latency']

            # Detect library function calls via auipc pattern
            # Pattern: auipc ra, %pcrel_hi(__mul)
            if instr.op_name == 'auipc' and instr.imm and isinstance(instr.imm, str):
                # Try to extract library function name from immediate
                # Pattern: %pcrel_hi(__mul) or %pcrel_hi(__riscv_div_lib_divsi3)
                match = re.search(r'__\w+', instr.imm)
                if match:
                    func_name = match.group(0)
                    if func_name in LIBRARY_CALL_LATENCIES:
                        # This auipc is calling a library function
                        # Use library call latency instead of normal auipc latency
                        library_latency = LIBRARY_CALL_LATENCIES[func_name]
                        instr_latency = library_latency
                        # Note: The following jalr will be counted separately with its normal latency (1 cycle)
                        # Total = library_latency + 1 for the jalr

            # Multiply instruction latency by block execution count
            latency_cycles += instr_latency * block_exec_count

    # If frequency is provided, convert cycles to seconds
    if frequency is not None:
        if frequency <= 0:
            raise ValueError(f"Invalid frequency: {frequency} MHz. Frequency must be positive.")
        # Convert: cycles / (MHz * 10^6) = seconds
        latency_seconds = latency_cycles / (frequency * 1e6)
        print(f"  Latency: {latency_cycles} cycles @ {frequency:.2f} MHz = {latency_seconds:.2e} seconds")
        return latency_seconds
    else:
        return latency_cycles
