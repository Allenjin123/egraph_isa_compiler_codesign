import sys
import json
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Tuple, Set

sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "Extractor" / "src"))
from egraph import EGraph, ENode 
from ILP.ilp_solver import parse_solution_file, extract_solution  
from util import INSTRUCTIONS_WITHOUT_RD, RV32I_LOAD, ALL_ABI_REGS, parse_instruction, format_instruction, SPECIAL_REGS
from reg_alloc import allocate_compact_mapping
from mextension import replace_m_extension
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


def get_eclass_to_rd(program_name: str, block_num: int) -> List[Tuple[str, str]]:
    """从 eclass 文件中按顺序提取每个 eclass 对应的原始 rd 寄存器名（已 norm）
    
    返回: List[(eclass_id, rd), ...]，按文件行顺序，相同 eclass 不覆盖
    例如: [
        ("dijkstra_small_O3_17_eclass_Inst_5", "a6"),
        ("dijkstra_small_O3_17_eclass_Inst_7", "a3"),
        ("dijkstra_small_O3_17_eclass_Inst_7", "t1"),  # 第二次出现 Inst-7
        ...
    ]
    """
    eclass_file = FRONTEND_OUTPUT_DIR / program_name / "basic_blocks_eclass" / f"{block_num}.txt"
    prefix = f"{program_name}_{block_num}_eclass_"
    result = []
    
    with open(eclass_file, 'r') as f:
        for line in f:
            line = line.strip()
            if not line or ';' not in line:
                continue
            
            # 解析: "addi a5_0, a0_0, 0; Inst-6"
            inst_text = line.split(';')[0].strip()
            eclass_short = line.split(';')[-1].strip()  # "Inst-6"
            eclass_full = prefix + eclass_short.replace('-', '_')  # "dijkstra_small_O3_17_eclass_Inst_6"
            
            # 提取 rd（第一个操作数）
            parts = inst_text.split()
            if len(parts) >= 2:
                inst_op = parts[0].lower()  # 指令名
                # 检查是否是有 rd 的指令（不在 INSTRUCTIONS_WITHOUT_RD 中）
                if inst_op not in INSTRUCTIONS_WITHOUT_RD:
                    rd_raw = parts[1].rstrip(',')  # "a5_0," -> "a5_0"
                    rd = norm_reg(rd_raw)  # "a5_0" -> "a5"
                    result.append((eclass_full, rd))
                else:
                    result.append((eclass_full, None))
    
    return result


def extract_def_use(inst_line: str) -> Tuple[Set[str], Set[str]]:
    """提取一条指令的 def 和 use 寄存器
    
    Returns:
        (def_regs, use_regs) - 两个集合，包含定义和使用的寄存器
    """
    mnemonic, operands = parse_instruction(inst_line)
    if not mnemonic:
        return set(), set()
    
    mnemonic = mnemonic.lower()
    def_regs = set()
    use_regs = set()
    
    # 规范化操作数（去除下标）
    norm_operands = [norm_reg(op) for op in operands if norm_reg(op) in ALL_ABI_REGS]
    
    # 没有 rd 的指令（store, branch, etc.）
    if mnemonic in INSTRUCTIONS_WITHOUT_RD:
        # 所有操作数都是 use
        use_regs = set(norm_operands)
    else:
        # 有 rd 的指令：第一个操作数是 def，其他是 use
        if norm_operands:
            def_regs = {norm_operands[0]}
            use_regs = set(norm_operands[1:])
    
    return def_regs, use_regs


def compute_free_regs_per_line(program_name: str, block_num: int) -> List[List[str]]:
    """计算每行指令可用的 free 寄存器列表
    
    从后向前遍历 basic block，根据 def/use 计算每行可用的临时寄存器。
    
    算法：
    1. 从 liveness.json 读取 FREE_at_exit（块出口处不活跃的寄存器）
    2. 读取 basic_blocks 中的每一行指令
    3. 从最后一行开始向前遍历：
       - 每行可用的 free_regs = 当前活跃的 free_regs - 该行的 use
       - 处理完该行后，更新活跃集合：移除该行的 def，添加该行的 use
    
    Returns:
        List[List[str]]: 每行可用的 free_regs 列表，按原始顺序（第0行到第n行）
    """
    results = {'free_regs_per_line': [], 'defs_uses_per_line': []}
    # 1. 读取 liveness.json 中的 FREE_at_exit
    liveness_file = FRONTEND_OUTPUT_DIR / program_name / "liveness.json"
    with open(liveness_file, 'r') as f:
        liveness_data = json.load(f)
    
    block_key = str(block_num)
    if block_key not in liveness_data:
        # 如果没有 liveness 信息，返回默认值
        return []
    
    free_at_exit = liveness_data[block_key].get('FREE_at_exit', [])
    # 过滤出以 t 和 a 开头的寄存器
    free_at_exit = [reg for reg in free_at_exit if reg.startswith(('t', 'a'))]
    
    # 2. 读取 basic block 的每一行指令
    block_file = FRONTEND_OUTPUT_DIR / program_name / "basic_blocks" / f"{block_num}.txt"
    with open(block_file, 'r') as f:
        lines = [line.rstrip('\n') for line in f]
    
    # 移除空行
    lines = [line for line in lines if line.strip()]
    
    if not lines:
        return []
    
    # 3. 从后向前遍历，计算每行的 free_regs
    num_lines = len(lines)
    free_regs_per_line = [[] for _ in range(num_lines)]
    defs_uses_per_line = [(set(), set()) for _ in range(num_lines)]
    # 从最后一行开始
    last_line = set(free_at_exit)
    for i in range(num_lines - 1, -1, -1):
        line = lines[i]
        def_regs, use_regs = extract_def_use(line)
        
        # 当前行可用的 free_regs = last_line - use[i] + last_def_regs
        free_set = (last_line  | def_regs) - use_regs
        free_regs_per_line[i] = sorted(free_set)
        defs_uses_per_line[i] = (def_regs, use_regs)
        last_line = free_set
    results['free_regs_per_line'] = free_regs_per_line
    results['defs_uses_per_line'] = defs_uses_per_line
    return results

@dataclass
class GraphNode:
    """图中的一个节点"""
    enode_id: str          # enode 唯一标识
    eclass_id: str         # 所属 eclass
    op: str                # 操作符
    children: List[str]    # 子节点 eclass_id 列表
    rd: str = None         # 分配的寄存器


class BlockGraph:
    def __init__(self, program_name: str, block_num: int, egraph: EGraph, choices: Dict[str, str]):
        self.program_name = program_name
        self.block_num = block_num
        self.egraph = egraph
        self.choices = choices  # eclass_id -> enode_id (ILP solution)
        self.root_eclass_id = []
        # self.nodes: List[GraphNode] = [] 
        self.eclasses_to_nodes: Dict[str, GraphNode] = {} 
        self.merged_data: Dict = {}  # merged.json 数据
        
    def load_merged_json(self):
        """加载 merged.json"""
        json_file = FRONTEND_OUTPUT_DIR / self.program_name / "merged.json"
        if json_file.exists():
            with open(json_file, 'r') as f:
                data = json.load(f)
                self.merged_data = data.get('nodes', {})
    
    def get_leaf_value(self, enode_id: str) -> str:
        """获取 leaf 节点的实际值"""
        if enode_id in self.merged_data:
            op =  strip_quotes(self.merged_data[enode_id].get('op', ''))
            if norm_reg(op) in ALL_ABI_REGS:
                return norm_reg(op)
            else:
                return op
        else:
            raise ValueError(f"Enode {enode_id} not found in merged.json")
    
    def load_root_eclass(self):
        """从 choices 中找到 root 节点，提取其子 eclass"""
        root_key = f"{self.program_name}_{self.block_num}_eclass_root"
        
        if root_key in self.choices:
            root_enode_id = self.choices[root_key]
            if root_enode_id in self.egraph.enodes:
                root_enode = self.egraph.enodes[root_enode_id]
                self.root_eclass_id = list(root_enode.children)
    
    def build_graph(self):
        """构建图：从 root 开始递归添加所有依赖节点"""
        self.load_merged_json()
        self.load_root_eclass()
        visited = set()
        for eclass_id in self.root_eclass_id:
            self._add_node_recursive(eclass_id, visited)
    
    def _add_node_recursive(self, eclass_id: str, visited: Set[str]):
        """递归添加节点"""
        if eclass_id in visited or eclass_id not in self.choices:
            return
        visited.add(eclass_id)
        
        enode_id = self.choices[eclass_id]
        if enode_id not in self.egraph.enodes:
            return
        
        enode = self.egraph.enodes[enode_id]
        
        # 如果是 leaf 节点，获取实际值作为 op
        if enode.op.lower() == 'leaf':
            op = self.get_leaf_value(enode_id)
        else:
            op = enode.op.lower()
        
        # 如果是包装节点（ImmVal, ImmLabel, RegVal），跳过它，直接处理其唯一子节点
        if op in ['immval', 'immlabel', 'regval']:
            if enode.children:
                self._add_node_recursive(enode.children[0], visited)
            return
        
        # 处理子节点：如果是包装节点，unwrap 一层
        children = list(enode.children)
        for i, child in enumerate(children):
            if child in self.choices:
                child_enode = self.egraph.enodes[self.choices[child]]
                if child_enode.op.lower() in ['immval', 'immlabel', 'regval']:
                    if child_enode.children:
                        children[i] = child_enode.children[0]
        
        # 创建节点
        node = GraphNode(
            enode_id=enode_id,
            eclass_id=eclass_id,
            op=op,
            children=children
        )
        self.eclasses_to_nodes[eclass_id] = node
        
        # 递归处理子节点
        for child_eclass in children:
            self._add_node_recursive(child_eclass, visited)

class RewriteBlock:
    def __init__(self, program_name: str, block_num: int, egraph: EGraph, choices: Dict[str, str]):
        self.program_name = program_name
        self.block_num = block_num
        self.block_graph = BlockGraph(program_name, block_num, egraph, choices)
        self.block_graph.build_graph()
        self.lines: List[str] = []
        self.eclass_to_rd_list: List[Tuple[str, str]] = get_eclass_to_rd(program_name, block_num)
        self.block_lines: List[List[str]] = [[] for _ in range(len(self.eclass_to_rd_list))]
        self.placeholder_block_lines: List[List[str]] = [[] for _ in range(len(self.block_lines))]
        self.placeholder_lines: List[str] = []
        self.eclass_to_rd_map: Dict[str, str] = {}  # 初始化为空，走一行更新一行
        self.stack_per_line: List[Dict[str, List[str]]] = [{"push": [], "pop": []} for _ in range(len(self.block_lines))]
        # 计算每行可用的 free_regs
        self.free_regs_per_line: List[List[str]] = compute_free_regs_per_line(program_name, block_num)['free_regs_per_line']
        self.defs_uses_per_line: List[Tuple[Set[str], Set[str]]] = compute_free_regs_per_line(program_name, block_num)['defs_uses_per_line']
        self.free_regs: List[str] = []
        self.temp_counter: int = 0  # 临时寄存器计数器
        self.current_line_idx: int = 0  # 当前处理的行索引

    def get_placeholder_reg(self) -> str:
        """获取一个可用的寄存器
        
        生成占位符：op_<temp_counter>
        """
        placeholder = f"op_{self.temp_counter}"
        self.temp_counter += 1
        return placeholder
            
    def rewrite_line(self, eclass_id: str, rd: str, line_idx: int):
        """以 eclass_id 展开后序遍历，生成指令，最后更新 rd
        
        Args:
            eclass_id: 要处理的 eclass ID
            rd: 这个 eclass 应该写入的目标寄存器
        """
        # 获取这个 eclass 对应的节点
        if eclass_id not in self.block_graph.eclasses_to_nodes:
            raise ValueError(f"Eclass {eclass_id} not found in block graph")
        node = self.block_graph.eclasses_to_nodes[eclass_id]
        
        # 特殊处理 Seq2：展开为多条指令，不生成 seq2 本身
        if node.op == 'seq2':
            # Seq2 有两个子节点，顺序执行
            for i, child_eclass in enumerate(node.children):

                child_node = self.block_graph.eclasses_to_nodes.get(child_eclass)
                if child_node and child_node.op not in INSTRUCTIONS_WITHOUT_RD:
                    self.rewrite_line(child_eclass, rd, line_idx)
                else:
                    # 不需要 rd（如分支指令），使用 None
                    self.rewrite_line(child_eclass, None, line_idx)
            return
        
        # 递归处理所有子节点（后序遍历）
        child_operands = []
        for child_eclass in node.children:
            # 检查子节点是否在图中
            if child_eclass not in self.block_graph.eclasses_to_nodes:
                raise ValueError(f"Child eclass {child_eclass} not found in block graph")
            
            # 如果子节点已经处理过，直接使用其 rd
            if child_eclass in self.eclass_to_rd_map:
                child_operands.append(self.eclass_to_rd_map[child_eclass])
                continue
            
            child_node = self.block_graph.eclasses_to_nodes[child_eclass]
            if child_node.children:
                # 有子节点，需要递归生成指令
                if child_node.op not in INSTRUCTIONS_WITHOUT_RD:
                    child_rd = self.get_placeholder_reg()  
                else:
                    child_rd = None
                self.rewrite_line(child_eclass, child_rd, line_idx)
                # self.eclass_to_rd_map[child_eclass] = child_rd 展开的指令暂时不记录
                child_operands.append(child_rd)
            else:
                # leaf 节点，直接使用其 op 值
                child_operands.append(child_node.op)
        
        # 生成指令
        inst_str = format_instruction(node.op, rd, child_operands)
        self.block_lines[line_idx].append(inst_str)

    def rewrite_block(self):
        """重写整个 block，按顺序处理每一行"""
        for line_idx, (eclass_id, rd) in enumerate(self.eclass_to_rd_list):
            if eclass_id in self.block_graph.eclasses_to_nodes:
                # 设置当前行索引和可用的 free_regs
                self.current_line_idx = line_idx
                self.temp_counter = 0  # 重置临时寄存器计数器
                
                if line_idx < len(self.free_regs_per_line):
                    self.free_regs = self.free_regs_per_line[line_idx]
                else:
                    raise ValueError(f"Line {line_idx} has no free registers")
                
                # 处理这一行
                live_out = set()
                for use in self.defs_uses_per_line[line_idx][1]:
                    if use not in self.free_regs_per_line[line_idx]:
                        live_out.add(use)
                self.rewrite_line(eclass_id, rd, line_idx)
                self.placeholder_block_lines[line_idx] = list(self.block_lines[line_idx])
                self.replace_placeholders(line_idx, live_out)
                # 更新映射
                self.eclass_to_rd_map[eclass_id] = rd
            else:
                # 不在图中的 eclass，说明图构建有问题
                raise ValueError(f"Eclass {eclass_id} from file not found in block graph")

        self.merge_lines()

    def replace_placeholders(self, line_idx: int, live_out: Set[str]):
        """替换占位符为借用的寄存器或使用寄存器分配算法"""
        lines = self.block_lines[line_idx]
        if not lines:
            return
        
        # 找到所有占位符
        all_text = ' '.join(lines)
        placeholders = re.findall(r'op_(\d+)', all_text)
        if not placeholders:
            return
        
        # 调用寄存器分配算法
        mapping, m = allocate_compact_mapping(lines, live_out)
        
        # 收集 mapping 中直接使用的真实寄存器（需要避免借用这些）
        used_real_regs = set()
        for op_name, allocated in mapping.items():
            if not allocated.startswith('op_'):
                used_real_regs.add(allocated)
        
        # 从 free_regs 中排除已被直接使用的寄存器
        available_free_regs = [r for r in self.free_regs if r not in used_real_regs]
        
        # 计算需要借用的寄存器数量（虚拟寄存器的数量）
        num_virtual = m + 1 if m >= 0 else 0
        num_available = len(available_free_regs)
        num_needed = max(0, num_virtual - num_available)
        
        if num_needed > 0:
            # 需要借用寄存器（避开已使用的真实寄存器）
            borrowed_regs, push_stack, pop_stack = self.allocate_registers(num_needed, used_real_regs)
            
            # 构建最终的寄存器映射：op_k -> 真实寄存器
            final_mapping = {}
            for op_name, allocated in mapping.items():
                if allocated.startswith('op_'):
                    # 虚拟寄存器，分配到 available_free_regs 或 borrowed_regs
                    op_num = int(allocated.split('_')[1])
                    if op_num < num_available:
                        final_mapping[op_name] = available_free_regs[op_num]
                    else:
                        final_mapping[op_name] = borrowed_regs[op_num - num_available]
                else:
                    # 已经是真实寄存器
                    final_mapping[op_name] = allocated
            
            # 记录栈操作
            self.stack_per_line[line_idx]["push"] = push_stack
            self.stack_per_line[line_idx]["pop"] = pop_stack
        else:
            # 不需要借用寄存器
            final_mapping = {}
            for op_name, allocated in mapping.items():
                if allocated.startswith('op_'):
                    # 虚拟寄存器，分配到 available_free_regs
                    op_num = int(allocated.split('_')[1])
                    final_mapping[op_name] = available_free_regs[op_num]
                else:
                    # 已经是真实寄存器
                    final_mapping[op_name] = allocated
        
        # 替换所有占位符
        for i, line in enumerate(lines):
            for op_name, real_reg in final_mapping.items():
                # 使用正则表达式确保只替换完整的寄存器名
                line = re.sub(r'\b' + re.escape(op_name) + r'\b', real_reg, line)
            self.block_lines[line_idx][i] = line
        
    def _select_borrowable_registers(self, num_needed: int, exclude_regs: Set[str] = None) -> List[str]:
        """选择可以借用的寄存器
        
        选择标准：在当前 sublist 中既未使用也未定义，且不在 exclude_regs 中
        """
        if exclude_regs is None:
            exclude_regs = set()
        
        candidate_regs = ['s2', 's3', 's4', 's5', 's6', 's7', 's8', 's9', 's10', 's11',
                          'a0', 'a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 't0', 't1', 't2', 't3', 't4', 't5', 't6']
        
        borrowable = []
        for reg in candidate_regs:
            if reg not in self.free_regs and reg not in exclude_regs and reg not in borrowable:
                borrowable.append(reg)
            if len(borrowable) >= num_needed:
                break
        
        return borrowable[:num_needed]
        
    def allocate_registers(self, num_needed: int, exclude_regs: Set[str] = None) -> Tuple[List[str], List[str], List[str]]:
        """分配需要借用的寄存器并生成栈操作指令"""
        if num_needed == 0:
            return [], [], []
        
        borrowed_regs = self._select_borrowable_registers(num_needed, exclude_regs)
        
        if len(borrowed_regs) < num_needed:
            raise RuntimeError(f"需要 {num_needed} 个寄存器，但只能借用 {len(borrowed_regs)} 个")
        
        borrowed_regs = borrowed_regs[:num_needed]
        
        raw_stack_size = 4 * len(borrowed_regs)
        stack_size = ((raw_stack_size + 15) // 16) * 16  # 向上对齐到 16 的倍数
        
        push_stack = [f"addi\tsp,sp,{-stack_size}"]
        for i, reg in enumerate(borrowed_regs):
            push_stack.append(f"sw\t{reg},{4*i}(sp)")
        
        pop_stack = []
        for i, reg in enumerate(borrowed_regs):
            pop_stack.append(f"lw\t{reg},{4*i}(sp)")
        pop_stack.append(f"addi\tsp,sp,{stack_size}")
        
        return borrowed_regs, push_stack, pop_stack
    
    
    
    def merge_lines(self):

        for idx, sublist in enumerate(self.block_lines):
            push_stack = [line for line in self.stack_per_line[idx]["push"]]
            pop_stack = [line for line in self.stack_per_line[idx]["pop"]]
            lines = [line for line in sublist]
            combined = push_stack + lines + pop_stack    
            self.block_lines[idx] = combined
        self.placeholder_lines = [line for sublist in self.placeholder_block_lines for line in sublist]
        self.lines = [line for sublist in self.block_lines for line in sublist]
        
        # 替换所有 M 扩展伪指令 (callmul, calldiv, calldivu, callrem, callremu)
        asm_text = '\n'.join(self.lines)
        asm_text = replace_m_extension(asm_text)
        self.lines = asm_text.split('\n') if asm_text else []

def get_all_blocks(program_name: str) -> List[int]:
    """获取一个 program 的所有 block 编号
    
    从 basic_blocks_eclass 目录中读取所有的 .txt 文件，提取 block 编号
    
    Returns:
        排序后的 block 编号列表
    """
    blocks_dir = FRONTEND_OUTPUT_DIR / program_name / "basic_blocks_eclass"
    if not blocks_dir.exists():
        raise ValueError(f"Blocks directory not found: {blocks_dir}")
    
    block_nums = []
    for file in blocks_dir.iterdir():
        if file.suffix == '.txt':
            try:
                block_num = int(file.stem)
                block_nums.append(block_num)
            except ValueError:
                # 跳过不是数字的文件名
                continue
    
    return sorted(block_nums)


def rewrite_program(program_name: str, solution_file: str = None, output_dir: str = None):
    """处理整个 program，重写所有 basic blocks
    
    Args:
        program_name: 程序名称 (例如 "dijkstra_small_O3")
        solution_file: ILP solution 文件路径（默认为 output/ilp/<program_name>/sol/solution.sol）
        output_dir: 输出目录（默认为 output/frontend/<program_name>/basic_blocks_rewrite）
    
    Returns:
        Dict: 包含统计信息的字典
    """
    print(f"=" * 60)
    print(f"重写程序: {program_name}")
    print(f"=" * 60)
    
    # 1. 加载 EGraph
    print(f"\n正在加载 EGraph...")
    egraph = EGraph(program_name)
    print(f"  - 加载完成，共 {len(egraph.eclasses)} 个 eclasses，{len(egraph.enodes)} 个 enodes")
    
    # 2. 加载 ILP solution
    if solution_file is None:
        solution_file = str(ILP_OUTPUT_DIR / program_name / "sol" / "solution.sol")
    
    print(f"\n正在解析 ILP solution: {solution_file}")
    variables = parse_solution_file(solution_file)
    print(f"  - 解析完成，共 {len(variables)} 个变量")
    
    choices = extract_solution(egraph, variables)
    print(f"  - 提取选择完成，共 {len(choices)} 个 eclass 选择")
    
    # 3. 获取所有 block 编号
    print(f"\n正在获取所有 blocks...")
    block_nums = get_all_blocks(program_name)
    print(f"  - 找到 {len(block_nums)} 个 blocks: {block_nums}")
    
    # 4. 设置输出目录
    if output_dir is None:
        output_dir = FRONTEND_OUTPUT_DIR / program_name / "basic_blocks_rewrite"
    else:
        output_dir = Path(output_dir)
    
    output_dir.mkdir(parents=True, exist_ok=True)
    if output_dir.name.startswith("variant_"):
        placeholder_base_dir = output_dir.parent.parent / "basic_blocks_placeholder"
        placeholder_dir = placeholder_base_dir / output_dir.name
    else:
        placeholder_base_dir = output_dir.parent / "basic_blocks_placeholder"
        placeholder_dir = placeholder_base_dir
    placeholder_dir.mkdir(parents=True, exist_ok=True)
    print(f"\n输出目录: {output_dir}")
    
    # 5. 处理每个 block
    print(f"\n开始重写 blocks...")
    stats = {
        'total_blocks': len(block_nums),
        'success_blocks': 0,
        'failed_blocks': 0,
        'total_lines': 0,
        'errors': []
    }
    
    for block_num in block_nums:
        try:
            print(f"\n处理 block {block_num}...", end=" ")
            
            # 创建 RewriteBlock 实例
            rewriter = RewriteBlock(program_name, block_num, egraph, choices)
            
            # 重写 block
            rewriter.rewrite_block()
            
            # 写入文件
            output_file = output_dir / f"{block_num}.txt"
            with open(output_file, 'w') as f:
                for line in rewriter.lines:
                    # 标签行（以冒号结尾）不缩进，其他行添加制表符缩进
                    if line.rstrip().endswith(':'):
                        f.write(line + '\n')
                    else:
                        f.write('\t' + line + '\n')
            placeholder_file = placeholder_dir / f"{block_num}.txt"
            with open(placeholder_file, 'w') as f:
                for line in rewriter.placeholder_lines:
                    # 标签行（以冒号结尾）不缩进，其他行添加制表符缩进
                    if line.rstrip().endswith(':'):
                        f.write(line + '\n')
                    else:
                        f.write('\t' + line + '\n')
            
            stats['success_blocks'] += 1
            stats['total_lines'] += len(rewriter.lines)
            print(f"✓ ({len(rewriter.lines)} 行)")
            
        except Exception as e:
            stats['failed_blocks'] += 1
            error_msg = f"Block {block_num}: {str(e)}"
            stats['errors'].append(error_msg)
            print(f"✗ 错误: {str(e)}")
    
    # 6. 输出统计信息
    print(f"\n" + "=" * 60)
    print(f"重写完成统计")
    print(f"=" * 60)
    print(f"总 blocks:    {stats['total_blocks']}")
    print(f"成功:         {stats['success_blocks']}")
    print(f"失败:         {stats['failed_blocks']}")
    print(f"总指令行数:   {stats['total_lines']}")
    
    if stats['errors']:
        print(f"\n错误详情:")
        for error in stats['errors']:
            print(f"  - {error}")
    
    print(f"\n输出目录: {output_dir}")
    print(f"=" * 60)
    
    return stats


def rewrite_program_all_variants(program_name: str, num_variants: int = 5):
    """Process all variants of a program

    Args:
        program_name: Program name (e.g., "dijkstra_small_O3")
        num_variants: Number of variants to process (default 5)

    Returns:
        List[Dict]: Statistics for all variants
    """
    print(f"\n{'='*70}")
    print(f"重写程序的多个变体: {program_name}")
    print(f"变体数量: {num_variants}")
    print(f"{'='*70}")

    # Base output directory
    base_output_dir = FRONTEND_OUTPUT_DIR / program_name / "basic_blocks_rewrite"

    # Clean up existing directory or symlink and create fresh
    if base_output_dir.exists() or base_output_dir.is_symlink():
        import shutil
        if base_output_dir.is_symlink():
            base_output_dir.unlink()  # Remove symlink
        elif base_output_dir.is_dir():
            shutil.rmtree(base_output_dir)  # Remove directory
    base_output_dir.mkdir(parents=True, exist_ok=True)

    # Process each variant
    all_stats = []

    for variant_num in range(num_variants):
        # Check if solution file exists
        solution_file = ILP_OUTPUT_DIR / program_name / "sol" / f"solution_{variant_num}.sol"

        if not solution_file.exists():
            print(f"\n警告: 变体 {variant_num} 的解文件不存在: {solution_file}")
            # Try fallback to single solution file for variant 0
            if variant_num == 0:
                fallback_file = ILP_OUTPUT_DIR / program_name / "sol" / "solution.sol"
                if fallback_file.exists():
                    print(f"  使用备用文件: {fallback_file}")
                    solution_file = fallback_file
                else:
                    print(f"  跳过变体 {variant_num}")
                    continue
            else:
                # For non-zero variants, check if we should break or continue
                # If we have at least one variant, we can stop here
                if all_stats:
                    print(f"  未找到更多变体，停止处理")
                    break
                print(f"  跳过变体 {variant_num}")
                continue

        try:
            print(f"\n{'='*60}")
            print(f"处理变体 {variant_num}: {program_name}")
            print(f"{'='*60}")

            # Create variant output directory
            variant_dir = base_output_dir / f"variant_{variant_num}"
            variant_dir.mkdir(parents=True, exist_ok=True)

            # Rewrite with this solution
            stats = rewrite_program(program_name, str(solution_file), str(variant_dir))
            stats['variant'] = variant_num
            all_stats.append(stats)

        except Exception as e:
            print(f"\n处理变体 {variant_num} 时出错: {str(e)}")
            all_stats.append({
                'variant': variant_num,
                'error': str(e),
                'total_blocks': 0,
                'success_blocks': 0,
                'failed_blocks': 0
            })

    # Final summary
    print(f"\n{'='*70}")
    print(f"最终汇总")
    print(f"{'='*70}")
    print(f"程序: {program_name}")
    print(f"处理的变体数: {len(all_stats)}")

    total_success = sum(s.get('success_blocks', 0) for s in all_stats)
    total_failed = sum(s.get('failed_blocks', 0) for s in all_stats)

    print(f"所有变体成功的基本块总数: {total_success}")
    print(f"所有变体失败的基本块总数: {total_failed}")

    print(f"\n每个变体汇总:")
    for stats in all_stats:
        variant = stats.get('variant', '?')
        success = stats.get('success_blocks', 0)
        total = stats.get('total_blocks', 0)
        if 'error' in stats:
            print(f"  变体 {variant}: 错误 - {stats['error']}")
        else:
            print(f"  变体 {variant}: {success}/{total} 个块成功")

    print(f"\n输出目录结构:")
    print(f"  {base_output_dir}/")
    for i in range(len(all_stats)):
        variant_dir = base_output_dir / f"variant_{i}"
        if variant_dir.exists():
            num_files = len(list(variant_dir.glob("*.txt")))
            print(f"    variant_{i}/  ({num_files} 个文件)")

    print(f"{'='*70}\n")

    return all_stats


def main():
    """命令行入口"""
    import argparse

    parser = argparse.ArgumentParser(description="重写 RISC-V 程序的所有 basic blocks")
    parser.add_argument("program_name", help="程序名称 (例如 dijkstra_small_O3)")
    parser.add_argument("--solution", "-s", help="ILP solution 文件路径（可选，仅用于单变体模式）")
    parser.add_argument("--output", "-o", help="输出目录（可选，仅用于单变体模式）")
    parser.add_argument("--variants", "-k", type=int, default=5,
                        help="要处理的变体数量 (默认: 5)")
    parser.add_argument("--single-variant", action="store_true",
                        help="只处理单个变体（使用 --solution 指定的文件）")

    args = parser.parse_args()

    if args.single_variant:
        # Single variant mode (backward compatibility)
        rewrite_program(args.program_name, args.solution, args.output)
    else:
        # Multi-variant mode (default)
        rewrite_program_all_variants(args.program_name, args.variants)


if __name__ == "__main__":
    main()