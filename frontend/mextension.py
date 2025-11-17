#!/usr/bin/env python3
"""扩展 RISC-V M 扩展伪指令。

提供函数将 M 扩展伪指令（callmul, calldiv, calldivu, callrem, callremu）
替换为调用软件实现例程的展开序列。
"""

from __future__ import annotations

import itertools
import re


# 操作类型到函数名的映射
_OP_TO_FUNCTION = {
    "callmul": "__mul",
    "calldiv": "__riscv_div_lib_divsi3",
    "calldivu": "__riscv_div_lib_udivsi3",
    "callrem": "__riscv_div_lib_modsi3",
    "callremu": "__riscv_div_lib_umodsi3",
}

# 需要额外保存 t0 的操作
_OPS_NEED_T0 = {"calldiv", "calldivu", "callrem", "callremu"}

_CALL_M_EXT_RE = re.compile(
    r"""
    ^(?P<indent>\s*)(?P<op>callmul|calldiv|calldivu|callrem|callremu)\s+
    (?P<rd>[^\s,#]+)\s*,\s*
    (?P<rs1>[^\s,#]+)\s*,\s*
    (?P<rs2>[^\s,#]+)
    (?P<comment>\s*(?:\#.*)?)?$
    """,
    re.VERBOSE,
)

_LABEL_COUNTER = itertools.count(1)


def _is_a0(reg: str) -> bool:
    return reg in {"a0", "x10"}


def _is_a1(reg: str) -> bool:
    return reg in {"a1", "x11"}


def _is_a2(reg: str) -> bool:
    return reg in {"a2", "x12"}


def _is_a3(reg: str) -> bool:
    return reg in {"a3", "x13"}


def _is_t0(reg: str) -> bool:
    return reg in {"t0", "x5"}


def replace_m_extension(asm: str) -> str:
    """将所有 M 扩展伪指令替换为调用软件实现。

    支持的伪指令：callmul, calldiv, calldivu, callrem, callremu
    根据 rd 是否为 a0/a1 决定是否保留对应的压栈与出栈指令。
    对于 div/divu 操作，额外保存 t0 寄存器。
    """

    if not asm:
        return asm

    lines = []
    for line in asm.splitlines():
        match = _CALL_M_EXT_RE.match(line)
        if not match:
            lines.append(line)
            continue

        indent = match.group("indent")
        op = match.group("op")
        rd = match.group("rd")
        rs1 = match.group("rs1")
        rs2 = match.group("rs2")
        comment = match.group("comment") or ""

        function_name = _OP_TO_FUNCTION[op]
        needs_t0 = op in _OPS_NEED_T0
        is_commutative = (op == "callmul")  # 只有乘法是可交换的

        rs1_is_a0 = _is_a0(rs1)
        rs2_is_a1 = _is_a1(rs2)
        rs1_is_a1 = _is_a1(rs1)
        rs2_is_a0 = _is_a0(rs2)

        save_a0 = not _is_a0(rd)
        save_a1 = not _is_a1(rd)
        save_a2 = not _is_a2(rd)
        save_a3 = not _is_a3(rd)
        save_t0 = needs_t0 and not _is_t0(rd)
        
        # ra 始终保存，a0-a3 根据 rd 决定是否保存
        stack_slots = int(save_a0) + int(save_a1) + int(save_a2) + int(save_a3) + int(save_t0) + 1
        # RISC-V ABI 要求栈指针保持 16 字节对齐
        stack_frame = ((4 * stack_slots + 15) // 16) * 16

        new_lines = []

        if stack_frame:
            new_lines.append(f"{indent}addi\tsp, sp, -{stack_frame}")
            offset = 0
            if save_a0:
                new_lines.append(f"{indent}sw\ta0, {offset}(sp)")
                offset += 4
            if save_a1:
                new_lines.append(f"{indent}sw\ta1, {offset}(sp)")
                offset += 4
            if save_a2:
                new_lines.append(f"{indent}sw\ta2, {offset}(sp)")
                offset += 4
            if save_a3:
                new_lines.append(f"{indent}sw\ta3, {offset}(sp)")
                offset += 4
            if save_t0:
                new_lines.append(f"{indent}sw\tt0, {offset}(sp)")
                offset += 4
            # 始终保存 ra
            new_lines.append(f"{indent}sw\tra, {offset}(sp)")

        # 处理参数准备
        if is_commutative:
            # 乘法是可交换的，可以灵活调整参数位置以减少移动
            if rs1_is_a0 or rs2_is_a0:
                # 有 a0，检查另一个是不是 a1
                if rs1_is_a1 or rs2_is_a1:
                    # 两个都已经在正确位置，不需要移动
                    pass
                else:
                    # 有 a0 但没有 a1，需要移动非 a0 的那个到 a1
                    if rs1_is_a0:
                        new_lines.append(f"{indent}add\ta1, {rs2}, x0")
                    else:
                        new_lines.append(f"{indent}add\ta1, {rs1}, x0")
            else:
                # 没有 a0，检查有没有 a1
                if rs1_is_a1 or rs2_is_a1:
                    # 有 a1，把非 a1 的那个移到 a0
                    if rs1_is_a1:
                        new_lines.append(f"{indent}add\ta0, {rs2}, x0")
                    else:
                        new_lines.append(f"{indent}add\ta0, {rs1}, x0")
                else:
                    # 既没有 a0 也没有 a1，两个都需要移动
                    new_lines.append(f"{indent}add\ta0, {rs1}, x0")
                    new_lines.append(f"{indent}add\ta1, {rs2}, x0")
        else:
            # 除法/取模不可交换，必须严格保持参数顺序：a0 = rs1, a1 = rs2
            # 需要考虑 rs1 和 rs2 可能相互覆盖的情况
            if rs1_is_a0 and rs2_is_a1:
                # 已经在正确位置
                pass
                
            # 先处理相反逻辑    
            elif rs1_is_a1 and rs2_is_a0:
                # 需要交换 a0 和 a1，使用临时寄存器或通过栈
                # 这里假设已经保存了 a0 和 a1 到栈上（如果需要），可以安全覆盖
                # 先保存 a0 到临时位置，然后移动
                new_lines.append(f"{indent}add\tt0, a0, x0")  # t0 = a0 (rs2)
                new_lines.append(f"{indent}add\ta0, a1, x0")  # a0 = a1 (rs1)
                new_lines.append(f"{indent}add\ta1, t0, x0")  # a1 = t0 (rs2)
            elif (not rs1_is_a1) and rs2_is_a0:
                # rs2 在 a0，rs1 不在 a1
                # 先移动 a0(rs2) 到 a1，再移动 rs1 到 a0
                new_lines.append(f"{indent}add\ta1, a0, x0")  # a1 = a0 (rs2)
                new_lines.append(f"{indent}add\ta0, {rs1}, x0")  # a0 = rs1
            
            elif rs1_is_a1 and (not rs2_is_a0):
                # rs1 在 a1，rs2 不在 a0（且不在 a1）
                new_lines.append(f"{indent}add\ta0, a1, x0")  # a0 = a1 (从 a1)
                new_lines.append(f"{indent}add\ta1, {rs2}, x0")  # a1 = rs2
            
            # 再处理只有一个相同的
            elif rs1_is_a0:
                # rs1 在 a0，rs2 不在 a1（且不在 a0）
                new_lines.append(f"{indent}add\ta1, {rs2}, x0")  # a1 = rs2
            elif rs2_is_a1:
                # rs2 在 a1，rs1 不在 a0（且不在 a1）
                # rs2 已经在正确位置，只需移动 rs1 到 a0
                new_lines.append(f"{indent}add\ta0, {rs1}, x0")  # a0 = rs1
            else:
                # rs1 和 rs2 都不在 a0 或 a1
                new_lines.append(f"{indent}add\ta0, {rs1}, x0")  # a0 = rs1
                new_lines.append(f"{indent}add\ta1, {rs2}, x0")  # a1 = rs2

        label = f".Lpcrel_{op}_{next(_LABEL_COUNTER)}"
        new_lines.append(f"{label}:")
        new_lines.append(f"{indent}auipc\tra, %pcrel_hi({function_name})")
        new_lines.append(f"{indent}jalr\tra, ra, %pcrel_lo({label})")

        new_lines.append(f"{indent}add\t{rd}, a0, x0{comment}")

        if stack_frame:
            offset = 0
            if save_a0:
                new_lines.append(f"{indent}lw\ta0, {offset}(sp)")
                offset += 4
            if save_a1:
                new_lines.append(f"{indent}lw\ta1, {offset}(sp)")
                offset += 4
            if save_a2:
                new_lines.append(f"{indent}lw\ta2, {offset}(sp)")
                offset += 4
            if save_a3:
                new_lines.append(f"{indent}lw\ta3, {offset}(sp)")
                offset += 4
            if save_t0:
                new_lines.append(f"{indent}lw\tt0, {offset}(sp)")
                offset += 4
            # 始终恢复 ra
            new_lines.append(f"{indent}lw\tra, {offset}(sp)")
            new_lines.append(f"{indent}addi\tsp, sp, {stack_frame}")

        lines.extend(new_lines)

    return "\n".join(lines)

