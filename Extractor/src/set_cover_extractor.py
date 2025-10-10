from collections import defaultdict
from egraph import EGraph # 假设您之前的代码在 egraph.py
import json

class SinglePassSetCoverExtractor:
    """
    Implements a single-pass extraction method based on a greedy Set Cover
    algorithm, as per user specification.

    This algorithm's goal is to produce a subgraph where every
    e-class is represented by exactly one e-node. The selection process
    is driven by minimizing the number of unique operators used.

    Algorithm:
    1.  Pre-calculation: Map each operator to the set of e-classes it can represent.
    2.  Greedy Loop: Until all e-classes are "covered":
        a. Find the operator that can cover the most currently uncovered e-classes.
        b. For each e-class this operator covers, "lock in" a choice. We must
           select one e-node with that operator to represent the e-class.
           (Tie-breaking: if multiple e-nodes have the chosen operator, pick the
           one with the lowest cost).
        c. Mark these e-classes as covered and repeat.
    3.  The output is a dictionary mapping every e-class ID to its single
        chosen representative e-node ID. This represents the final subgraph.
    """
    def __init__(self, egraph: EGraph):
        self.egraph = egraph
        self.subgraph = {} # The result: maps eclass_id -> chosen enode_id
        self.uncovered_eclasses = set(egraph.eclasses.keys())
    def extract(self) -> dict:
        """
        Runs the single-pass greedy Set Cover selection.

        Returns:
            dict: A dictionary representing the selected subgraph, mapping each
                  e-class ID to its single chosen representative e-node ID.
        """
        print("--- Running Single-Pass Set Cover Extraction ---")

        # 1. Pre-calculation: Map operators to the e-classes they can cover.
        # We don't need to cover the pseudo-class
        pseudo_class_name = self.egraph.file_name + '_pseudo_class'
        if pseudo_class_name in self.uncovered_eclasses:
            self.uncovered_eclasses.remove(pseudo_class_name)

        # 2. Greedy Loop
        while self.uncovered_eclasses:
            best_op = None
            best_op_info = None
            best_op_coverage = -1
            
            # a. Find the best operator for the current uncovered set
            for op, op_info in self.egraph.ops.items():
                eclasses_it_covers = op_info.eclass_ids # should be pruned
                coverage = len(eclasses_it_covers)
                if coverage > best_op_coverage:
                    best_op_coverage = coverage
                    best_op = op
                    best_op_info = op_info
            if best_op is None or best_op_coverage == 0:
                print(f"Warning: No operator can cover the remaining e-classes: {self.uncovered_eclasses}")
                break

            print(f"Choosing operator '{best_op}' which covers {best_op_coverage} new e-classes.")

            # b. For each e-class this operator covers, lock in a choice
            eclasses_to_cover_now = best_op_info.eclass_ids # might be pruned
            eclasses_to_cover_actually = set()
            while eclasses_to_cover_now:
                ec_id = eclasses_to_cover_now.pop()
                self.lock_and_remove(ec_id, best_op)
                eclasses_to_cover_actually.add(ec_id)
            # c. Update uncovered set
            self.uncovered_eclasses.difference_update(eclasses_to_cover_actually)
            
        print("Extraction of subgraph complete.")
        return self.subgraph

    def lock_and_remove(self, ec_id, chosen_op):
        """
        Recursively locks in choices for an e-class and its children
        based on the chosen operator.
        """ 
        # If we've already locked this e-class, nothing to do
        if ec_id in self.subgraph:
            print(f"EClass '{ec_id}' already locked in subgraph.")
            return

        # Sanity: ensure eclass exists
        if ec_id not in self.egraph.eclasses:
            # Unknown eclass, skip gracefully
            print(f"Warning: EClass '{ec_id}' not found in egraph.")
            return

        # 1) 在该 e-class 内选择 op==chosen_op 的最便宜 enode 作为代表
        member_enodes = self.egraph.eclasses[ec_id].member_enodes
        candidate_ids = [en_id for en_id in member_enodes
                         if self.egraph.enodes[en_id].op == chosen_op]
        if not candidate_ids:
            # 没有匹配 op 的 enode，就不锁定，直接返回
            # 这一步可能意味着该 eclass 实际上并不由该 op 覆盖
            print(f"Warning: No e-node with op '{chosen_op}' found in EClass '{ec_id}'.")
            return

        # 选成本最低的候选
        chosen_enode_id = min(
            candidate_ids,
            key=lambda nid: self.egraph.enodes[nid].cost
        )

        # 记录到 subgraph
        self.subgraph[ec_id] = chosen_enode_id

        # 2) 对该 e-class 中其他未被选择的 enode：
        #    - 将其 children 的 eclass 从 uncovered_eclasses 中删除
        #    - 并从对应 op 的 eclass_ids 中删除（需要递归地对其子树生效）
        chosen_children = set(self.egraph.enodes[chosen_enode_id].children)
        to_prune_enodes = [en_id for en_id in member_enodes if en_id != chosen_enode_id]

        visited_eclasses = set()

        for en_id in to_prune_enodes:
            en = self.egraph.enodes[en_id]
            for child_ec in en.children:
                # 如果该子 eclass 也是被选择 enode 的子节点，则不要剪掉它
                if child_ec in chosen_children:
                    continue
                self._prune_eclass_recursively(child_ec, visited_eclasses)

    def _prune_eclass_recursively(self, eclass_id: str, visited: set):
        """递归剪枝一个 e-class：
        - 从 uncovered_eclasses 删除该 eclass
        - 从所有出现在该 eclass 内的 op 的 eclass_ids 里删除该 eclass
        - 递归处理其成员 enode 的子 eclass

        注意：
        - 若该 eclass 已经被锁定选中（出现在 subgraph 中），则不剪枝。
        - 使用 visited 防止循环。
        """
        if eclass_id in visited:
            return
        visited.add(eclass_id)

        # 如果这个 eclass 已经锁定为代表的一部分，就不要剪掉它
        if eclass_id in self.subgraph:
            return

        # 从未覆盖集合中移除
        if hasattr(self, 'uncovered_eclasses'):
            self.uncovered_eclasses.discard(eclass_id)

        # 这个 eclass 可能不存在（数据异常）
        eclass_obj = self.egraph.eclasses.get(eclass_id)
        if not eclass_obj:
            return

        # 将该 eclass 从对应 op 的 eclass_ids 中移除
        # 只需查看该 eclass 的成员 enode，对其 op 进行删除当前 eclass 的操作
        for en_id in list(eclass_obj.member_enodes):
            en = self.egraph.enodes.get(en_id)
            if not en:
                continue
            op_info = self.egraph.ops.get(en.op)
            if op_info:
                op_info.eclass_ids.discard(eclass_id)

        # 递归剪枝子树（成员 enode 的子 eclass）
        for en_id in list(eclass_obj.member_enodes):
            en = self.egraph.enodes.get(en_id)
            if not en:
                continue
            for child_ec in en.children:
                # 防止把已经锁定的 eclass 剪掉
                if child_ec in self.subgraph:
                    continue
                self._prune_eclass_recursively(child_ec, visited)

        
if __name__ == '__main__':
    
    json_filename = "saturation_5.json"
        
    egraph = EGraph(input_file=json_filename)
    extractor = SinglePassSetCoverExtractor(egraph)

    # Run the single-pass extraction to get the subgraph
    subgraph = extractor.extract()
    
    print("\n" + "="*50)
    print("Generated Subgraph (EClass ID -> Chosen ENode ID):")
    # Pretty print the dictionary
    for ec_id, en_id in sorted(subgraph.items()):
        enode = egraph.enodes[en_id]
        print(f"  '{ec_id}': '{en_id}' --> (op: {enode.op}, cost: {enode.cost})")
    print("="*50)

    