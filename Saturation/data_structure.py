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
# one basic block should correspond to one egraph
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

#### Below are egraph data structure ####
class Reg(Expr):
    def __init__(self, name: StringLike) -> None: ...

class Inst(Expr):
    def __init__(self, name: StringLike, rd: Reg, rs1: Reg, rs2: Reg, imm: i64Like) -> None: ...

class Num(Expr):
    def __init__(self, value: i64Like) -> None: ...

    @classmethod
    def var(cls, name: StringLike) -> Num:  ...

    def __add__(self, other: Num) -> Num: ...

    def __mul__(self, other: Num) -> Num: ...

egraph = EGraph()

expr1 = egraph.let("expr1", Num(2) * (Num.var("x") + Num(3)))
expr2 = egraph.let("expr2", Num(6) + Num(2) * Num.var("x"))

@egraph.register
def _num_rule(a: Num, b: Num, c: Num, i: i64, j: i64):
    yield rewrite(a + b).to(b + a)
    yield rewrite(a * (b + c)).to((a * b) + (a * c))
    yield rewrite(Num(i) + Num(j)).to(Num(i + j))
    yield rewrite(Num(i) * Num(j)).to(Num(i * j))

egraph.saturate()
egraph.check(expr1 == expr2)
egraph.extract(expr1)