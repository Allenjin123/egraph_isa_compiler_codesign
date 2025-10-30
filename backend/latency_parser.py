import Saturation.data_structure as ds
import backend.global_parameter as gp

def parse_latency(program_variant: ds.text_program) -> int:
    """
    Extract latency information from the program variant.

    Args:
        program_variant: text_program data structure containing instructions

    Returns:
        Total latency (sum of all instruction latencies)

    Raises:
        ValueError: If instruction is not in RV_INSTRUCTIONS or has no latency
    """
    latency = 0
    for section_name, section in program_variant.sections.items():
        for block in section.basic_blocks:
            for instr in block.inst_list:
                # Check if instruction exists in RV_INSTRUCTIONS
                if instr.op_name not in gp.RV_INSTRUCTIONS:
                    raise ValueError(
                        f"Unknown instruction '{instr.op_name}' in section '{section_name}', "
                        f"block {block.block_idx}. Not found in RV32IM instruction set."
                    )

                # Get instruction metadata
                instr_metadata = gp.RV_INSTRUCTIONS[instr.op_name]

                # Check if latency field exists
                if 'latency' not in instr_metadata:
                    raise ValueError(
                        f"Instruction '{instr.op_name}' in section '{section_name}', "
                        f"block {block.block_idx} has no 'latency' field in metadata."
                    )

                instr_latency = instr_metadata['latency']
                latency += instr_latency

    return latency
