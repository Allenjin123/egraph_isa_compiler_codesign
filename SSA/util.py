# Shared utilities for SSA processing
# Provides common branch instruction predicates for RISC-V disassembly handling.

# ============================================================================
# RV32IM 指令集定义 (RISC-V 32-bit Integer + Multiply/Divide)
# ============================================================================

# RV32I 基础整数指令集 - 40条指令
# ----------------------------------------------------------------------------

# 1. 算术/逻辑运算指令 (10条)
RV32I_ALU = {
    'add', 'sub',           # 加法、减法
    'and', 'or', 'xor',     # 逻辑与、或、异或
    'sll', 'srl', 'sra',    # 逻辑左移、逻辑右移、算术右移
    'slt', 'sltu',          # 有符号/无符号比较（小于则置1）
}

# 2. 立即数运算指令 (9条)
RV32I_ALU_IMM = {
    'addi',                 # 立即数加法
    'andi', 'ori', 'xori',  # 立即数逻辑运算
    'slli', 'srli', 'srai', # 立即数移位
    'slti', 'sltiu',        # 立即数比较
}

# 3. 存储器访问指令 (8条)
RV32I_LOAD = {
    'lb', 'lh', 'lw',       # 加载字节/半字/字（符号扩展）
    'lbu', 'lhu',           # 加载字节/半字（零扩展）
}

RV32I_STORE = {
    'sb', 'sh', 'sw',       # 存储字节/半字/字
}

# 4. 控制流指令 (8条)
RV32I_BRANCH = {
    'beq', 'bne',           # 相等/不等分支
    'blt', 'bge',           # 有符号小于/大于等于分支
    'bltu', 'bgeu',         # 无符号小于/大于等于分支
}

RV32I_JUMP = {
    'jal', 'jalr',          # 跳转并链接、跳转并链接寄存器
}

# 5. 其他 RV32I 指令 (5条)
RV32I_UPPER_IMM = {
    'lui',                  # 加载立即数到高位
    'auipc',                # PC相对地址加载到高位
}

RV32I_SYSTEM = {
    'ecall', 'ebreak',      # 环境调用、断点
}

RV32I_FENCE = {
    'fence',               # 内存屏障
}

# RV32I 完整指令集 (40条)
RV32I_INSTRUCTIONS = (
    RV32I_ALU | RV32I_ALU_IMM | 
    RV32I_LOAD | RV32I_STORE | 
    RV32I_BRANCH | RV32I_JUMP | 
    RV32I_UPPER_IMM | RV32I_SYSTEM | RV32I_FENCE
)

# ----------------------------------------------------------------------------
# M 扩展：整数乘除法指令 - 8条指令
# ----------------------------------------------------------------------------

# 乘法指令 (4条)
RVM_MUL = {
    'mul',                  # 乘法（低32位）
    'mulh',                 # 有符号×有符号（高32位）
    'mulhsu',               # 有符号×无符号（高32位）
    'mulhu',                # 无符号×无符号（高32位）
}

# 除法和取余指令 (4条)
RVM_DIV = {
    'div', 'divu',          # 有符号/无符号除法
    'rem', 'remu',          # 有符号/无符号取余
}

# M 扩展完整指令集 (8条)
RVM_INSTRUCTIONS = RVM_MUL | RVM_DIV

# ----------------------------------------------------------------------------
# Zicsr 扩展：控制状态寄存器访问指令 - 6条指令
# ----------------------------------------------------------------------------
ZICSR_INSTRUCTIONS = {
    'csrrw',                # CSR 读写
    'csrrs',                # CSR 读并置位
    'csrrc',                # CSR 读并清除
    'csrrwi',               # CSR 立即数读写
    'csrrsi',               # CSR 立即数读并置位
    'csrrci',               # CSR 立即数读并清除
}

# ----------------------------------------------------------------------------
# Zifencei 扩展：指令流同步 - 1条指令
# ----------------------------------------------------------------------------
ZIFENCEI_INSTRUCTIONS = {
    'fence.i',              # 指令内存屏障
}

# ----------------------------------------------------------------------------
# RV32IM_Zicsr_Zifencei 完整指令集 (55条标准指令)
# ----------------------------------------------------------------------------
RV32IM_STANDARD_INSTRUCTIONS = (
    RV32I_INSTRUCTIONS | 
    RVM_INSTRUCTIONS | 
    ZICSR_INSTRUCTIONS | 
    ZIFENCEI_INSTRUCTIONS
)

# ============================================================================
# 分支和控制流指令（包含伪指令和压缩指令）
# ============================================================================

BRANCH_INSTRUCTIONS = {
    # Unconditional jumps / calls
    'jal', 'jalr',
    # Pseudo instructions
    'j', 'jr',
    # Conditional branches (standard)
    'beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu',
    # Conditional branches (pseudo)
    'beqz', 'bnez', 'blez', 'bgez', 'bltz', 'bgtz',
    # Compressed forms
    'c.j', 'c.jr', 'c.jal', 'c.jalr',
    'c.beqz', 'c.bnez',
    # Other control flow
    'ret', 'call', 'tail',
    # Traps / env calls
    'ecall', 'ebreak',
}

# RISC-V Register Definitions
#  s0 = frame pointer = fp
SPECIAL_REGS = ['zero', 'ra', 'sp', 'gp', 'tp', 'fp']
T_REGS = ['t0', 't1', 't2', 't3', 't4', 't5', 't6']  # Temporary (caller-saved)
S_REGS = ['s0', 's1', 's2', 's3', 's4', 's5', 's6', 's7', 's8', 's9', 's10', 's11']  # Saved (callee-saved)
A_REGS = ['a0', 'a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7']  # Arguments/return values
ALL_ABI_REGS = set(SPECIAL_REGS + T_REGS + S_REGS + A_REGS)
# Pseudo instructions within BRANCH_INSTRUCTIONS
PSEUDO_BRANCH_INSTRUCTIONS = {
    'j', 'jr', 'beqz', 'bnez', 'blez', 'bgez', 'bltz', 'bgtz', 'ret', 'call', 'tail'
}

# Global dict to track used pseudo instructions
USED_PSEUDO_INSTRUCTIONS = {}

def is_branch_mnemonic(mnemonic: str) -> bool:
    """Return True if mnemonic terminates a basic block (control-flow)."""
    if not mnemonic:
        return False
    return mnemonic in BRANCH_INSTRUCTIONS

def is_pseudo_mnemonic(mnemonic: str) -> bool:
    """Return True if mnemonic is a pseudo instruction."""
    return mnemonic in PSEUDO_BRANCH_INSTRUCTIONS

def normalize_mnemonic(mnemonic: str) -> str:
    """Normalize a mnemonic (lowercase for comparison)."""
    return mnemonic.lower() if mnemonic else mnemonic

# ============================================================================
# Register Utility Functions
# ============================================================================

def is_register(s: str) -> bool:
    """Check if string is a valid RISC-V register"""
    if not s:
        return False
    # x0-x31 format
    if s.startswith('x') and s[1:].isdigit():
        num = int(s[1:])
        return 0 <= num <= 31
    # ABI names
    return s in ALL_ABI_REGS

def is_temp_register(s: str) -> bool:
    """Check if register is a temporary register (t0-t6)"""
    return s in T_REGS

def is_saved_register(s: str) -> bool:
    """Check if register is a saved register (s0-s11)"""
    return s in S_REGS

def is_caller_saved(s: str) -> bool:
    """Check if register is caller-saved (may change after function call)"""
    return s in T_REGS or s in A_REGS or s == 'ra'

def is_callee_saved(s: str) -> bool:
    """Check if register is callee-saved (callee must preserve)"""
    return s in S_REGS or s == 'sp'

def is_argument_register(s: str) -> bool:
    """Check if register is an argument/return value register"""
    return s in A_REGS

def get_register_type(s: str) -> str:
    """Return register type: 'special', 'temp', 'saved', 'arg', 'unknown'"""
    if not is_register(s):
        return 'unknown'
    if s in SPECIAL_REGS:
        return 'special'
    if s in T_REGS:
        return 'temp'
    if s in S_REGS:
        return 'saved'
    if s in A_REGS:
        return 'arg'
    return 'unknown'

# ============================================================================
# Instruction Type Query Functions
# ============================================================================
def is_r_type_instruction(mnemonic: str) -> bool:
    """Check if mnemonic is a R-type instruction"""
    return normalize_mnemonic(mnemonic) in RV32I_ALU or normalize_mnemonic(mnemonic) in RVM_INSTRUCTIONS

def is_i_type_instruction(mnemonic: str) -> bool:
    """Check if mnemonic is a I-type instruction"""
    return normalize_mnemonic(mnemonic) in RV32I_ALU_IMM

def is_rv32i_instruction(mnemonic: str) -> bool:
    """Check if mnemonic is a RV32I base instruction"""
    return normalize_mnemonic(mnemonic) in RV32I_INSTRUCTIONS

def is_rv32m_instruction(mnemonic: str) -> bool:
    """Check if mnemonic is a M extension instruction"""
    return normalize_mnemonic(mnemonic) in RVM_INSTRUCTIONS

def is_mul_instruction(mnemonic: str) -> bool:
    """Check if mnemonic is a multiply instruction"""
    return normalize_mnemonic(mnemonic) in RVM_MUL

def is_div_instruction(mnemonic: str) -> bool:
    """Check if mnemonic is a divide/remainder instruction"""
    return normalize_mnemonic(mnemonic) in RVM_DIV

def is_load_instruction(mnemonic: str) -> bool:
    """Check if mnemonic is a load instruction"""
    return normalize_mnemonic(mnemonic) in RV32I_LOAD

def is_store_instruction(mnemonic: str) -> bool:
    """Check if mnemonic is a store instruction"""
    return normalize_mnemonic(mnemonic) in RV32I_STORE

def is_branch_instruction(mnemonic: str) -> bool:
    """Check if mnemonic is a branch instruction"""
    return normalize_mnemonic(mnemonic) in RV32I_BRANCH

def is_csr_instruction(mnemonic: str) -> bool:
    """Check if mnemonic is a CSR instruction"""
    return normalize_mnemonic(mnemonic) in ZICSR_INSTRUCTIONS

def is_standard_instruction(mnemonic: str) -> bool:
    """Check if mnemonic is a standard RV32IM_Zicsr_Zifencei instruction"""
    return normalize_mnemonic(mnemonic) in RV32IM_STANDARD_INSTRUCTIONS

def get_instruction_category(mnemonic: str) -> str:
    """
    Return instruction category.
    Returns: 'alu', 'alu_imm', 'load', 'store', 'branch', 'jump', 
             'upper_imm', 'system', 'fence', 'mul', 'div', 'csr', 
             'fence.i', 'pseudo', 'unknown'
    """
    m = normalize_mnemonic(mnemonic)
    
    if m in RV32I_ALU:
        return 'alu'
    elif m in RV32I_ALU_IMM:
        return 'alu_imm'
    elif m in RV32I_LOAD:
        return 'load'
    elif m in RV32I_STORE:
        return 'store'
    elif m in RV32I_BRANCH:
        return 'branch'
    elif m in RV32I_JUMP:
        return 'jump'
    elif m in RV32I_UPPER_IMM:
        return 'upper_imm'
    elif m in RV32I_SYSTEM:
        return 'system'
    elif m in RV32I_FENCE:
        return 'fence'
    elif m in RVM_MUL:
        return 'mul'
    elif m in RVM_DIV:
        return 'div'
    elif m in ZICSR_INSTRUCTIONS:
        return 'csr'
    elif m in ZIFENCEI_INSTRUCTIONS:
        return 'fence.i'
    elif is_pseudo_mnemonic(m):
        return 'pseudo'
    else:
        return 'unknown'