import Saturation.data_structure as ds
import backend.global_parameter as gp
from typing import Optional

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

            instr_latency = instr_metadata['latency']
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
