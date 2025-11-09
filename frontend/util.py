# Shared utilities for SSA processing
# Provides common branch instruction predicates for RISC-V disassembly handling.

from typing import List, Set, Tuple
import re
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

# 不产生 rd 写回的指令集合
INSTRUCTIONS_WITHOUT_RD = (
    RV32I_STORE |
    RV32I_BRANCH |
    RV32I_SYSTEM |
    RV32I_FENCE |
    ZIFENCEI_INSTRUCTIONS | 
    ZICSR_INSTRUCTIONS
)

# ============================================================================
# 分支和控制流指令（包含伪指令和压缩指令）
# ============================================================================

BRANCH_INSTRUCTIONS = {
    # Unconditional jumps / calls
    'jal', 'jalr',
    # Conditional branches (standard)
    'beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu',
    # Traps / env calls
    'ecall', 'ebreak',
    # # Pseudo instructions
    # 'j', 'jr',
    # # Conditional branches (pseudo)
    # 'beqz', 'bnez', 'blez', 'bgez', 'bltz', 'bgtz',
    # # Compressed forms
    # 'c.j', 'c.jr', 'c.jal', 'c.jalr',
    # 'c.beqz', 'c.bnez',
    # # Other control flow
    # 'ret', 'call', 'tail',
}

# RISC-V Register Definitions
#  s0 = frame pointer = fp
SPECIAL_REGS = ['x0', 'zero', 'ra', 'sp', 'gp', 'tp', 'fp']
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
def norm_reg(s: str) -> str:
    m = re.match(r'^([A-Za-z0-9]+)(?:_.*)?$', s)
    return m.group(1) if m else s

def is_register(s: str) -> bool:
    """Check if string is a valid RISC-V register"""
    if not s:
        return False
    # x0-x31 format
    if s.startswith('x') and s[1:].isdigit():
        num = int(s[1:])
        return 0 <= num <= 31
    # ABI names
    return norm_reg(s) in ALL_ABI_REGS

def extract_registers_from_operand(operand: str) -> List[str]:
    """
    从操作数中提取所有寄存器。
    
    支持的格式：
    - 普通寄存器：'a5' -> ['a5']
    - 立即数偏移：'12(sp)' -> ['sp']
    - 特殊格式：'%lo(symbol)(a5)' -> ['a5']
    - 特殊格式：'%pcrel_hi(symbol)' -> []
    - 特殊格式：'%hi(symbol)' -> []
    
    Args:
        operand: 操作数字符串
        
    Returns:
        提取到的寄存器列表
    """
    import re
    
    if not operand:
        return []
    
    registers = []
    
    # 首先检查是否是普通寄存器
    if is_register(operand):
        return [operand]
    
    # 查找所有括号中的内容，可能是寄存器
    # 例如：'12(sp)' 或 '%lo(g_qCount)(a5)'
    # 使用正则表达式查找所有 '(...)'
    pattern = r'\(([^)]+)\)'
    matches = re.findall(pattern, operand)
    
    for match in matches:
        # 检查括号中的内容是否是寄存器
        if is_register(match):
            registers.append(match)
    
    return registers

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

def parse_instruction(line: str, op_reg = None) -> Tuple[str, List[str]]:
    """解析指令，返回(mnemonic, operands_list)
    
    示例转换:
        "lw a0, 8(sp)  # comment"           → ("lw", ["a0", "8", "sp"])
        "lw a0, %lo(g_qCount)(a5)"          → ("lw", ["a0", "%lo(g_qCount)", "a5"])
        "add a0, a1, a2"                    → ("add", ["a0", "a1", "a2"])
        "lui a5, %hi(g_qCount)"             → ("lui", ["a5", "%hi(g_qCount)"])
    """
    import re
    
    # 移除注释（#之后的所有内容）
    clean = re.sub(r'#.*$', '', line).strip()
    
    # 移除符号引用 (<...>)
    clean = re.sub(r'<[^>]+>', '', clean).strip()
    
    # 分割mnemonic和operands（只分割一次）
    parts = clean.split(None, 1)
    if not parts:
        return "", []
    
    mnemonic = parts[0]
    operands_str = parts[1] if len(parts) > 1 else ""
    
    # 解析操作数
    operands = []
    if operands_str:
        # 先按逗号分割
        raw_operands = [op.strip() for op in operands_str.split(',')]
        
        for op in raw_operands:
            # 检查是否包含括号（内存访问格式）
            if '(' in op and ')' in op:
                # 处理两种情况：
                # 1. 普通格式：8(sp) → ["sp", "8"]
                # 2. 特殊格式：%lo(symbol)(reg) → ["reg", "%lo(symbol)"]
                # 3. 非寄存器格式：%hi(symbol) → ["%hi(symbol)"]（保持原样）
                
                # 提取最后括号中的内容
                reg_match = re.search(r'\(([^)]+)\)$', op)
                if reg_match:
                    last_token = reg_match.group(1)
                    
                    # 判断最后括号里的内容是否是寄存器
                    if is_register(last_token) or (op_reg and last_token.startswith(op_reg)):
                        # 是寄存器，分离成 offset 和 reg
                        last_paren = op.rfind('(')
                        offset = op[:last_paren]
                        
                        # 添加偏移量和寄存器
                        operands.append(last_token)
                        if offset:
                            operands.append(offset)
                    else:
                        # 不是寄存器（如 %hi(symbol)），保持原样
                        operands.append(op)
                else:
                    # 解析失败，保持原样
                    operands.append(op)
            else:
                # 普通操作数，直接添加
                operands.append(op)
    
    return mnemonic, operands

def analyze_instruction(mnemonic: str, operands: List[str]) -> Tuple[Set[str], Set[str]]:
    """Analyze USE and DEF registers for an instruction
    Returns: (use_regs, def_regs)
    """
    use_regs = set()
    def_regs = set()
    
    if not operands:
        return use_regs, def_regs
    if not is_standard_instruction(mnemonic):
        return use_regs, def_regs
    # R-type: rd, rs1, rs2 (add, sub, and, or, xor, sll, srl, sra, slt, sltu)
    if is_r_type_instruction(mnemonic):
        if len(operands) >= 3:
            if is_register(operands[0]):
                def_regs.add(operands[0])
            if is_register(operands[1]):
                use_regs.add(operands[1])
            if is_register(operands[2]):
                use_regs.add(operands[2])
    
    # I-type: rd, rs1, imm (addi, andi, ori, xori, slti, sltiu, slli, srli, srai)
    elif is_i_type_instruction(mnemonic):
        if len(operands) >= 2:
            if is_register(operands[0]):
                def_regs.add(operands[0])
            if is_register(operands[1]):
                use_regs.add(operands[1])
    
    # Load: rd, offset(rs1)
    elif is_load_instruction(mnemonic):
        if len(operands) >= 2:
            if is_register(operands[0]):
                def_regs.add(operands[0])
            # offset(rs1) parsed as [rd, rs1, offset]
            if is_register(operands[1]):
                use_regs.add(operands[1])
    
    # Store: rs2, offset(rs1)
    elif is_store_instruction(mnemonic):
        if len(operands) >= 2:
            if is_register(operands[0]):
                use_regs.add(operands[0])
            # offset(rs1)
            if is_register(operands[1]):
                use_regs.add(operands[1])
    
    # Branch: rs1, rs2, target
    elif is_branch_instruction(mnemonic):
        if len(operands) >= 2:
            if is_register(operands[0]):
                use_regs.add(operands[0])
            if is_register(operands[1]):
                use_regs.add(operands[1])
    
    # JAL: rd, target
    elif mnemonic == 'jal':
        if operands and is_register(operands[0]):
            def_regs.add(operands[0])
    
    # JALR: rd, rs1, offset
    elif mnemonic == 'jalr':
        if len(operands) >= 2:
            if is_register(operands[0]):
                def_regs.add(operands[0])
            if is_register(operands[1]):
                use_regs.add(operands[1])
    
    # LUI/AUIPC: rd, imm
    elif mnemonic in ['lui', 'auipc']:
        if operands and is_register(operands[0]):
            def_regs.add(operands[0])
    
    # CSR instructions: rd, csr, rs1/imm
    elif is_csr_instruction(mnemonic):
        if len(operands) >= 2:
            # rd is always defined (reads old CSR value)
            if is_register(operands[0]):
                def_regs.add(operands[0])
            # For csrrw/csrrs/csrrc: rs1 is used
            # For csrrwi/csrrsi/csrrci: immediate is used (no register)
            if mnemonic in ['csrrw', 'csrrs', 'csrrc']:
                if len(operands) >= 3 and is_register(operands[2]):
                    use_regs.add(operands[2])
    
    # Fence: none
    elif mnemonic in ['fence', 'fence.i', 'ecall', 'ebreak']:
        pass
    
    else:
        raise ValueError(f"Unknown standard instruction: {mnemonic}")
        
    return use_regs, def_regs

def format_instruction(op: str, rd: str, operands: List[str]) -> str:
    """格式化指令为汇编格式"""
    # Branch 指令列表
    branch_ops = {'beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu'}
    
    # 不需要 rd 的指令
    if op in INSTRUCTIONS_WITHOUT_RD:
        if op in ['sb', 'sh', 'sw'] and len(operands) >= 3:
            # Store 指令: sw rs2, offset(rs1)
            return f"{op}\t{operands[1]},{operands[2]}({operands[0]})"
        elif operands:
            # Branch 指令特殊处理：如果最后一个操作数是数字，改成 ".+数字"
            if (op in branch_ops or op == 'jal') and operands:
                modified_operands = operands.copy()
                last_operand = modified_operands[-1]
                # 检查是否是纯数字（不能有负号）
                if re.match(r'^\d+$', last_operand):
                    modified_operands[-1] = f".+{last_operand}"
                return f"{op}\t{','.join(modified_operands)}"
            else:
                return f"{op}\t{','.join(operands)}"
        else:
            return f"{op}"
    
    # 如果 rd 为 None，使用 x0（零寄存器）
    if rd is None:
        rd = 'x0'
    
    # Load 指令特殊格式
    if op in RV32I_LOAD and len(operands) >= 2:
        return f"{op}\t{rd},{operands[1]}({operands[0]})"
    
    # 普通指令
    if operands:
        return f"{op}\t{rd},{','.join(operands)}"
    else:
        return f"{op}\t{rd}" 