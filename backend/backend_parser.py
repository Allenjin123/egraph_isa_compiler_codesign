import argparse
import json
import backend.global_parameter as gp
import backend.latency_parser as lp
import backend.area_parser as ap

# parse user input arguments
# - input_files: path to the input files
# parse input_files, maintain a set structures for each file to analyze how many instructions are used
# example input_files: 
# └── bitcnts_small_O3
#     ├── variant_0
#     │   ├── basic_blocks
#     │       └── 0.txt
#     │       └── 1.txt
#     └── variant_1
#         ├── basic_blocks
#             └── 0.txt
#             └── 1.txt

import Saturation.data_structure as ds

class program():
    def __init__(self, name, path):
        self.name = name
        # path to the rewritten program directory
        self.path = path 
        # variants, a list of text program data structures
        self.variants = []
        # summary information for each variant
        self.subsets = []
        self.areas = []
        self.delays = []

    def parse_variants(self):
        for i, variant in enumerate(self.path.iterdir()):
            if variant.is_dir():
                prog = ds.text_program(f"{self.name}_variant_{i}")
                prog.from_directory(str(variant), suffix="_ssa")
                self.variants.append(prog)

    def parse_subsets(self):
        for variant in self.variants:
            subset = set()
            # count number of unique instructions in the variant
            for section in variant.sections.values():
                for block in section.basic_blocks:
                    for instr in block.instructions:
                        subset.add(instr.opcode)
            self.subsets.append(subset)

            self.areas.append(ap.parse_area(variant))
            self.delays.append(lp.parse_latency(variant))
