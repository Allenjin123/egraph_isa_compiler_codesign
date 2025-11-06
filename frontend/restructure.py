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
from util import INSTRUCTIONS_WITHOUT_RD, RV32I_LOAD, ALL_ABI_REGS, parse_instruction

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
    
    # 从最后一行开始
    last_line = set(free_at_exit)
    # last_def_regs = set()
    for i in range(num_lines - 1, -1, -1):
        line = lines[i]
        def_regs, use_regs = extract_def_use(line)
        
        # 当前行可用的 free_regs = last_line - use[i] + last_def_regs
        free_set = (last_line  | def_regs) - use_regs
        free_regs_per_line[i] = sorted(free_set)
        
        # 更新 current_free 供前一行使用：
        # free[i-1] = free[i] - use[i] + def[i]
        # 但我们已经在上面计算了 free[i] - use[i]，所以：
        # current_free = free_set + def[i]
        # last_def_regs = def_regs
        last_line = free_set
    return free_regs_per_line

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
        self.eclass_to_rd_map: Dict[str, str] = {}  # 初始化为空，走一行更新一行
        # 计算每行可用的 free_regs
        self.free_regs_per_line: List[List[str]] = compute_free_regs_per_line(program_name, block_num)
        self.free_regs: List[str] = []
        self.temp_counter: int = 0  # 临时寄存器计数器
        self.current_line_idx: int = 0  # 当前处理的行索引
        self.stack: Dict[str, List[str]] = {"push": [], "pop": []}  # 栈操作

    def get_free_reg(self) -> str:
        """获取一个可用的寄存器
        
        优先使用 free_regs，如果用完了就生成占位符（后续会替换为借用的寄存器）
        """
        if self.free_regs:
            return self.free_regs.pop(0)
        else:
            # 生成占位符：op_<line_idx>_<temp_counter>
            placeholder = f"op_{self.current_line_idx}_{self.temp_counter}"
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
                    child_rd = self.get_free_reg()  
                else:
                    child_rd = None
                self.rewrite_line(child_eclass, child_rd, line_idx)
                # self.eclass_to_rd_map[child_eclass] = child_rd 展开的指令暂时不记录
                child_operands.append(child_rd)
            else:
                # leaf 节点，直接使用其 op 值
                child_operands.append(child_node.op)
        
        # 生成指令
        inst_str = self._format_instruction(node.op, rd, child_operands)
        self.block_lines[line_idx].append(inst_str)
    
    def _use_original_instruction(self, line_idx: int):
        """使用原始 basic_blocks 中的指令（fallback）"""
        # 读取原始 basic block
        block_file = FRONTEND_OUTPUT_DIR / self.program_name / "basic_blocks" / f"{self.block_num}.txt"
        with open(block_file, 'r') as f:
            lines = [line.rstrip('\n') for line in f if line.strip()]
        
        if line_idx < len(lines):
            original_line = lines[line_idx]
            # 去除前导空白
            original_line = original_line.lstrip()
            self.block_lines[line_idx].append(original_line)
    
    def _format_instruction(self, op: str, rd: str, operands: List[str]) -> str:
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
                if op in branch_ops and operands:
                    modified_operands = operands.copy()
                    last_operand = modified_operands[-1]
                    # 检查是否是纯数字（可能有正负号）
                    if re.match(r'^-?\d+$', last_operand):
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
        
        # # 特殊处理: sub rd, x0, rs -> neg rd, rs (RISC-V 伪指令)
        # if op == 'sub' and len(operands) == 2 and operands[0] in ('x0', 'zero'):
        #     return f"neg\t{rd},{operands[1]}"
        
        # 普通指令
        if operands:
            return f"{op}\t{rd},{','.join(operands)}"
        else:
            return f"{op}\t{rd}" 

    def rewrite_block(self):
        """重写整个 block，按顺序处理每一行"""
        for line_idx, (eclass_id, rd) in enumerate(self.eclass_to_rd_list):
            if eclass_id in self.block_graph.eclasses_to_nodes:
                # 设置当前行索引和可用的 free_regs
                self.current_line_idx = line_idx
                self.temp_counter = 0  # 重置临时寄存器计数器
                
                if line_idx < len(self.free_regs_per_line):
                    self.free_regs = self.free_regs_per_line[line_idx].copy()
                else:
                    raise ValueError(f"Line {line_idx} has no free registers")
                
                # # 测试：直接使用原始指令
                # self._use_original_instruction(line_idx)
                
                # 处理这一行
                self.rewrite_line(eclass_id, rd, line_idx)
                # 更新映射
                self.eclass_to_rd_map[eclass_id] = rd
            else:
                # 不在图中的 eclass，说明图构建有问题
                raise ValueError(f"Eclass {eclass_id} from file not found in block graph")

        max_placeholders = 0
        temp_lines = [line for sublist in self.block_lines for line in sublist]
        for line in temp_lines:
            placeholders = re.findall(r'op_\d+_\d+', line)
            num_placeholders = len(set(placeholders))  # 去重
            max_placeholders = max(max_placeholders, num_placeholders)

        self.allocate_registers(max_placeholders)
        self.replace_placeholders()
        self.merge_lines()
        
    def allocate_registers(self, max_placeholders: int):
        """分配需要借用的寄存器并生成栈操作指令"""
        if max_placeholders == 0:
            return
        
        # 选择可借用的寄存器（s 寄存器）
        borrowed_regs = self._select_borrowable_registers(max_placeholders)
        
        if len(borrowed_regs) < max_placeholders:
            raise RuntimeError(f"需要 {max_placeholders} 个寄存器，但只能借用 {len(borrowed_regs)} 个")
        
        # 生成压栈指令
        # RISC-V ABI 要求 sp 必须保持 16 字节对齐
        raw_stack_size = 4 * len(borrowed_regs)
        stack_size = ((raw_stack_size + 15) // 16) * 16  # 向上对齐到 16 的倍数
        
        self.stack["push"].append(f"addi\tsp,sp,{-stack_size}")
        for i, reg in enumerate(borrowed_regs):
            self.stack["push"].append(f"sw\t{reg},{4*i}(sp)")
        
        # 生成出栈指令
        for i, reg in enumerate(borrowed_regs):
            self.stack["pop"].append(f"lw\t{reg},{4*i}(sp)")
        self.stack["pop"].append(f"addi\tsp,sp,{stack_size}")
        
        # 保存借用的寄存器列表供替换使用
        self.borrowed_regs = borrowed_regs
    
    def _select_borrowable_registers(self, num_needed: int) -> List[str]:
        """选择可以借用的寄存器
        
        选择标准：没被 block 使用过且没被 block 定义过
        """
        # 读取 defuse 信息
        defuse_file = FRONTEND_OUTPUT_DIR / self.program_name / "defuse.json"
        with open(defuse_file, 'r') as f:
            defuse_data = json.load(f)
        
        block_key = str(self.block_num)
        use_all = set(defuse_data[block_key].get('USE_all', []))  # block 所有使用的寄存器
        def_all = set(defuse_data[block_key].get('DEF_all', []))  # block 所有定义的寄存器
        
        # 候选寄存器：s 寄存器优先（callee-saved）
        candidate_regs = ['s2', 's3', 's4', 's5', 's6', 's7', 's8', 's9', 's10', 's11']
        
        borrowable = []
        for reg in candidate_regs:
            # 可以借用：既不在 USE_all 也不在 DEF_all
            if reg not in use_all and reg not in def_all:
                borrowable.append(reg)
            
            if len(borrowable) >= num_needed:
                break
        
        return borrowable[:num_needed]
    
    def replace_placeholders(self):
        """替换占位符为实际寄存器
        
        每个 sublist（每行原始指令展开后的结果）独立分配寄存器，
        因为占位符名字包含 line_idx，不同 sublist 的占位符不会冲突，
        可以复用相同的借用寄存器
        """
        if not hasattr(self, 'borrowed_regs') or not self.borrowed_regs:
            return
        
        import re
        
        # 按 sublist 独立处理
        for i, sublist in enumerate(self.block_lines):
            # 1. 收集当前 sublist 中所有唯一的占位符（保持首次出现顺序）
            seen_placeholders = []
            for line in sublist:
                placeholders = re.findall(r'op_\d+_\d+', line)
                for placeholder in placeholders:
                    if placeholder not in seen_placeholders:
                        seen_placeholders.append(placeholder)
            
            if not seen_placeholders:
                continue
            
            # 2. 检查寄存器数量是否足够
            if len(seen_placeholders) > len(self.borrowed_regs):
                raise RuntimeError(f"Sublist {i} 需要 {len(seen_placeholders)} 个寄存器，但只借用了 {len(self.borrowed_regs)} 个")
            
            # 3. 为当前 sublist 分配寄存器（按首次出现顺序）
            placeholder_to_reg = {}
            for idx, placeholder in enumerate(seen_placeholders):
                placeholder_to_reg[placeholder] = self.borrowed_regs[idx]
            
            # 4. 替换当前 sublist 中的占位符
            for j in range(len(self.block_lines[i])):
                for placeholder, reg in placeholder_to_reg.items():
                    self.block_lines[i][j] = self.block_lines[i][j].replace(placeholder, reg)
    
    def merge_lines(self):
        push_stack = [line for line in self.stack["push"]]
        pop_stack = [line for line in self.stack["pop"]]
        lines = [line for sublist in self.block_lines for line in sublist]
        
        if not lines or not pop_stack:
            self.lines = push_stack + lines + pop_stack
            return
        
        # 检查最后一条和倒数第二条指令
        last_line = lines[-1].strip()
        last_mnemonic = last_line.split()[0] if last_line else ""
        
        # 检查是否是 auipc + jalr 配对（用于函数调用）
        if len(lines) >= 2 and last_mnemonic == 'jalr':
            second_last_line = lines[-2].strip()
            second_last_mnemonic = second_last_line.split()[0] if second_last_line else ""
            
            if second_last_mnemonic == 'auipc':
                # auipc + jalr 配对，pop 必须插入到 auipc 之前
                self.lines = push_stack + lines[:-2] + pop_stack + lines[-2:]
                return
        
        # RV32I branch 指令
        branch_ops = {'beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu', 'jal', 'jalr'}
        
        if last_mnemonic in branch_ops:
            # 普通 branch，pop 插入到最后一条指令之前
            self.lines = push_stack + lines[:-1] + pop_stack + [lines[-1]]
        else:
            self.lines = push_stack + lines + pop_stack

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
                    f.write(line + '\n')
            
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
