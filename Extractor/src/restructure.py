#!/usr/bin/env python3
"""
从 ILP 解(solution*.sol)与 EGraph 出发，
为每个 basic block 搭建结构化数据与输出目录骨架：

ilp_output/<program>/rewrite/variant{N}/<section>/<block>.txt

- variant{N} 对应第 N 个解（solution.sol 或 solution_i.sol → variant{i+1}）；
- 目前仅创建占位文件（写入元信息），后续再实现后序遍历转写为汇编；
- 预留 RegVal/ImmVal 与 norm_reg 逻辑接口。
"""

import sys
import json
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Tuple

sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
from egraph import EGraph  # type: ignore
from ILP.ilp_solver import parse_solution_file, extract_solution  # type: ignore
from SSA.util import INSTRUCTIONS_WITHOUT_RD

# 路径配置
SATURATION_OUTPUT_DIR = Path(__file__).resolve().parent.parent.parent / "saturation_output"

# a2_0 -> a2
def norm_reg(s: str) -> str:
    m = re.match(r'^([A-Za-z0-9]+)(?:_.*)?$', s)
    return m.group(1) if m else s


def strip_quotes(s: str) -> str:
    if not isinstance(s, str) or len(s) < 2:
        return s
    if s[0] in ('"', "'") and s[-1] in ('"', "'") and s[0] == s[-1]:
        return strip_quotes(s[1:-1])  # 递归去除多层引号
    return s


@dataclass
class BlockGraph:
    program_name: str
    section: str
    block_num: int
    # 该 block 下的 root 子 eclass 列表（每个 root 可能有多个子 eclass）
    root_children: List[str] = field(default_factory=list)
    # 选择的节点映射（eclass → enode_id）
    choices: Dict[str, str] = field(default_factory=dict)

    def add_root_children(self, children: List[str]) -> None:
        self.root_children.extend(children)
    
    def load_ordered_insts(self) -> List[str]:
        """从 eclass 目录读取对应的 txt 文件，按行顺序提取 class 标识符"""
        with open(f"{SATURATION_OUTPUT_DIR}/{self.program_name}/sections/{self.section}/basic_blocks_eclass/{self.block_num}.txt") as f:
            return [l.split(';')[-1].strip() for l in f if l.strip()]
    
    def sort_root_children(self) -> None:
        """按 eclass 文件中的行顺序排序 root_children"""
        order = self.load_ordered_insts()
        self.root_children.sort(key=lambda x: order.index(x) if x in order else len(order))


def find_solution_files(program_output_dir: Path) -> List[Path]:
    sol_dir = program_output_dir / 'sol'
    files: List[Path] = []
    if not sol_dir.exists():
        return files
    # 优先匹配 solution_*.sol，再匹配单个 solution.sol
    files.extend(sorted(sol_dir.glob('solution_*.sol')))
    single = sol_dir / 'solution.sol'
    if single.exists() and not files:
        files = [single]
    return files


def build_block_graphs(egraph: EGraph, choices: Dict[str, str], program_name: str) -> Dict[Tuple[str, int], BlockGraph]:
    """从已选 eclass→node 结果中，抽取各个 block 的 root，并记录其子 eclass。
    命名约定：root eclass 形如 "<section>_<block>_eclass_root"。
    """
    blocks: Dict[Tuple[str, int], BlockGraph] = {}
    for eclass_id, node_id in choices.items():
        # 仅处理 root eclass
        if not (eclass_id != 'eclass_root' and eclass_id.endswith('_root')):
            continue
        # 提取 section 与 block 号
        prefix = eclass_id.split('_eclass')[0]
        m = re.match(r'^(.*)_(\d+)$', prefix)
        if not m:
            continue
        section = m.group(1)
        block_num = int(m.group(2))

        # 读取 root 节点的子 eclass
        if node_id not in egraph.enodes:
            continue
        node = egraph.enodes[node_id]
        children = list(node.children) if node.children else []

        key = (section, block_num)
        if key not in blocks:
            blocks[key] = BlockGraph(program_name=program_name, section=section, block_num=block_num, choices=choices)
        blocks[key].add_root_children(children)

    return blocks


def ensure_output_structure(base_output_dir: Path, program_name: str) -> Tuple[Path, Path]:
    program_dir = base_output_dir / program_name
    rewrite_dir = program_dir / 'rewrite'
    program_dir.mkdir(parents=True, exist_ok=True)
    rewrite_dir.mkdir(parents=True, exist_ok=True)
    return program_dir, rewrite_dir


def load_merged_node_ops(program_name: str) -> Dict[str, str]:
    repo_root = Path(__file__).resolve().parents[2]
    merged_path = repo_root / 'saturation_output' / program_name / 'merged.json'
    if not merged_path.exists():
        return {}
    try:
        with open(merged_path, 'r') as f:
            data = json.load(f)
        nodes = data.get('nodes', {})
        return {k: v.get('op') for k, v in nodes.items() if isinstance(v, dict) and 'op' in v}
    except Exception:
        return {}


def emit_block_instructions(egraph: EGraph, bg: BlockGraph, node_ops: Dict[str, str]) -> List[str]:
    instructions: List[str] = []
    counter = [0]
    memo: Dict[str, str] = {}
    def norm_op(op: str) -> str:
        return str(op).lower()

    bg.sort_root_children()

    def emit(eclass_id: str) -> str:
        if eclass_id in memo:
            return memo[eclass_id]
        if eclass_id not in bg.choices:
            memo[eclass_id] = f"<missing:{eclass_id}>"
            return memo[eclass_id]
        node_id = bg.choices[eclass_id]
        if node_id not in egraph.enodes:
            memo[eclass_id] = f"<invalid:{node_id}>"
            return memo[eclass_id]
        node = egraph.enodes[node_id]
        op = node.op

        # 叶子：无子节点 → 原子值
        if not node.children:
            val = node_ops.get(node_id, op)
            val = norm_reg(strip_quotes(str(val)))
            memo[eclass_id] = val
            return val

        # 包装操作符
        if op == 'RegVal' and len(node.children) == 1:
            inner = emit(node.children[0])
            inner = norm_reg(strip_quotes(inner))
            memo[eclass_id] = inner
            return inner
        if op == 'ImmVal' and len(node.children) == 1:
            inner = emit(node.children[0])
            inner = strip_quotes(inner)
            memo[eclass_id] = inner
            return inner

        # 顺序节点：Seq2 仅用于保持先后顺序，不产生命令
        if op == 'Seq2' and node.children:
            last_val = ''
            for child in node.children:
                last_val = emit(child)
            memo[eclass_id] = last_val
            return last_val

        # 普通指令：先生成子操作数，再生成当前指令
        operands = [emit(child) for child in node.children]
        counter[0] += 1
        dest = f"op_{counter[0]}"
        op_print = norm_op(op)
        if op_print in INSTRUCTIONS_WITHOUT_RD:
            if operands:
                instructions.append(f"{op_print} {', '.join(operands)}")
            else:
                instructions.append(op_print)
        else:
            if operands:
                instructions.append(f"{op_print} {dest}, {', '.join(operands)}")
            else:
                instructions.append(f"{op_print} {dest}")
        memo[eclass_id] = dest
        return dest

    for child_eclass in bg.root_children:
        emit(child_eclass)
    return instructions


def main():
    import argparse

    parser = argparse.ArgumentParser(description="从 sol+EGraph 搭建每个 basic block 的数据结构与输出骨架")
    parser.add_argument(
        'program_name',
        help='程序名称（例如 bitcnts_small_O3）'
    )
    parser.add_argument(
        '--output',
        default=str(Path(__file__).resolve().parents[2] / 'ilp_output'),
        help='ilp_output 基础目录（默认：项目根下 ilp_output）'
    )

    args = parser.parse_args()
    base_output_dir = Path(args.output)
    program_dir, rewrite_dir = ensure_output_structure(base_output_dir, args.program_name)

    # 加载 EGraph
    egraph = EGraph(args.program_name)

    # 读取解文件
    sol_files = find_solution_files(program_dir)
    if not sol_files:
        print(f"错误：未在 {program_dir / 'sol'} 找到 solution*.sol")
        sys.exit(1)

    print(f"发现 {len(sol_files)} 个解文件")

    for idx, sol_file in enumerate(sol_files):
        print(f"处理解 {idx+1}: {sol_file}")
        variables = parse_solution_file(str(sol_file))
        choices = extract_solution(egraph, variables)
        blocks = build_block_graphs(egraph, choices, args.program_name)

        variant_dir = rewrite_dir / f"variant{idx + 1}"
        variant_dir.mkdir(parents=True, exist_ok=True)
        node_ops = load_merged_node_ops(args.program_name)
        # 生成每个 block 的指令
        for (section, block_num), bg in sorted(blocks.items(), key=lambda x: (x[0][0], x[0][1])):
            section_dir = variant_dir / section
            section_dir.mkdir(parents=True, exist_ok=True)
            block_file = section_dir / f"{block_num}.txt"
            asm = emit_block_instructions(egraph, bg, node_ops)
            with open(block_file, 'w') as f:
                for line in asm:
                    f.write(line)
                    f.write('\n')

    print(f"输出已生成：{rewrite_dir}")


if __name__ == '__main__':
    main()
