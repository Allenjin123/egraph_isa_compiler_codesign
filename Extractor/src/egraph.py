import re
import os
import json
import pickle
import logging
from collections import defaultdict

"""Lightweight e-graph reader focused on JSON structure in Extractor/test.

This module removes GPU/MLP dependencies and keeps only the parsing logic
to construct ENode/EClass objects and basic cross-references.
"""

def merge_json(json_files):
    merged = {"nodes": {}}
    subroots = []
    for file in json_files:
        prefix = os.path.splitext(os.path.basename(file))[0]
        with open(file, 'r') as f:
            nodes = json.load(f).get("nodes", {})
        for nid, node in nodes.items():
            new_id = f"{prefix}_{nid}"
            new_node = dict(node)
            # prefix eclass
            if "eclass" in new_node and new_node["eclass"] is not None:
                new_node["eclass"] = f"{prefix}_{new_node['eclass']}"
            # prefix children (enode ids)
            if "children" in new_node and new_node["children"]:
                new_node["children"] = [f"{prefix}_{c}" for c in new_node["children"]]
            # rename root op
            if new_node.get("op") == "root":
                new_node["op"] = f"{prefix}_root"
                subroots.append(new_id)
            merged["nodes"][new_id] = new_node
    merged["nodes"]["root_enode"] = {
        "op": "root",
        "children": subroots,
        "eclass": "root_eclass",
        "cost": 0,
        "subsumed": False
    }
    return merged

class ENode:

    def __init__(self, eclass_id, enode_id, op, children, cost=1):
        self.eclass_id = eclass_id
        self.enode_id = enode_id
        self.op = op
        self.children = children # list of child eclass ids
        self.cost = cost

    def __repr__(self) -> str:
        return (f'ENode(id={self.enode_id}, eclass={self.eclass_id}, '
                f'op={self.op}, children={self.children})')


class EClass:

    def __init__(self, class_id):
        self.class_id = class_id
        self.locked = False
        self.member_enodes = set()
        self.parent_enodes = set()

    def __repr__(self) -> str:
        return (f'EClass(id={self.class_id}, members={self.member_enodes}, '
                f'parent_enodes={self.parent_enodes})')

class Op:
    def __init__(self, name):
        self.name = name
        self.count = 0
        self.ec_en = defaultdict(set)  # eclass_id -> set of enode_ids
        self.total_cost = 0

    def add_instance(self, eclass_id, enode_id, cost):
        self.count += 1
        self.ec_en[eclass_id].add(enode_id)
        self.total_cost += cost

    def __repr__(self) -> str:
        return (f'Op(name={self.name}, count={self.count}, '
                f'ec_en={self.ec_en}, total_cost={self.total_cost})')


class EGraph:

    def __init__(self, input_files):
        self.eclasses = {}
        self.enodes = {}
        self.ops = {}
        self.root_classes = set()
        self.from_json_file(merge_json(input_files))

    def __repr__(self) -> str:
        return f'EGraph: EClass {self.eclasses} ENode {self.enodes} Ops {self.ops}'
    

    def from_json_file(self, input_dict):
        node_objs = input_dict.get('nodes', {})
        leaf_op = Op("leaf")
        
        # Pass 1: node -> eclass mapping
        node_to_eclass = {}
        for nid, n in node_objs.items():
            ec = n.get('eclass')
            node_to_eclass[nid] = ec

        # Pass 2: instantiate classes, nodes, ops, and parent links
        for node_id, node in node_objs.items():
            ec = node.get('eclass')
            if ec is None:
                logging.warning(f'Node {node_id} missing eclass; skipping')
                continue
            # ensure class exists and add member
            if ec not in self.eclasses:
                self.eclasses[ec] = EClass(ec)
            self.eclasses[ec].member_enodes.add(node_id)

            op = node.get('op', "N/A")
            cost = node.get('cost', 1)
            if op.endswith("_root"):
                self.root_classes.add(ec)
            # map children (node ids) -> child eclass ids
            child_eclasses = []
            if node.get('children'):
                for child_id in node.get('children', []):
                    child_ec = node_to_eclass.get(child_id)
                    if child_ec is None:
                        logging.warning(f'Child {child_id} referenced by {node_id} not found; skipping')
                        continue
                    child_eclasses.append(child_ec)
                    if child_ec not in self.eclasses:
                        self.eclasses[child_ec] = EClass(child_ec)
                    self.eclasses[child_ec].parent_enodes.add(node_id)
            else: # leaf node
                leaf_op.add_instance(ec, node_id, cost)
            # create enode
            self.enodes[node_id] = ENode(
                eclass_id=ec,
                enode_id=node_id,
                op=op,
                children=child_eclasses,
                cost=cost,
            )
            def check_circular(ec, child_eclasses):
                return ec in child_eclasses
            # op stats
            if child_eclasses and not check_circular(ec, child_eclasses):
                if op not in self.ops:
                    self.ops[op] = Op(op)
                self.ops[op].add_instance(ec, node_id, cost)
                # Op.total_cost already tracks cumulative cost; no separate op_cost map needed.
                
        self.add_pseudo_root()
        self.ops["leaf"] = leaf_op
        return self

    def add_pseudo_root(self):
        """Attach any orphan eclasses (no parents) under a corresponding <prefix>_root enode.

        - parent_enodes should store parent ENODE IDs (strings)
        - enode.children should store child ECLASS IDs (strings)
        """
        # Build a map: prefix -> one enode_id whose op is f"{prefix}_root"
        prefix_root_enode = {}
        for enode_id, enode in self.enodes.items():
            if enode.op != "root" and enode.op.endswith("_root"):
                prefix = enode.op[: -len("_root")]
                # keep first seen for that prefix
                if prefix not in prefix_root_enode:
                    prefix_root_enode[prefix] = enode_id

        for ec_id, ec_obj in self.eclasses.items():
            if ec_id == "root_eclass":
                continue
            if not ec_obj.parent_enodes:
                prefix = ec_id.split('_', 1)[0]
                root_enode_id = prefix_root_enode.get(prefix)
                if root_enode_id:
                    # Record parent enode id
                    ec_obj.parent_enodes.add(root_enode_id)
                    # Add this eclass as a child of the prefix_root enode if not already present
                    if ec_id not in self.enodes[root_enode_id].children:
                        self.enodes[root_enode_id].children.append(ec_id)
                    print(f'Added orphan eclass {ec_id} under root enode {root_enode_id}')

        

# def main():
#     result = merge_json(["4.json", "5.json"])
#     with open("merged.json", "w") as f:
#         json.dump(result, f, indent=2)
# if __name__ == "__main__":
#     main()

