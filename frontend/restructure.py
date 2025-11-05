#!/usr/bin/env python3
"""
从 ILP 解(solution*.sol)与 EGraph 出发，
为每个 basic block 搭建结构化数据与输出目录骨架：

output/ilp/<program>/rewrite/variant{N}/<block>.txt

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
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "Extractor" / "src"))
from egraph import EGraph, ENode  # type: ignore
from ILP.ilp_solver import parse_solution_file, extract_solution  # type: ignore
from util import INSTRUCTIONS_WITHOUT_RD, RV32I_LOAD

# 路径配置
FRONTEND_OUTPUT_DIR = Path(__file__).resolve().parent.parent / "output" / "frontend"
ILP_OUTPUT_DIR = Path(__file__).resolve().parent.parent / "output" / "ilp"

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


# def reorder_instruction_args(op: str, child_ops: List[str]) -> List[str]:
#     """根据指令类型重新排列参数顺序
    
#     有些指令的汇编格式参数顺序和 egraph children 顺序不同：
#     - Store 指令 (sw, sh, sb, sd): children=[rs1, rs2, offset] -> asm: rs2, offset(rs1)

#     Args:
#         op: 指令名（小写）
#         child_ops: 子节点的操作数列表（按 egraph children 顺序）
    
#     Returns:
#         重新排序后的操作数列表（按汇编格式顺序）
#     """
#     # Store 指令: sw rs2, offset(rs1)
#     # children: [rs1, rs2, offset] -> [rs2, offset, rs1]
#     if op in ['sb', 'sh', 'sw']:
#         if len(child_ops) >= 3:
#             return [child_ops[1], child_ops[2], child_ops[0]]  # [rs2, offset, rs1]
    
#     # Branch 指令: beq rs1, rs2, label
#     # children 顺序已经和汇编格式一致: [rs1, rs2, label]，不需要交换
    
#     # Load 指令: lw rd, offset(rs1)
#     # children: [rs1, offset] -> 保持不变，但需要特殊格式化
#     # 这里只返回顺序，格式化在后面处理
    
#     # 其他指令保持原顺序
#     return child_ops


@dataclass
class BlockGraph:
    program_name: str
    block_num: int
    # 该 block 下的 root 子 eclass 列表（每个 root 可能有多个子 eclass）
    root_children: List[str] = field(default_factory=list)
    # 选择的节点映射（eclass → enode_id）
    choices: Dict[str, str] = field(default_factory=dict)
    # 存储子图中的所有 enode（enode_id -> ENode）
    enodes: Dict[str, 'ENode'] = field(default_factory=dict)
    # 存储子图中的所有 eclass（eclass_id -> set of enode_ids）
    eclasses: Dict[str, set] = field(default_factory=dict)
    # 父子关系映射（eclass_id -> list of parent enode_ids）
    parent_map: Dict[str, List[str]] = field(default_factory=dict)
    # 子节点映射（enode_id -> list of child eclass_ids in subgraph）
    children_map: Dict[str, List[str]] = field(default_factory=dict)
    # 原始 JSON 数据缓存
    _original_json: Dict = field(default_factory=dict)

    def add_root_children(self, children: List[str]) -> None:
        self.root_children.extend(children)
    
    def load_ordered_insts(self) -> List[str]:
        """从 eclass 目录读取对应的 txt 文件，按行顺序提取 class 标识符"""
        with open(f"{FRONTEND_OUTPUT_DIR}/{self.program_name}/basic_blocks_eclass/{self.block_num}.txt") as f:
            return [l.split(';')[-1].strip() for l in f if l.strip()]
    
    def load_original_instructions(self) -> Dict[str, str]:
        """从原始 basic_blocks 和 eclass 文件中提取每个 eclass 对应的原始 rd 寄存器
        
        Returns:
            Dict[eclass_id, rd]: eclass -> 原始指令的 rd 寄存器名（已 norm）
        """
        eclass_file = f"{FRONTEND_OUTPUT_DIR}/{self.program_name}/basic_blocks_eclass/{self.block_num}.txt"
        original_file = f"{FRONTEND_OUTPUT_DIR}/{self.program_name}/basic_blocks/{self.block_num}.txt"
        
        eclass_to_rd = {}
        prefix = f"{self.program_name}_{self.block_num}_eclass_"
        
        try:
            with open(eclass_file, 'r') as f:
                eclass_lines = [l.strip() for l in f if l.strip()]
            
            with open(original_file, 'r') as f:
                original_lines = [l.strip() for l in f if l.strip()]
            
            # 逐行匹配
            for i, (eclass_line, original_line) in enumerate(zip(eclass_lines, original_lines)):
                # 提取 eclass 标识符（如 "Inst-6"）
                if ';' not in eclass_line:
                    continue
                eclass_short = eclass_line.split(';')[-1].strip()
                full_eclass_id = prefix + eclass_short.replace('-', '_')
                
                # 如果有多个相同的 eclass，以第一个为准
                if full_eclass_id in eclass_to_rd:
                    continue
                
                # 解析原始指令，提取 rd（第一个操作数）
                # 格式如: "addi a5, a0, 0" 或 "lw a0, 8(sp)" 或 "addi a5,a0,0" (无空格)
                parts = original_line.split()
                if len(parts) >= 2:
                    # 第一个是指令，第二个通常是 rd（可能带逗号）
                    # 处理无空格格式：取第一个逗号之前的部分
                    rd_raw = parts[1].split(',')[0]
                    # 应用 norm_reg
                    rd_normed = norm_reg(rd_raw)
                    eclass_to_rd[full_eclass_id] = rd_normed
        
        except FileNotFoundError:
            pass  # 如果文件不存在，返回空字典
        
        return eclass_to_rd
    
    def load_free_registers(self) -> List[str]:
        """从liveness.json加载该block的空闲寄存器列表
        
        Returns:
            按优先级排序的空闲寄存器列表 (t寄存器 > a寄存器 > 其他)
        """
        liveness_file = f"{FRONTEND_OUTPUT_DIR}/{self.program_name}/liveness.json"
        
        try:
            with open(liveness_file, 'r') as f:
                liveness_data = json.load(f)
            
            # 获取该block的空闲寄存器
            block_key = str(self.block_num)
            if block_key in liveness_data:
                free_regs = liveness_data[block_key].get('FREE_at_exit', [])
                
                # 分类寄存器
                t_regs = []
                a_regs = []
                other_regs = []
                
                for reg in free_regs:
                    if reg.startswith('t'):
                        t_regs.append(reg)
                    elif reg.startswith('a'):
                        a_regs.append(reg)
                    else:
                        other_regs.append(reg)
                
                # 按优先级排序：t > a > other
                # 每个类别内部按名称排序
                sorted_regs = sorted(t_regs) + sorted(a_regs) + sorted(other_regs)
                return sorted_regs
        
        except (FileNotFoundError, json.JSONDecodeError, KeyError):
            pass  # 如果文件不存在或格式错误，返回空列表
        
        return []
    
    def sort_root_children(self) -> None:
        """按 eclass 文件中的行顺序排序 root_children"""
        order = self.load_ordered_insts()
        # 构建完整 eclass_id 到顺序的映射
        prefix = f"{self.program_name}_{self.block_num}_eclass_"
        order_map = {}
        for i, ec in enumerate(order):
            # 将 Inst-6 转换为 dijkstra_small_O3_2_eclass_Inst_6
            full_eclass_id = prefix + ec.replace('-', '_')
            order_map[full_eclass_id] = i
        
        self.root_children.sort(key=lambda x: order_map.get(x, 999999))
    
    def add_enode(self, enode: 'ENode') -> None:
        """添加一个 enode 到子图中"""
        self.enodes[enode.enode_id] = enode
        # 更新 eclass 成员
        if enode.eclass_id not in self.eclasses:
            self.eclasses[enode.eclass_id] = set()
        self.eclasses[enode.eclass_id].add(enode.enode_id)
        # 更新父子关系（反向映射）
        for child_eclass in enode.children:
            if child_eclass not in self.parent_map:
                self.parent_map[child_eclass] = []
            self.parent_map[child_eclass].append(enode.enode_id)
        # 初始化子节点映射（先存储所有 children，后续会过滤）
        self.children_map[enode.enode_id] = list(enode.children)
    
    def build_subgraph(self, egraph: 'EGraph') -> None:
        """从 egraph 和 choices 中构建完整的子图结构"""
        # BFS 遍历所有被选中的节点
        visited = set()
        queue = []
        
        # 从 root_children 开始
        for eclass_id in self.root_children:
            if eclass_id in self.choices:
                queue.append(eclass_id)
        
        while queue:
            current_eclass = queue.pop(0)
            if current_eclass in visited:
                continue
            visited.add(current_eclass)
            
            # 获取选中的 enode
            if current_eclass not in self.choices:
                continue
            enode_id = self.choices[current_eclass]
            if enode_id not in egraph.enodes:
                continue
            
            # 添加 enode 到子图
            enode = egraph.enodes[enode_id]
            self.add_enode(enode)
            
            # 将子节点加入队列
            for child_eclass in enode.children:
                if child_eclass not in visited:
                    queue.append(child_eclass)
        
        # 过滤 children_map，只保留在子图中实际存在的 children
        self._filter_children_map()
    
    def _filter_children_map(self) -> None:
        """过滤 children_map，只保留在子图中实际存在的 eclass"""
        for enode_id in self.children_map:
            # 过滤出在子图中实际存在的 children
            filtered_children = [
                child_eclass for child_eclass in self.children_map[enode_id]
                if child_eclass in self.eclasses
            ]
            self.children_map[enode_id] = filtered_children
    
    def verify_reachability(self) -> Dict[str, any]:
        """验证该 block 中所有被选中的节点是否都从 root 可达
        
        返回验证结果字典：
        {
            'total_selected': int,  # 该 block 中被选中的总节点数
            'reachable': int,       # 从 root 可达的节点数
            'unreachable': int,     # 不可达的节点数
            'unreachable_eclasses': list,  # 不可达的 eclass 列表
            'is_valid': bool        # 是否所有节点都可达
        }
        """
        # 1. 找出该 block 中所有被选中的 eclass
        prefix = f"{self.program_name}_{self.block_num}_"
        selected_eclasses = set()
        for eclass_id in self.choices.keys():
            # 跳过全局 root 和其他 block 的节点
            if eclass_id.startswith(prefix) and not eclass_id.endswith('_eclass_root'):
                selected_eclasses.add(eclass_id)
        
        # 2. 找出从 root 可达的 eclass（就是当前子图中的 eclass）
        reachable_eclasses = set(self.eclasses.keys())
        
        # 3. 找出不可达的 eclass
        unreachable_eclasses = selected_eclasses - reachable_eclasses
        
        return {
            'total_selected': len(selected_eclasses),
            'reachable': len(reachable_eclasses),
            'unreachable': len(unreachable_eclasses),
            'unreachable_eclasses': sorted(list(unreachable_eclasses)),
            'is_valid': len(unreachable_eclasses) == 0
        }
    
    def load_original_json(self) -> None:
        """加载 merged.json 以获取 leaf 节点的实际值"""
        if self._original_json:
            return  # 已加载
        
        # 直接加载 merged.json，它保留了原始的 op 值
        json_file = FRONTEND_OUTPUT_DIR / self.program_name / "merged.json"
        if json_file.exists():
            with open(json_file, 'r') as f:
                data = json.load(f)
                self._original_json = data.get('nodes', {})
    
    def get_leaf_value(self, enode_id: str) -> str:
        """从 merged.json 获取 leaf 节点的实际值"""
        # 确保已加载 merged.json
        self.load_original_json()
        
        # merged.json 中的 key 就是完整的 enode_id，直接查询即可！
        if enode_id in self._original_json:
            op_value = self._original_json[enode_id].get('op', '')
            # 去除引号（如果有的话）
            return strip_quotes(op_value)
        
        # 如果找不到，返回提取的后缀作为后备
        return enode_id.split('_')[-1] if '_' in enode_id else enode_id
    
    
    def generate_rewrite_output(self, egraph: 'EGraph', output_dir: Path) -> None:
        """生成重写后的指令文件
        
        通过后序遍历 root_children，为每个节点分配 op_n 编号，并输出到文件
        
        Args:
            egraph: EGraph 对象（用于获取原始操作符信息）
            output_dir: 输出目录路径
        """
        # 加载原始 JSON 数据
        self.load_original_json()
        
        # 加载原始指令的 rd 映射
        eclass_to_original_rd = self.load_original_instructions()
        
        # 按照 eclass 文件中的顺序排序 root_children
        self.sort_root_children()
        
        # 创建输出目录
        rewrite_dir = output_dir / self.program_name / "basic_blocks_rewrite"
        rewrite_dir.mkdir(parents=True, exist_ok=True)
        
        # 输出文件路径
        output_file = rewrite_dir / f"{self.block_num}.txt"
        
        # 用于存储指令序列
        instructions = []
        
        # 用于为每个 eclass 分配 op_n 编号
        op_counter = 0
        eclass_to_op = {}  # eclass_id -> op_n 或原始 rd
        
        # 获取 eclass 顺序映射
        eclass_order = self.load_ordered_insts()
        # 构建完整 eclass_id 到顺序的映射
        # eclass_order 中是 "Inst-6" 格式，需要转换为完整 ID
        prefix = f"{self.program_name}_{self.block_num}_eclass_"
        eclass_order_map = {}
        eclass_in_file = set()  # 记录哪些 eclass 在原始文件中出现
        for i, ec in enumerate(eclass_order):
            # 将 Inst-6 转换为 dijkstra_small_O3_2_eclass_Inst_6
            full_eclass_id = prefix + ec.replace('-', '_')
            eclass_order_map[full_eclass_id] = i
            eclass_in_file.add(full_eclass_id)
        
        
        # 后序遍历辅助函数
        def postorder_traverse(eclass_id: str, visited: set) -> None:
            """后序遍历并生成指令"""
            nonlocal op_counter
            
            if eclass_id in visited:
                return
            visited.add(eclass_id)
            
            # 获取选中的 enode
            if eclass_id not in self.choices:
                return
            enode_id = self.choices[eclass_id]
            if enode_id not in self.enodes:
                return
            
            enode = self.enodes[enode_id]
            
            # 递归处理所有子节点（后序遍历）
            # 使用 children_map 而不是 enode.children，确保只遍历子图中实际存在的节点
            child_ops = []
            for child_eclass in self.children_map.get(enode_id, []):
                postorder_traverse(child_eclass, visited)
                # 记录子节点的 op 编号
                if child_eclass in eclass_to_op:
                    child_ops.append(eclass_to_op[child_eclass])
            
            # 获取操作符名称
            op = enode.op.lower()
            
            # 处理 leaf 节点（获取实际值）
            if op == 'leaf':
                # 从原始 JSON 中获取实际值
                leaf_value = self.get_leaf_value(enode_id)
                # 如果是寄存器名，应用 norm_reg
                leaf_value_normed = norm_reg(leaf_value)
                eclass_to_op[eclass_id] = leaf_value_normed
                return
            
            # 处理 RegVal、ImmVal、ImmLabel（包装值）
            if op in ['regval', 'immval', 'immlabel']:
                # 这些节点的子节点应该是 leaf，获取其值
                if child_ops:
                    # 如果是 regval，应用 norm_reg
                    if op == 'regval':
                        eclass_to_op[eclass_id] = norm_reg(child_ops[0])
                    else:
                        eclass_to_op[eclass_id] = child_ops[0]
                else:
                    eclass_to_op[eclass_id] = f"<{op}>"
                return
            
            # 重新排列参数顺序（根据指令类型）
            # reordered_ops = reorder_instruction_args(op, child_ops)
            
            
            # 构建汇编指令字符串（格式对齐，与原始 .s 文件一致）
            # INSTRUCTIONS_WITHOUT_RD 中存储的是小写指令名
            if op in INSTRUCTIONS_WITHOUT_RD:
                # 不需要 rd 的指令（如 Store、Branch）
                if op in ['sb', 'sh', 'sw'] and len(child_ops) >= 3:
                    # Store 指令特殊格式: sw rs2, offset(rs1)
                    inst_str = f"{op}\t{child_ops[1]},{child_ops[2]}({child_ops[0]})"
                elif child_ops:
                    # 其他不需要 rd 的指令（Branch等）
                    inst_str = f"{op}\t{','.join(child_ops)}"
                else:
                    inst_str = f"{op}"
                instructions.append(inst_str)
            else:
                # 需要 rd 的指令
                # 如果 eclass 在原始文件中存在，使用原始的 rd
                if eclass_id in eclass_to_original_rd:
                    current_op = eclass_to_original_rd[eclass_id]
                else:
                    # 否则生成新的 op_n
                    current_op = f"op_{op_counter}"
                    op_counter += 1
                
                eclass_to_op[eclass_id] = current_op
                
                # Load 指令特殊格式: lw rd, offset(rs1)
                # children: [rs1, offset] -> 保持不变
                if op in RV32I_LOAD and len(child_ops) >= 2:
                    inst_str = f"{op}\t{current_op},{child_ops[1]}({child_ops[0]})"
                elif child_ops:
                    # 其他需要 rd 的指令
                    inst_str = f"{op}\t{current_op},{','.join(child_ops)}"
                else:
                    inst_str = f"{op}\t{current_op}"
                
                instructions.append(inst_str)
        
        # 按照 eclass 文件的顺序处理所有指令
        visited = set()
        
        # 按照 eclass 文件顺序处理每个指令
        for ec_short in eclass_order:
            full_eclass_id = prefix + ec_short.replace('-', '_')
            
            # 如果这个 eclass 在子图中
            if full_eclass_id in self.eclasses:
                # 后序遍历生成指令（包括所有依赖）
                postorder_traverse(full_eclass_id, visited)
        
        # 替换所有 op_n 为实际的空闲寄存器
        instructions = self._replace_temp_regs_with_free_regs(instructions)
        
        # 将 x0 替换为 zero（RISC-V 别名）
        # 使用正则表达式确保只替换寄存器名 x0，不影响其他内容
        instructions = [re.sub(r'\bx0\b', 'zero', inst) for inst in instructions]
        
        # 写入文件
        with open(output_file, 'w') as f:
            for inst in instructions:
                f.write(inst + '\n')
        
        return len(instructions)
    
    def _replace_temp_regs_with_free_regs(self, instructions: List[str]) -> List[str]:
        """将指令中的 op_n 替换为实际的空闲寄存器
        
        Args:
            instructions: 原始指令列表（可能包含 op_0, op_1 等临时寄存器）
        
        Returns:
            替换后的指令列表
        """
        # 加载空闲寄存器
        free_regs = self.load_free_registers()
        
        if not free_regs:
            # 如果没有空闲寄存器信息，直接返回原指令
            return instructions
        
        # 找出所有的 op_n 模式
        op_pattern = re.compile(r'\bop_(\d+)\b')
        op_to_reg = {}  # op_n -> 实际寄存器
        free_reg_index = 0
        
        # 第一遍：收集所有需要替换的 op_n
        for inst in instructions:
            matches = op_pattern.findall(inst)
            for op_num in matches:
                op_name = f"op_{op_num}"
                if op_name not in op_to_reg:
                    # 分配一个新的空闲寄存器
                    if free_reg_index < len(free_regs):
                        op_to_reg[op_name] = free_regs[free_reg_index]
                        free_reg_index += 1
                    else:
                        # 空闲寄存器用完了，保持原样
                        op_to_reg[op_name] = op_name
        
        # 第二遍：替换所有 op_n
        replaced_instructions = []
        for inst in instructions:
            # 替换所有 op_n
            replaced_inst = inst
            for op_name, reg_name in sorted(op_to_reg.items(), key=lambda x: -int(x[0].split('_')[1])):
                # 从大到小替换，避免 op_1 被替换成 op_10 的一部分
                replaced_inst = re.sub(r'\b' + re.escape(op_name) + r'\b', reg_name, replaced_inst)
            replaced_instructions.append(replaced_inst)
        
        return replaced_instructions


def build_block_graphs(egraph: EGraph, choices: Dict[str, str]) -> Dict[Tuple[str, int], BlockGraph]:
    """从已选 eclass→node 结果中，抽取各个 block 的 root，并记录其子 eclass。
    命名约定：root eclass 形如 "<program_name>_<block>_eclass_root"。
    """
    blocks: Dict[Tuple[str, int], BlockGraph] = {}
    for eclass_id, node_id in choices.items():
        # 仅处理 root eclass
        if not eclass_id.endswith('_eclass_root'):
            continue
        # 提取 program_name 与 block 号
        prefix = eclass_id.split('_eclass_root')[0]
        m = re.match(r'^(.*)_(\d+)$', prefix)
        if not m:
            continue
        current_program_name = m.group(1)
        block_num = int(m.group(2))
        # 读取 root 节点的子 eclass
        if node_id not in egraph.enodes:
            continue
        node = egraph.enodes[node_id]
        children = list(node.children) if node.children else []

        key = (current_program_name, block_num)
        if key not in blocks:
            blocks[key] = BlockGraph(program_name=current_program_name, block_num=block_num, choices=choices)
        blocks[key].add_root_children(children)

    # 为每个 block 构建完整的子图结构
    for block_graph in blocks.values():
        block_graph.build_subgraph(egraph)

    return blocks



def main():
    """主函数：从 ILP 解生成重写后的基本块"""
    import argparse
    
    parser = argparse.ArgumentParser(description='从 ILP 解生成重写后的基本块')
    parser.add_argument('program_name', help='程序名 (如 dijkstra_small_O3)')
    parser.add_argument('-v', '--verbose', action='store_true', help='详细输出')
    args = parser.parse_args()
    
    program_name = args.program_name
    verbose = args.verbose
    
    if verbose:
        print("="*60)
        print(f"生成重写后的基本块: {program_name}")
        print("="*60)
    
    # 加载 EGraph
    if verbose:
        print("\n加载 EGraph...")
    egraph = EGraph(program_name)
    if verbose:
        print(f"  - EClasses: {len(egraph.eclasses)}, ENodes: {len(egraph.enodes)}")
    
    # 加载 solution 文件
    sol_path = ILP_OUTPUT_DIR / program_name / "sol" / "solution.sol"
    if not sol_path.exists():
        print(f"错误：找不到 solution 文件: {sol_path}")
        sys.exit(1)
    
    if verbose:
        print(f"\n加载 solution: {sol_path}")
    
    variables = parse_solution_file(str(sol_path))
    choices = extract_solution(egraph, variables)
    
    # 构建 BlockGraph
    blocks = build_block_graphs(egraph, choices)
    
    # 生成重写输出
    print(f"\n生成重写后的指令文件...")
    total_instructions = 0
    for (prog_name, block_num), block_graph in sorted(blocks.items()):
        num_instructions = block_graph.generate_rewrite_output(egraph, FRONTEND_OUTPUT_DIR)
        total_instructions += num_instructions
        if verbose:
            print(f"  Block {block_num}: {num_instructions} 条指令")
    
    rewrite_dir = FRONTEND_OUTPUT_DIR / program_name / "basic_blocks_rewrite"
    print(f"✓ 生成 {len(blocks)} 个块，共 {total_instructions} 条指令")
    print(f"✓ 输出目录: {rewrite_dir}")
    
    return 0


if __name__ == "__main__":
    sys.exit(main())
