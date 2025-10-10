from __future__ import annotations
from egglog import *

class text_inst():
# data structure for text format of a single riscv instruction
    def __init__(self, op_name, rd, rs1, rs2, imm, addr):
        self.op_name = op_name
        self.rd = rd
        self.rs1 = rs1
        self.rs2 = rs2
        self.imm = imm
        self.addr = addr

class text_basic_block():
# data structure for a basic block, that stores a sequence of instructions
    def __init__(self, block_idx):
        self.block_idx = block_idx
        self.inst_list = []  # list of text_inst objects

    def add_inst(self, inst):
        self.inst_list.append(inst)

    def from_file(self, file_path):
        self.block_idx = int(file_path.split('_')[-1])  # assuming filename format includes block index
        with open(file_path, 'r') as f:
            for line in f:
                # parse each line to create text_inst objects and add to inst_list
                pass