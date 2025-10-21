from __future__ import annotations
from data_structure import *
from egglog import *


if __name__ == "__main__":

    # Check if the expected directory exists
    dhrystone_path = "../SSA/outputs/dhrystone.riscv/sections"

    if os.path.exists(dhrystone_path):
        # Load and parse the program
        program = text_program("dhrystone")
        program.from_directory(dhrystone_path)

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
                for inst in block.inst_list:
                    print(f"    {inst}")
                block_count += 1
            section_count += 1

        print("\n" + "="*60)
        print("Full program structure loaded successfully!")
        print("Use 'print(program)' to see the complete structure")
        print("="*60)



Egraph(save_egglog_string=True)