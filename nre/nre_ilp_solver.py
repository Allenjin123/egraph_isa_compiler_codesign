#!/usr/bin/env python3
"""
问题描述：
- 有 n 个程序，每个程序有 m 个不同的处理器实现变种
- 每个实现支持不同的指令子集（ISA子集），有不同的延迟和面积
- 需要选择 a 个芯片（ISA子集），使得：
  1. 这 a 个芯片能够覆盖全部 n 个程序
  2. 所有程序的加权成本 α·latency + (1-α)·area 最小

算法思路：
1. 成本函数：cost = α·latency + (1-α)·area，其中 α 是权重参数
2. 使用整数线性规划（ILP）建模：
   - 决策变量：x_j (是否选择芯片j), y_ij (程序i是否使用实现j)
   - 约束：覆盖约束、芯片数量约束、兼容性约束
3. 使用Gurobi求解

使用方法：
    module load gurobi
    conda activate esip
    python nre_ilp_solver.py --input ilp_input.json --num_chips 3
"""

import argparse
import json
import sys
from pathlib import Path
from typing import Dict, List, Tuple, Set, Optional
from collections import defaultdict

# 导入Gurobi
try:
    import gurobipy as gp
    from gurobipy import GRB
except ImportError:
    print("错误: 需要安装Gurobi", file=sys.stderr)
    print("提示: 请先运行: conda activate esip && module load gurobi", file=sys.stderr)
    sys.exit(1)


class ISAILPSolver:
    """ISA子集选择ILP求解器"""
    
    def __init__(self, programs: List[Dict], num_chips: int, solver_type: str = 'gurobi', 
                 chip_metadata: Optional[Dict] = None, alpha: float = 0.5, best_k: Optional[int] = None):
        """
        初始化求解器
        
        Args:
            programs: 程序列表，每个程序包含：
                - name: 程序名称
                - implementations: 实现列表，每个实现包含：
                    - chip_id: ISA子集（芯片）ID
                    - area: 面积
                    - latency: 延迟
                    - variant_id: 变体ID（可选）
            num_chips: 需要选择的芯片数量
            solver_type: 求解器类型 ('gurobi', 'auto')
            chip_metadata: 芯片元数据字典（可选），包含instruction_subset等信息
            alpha: 成本权重参数，成本 = alpha * latency + (1-alpha) * area，范围 [0, 1]
            best_k: 返回最优解的个数，None 或 1 表示只返回最优解，>1 表示返回多个解
        """
        if not (0 <= alpha <= 1):
            raise ValueError(f"alpha 必须在 [0, 1] 范围内，当前值: {alpha}")
        if best_k is not None and best_k < 1:
            raise ValueError(f"best_k 必须 >= 1，当前值: {best_k}")
        
        self.programs = programs
        self.num_chips = num_chips
        self.solver_type = solver_type
        self.chip_metadata = chip_metadata or {}
        self.alpha = alpha
        self.best_k = best_k if best_k is not None else 1
        
        # 验证数据
        self._validate_data()
        
        # 提取所有芯片ID和实现映射
        self.all_chips = set()
        self.program_to_implementations = {}
        self.chip_to_programs = defaultdict(set)  # 每个芯片被哪些程序使用
        
        # 构建全局芯片到实现的映射（用于查找超集芯片的area）
        chip_to_all_implementations = defaultdict(list)  # 每个芯片上所有程序的实现
        for prog in programs:
            for impl in prog['implementations']:
                chip_id = impl['chip_id']
                chip_to_all_implementations[chip_id].append(impl)
        
        # 构建芯片指令集映射（用于超集检测）
        chip_instruction_sets = {}
        for chip_id, metadata in self.chip_metadata.items():
            chip_instruction_sets[chip_id] = set(metadata.get('instruction_subset', []))
        
        for prog in programs:
            prog_name = prog['name']
            implementations = []
            prog_chip_instruction_sets = {}  # 该程序使用的芯片的指令集
            
            # 首先收集该程序直接使用的芯片及其指令集，并构建chip_id到实现的映射
            # 注意：同一程序在同一芯片上应该只有一个area/latency值，所以用字典而不是列表
            prog_chip_to_impl = {}  # 该程序在每个芯片上的实现（每个芯片只保留一个）
            for impl in prog['implementations']:
                chip_id = impl['chip_id']
                self.all_chips.add(chip_id)
                self.chip_to_programs[chip_id].add(prog_name)
                prog_chip_instruction_sets[chip_id] = chip_instruction_sets.get(chip_id, set())
                # 如果该芯片还没有实现，或者新实现的area/latency不同，则更新
                # 通常同一芯片上的实现area/latency都相同，所以只保留第一个即可
                if chip_id not in prog_chip_to_impl:
                    prog_chip_to_impl[chip_id] = impl
            
            # 为每个实现添加选项：可以使用该实现，也可以使用指令集超集的芯片
            for impl in prog['implementations']:
                chip_id = impl['chip_id']
                required_instructions = prog_chip_instruction_sets.get(chip_id, set())
                original_area = float(impl['area'])
                original_latency = float(impl['latency'])
                
                # 找到所有指令集超集的芯片
                compatible_chips = [chip_id]  # 包括自己
                for other_chip_id, other_instructions in chip_instruction_sets.items():
                    # 超集芯片必须是其他程序使用的芯片，不能是当前程序自己使用的
                    if (other_chip_id != chip_id 
                        and other_chip_id not in prog_chip_to_impl 
                        and other_instructions >= required_instructions):
                        compatible_chips.append(other_chip_id)
                        # 添加超集芯片到候选列表（set会自动去重）
                        self.all_chips.add(other_chip_id)
                        self.chip_to_programs[other_chip_id].add(prog_name)
                
                # 为每个兼容芯片创建一个选项
                for compat_chip_id in compatible_chips:
                    if compat_chip_id == chip_id:
                        # 原始芯片，使用原始数据
                        area = original_area
                        latency = original_latency
                    else:
                        # 超集芯片：从其他程序的实现中获取area
                        # 查找其他程序在该超集芯片上的实现
                        superset_impls = chip_to_all_implementations.get(compat_chip_id, [])
                        if superset_impls:
                            # 同一芯片上的area应该相同，直接取第一个实现的area
                            area = float(superset_impls[0]['area'])
                        else:
                            # 如果没有其他程序使用该芯片，使用原始area作为fallback
                            area = original_area
                        latency = original_latency  # latency保持原始实现的latency
                    
                    # 计算加权成本：alpha * latency + (1-alpha) * area
                    cost = self.alpha * latency + (1 - self.alpha) * area
                    
                    implementations.append({
                        'chip_id': compat_chip_id,
                        'original_chip_id': chip_id,  # 记录原始芯片ID
                        'area': area,
                        'latency': latency,
                        'variant_id': impl.get('variant_id', ''),
                        'cost': cost
                    })
            
            self.program_to_implementations[prog_name] = implementations
        
        self.all_chips = sorted(list(self.all_chips))
        self.num_programs = len(programs)
        
        # 打印问题规模信息
        self._print_problem_info()
    
    def _validate_data(self):
        """验证输入数据"""
        if not self.programs:
            raise ValueError("程序列表为空")
        
        if self.num_chips <= 0:
            raise ValueError(f"芯片数量必须大于0，当前值: {self.num_chips}")
        
        for prog in self.programs:
            if 'name' not in prog:
                raise ValueError(f"程序缺少'name'字段: {prog}")
            if 'implementations' not in prog:
                raise ValueError(f"程序 {prog['name']} 缺少'implementations'字段")
            if not prog['implementations']:
                raise ValueError(f"程序 {prog['name']} 的实现列表为空")
            
            for impl in prog['implementations']:
                required_fields = ['chip_id', 'area', 'latency']
                for field in required_fields:
                    if field not in impl:
                        raise ValueError(f"程序 {prog['name']} 的实现缺少'{field}'字段")
                
                if impl['area'] <= 0 or impl['latency'] <= 0:
                    raise ValueError(
                        f"程序 {prog['name']} 的实现面积或延迟必须大于0: "
                        f"area={impl['area']}, latency={impl['latency']}"
                    )
    
    def _print_problem_info(self):
        """打印问题规模信息"""
        print(f"\n{'='*60}")
        print(f"问题规模:")
        print(f"  - 程序数: {self.num_programs}")
        print(f"  - 候选芯片数: {len(self.all_chips)}")
        print(f"  - 需要选择的芯片数: {self.num_chips}")
        print(f"  - 总实现数: {sum(len(impls) for impls in self.program_to_implementations.values())}")
        
        # 检查覆盖性
        all_chips_set = set(self.all_chips)
        programs_with_chips = set()
        for prog in self.programs:
            prog_chips = {impl['chip_id'] for impl in prog['implementations']}
            if prog_chips & all_chips_set:
                programs_with_chips.add(prog['name'])
        
        if len(programs_with_chips) < self.num_programs:
            print(f"\n警告: {self.num_programs - len(programs_with_chips)} 个程序可能无法被覆盖")
        
        print(f"{'='*60}\n")
    
    def solve_with_gurobi(self, timeout: Optional[int] = None) -> Tuple[bool, List[Dict], List[float]]:
        """使用Gurobi求解，返回 best_k 个最优解"""
        print("使用Gurobi求解器...")
        model = gp.Model("ISA_Selection")
        model.setParam('OutputFlag', 1)
        if timeout:
            model.setParam('TimeLimit', timeout)
        
        # 如果需要多个解，设置 Solution Pool 参数
        if self.best_k > 1:
            model.setParam('PoolSearchMode', 2)  # 搜索模式：找到最优的 k 个解
            model.setParam('PoolSolutions', self.best_k)  # 保存的解的数量
            # 允许目标值略有不同的解（相对差距0.1%），这样可以找到更多不同的解
            model.setParam('PoolGap', 0.01)  # 允许目标值相差0.1%的解
        
        # 决策变量
        # x[j]: 是否选择芯片j
        x = {}
        for chip_id in self.all_chips:
            x[chip_id] = model.addVar(vtype=GRB.BINARY, name=f"x_{chip_id}")
        
        # y[prog_name][impl_idx]: 程序prog_name是否使用第impl_idx个实现
        y = {}
        for prog in self.programs:
            prog_name = prog['name']
            y[prog_name] = {}
            impls = self.program_to_implementations[prog_name]
            for idx, impl in enumerate(impls):
                y[prog_name][idx] = model.addVar(
                    vtype=GRB.BINARY,
                    name=f"y_{prog_name}_{idx}"
                )
        
        model.update()
        
        # 目标函数：最小化加权成本之和
        obj = gp.quicksum(
            y[prog['name']][idx] * impl['cost']
            for prog in self.programs
            for idx, impl in enumerate(self.program_to_implementations[prog['name']])
        )
        model.setObjective(obj, GRB.MINIMIZE)
        
        # 约束1: 每个程序至少选择一个实现
        for prog in self.programs:
            prog_name = prog['name']
            impls = self.program_to_implementations[prog_name]
            model.addConstr(
                gp.quicksum(y[prog_name][idx] for idx in range(len(impls))) >= 1,
                name=f"cover_{prog_name}"
            )
        
        # 约束2: 每个程序最多选择一个实现
        for prog in self.programs:
            prog_name = prog['name']
            impls = self.program_to_implementations[prog_name]
            model.addConstr(
                gp.quicksum(y[prog_name][idx] for idx in range(len(impls))) <= 1,
                name=f"single_{prog_name}"
            )
        
        # 约束3: 只能选择num_chips个芯片
        model.addConstr(
            gp.quicksum(x[chip_id] for chip_id in self.all_chips) == self.num_chips,
            name="num_chips"
        )
        
        # 约束4: 程序只能使用已选中芯片支持的实现
        for prog in self.programs:
            prog_name = prog['name']
            impls = self.program_to_implementations[prog_name]
            for idx, impl in enumerate(impls):
                chip_id = impl['chip_id']
                model.addConstr(
                    y[prog_name][idx] <= x[chip_id],
                    name=f"compat_{prog_name}_{idx}"
                )
        
        # 求解
        model.optimize()
        
        if model.status == GRB.OPTIMAL or model.status == GRB.TIME_LIMIT:
            if model.status == GRB.TIME_LIMIT:
                print("警告: 达到时间限制，返回当前最佳解")
            
            solutions = []
            obj_values = []
            
            # 获取多个解
            if self.best_k > 1:
                num_solutions = min(self.best_k, model.SolCount)
                if model.SolCount > 1:
                    print(f"找到 {model.SolCount} 个解，返回前 {num_solutions} 个")
                    # 打印所有解的目标函数值，用于调试
                    print(f"所有解的目标函数值: ", end="")
                    for i in range(min(model.SolCount, 10)):  # 最多显示10个
                        model.setParam('SolutionNumber', i)
                        if i == 0:
                            print(f"{model.ObjVal:.4f}", end=" ")
                        else:
                            print(f"{model.PoolObjVal:.4f}", end=" ")
                    print()
                
                for i in range(num_solutions):
                    # 设置当前解为第 i 个解
                    model.setParam('SolutionNumber', i)
                    # 获取第 i 个解的目标函数值
                    if i == 0:
                        obj_val = model.ObjVal
                    else:
                        # 对于Solution Pool中的解，使用PoolObjVal
                        obj_val = model.PoolObjVal
                    solution = self._extract_solution_gurobi(model, x, y, obj_val, solution_num=i)
                    
                    # 检查是否与之前的解相同（重点关注 y 值，即程序分配）
                    if i > 0:
                        prev_solution = solutions[0]
                        # 检查程序分配（y 值）是否相同
                        assignments_same = solution['assignments'] == prev_solution['assignments']
                        chips_same = set(solution['selected_chips']) == set(prev_solution['selected_chips'])
                        
                        if assignments_same and chips_same:
                            if i == 1:  # 只在第一次发现重复时打印
                                print(f"注意: 解 #{i+1} 与最优解完全相同（芯片和程序分配都相同）")
                        elif chips_same and not assignments_same:
                            # 芯片相同但程序分配不同 - 这是不同的解！
                            obj_diff = abs(solution['objective_value'] - prev_solution['objective_value'])
                            
                            # 检查每个程序的成本是否都相同
                            all_programs_same_cost = True
                            diff_programs = []
                            cost_diffs = []
                            
                            for prog_name in solution['assignments']:
                                curr_assign = solution['assignments'][prog_name]
                                prev_assign = prev_solution['assignments'][prog_name]
                                curr_cost = curr_assign['cost']
                                prev_cost = prev_assign['cost']
                                
                                # 检查芯片ID或variant_id是否不同
                                chip_diff = curr_assign['chip_id'] != prev_assign['chip_id']
                                variant_diff = curr_assign.get('variant_id', '') != prev_assign.get('variant_id', '')
                                
                                if chip_diff or variant_diff:
                                    diff_programs.append(prog_name)
                                    cost_diff = abs(curr_cost - prev_cost)
                                    if cost_diff > 0.01:  # 成本不同
                                        all_programs_same_cost = False
                                        cost_diffs.append((prog_name, curr_cost, prev_cost, cost_diff))
                            
                            if obj_diff < 0.01:  # 目标函数值相同（数值误差范围内）
                                if all_programs_same_cost:
                                    print(f"解 #{i+1}: 芯片选择相同，程序分配不同，但每个程序的成本都相同！")
                                    print(f"  这很奇怪 - 可能是数据问题或模型对称性")
                                    # 详细检查：显示几个差异程序的详细信息
                                    if diff_programs:
                                        print(f"  检查差异程序详情:")
                                        for prog_name in diff_programs[:3]:
                                            curr = solution['assignments'][prog_name]
                                            prev = prev_solution['assignments'][prog_name]
                                            variant_info = ""
                                            if curr.get('variant_id', '') != prev.get('variant_id', ''):
                                                variant_info = f", variant {curr.get('variant_id', 'N/A')} vs {prev.get('variant_id', 'N/A')}"
                                            print(f"    {prog_name}: 芯片 {curr['chip_id']} vs {prev['chip_id']}, "
                                                  f"成本 {curr['cost']:.4f} vs {prev['cost']:.4f}, "
                                                  f"area {curr['area']:.2f} vs {prev['area']:.2f}, "
                                                  f"latency {curr['latency']:.4f} vs {prev['latency']:.4f}{variant_info}")
                                        
                                        # 如果所有显示的差异程序实际上都相同，说明可能是误检
                                        all_same = all(
                                            solution['assignments'][p]['chip_id'] == prev_solution['assignments'][p]['chip_id'] and
                                            abs(solution['assignments'][p]['cost'] - prev_solution['assignments'][p]['cost']) < 0.01
                                            for p in diff_programs[:3]
                                        )
                                        if all_same:
                                            print(f"  警告: 虽然标记为差异程序，但实际上这些程序的分配完全相同！")
                                            print(f"  可能是variant_id不同，或者代码提取解时有问题")
                                else:
                                    print(f"解 #{i+1}: 芯片选择相同，程序分配不同，目标函数值相同（{solution['objective_value']:.4f}）")
                                    print(f"  但各程序成本不同，只是总和相同（这是正常的）")
                                    if cost_diffs:
                                        print(f"  成本差异示例: {cost_diffs[0][0]}: {cost_diffs[0][1]:.4f} vs {cost_diffs[0][2]:.4f} (差异: {cost_diffs[0][3]:.4f})")
                            else:
                                print(f"解 #{i+1}: 芯片选择相同，程序分配不同，目标函数值: {solution['objective_value']:.4f} (差异: {obj_diff:.4f})")
                            
                            if diff_programs:
                                print(f"  差异程序: {', '.join(diff_programs[:5])}{'...' if len(diff_programs) > 5 else ''}")
                    
                    solutions.append(solution)
                    obj_values.append(obj_val)
            else:
                # 单个解
                obj_val = model.ObjVal
                solution = self._extract_solution_gurobi(model, x, y, obj_val, solution_num=0)
                solutions.append(solution)
                obj_values.append(obj_val)
            
            return True, solutions, obj_values
        else:
            print(f"求解状态: {model.status}")
            return False, [], []
    
    def _extract_solution_gurobi(self, model: gp.Model, x: Dict, y: Dict,
                                 obj_value: float, solution_num: int = 0) -> Dict:
        """从Gurobi模型中提取第 solution_num 个解"""
        
        # 对于 Solution Pool 中的解，需要先设置 SolutionNumber，然后使用 .Xn
        # 对于第一个解（最优解），使用 .X
        if solution_num > 0:
            model.setParam('SolutionNumber', solution_num)
            # 使用 .Xn 访问 Solution Pool 中第 solution_num 个解的值
            selected_chips = [
                chip_id
                for chip_id in self.all_chips
                if x[chip_id].Xn > 0.5
            ]
        else:
            # 第一个解（最优解）使用 .X
            selected_chips = [
                chip_id
                for chip_id in self.all_chips
                if x[chip_id].X > 0.5
            ]

        assignments = {}

        for prog in self.programs:
            prog_name = prog['name']
            impls = self.program_to_implementations[prog_name]
            for idx, impl in enumerate(impls):
                if solution_num > 0:
                    # 使用 .Xn 访问 Solution Pool 中的解
                    var_value = y[prog_name][idx].Xn
                else:
                    # 第一个解使用 .X
                    var_value = y[prog_name][idx].X
                
                if var_value > 0.5:
                    assignments[prog_name] = {
                        'chip_id': impl['chip_id'],
                        'area': impl['area'],
                        'latency': impl['latency'],
                        'variant_id': impl.get('variant_id', ''),
                        'cost': self.alpha * impl['latency'] + (1 - self.alpha) * impl['area']
                    }
                    break

        # 计算平均成本（算术平均）
        costs = [assignments[p['name']]['cost'] for p in self.programs]
        average_cost = sum(costs) / len(costs) if costs else 0.0
        
        # 重新计算目标函数值（总成本），确保准确性
        # 目标函数 = Σ y[prog_name][idx] * impl['cost']
        recalculated_obj = sum(assignments[p['name']]['cost'] for p in self.programs)

        return {
            'selected_chips': selected_chips,
            'assignments': assignments,
            'average_cost': average_cost,
            'objective_value': recalculated_obj,  # 使用重新计算的值
            'original_obj_value': obj_value  # 保留Gurobi返回的原始值
        }

    def solve(self, timeout: Optional[int] = None) -> Tuple[bool, List[Dict], List[float]]:
        """求解问题，返回 best_k 个最优解"""
        return self.solve_with_gurobi(timeout)
    
    def print_solution(self, solution: Dict, obj_value: float, solution_idx: int = 0):
        """打印求解结果"""
        if solution_idx == 0:
            print(f"\n{'='*60}")
            print("求解结果")
            print(f"{'='*60}\n")
        
        if solution_idx > 0:
            print(f"\n{'='*60}")
            print(f"解 #{solution_idx + 1}")
            print(f"{'='*60}\n")
        
        print(f"选中的芯片 ({len(solution['selected_chips'])} 个):")
        for chip_id in sorted(solution['selected_chips']):
            metadata = self.chip_metadata.get(chip_id, {})
            num_instructions = len(metadata.get('instruction_subset', []))
            num_programs = len(self.chip_to_programs.get(chip_id, set()))
            print(f"  - {chip_id}: {num_instructions} 条指令, {num_programs} 个程序可用")
            if metadata.get('instruction_subset'):
                print(f"    指令集: {', '.join(sorted(metadata['instruction_subset'])[:10])}")
                if len(metadata['instruction_subset']) > 10:
                    print(f"    ... (共 {len(metadata['instruction_subset'])} 条指令)")
        
        print(f"\n程序分配 ({len(solution['assignments'])} 个程序):")
        # 按芯片分组显示
        chip_to_programs = defaultdict(list)
        for prog_name, assignment in solution['assignments'].items():
            chip_to_programs[assignment['chip_id']].append((prog_name, assignment))
        
        for chip_id in sorted(solution['selected_chips']):
            programs = chip_to_programs[chip_id]
            print(f"\n  芯片 {chip_id} ({len(programs)} 个程序):")
            for prog_name, assignment in sorted(programs):
                print(f"    {prog_name:20} | 面积: {assignment['area']:10.2f} | "
                      f"延迟: {assignment['latency']:10.6f} | "
                      f"成本: {assignment['cost']:12.2f} | "
                      f"变体: {assignment.get('variant_id', 'N/A')}")
        
        print(f"\n{'='*60}")
        print("统计信息:")
        print(f"  - 平均成本: {solution['average_cost']:.4f}")
        print(f"  - 目标函数值（总成本）: {obj_value:.4f}")
        print(f"  - 成本权重 (alpha): {self.alpha:.2f}")
        
        # 每个芯片的使用统计
        print(f"\n芯片使用统计:")
        for chip_id in sorted(solution['selected_chips']):
            programs = chip_to_programs[chip_id]
            total_cost = sum(a['cost'] for _, a in programs)
            avg_cost = total_cost / len(programs) if programs else 0
            print(f"  {chip_id}: {len(programs)} 个程序, "
                  f"平均成本: {avg_cost:.2f}, "
                  f"总成本: {total_cost:.2f}")
        print(f"{'='*60}\n")


def load_data(file_path: str) -> Tuple[List[Dict], Optional[Dict], Optional[Dict]]:
    """
    加载数据文件
    
    Returns:
        (programs, chip_metadata, statistics)
    """
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # 支持两种格式：
    # 1. 直接是程序列表
    # 2. 包含'programs'键的字典（parse_ilp.py生成的格式）
    if isinstance(data, list):
        return data, None, None
    elif isinstance(data, dict):
        programs = data.get('programs', [])
        chip_metadata = data.get('chip_metadata', None)
        statistics = data.get('statistics', None)
        return programs, chip_metadata, statistics
    else:
        raise ValueError("数据格式不正确，应为程序列表或包含'programs'键的字典")


def main():
    parser = argparse.ArgumentParser(
        description='ISA子集选择ILP求解器',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  module load gurobi
  conda activate esip
  python nre_ilp_solver.py --input nre/ilp_input.json --num_chips 3
  python nre_ilp_solver.py --input nre/ilp_input.json --num_chips 5 --solver gurobi --timeout 300 --output result.json
        """
    )
    parser.add_argument('--input', '-i', required=True, help='输入JSON文件路径')
    parser.add_argument('--num_chips', '-a', type=int, required=True, help='需要选择的芯片数量')
    parser.add_argument('--solver', '-s', choices=['gurobi', 'auto'], 
                       default='auto', help='求解器类型 (默认: auto, 使用Gurobi)')
    parser.add_argument('--timeout', '-t', type=int, default=None, help='求解超时时间（秒）')
    parser.add_argument('--output', '-o', default=None, help='输出JSON文件路径')
    parser.add_argument('--quiet', '-q', action='store_true', help='安静模式，减少输出')
    parser.add_argument('--alpha', type=float, default=0.5,
                       help='成本权重参数，成本 = alpha * latency + (1-alpha) * area，范围 [0, 1] (默认: 0.5)')
    parser.add_argument('--best_k', type=int, default=None,
                       help='返回最优解的个数，默认只返回最优解，>1 表示返回多个解')
    
    args = parser.parse_args()
    
    # 求解器类型处理
    if args.solver == 'auto':
        args.solver = 'gurobi'  # 默认使用Gurobi
    
    # 验证 alpha 参数
    if not (0 <= args.alpha <= 1):
        print(f"错误: alpha 必须在 [0, 1] 范围内，当前值: {args.alpha}", file=sys.stderr)
        sys.exit(1)
    
    # 验证 best_k 参数
    if args.best_k is not None and args.best_k < 1:
        print(f"错误: best_k 必须 >= 1，当前值: {args.best_k}", file=sys.stderr)
        sys.exit(1)
    
    # 加载数据
    input_path = Path(args.input)
    if not input_path.exists():
        print(f"错误: 输入文件不存在: {args.input}", file=sys.stderr)
        sys.exit(1)
    
    print(f"加载数据: {args.input}")
    programs, chip_metadata, statistics = load_data(str(input_path))
    
    if statistics:
        print(f"数据统计: {statistics.get('num_programs', 'N/A')} 个程序, "
              f"{statistics.get('num_chips', 'N/A')} 个候选芯片")
    else:
        print(f"加载了 {len(programs)} 个程序")
    
    # 创建求解器
    solver = ISAILPSolver(programs, args.num_chips, args.solver, chip_metadata, args.alpha, args.best_k)
    
    # 求解
    best_k_str = f"，返回 {args.best_k} 个最优解" if args.best_k and args.best_k > 1 else ""
    print(f"\n开始求解（选择{args.num_chips}个芯片{best_k_str}）...")
    success, solutions, obj_values = solver.solve(args.timeout)
    
    if success:
        if not args.quiet:
            for idx, (solution, obj_value) in enumerate(zip(solutions, obj_values)):
                solver.print_solution(solution, obj_value, solution_idx=idx)
        else:
            print(f"\n✓ 求解成功！找到 {len(solutions)} 个解")
            for idx, (solution, obj_value) in enumerate(zip(solutions, obj_values)):
                print(f"\n解 #{idx + 1}:")
                print(f"  选中的芯片: {solution['selected_chips']}")
                print(f"  平均成本: {solution['average_cost']:.4f}")
                print(f"  目标函数值: {obj_value:.4f}")
        
        # 保存结果
        if args.output:
            if len(solutions) == 1:
                # 单个解，保持原有格式
                solution = solutions[0]
                obj_value = obj_values[0]
                output_data = {
                    'num_chips': args.num_chips,
                    'selected_chips': solution['selected_chips'],
                    'assignments': solution['assignments'],
                    'average_cost': solution['average_cost'],
                    'objective_value': obj_value,
                    'alpha': args.alpha,
                    'chip_metadata': {
                        chip_id: chip_metadata.get(chip_id, {}) 
                        for chip_id in solution['selected_chips']
                    } if chip_metadata else {}
                }
            else:
                # 多个解
                output_data = {
                    'num_chips': args.num_chips,
                    'alpha': args.alpha,
                    'num_solutions': len(solutions),
                    'solutions': []
                }
                for idx, (solution, obj_value) in enumerate(zip(solutions, obj_values)):
                    output_data['solutions'].append({
                        'solution_index': idx + 1,
                        'selected_chips': solution['selected_chips'],
                        'assignments': solution['assignments'],
                        'average_cost': solution['average_cost'],
                        'objective_value': obj_value,
                        'chip_metadata': {
                            chip_id: chip_metadata.get(chip_id, {}) 
                            for chip_id in solution['selected_chips']
                        } if chip_metadata else {}
                    })
            
            output_path = Path(args.output)
            output_path.parent.mkdir(parents=True, exist_ok=True)
            with open(output_path, 'w', encoding='utf-8') as f:
                json.dump(output_data, f, indent=2, ensure_ascii=False)
            print(f"\n结果已保存到: {args.output}")
    else:
        print("\n✗ 求解失败")
        sys.exit(1)


if __name__ == '__main__':
    main()
