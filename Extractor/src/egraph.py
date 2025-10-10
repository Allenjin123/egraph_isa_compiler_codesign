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
        self.member_enodes = set()
        self.parent_enodes = set()

    def add_parent_enode(self, parent_node):
        self.parent_enodes.add(parent_node)

    def __repr__(self) -> str:
        return (f'EClass(id={self.class_id}, members={self.member_enodes}, '
                f'parent_enodes={self.parent_enodes})')

class Op:
    def __init__(self, name):
        self.name = name
        self.count = 0
        self.eclass_ids = set()
        self.enode_ids = set()
        self.total_cost = 0

    def add_instance(self, eclass_id, enode_id, cost):
        self.count += 1
        self.eclass_ids.add(eclass_id)
        self.enode_ids.add(enode_id)
        self.total_cost += cost

    def __repr__(self) -> str:
        return (f'Op(name={self.name}, count={self.count}, '
                f'eclasses={self.eclass_ids}, enodes={self.enode_ids}, '
                f'total_cost={self.total_cost})')
    

class EGraph:

    def __init__(self,
                 input_file):
        self.eclasses = {}
        self.enodes = {}
        self.ops = {}
        self.op_cost = defaultdict(int)
        self.file_name = input_file.rstrip('.json')
        if input_file.endswith('.json'):
            self.from_json_file(input_file)
        else:
            raise NotImplementedError

    def __repr__(self) -> str:
        return f'EGraph: EClass {self.eclasses} ENode {self.enodes} Ops {self.ops}'
    

    def from_json_file(self, json_file):
        with open(json_file, 'r') as f:
            input_dict = json.load(f)
        node_objs = input_dict.get('nodes', {})

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

            # map children (node ids) -> child eclass ids
            child_eclasses = []
            for child_id in node.get('children', []):
                child_ec = node_to_eclass.get(child_id)
                if child_ec is None:
                    logging.warning(f'Child {child_id} referenced by {node_id} not found; skipping')
                    continue
                child_eclasses.append(child_ec)
                if child_ec not in self.eclasses:
                    self.eclasses[child_ec] = EClass(child_ec)
                self.eclasses[child_ec].add_parent_enode(node_id)
                
            # create enode
            self.enodes[node_id] = ENode(
                eclass_id=ec,
                enode_id=node_id,
                op=op,
                children=child_eclasses,
                cost=cost,
            )

            # op stats
            if child_eclasses:
                if op not in self.ops:
                    self.ops[op] = Op(op)
                self.ops[op].add_instance(ec, node_id, cost)
                self.op_cost[op] += cost

        # Roots (optional)
        # self.root_eclasses = input_dict.get('root_eclasses', [])
        self.add_pseudo_root()
        return self

    def add_pseudo_root(self):
        root_node_name = self.file_name + '_pseudo_node'
        root_class_name = self.file_name + '_pseudo_class'
        pseudo_root_class = EClass(root_class_name)
        pseudo_root_node = ENode(
            eclass_id=root_class_name,
            enode_id=root_node_name,
            op="pseudo_root",
            children=[],
            cost=0,
        )
        pseudo_root_class.member_enodes.add(root_node_name)

        for ec in self.eclasses.values():
            if not ec.parent_enodes:
                ec.add_parent_enode(root_node_name)
                pseudo_root_node.children.append(ec.class_id)
                print(f'Added pseudo root link: {root_node_name} -> {ec.class_id}')
        self.enodes[root_node_name] = pseudo_root_node
        self.eclasses[root_class_name] = pseudo_root_class
        if "pseudo_root" not in self.ops:
            self.ops["pseudo_root"] = Op("pseudo_root")
        self.ops["pseudo_root"].add_instance(root_class_name, root_node_name, 0)

    def merge_egraph(self, others):
        pass
    