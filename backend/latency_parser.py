import Saturation.data_structure as ds

def parse_latency(program_variant: ds.text_program) -> int:
    # Extract latency information from the program variant
    latency = 0
    for section in program_variant.sections.values():
        for block in section.basic_blocks:
            for instr in block.instructions:
                if instr.latency and instr.latency > latency:
                    latency = instr.latency
    return latency
