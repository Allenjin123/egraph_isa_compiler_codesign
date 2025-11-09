import re
from typing import Dict, Iterable, List, Optional, Tuple

from .util import INSTRUCTIONS_WITHOUT_RD, parse_instruction, format_instruction

VERSION_SEP = "__v"

def linear_scan_rewrite(
    lines: List[str], live_out: Optional[Iterable[str]] = None
) -> Tuple[List[str], int, Dict[str, str]]:
    """对基本块内的 op_* 占位符进行线性扫描重命名。

    Returns:
        (rewritten_lines, reg_count, live_out_mapping)
        rewritten_lines: 重写后的指令行列表
        reg_count: 线性扫描过程中实际使用的占位符数量
        live_out_mapping: live_out 原始名 -> 分配后的物理寄存器名
    """
    # --- ① 版本化预处理：把每次定义的同名寄存器拆成不同版本 ---
    version_counters: Dict[str, int] = {}        # 原名 -> 下一个版本号
    current_version: Dict[str, str] = {}         # 原名 -> 当前版本名（如 op_2__v1）
    versioned_lines: List[str] = []              # 版本化后的行（仅名字变化）

    def ensure_livein_version(sym: str) -> str:
        """为块入口即用的 op_* 创建一个入口版本（只创建一次）"""
        vname = current_version.get(sym)
        if vname is None:
            vname = f"{sym}{VERSION_SEP}0i"      # <<< 最小改动：新增 live-in 版本
            current_version[sym] = vname
            # 不消耗 version_counters 计数，首次“定义”时仍从 0 开始
        return vname

    for idx, line in enumerate(lines):
        mnemonic, operands = parse_instruction(line, op_reg="op_")
        if not mnemonic:
            versioned_lines.append(line)
            continue

        mnemonic_l = mnemonic.lower()
        ops = [op.strip() for op in operands]

        if mnemonic_l not in INSTRUCTIONS_WITHOUT_RD and ops:
            # 先处理 uses
            for i, u in enumerate(ops[1:], start=1):
                if u.startswith("op_"):
                    # <<< 最小改动：未见过的 use 视作 live-in，强制版本化
                    ops[i] = current_version.get(u, ensure_livein_version(u))

            # 再处理定义
            dest = ops[0]
            if dest.startswith("op_"):
                v = version_counters.get(dest, 0)
                vname = f"{dest}{VERSION_SEP}{v}"
                version_counters[dest] = v + 1
                current_version[dest] = vname
                ops[0] = vname
        else:
            # 无 rd 指令：仅把 uses 换成当前版本 / live-in 版本
            for i, u in enumerate(ops):
                if u.startswith("op_"):
                    # <<< 最小改动：同上，保证 use 都被版本化
                    ops[i] = current_version.get(u, ensure_livein_version(u))

        versioned_lines.append(f"{mnemonic} " + ", ".join(ops) if ops else mnemonic)

    live_out_versions: Dict[str, str] = {}
    if live_out:
        for sym in live_out:
            if not sym or not sym.startswith("op_"):
                continue
            vname = current_version.get(sym)
            if vname is None:
                vname = ensure_livein_version(sym)
            live_out_versions[sym] = vname

    # --- ② 按版本进行活跃区间收集 ---
    def_lines: Dict[str, int] = {}
    end_lines: Dict[str, int] = {}

    for idx, line in enumerate(versioned_lines):
        mnemonic, operands = parse_instruction(line, op_reg="op_")
        if not mnemonic:
            continue
        mnemonic = mnemonic.lower()
        operands = [op.strip() for op in operands]

        if mnemonic not in INSTRUCTIONS_WITHOUT_RD and operands:
            dest = operands[0]
            if dest.startswith("op_") and VERSION_SEP in dest and dest not in def_lines:
                def_lines[dest] = idx
                end_lines[dest] = idx

        uses = operands if mnemonic in INSTRUCTIONS_WITHOUT_RD else operands[1:]
        for operand in uses:
            if operand.startswith("op_") and VERSION_SEP in operand:
                # <<< 最小改动：use 时若尚无定义，视为块入口定义（行号 0）
                if operand not in def_lines:
                    def_lines[operand] = 0
                    end_lines[operand] = idx
                else:
                    end_lines[operand] = idx

    block_end = len(versioned_lines)
    for vname in live_out_versions.values():
        if vname not in def_lines:
            def_lines[vname] = 0
        end_lines[vname] = block_end

    intervals = sorted(def_lines.items(), key=lambda item: item[1])
    active: List[Tuple[str, int]] = []
    free_regs: List[str] = []
    mapping: Dict[str, str] = {}   # 版本名 -> 物理名
    next_reg_id = 0

    for name, start in intervals:
        end = end_lines.get(name, start)
        new_active = []
        for active_name, active_end in active:
            if active_end <= start:
                free_regs.append(mapping[active_name])
            else:
                new_active.append((active_name, active_end))
        active = new_active

        if free_regs:
            reg = free_regs.pop()
        else:
            reg = f"op_{next_reg_id}"
            next_reg_id += 1

        mapping[name] = reg
        active.append((name, end))

    if not mapping:
        return lines[:], 0, {}  # 没有需要映射的，原样返回

    # --- ③ 仅替换“版本名”为物理寄存器名，不动原始输入名 ---
    pattern = re.compile(r'\b(' + '|'.join(sorted((re.escape(name) for name in mapping), key=len, reverse=True)) + r')\b')
    out_lines: List[str] = []
    for orig_line, line in zip(lines, versioned_lines):
        replaced = pattern.sub(lambda m: mapping[m.group(1)], line)
        mnemonic, operands = parse_instruction(replaced, op_reg="op_")
        if not mnemonic:
            out_lines.append(replaced)
            continue
        mnemonic_l = mnemonic.lower()
        operands = [op.strip() for op in operands]
        if mnemonic_l in INSTRUCTIONS_WITHOUT_RD:
            out_lines.append(format_instruction(mnemonic_l, None, operands))
        else:
            rd = operands[0] if operands else None
            uses = operands[1:] if operands else []
            out_lines.append(format_instruction(mnemonic_l, rd, uses))
    live_out_mapping = {
        sym: mapping[vname]
        for sym, vname in live_out_versions.items()
        if vname in mapping
    }
    return out_lines, next_reg_id, live_out_mapping
