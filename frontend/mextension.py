#!/usr/bin/env python3
"""扩展 RISC-V 乘法伪指令。

目前仅提供一个简单的 `replace_callmul` 函数，用给定的
`callmul rd, rs1, rs2` 指令替换为调用软乘法例程的展开序列。
"""

from __future__ import annotations

import itertools
import re


_CALLMUL_RE = re.compile(
    r"""
    ^(?P<indent>\s*)callmul\s+
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


def replace_callmul(asm: str) -> str:
    """将所有 `callmul rd, rs1, rs2` 伪指令替换为调用软乘实现。

    根据 rd 是否为 a0/a1 决定是否保留对应的压栈与出栈指令。
    """

    if not asm:
        return asm

    lines = []
    for line in asm.splitlines():
        match = _CALLMUL_RE.match(line)
        if not match:
            lines.append(line)
            continue

        indent = match.group("indent")
        rd = match.group("rd")
        rs1 = match.group("rs1")
        rs2 = match.group("rs2")
        comment = match.group("comment") or ""

        rs1_is_a0 = _is_a0(rs1)
        rs2_is_a1 = _is_a1(rs2)
        rs1_is_a1 = _is_a1(rs1)
        rs2_is_a0 = _is_a0(rs2)

        save_a0 = not _is_a0(rd)
        save_a1 = not _is_a1(rd)
        # a2 和 a3 始终保存
        stack_slots = int(save_a0) + int(save_a1) + 2
        stack_frame = 4 * stack_slots

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
            # 始终保存 a2 和 a3
            new_lines.append(f"{indent}sw\ta2, {offset}(sp)")
            offset += 4
            new_lines.append(f"{indent}sw\ta3, {offset}(sp)")

        # 处理参数准备：检查参数中有没有 a0
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

        label = f".Lpcrel_mul_{next(_LABEL_COUNTER)}"
        new_lines.append(f"{label}:")
        new_lines.append(f"{indent}auipc\tra, %pcrel_hi(__mul)")
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
            # 始终恢复 a2 和 a3
            new_lines.append(f"{indent}lw\ta2, {offset}(sp)")
            offset += 4
            new_lines.append(f"{indent}lw\ta3, {offset}(sp)")
            new_lines.append(f"{indent}addi\tsp, sp, {stack_frame}")

        lines.extend(new_lines)

    return "\n".join(lines)

