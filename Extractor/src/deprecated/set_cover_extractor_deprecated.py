from collections import defaultdict, deque
from egraph import EGraph, get_files
import json
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
DATA_DIR = Path(__file__).resolve().parents[1] / 'data'

INFINITY = float('inf')

class SetCoverExtractor:
    """
    Implements a single-pass extraction method based on a greedy Set Cover
    algorithm.

    This algorithm's goal is to produce a subgraph where every
    e-class is represented by exactly one operator. The selection process
    is driven by minimizing the number of unique operators used.

    Algorithm:
    1.  Pre-calculation: 先处理root和leaf，这和operator无关.
    2.  Greedy Loop: Until all e-classes are "covered":
        a. Find the operator that can cover the most currently uncovered e-classes.
        b. For each e-class this operator covers, "lock in" choices for its representative
           e-node and its children (recursively).
        c. Mark these e-classes as covered and repeat.
    """
    def __init__(self, egraph: EGraph):
        self.egraph = egraph
        self.uncovered_eclasses = set(egraph.eclasses.keys())
        self.uncovered_ops = set(egraph.ops.keys())
        self.used_ops = set()
        
    def extract(self) -> dict:
        """
        Runs the greedy Set Cover selection.

        Returns:
            modified EGraph -- self.egraph. 但较为宽泛，只保证一个eclass有一个op，但还可能有多个enode和不需要的eclass
        """
        print("--- Running Greedy Set Cover Extraction ---")

        # 1. Pre-calculation: 
        # clean root classes
        for root_eclass, val in self.egraph.root_ec_en.items():
            if root_eclass in self.uncovered_eclasses:
                if isinstance(val, (list, set, tuple)):
                    root_enode = min(val, key=lambda nid: self.egraph.enodes[nid].cost)
                else:
                    root_enode = val
                self.uncovered_eclasses.discard(root_eclass)
                self.uncovered_ops.discard(self.egraph.enodes[root_enode].op)
                self.used_ops.add(self.egraph.enodes[root_enode].op)

        # clean leaf classes
        for leaf_eclass, val in self.egraph.ops["leaf"].ec_en.items():
            if leaf_eclass in self.uncovered_eclasses:
                if isinstance(val, (list, set, tuple)):
                    leaf_enode = min(val, key=lambda nid: self.egraph.enodes[nid].cost)
                else:
                    leaf_enode = val
                self.uncovered_eclasses.discard(leaf_eclass)
                self.uncovered_ops.discard(self.egraph.enodes[leaf_enode].op)
                self.used_ops.add(self.egraph.enodes[leaf_enode].op)

        # 2. Greedy Loop
        while self.uncovered_eclasses:
            best_op = None
            best_op_info = None
            best_op_coverage = -1
            
            # a. Find the best operator for the current uncovered set
            for op in self.uncovered_ops:
                if op == "leaf" or op.endswith("_root"):
                    continue # Skip leaf and root pseudo-ops
                op_info = self.egraph.ops[op]
                coverage = len(op_info.ec_en.keys()) # should be pruned during each iteration
                if coverage > best_op_coverage:
                    best_op_coverage = coverage
                    best_op = op
                    best_op_info = op_info

            if best_op is None or best_op_coverage == 0:
                print(f"Warning: No operator can cover the remaining e-classes: {self.uncovered_eclasses}")
                break

            print(f"Choosing operator '{best_op}' which covers {best_op_coverage} new e-classes.")
            
            # b. For each e-class this operator covers, lock in choices
            eclasses_to_cover = best_op_info.ec_en.keys()
            for ec_id in eclasses_to_cover:
                self.lock_and_remove(ec_id, best_op)

            # c. Update uncovered set
            self.uncovered_eclasses.difference_update(eclasses_to_cover)
            self.uncovered_ops.discard(best_op)
            self.used_ops.add(best_op)
        
        print(f"\n--- Set Cover Complete: Used {len(self.used_ops)} operators ---")

    def lock_and_remove(self, ec_id, chosen_op):
        """
        Locks in choices for an e-class and its children based on the chosen operator.
        Then removes other unchosen e-nodes and prunes their children e-classes.
        """ 
        # If we've already locked this e-class, nothing to do
        if self.egraph.eclasses[ec_id].locked:
            print(f"EClass '{ec_id}' already locked; skipping.")
            return 0

        # Sanity: ensure eclass exists
        if ec_id not in self.egraph.eclasses:
            # Unknown eclass, skip gracefully
            print(f"Warning: EClass '{ec_id}' not found in egraph.")
            return 0

        # 1) 标记该 e-class 为已处理（锁定）
        self.egraph.eclasses[ec_id].locked = True
        #self._mark_eclass(ec_id, sub_enodes) # Locks in choices

        # 2) 对该 e-class 中其他未被选择的 enode：
        #    - 将其 children 的 eclass （且未被lock的）从 uncovered_eclasses 中删除
        #    - 并从对应 op 的 eclass_ids 中删除（需要递归地对其子树生效）
        sub_enodes = self.egraph.ops[chosen_op].ec_en.get(ec_id, [])
        member_enodes = self.egraph.eclasses[ec_id].member_enodes
        to_prune_enodes = [en_id for en_id in member_enodes if en_id not in sub_enodes]

        for en_id in to_prune_enodes:
            en = self.egraph.enodes[en_id]
            self._remove_en_from_op(en_id, ec_id) # Remove from other op's ec_en
            # for child_ec in en.children: #不过度剪枝，取消递归操作
            #     self._prune_eclass_recursively(child_ec)
        self.egraph.eclasses[ec_id].member_enodes = set(sub_enodes)

    def _remove_en_from_op(self, en_id, ec_id):
        en = self.egraph.enodes[en_id]
        op_info = self.egraph.ops.get(en.op)
        if op_info and ec_id in op_info.ec_en.keys():
            op_info.ec_en[ec_id].discard(en_id)
            if not op_info.ec_en[ec_id]:
                del op_info.ec_en[ec_id]

    # def _mark_eclass(self, eclass_id: str, sub_enodes: list):
    #     """标记一个 e-class 为已处理（即已被锁定，不能被剪枝）"""
    #     self.egraph.eclasses[eclass_id].locked = True
    #     for en_id in sub_enodes:
    #         en = self.egraph.enodes[en_id]
    #         if eclass_id in en.children:
    #             continue # Avoid self-loop
    #         for child_ec in en.children: #不过度剪枝，取消递归操作
    #             if not self.egraph.eclasses[child_ec].locked:
    #                 #self._mark_eclass(child_ec, self.egraph.eclasses[child_ec].member_enodes)
    #                 self.egraph.eclasses[child_ec].locked = True

    def cleanup_graph(self):
        """
        从 root_eclass 开始，清理出可达的 eclasses 和 enodes
        在原 egraph 基础上：
        1. 移除不可达的 eclasses
        2. 重新构建正确的 parent_enodes 关系
        3. 返回 leaf enodes 供 DAG 提取使用
        
        Returns:
            deque: leaf enode_ids (没有 children 的 enodes)
        """
        print("\n--- Cleaning Up Graph After Set Cover ---")
        
        # 1. 从 root_eclass 出发，找出所有可达的 eclasses
        # root_eclass 是唯一的根，它的 children 是各个子类的根（如 4_root, 5_root）
        reachable_eclasses = set()
        to_visit = deque(["root_eclass"])
        
        while to_visit:
            ec_id = to_visit.popleft()
            if ec_id in reachable_eclasses or ec_id not in self.egraph.eclasses:
                continue
            
            reachable_eclasses.add(ec_id)
            eclass = self.egraph.eclasses[ec_id]
            
            # 访问该 eclass 中所有 member_enodes 的 children
            for en_id in eclass.member_enodes:
                if en_id in self.egraph.enodes:
                    enode = self.egraph.enodes[en_id]
                    to_visit.extend(enode.children)
        
        print(f"Reachable eclasses: {len(reachable_eclasses)} / {len(self.egraph.eclasses)}")
        print(f"Reachable eclasses list: {sorted(reachable_eclasses)}")
        
        # 2. 清理不可达的 eclasses（从 egraph 中移除）
        unreachable = set(self.egraph.eclasses.keys()) - reachable_eclasses
        for ec_id in unreachable:
            del self.egraph.eclasses[ec_id]
        print(f"Removed {len(unreachable)} unreachable eclasses")
        
        # 3. 重新构建所有 eclass 的 parent_enodes 关系
        # 4. 收集所有 leaf enodes（没有 children 的 enodes）

        # 先清空所有 parent_enodes
        for ec_id in reachable_eclasses:
            self.egraph.eclasses[ec_id].parent_enodes.clear()
        
        # 重新扫描所有 enode，构建 parent 关系
        analysis_pending = deque()
        reachable_enodes = set()
        for ec_id in reachable_eclasses:
            eclass = self.egraph.eclasses[ec_id]
            for en_id in eclass.member_enodes:
                if en_id not in self.egraph.enodes:
                    continue
                enode = self.egraph.enodes[en_id]
                reachable_enodes.add(en_id)

                if not enode.children:
                    analysis_pending.append(en_id)

                # 为每个 child eclass 记录当前 enode 为其 parent
                for child_ec in list(enode.children):
                    if child_ec in reachable_eclasses:
                        self.egraph.eclasses[child_ec].parent_enodes.add(en_id)
                    else:
                        self.egraph.enodes[en_id].children.remove(child_ec)

        unreachable = set(self.egraph.enodes.keys()) - reachable_enodes
        for en_id in unreachable:
            del self.egraph.enodes[en_id]
        print(f"Removed {len(unreachable)} unreachable enodes")
        print(f"Found {len(analysis_pending)} leaf enodes for DAG extraction")
        print(f"Rebuilt parent_enodes relationships")
        
        return analysis_pending
    
    def dag_extract(self, analysis_pending):
        """
        Phase 2: 自底向上的 DAG 提取算法
        从 leaf enodes 开始，计算每个 eclass 的最优 enode（最小化 DAG cost）
        
        Args:
            analysis_pending: deque of leaf enode_ids
        
        Returns:
            dict: eclass_id -> chosen_enode_id
        """
        print("\n--- Running Bottom-Up DAG Extraction ---")
        
        # costs[eclass_id] = (total_cost, chosen_enode_id, cost_set)
        costs = {}
        pending = analysis_pending
        processed = set()
        iteration = 0
        
        # 自底向上计算 cost（类似 Rust 实现）
        while pending:
            en_id = pending.popleft()
            
            if en_id in processed or en_id not in self.egraph.enodes:
                continue
            
            enode = self.egraph.enodes[en_id]
            ec_id = enode.eclass_id
            
            # 检查所有子节点是否已计算完成（类似 Rust 的 all() 检查）
            if not all(child_ec in costs for child_ec in enode.children):
                # 子节点未全部计算完成，跳过（不重新加入队列）
                continue
            
            processed.add(en_id)
            iteration += 1
            
            # 计算该 enode 的 cost_set
            total_cost, cost_set = self._calculate_cost_set(enode, costs)
            
            # 更新该 eclass 的最优选择
            prev_cost = costs.get(ec_id, (INFINITY, None, {}))[0]
            if total_cost < prev_cost:
                costs[ec_id] = (total_cost, en_id, cost_set)
                
                # 通知父节点重新计算（类似 Rust 的 extend）
                if ec_id in self.egraph.eclasses:
                    parent_enodes = self.egraph.eclasses[ec_id].parent_enodes
                    for parent_en_id in parent_enodes:
                        if parent_en_id not in processed:
                            pending.append(parent_en_id)
        
        print(f"\nDAG extraction completed:")
        print(f"  Computed costs for {len(costs)}/{len(self.egraph.eclasses)} eclasses after {iteration} iterations")
        print(f"  Processed {len(processed)}/{len(self.egraph.enodes)} enodes")
        
        # 检查哪些 eclasses 没有被计算（可能是循环依赖）
        missing_eclasses = set(self.egraph.eclasses.keys()) - set(costs.keys())
        if missing_eclasses:
            print(f"\n⚠️  {len(missing_eclasses)} eclasses not extracted (likely circular dependencies):")
            for ec_id in list(missing_eclasses)[:5]:
                eclass = self.egraph.eclasses[ec_id]
                ops = {self.egraph.enodes[en_id].op for en_id in eclass.member_enodes if en_id in self.egraph.enodes}
                print(f"    - {ec_id}: operators {ops}")
        
        # Debug: 检查 root_eclass 的依赖
        if "root_eclass" in self.egraph.eclasses:
            root_ec = self.egraph.eclasses["root_eclass"]
            print(f"\nDebug: root_eclass has {len(root_ec.member_enodes)} enodes:")
            for en_id in list(root_ec.member_enodes)[:3]:
                if en_id in self.egraph.enodes:
                    en = self.egraph.enodes[en_id]
                    print(f"  {en_id}: op={en.op}, children={en.children}")
                    print(f"    Children in costs: {[c in costs for c in en.children]}")
        
        # 从 root_eclass 回溯，构建最终提取结果
        result = {}
        to_visit = deque(["root_eclass"])
        visited = set()
        
        while to_visit:
            ec_id = to_visit.popleft()
            
            if ec_id in visited or ec_id not in costs:
                if ec_id not in costs and ec_id in self.egraph.eclasses:
                    print(f"Warning: eclass '{ec_id}' not in costs")
                continue
            
            visited.add(ec_id)
            _, chosen_en_id, _ = costs[ec_id]
            result[ec_id] = chosen_en_id
            
            # 递归访问子节点
            if chosen_en_id in self.egraph.enodes:
                chosen_enode = self.egraph.enodes[chosen_en_id]
                to_visit.extend(chosen_enode.children)
        
        print(f"Extracted {len(result)} eclasses from DAG")
        return result
    
    def _calculate_cost_set(self, enode, costs):
        """
        计算一个 enode 的 cost_set（考虑 DAG 共享）
        
        Returns:
            (total_cost, cost_set): cost_set 是 {eclass_id: cost} 的字典
        """
        # Leaf 节点
        if not enode.children:
            return enode.cost, {enode.eclass_id: enode.cost}
        
        # 获取子节点的唯一 eclass（去重）
        unique_children = list(set(enode.children))
        
        # 循环检测：如果子节点包含当前 eclass，返回 INFINITY
        if enode.eclass_id in unique_children:
            return INFINITY, {}
        
        # 合并所有子节点的 cost_set
        merged_costs = {}
        for child_ec in unique_children:
            if child_ec not in costs:
                continue
            _, _, child_cost_set = costs[child_ec]
            for ec, cost in child_cost_set.items():
                if ec not in merged_costs:
                    merged_costs[ec] = cost
        
        # 再次检测循环（精确检测）
        if enode.eclass_id in merged_costs:
            return INFINITY, {}
        
        # 加入当前节点
        merged_costs[enode.eclass_id] = enode.cost
        total = sum(merged_costs.values())
        
        return total, merged_costs

    def test_print(self):
        print("EGraph State:")
        print(f"  Uncovered EClasses: {self.uncovered_eclasses}")
        print(f"  Uncovered Ops: {self.uncovered_ops}")
        print(f"  Used Ops: {self.used_ops}")
        for ec_id, ec in self.egraph.eclasses.items():
            print(f"  EClass '{ec_id}' has:")
            for en_id in ec.member_enodes:
                en = self.egraph.enodes[en_id]
                print(f"  ENode '{en_id}' (op: {en.op}, cost: {en.cost}, locked: {ec.locked})")

        
if __name__ == '__main__':
    print("DATA_DIR:", DATA_DIR)
    files = get_files(DATA_DIR)
    egraph = EGraph(input_files=files)
    
    # Phase 1: Set Cover
    extractor = SetCoverExtractor(egraph)
    extractor.extract()
    #extractor.test_print()

    # Phase 1.5: Cleanup: 清理不可达节点，重建父子关系
    analysis_pending = extractor.cleanup_graph()
    
    # Debug: 检查自环
    print(f"\nDebug: Checking for self-loops...")
    self_loops = []
    for ec_id, eclass in egraph.eclasses.items():
        for en_id in eclass.member_enodes:
            if en_id in egraph.enodes:
                en = egraph.enodes[en_id]
                if ec_id in en.children:
                    self_loops.append((ec_id, en_id))
                    print(f"  ✗ Self-loop: eclass '{ec_id}' -> enode '{en_id}' (op={en.op}) has child '{ec_id}'")
    
    if not self_loops:
        print(f"  ✓ No self-loops found")
    else:
        print(f"  Found {len(self_loops)} self-loops!")
    
    # Debug: 追踪依赖链
    print(f"\nDebug: Tracing dependency chain...")
    def trace_deps(ec_id, depth=0, visited=None):
        if visited is None:
            visited = set()
        if ec_id in visited:
            print(f"{'  ' * depth}✗ CYCLE DETECTED: {ec_id}")
            return
        if depth > 5:
            return
        visited.add(ec_id)
        
        if ec_id not in egraph.eclasses:
            print(f"{'  ' * depth}✗ {ec_id} MISSING")
            return
        
        eclass = egraph.eclasses[ec_id]
        for en_id in list(eclass.member_enodes)[:1]:
            if en_id in egraph.enodes:
                en = egraph.enodes[en_id]
                print(f"{'  ' * depth}{ec_id} -> {en_id} (op={en.op})")
                for child_ec in en.children:
                    trace_deps(child_ec, depth + 1, visited.copy())
    
    trace_deps('5_Inst-117')
    
    # Phase 2: DAG Extraction
    result = extractor.dag_extract(analysis_pending)
    for ec_id, en_id in sorted(result.items()):
        enode = egraph.enodes[en_id]
        print(f"  '{ec_id}' -> '{en_id}' (op: {enode.op}, cost: {enode.cost})")
    print("="*60)

    