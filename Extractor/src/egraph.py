import re
import os
import json
import pickle
import logging
import argparse
from collections import defaultdict
from typing import Optional, Sequence

"""
Lightweight e-graph reader focused on JSON structure in Extractor/test.

This module keeps only the parsing logic to construct ENode/EClass objects and basic cross-references.
"""
# Get the directory of this script
script_dir = os.path.dirname(os.path.abspath(__file__))
# Go up to project root and then into output/frontend/
project_root = os.path.dirname(os.path.dirname(script_dir))
DATA_DIR = os.path.join(project_root, "output", "frontend")
   
def get_file_name(path):
    return os.path.basename(path)

def sanitize(s: str) -> str:
    "convert string to valid variable name (only letters, numbers, and underscores)"
    return re.sub(r'[^a-zA-Z0-9_]', '_', str(s))

def clean_folder(folder):
    merged_path = os.path.join(folder, "merged.json")
    if os.path.exists(merged_path):
        os.remove(merged_path)
        print(f"Deleted old {merged_path}")

def collect_program_json_files(program_dir):
    """
    Collect all JSON files from program_dir/ (no sections subdirectory)
    Returns list of tuples: (file_path, prefix) where prefix = <program>_<block_num>
    
    Files are expected to be named like <program>_<block_num>.json
    """
    if not os.path.exists(program_dir):
        print(f"Program directory not found: {program_dir}")
        return []
    
    json_files = []
    program_name = os.path.basename(program_dir)
    json_files_path = os.path.join(program_dir, "basic_blocks_json")
    if not os.path.exists(json_files_path):
        print(f"JSON files directory not found: {json_files_path}")
        return []
    
    # Get all JSON files in the program directory
    for filename in os.listdir(json_files_path):
        if filename.endswith('.json'):
            # Skip merged files
            if filename.startswith('merged'):
                continue
            file_path = os.path.join(json_files_path, filename)
            # Extract block_num from filename
            # Expected format: <program>_<block_num>.json or just <block_num>.json
            basename = os.path.splitext(filename)[0]  # Remove .json extension
            
            # Try to extract block_num from the filename
            # If filename is <program>_<block_num>, extract block_num
            # Otherwise, use the whole basename as block_num
            if basename.startswith(f"{program_name}_"):
                block_num = basename[len(program_name)+1:]
            else:
                block_num = basename
            
            prefix = f"{program_name}_{block_num}"
            json_files.append((file_path, prefix))
    
    return json_files

def merge_json(json_files_with_prefixes):
    """
    Merge JSON files with specified prefixes.
    Args:
        json_files_with_prefixes: List of tuples (file_path, prefix) or list of file paths
    """
    merged = {"nodes": {}}
    subroots = []
    
    # Handle both formats: list of tuples
    for item in json_files_with_prefixes:
        if isinstance(item, tuple):
            file_path, prefix = item
        else:
            raise ValueError(f"Invalid item: {item}")
        
        with open(file_path, 'r') as f:
            nodes = json.load(f).get("nodes", {})
        for nid, node in nodes.items():
            new_id = f"{prefix}_enode_{sanitize(nid)}"
            new_node = dict(node)
            # prefix eclass
            if "eclass" in new_node and new_node["eclass"] is not None:
                new_node["eclass"] = f"{prefix}_eclass_{sanitize(new_node['eclass'])}"
            # prefix children (enode ids)
            if "children" in new_node and new_node["children"]:
                new_node["children"] = [f"{prefix}_enode_{sanitize(c)}" for c in new_node["children"]]
            # rename root op
            # if new_node.get("op") == "root":
            #     new_node["op"] = f"{prefix}_root"
            #     subroots.append(new_id)
            # if new_node.get("op") == "()":
            #     continue # skip no-op
            merged["nodes"][new_id] = new_node
    # merged["nodes"]["root_enode"] = {
    #     "op": "root",
    #     "children": subroots,
    #     "eclass": "root_eclass",
    #     "cost": 0,
    #     "subsumed": False
    # }
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

    def __init__(self, program_name: Optional[str] = None):
        """Create an EGraph from a program directory.
        
        Args:
            program_name: Name of the program subdirectory in output/frontend/ (e.g., 'bitcnts_small_O3')
                         If None, creates an empty graph.
        """
        self.eclasses = {}
        self.enodes = {}
        self.ops = {}
        self.root_ec_en = {}
        if program_name:
            # Collect JSON files from program directory and load
            program_dir = os.path.join(DATA_DIR, program_name)
            if os.path.exists(program_dir):
                json_files_with_prefixes = collect_program_json_files(program_dir)
                if json_files_with_prefixes:
                    self.from_json_file(merge_json(json_files_with_prefixes))
                else:
                    print(f"Warning: No JSON files found in {program_dir}")
            else:
                print(f"Warning: Program directory not found: {program_dir}")

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
            # if op.endswith("root"):
            #     self.root_ec_en[ec] = node_id
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
                op = "leaf"
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
        """Create virtual root nodes for each prefix and attach orphan eclasses.
        
        For each prefix (format: {program}_{block_num}_eclass), create a virtual root node.
        Attach orphan eclasses (no parents) to their corresponding prefix root.
        Finally, create a global root node that connects all prefix roots.
        
        - parent_enodes should store parent ENODE IDs (strings)
        - enode.children should store child ECLASS IDs (strings)
        """
        # Extract prefix from eclass_id: format is {program}_{block_num}_eclass_{rest}
        # We need to find the part before the first occurrence of pattern that ends with "_eclass_"
        def extract_prefix(eclass_id: str) -> Optional[str]:
            # Pattern: {program}_{block_num}_eclass_{...}
            # We look for the first occurrence of "_eclass_" or ends with "_eclass"
            if "_eclass_" in eclass_id:
                # Extract prefix up to and including "_eclass"
                parts = eclass_id.split("_eclass_", 1)
                return f"{parts[0]}"
            elif eclass_id.endswith("_eclass"):
                parts = eclass_id.split("_eclass", 1)
                return f"{parts[0]}"
            else:
                print(f"Skipping eclass: {eclass_id}")
                return None
        
        # Group orphan eclasses by prefix
        prefix_orphans = defaultdict(list)
        for ec_id, ec_obj in self.eclasses.items():
            if ec_id == "root_eclass":
                print(f"Skipping root eclass: {ec_id}")
                continue
            if not ec_obj.parent_enodes:
                prefix = extract_prefix(ec_id)
                if prefix:
                    prefix_orphans[prefix].append(ec_id)

        # Create virtual root node for each prefix
        prefix_root_enodes = {}
        for prefix, orphan_ecs in prefix_orphans.items():
            # Create virtual root enode for this prefix
            root_enode_id = f"{prefix}_enode_root"
            root_eclass_id = f"{prefix}_eclass_root"
            
            # Create root eclass if not exists
            if root_eclass_id not in self.eclasses:
                self.eclasses[root_eclass_id] = EClass(root_eclass_id)
            else:
                print(f"Root eclass already exists: {root_eclass_id}")
            # Create root enode if not exists
            if root_enode_id not in self.enodes:
                self.enodes[root_enode_id] = ENode(
                    eclass_id=root_eclass_id,
                    enode_id=root_enode_id,
                    op="root",
                    children=[],
                    cost=0
                )
                self.eclasses[root_eclass_id].member_enodes.add(root_enode_id)
                self.root_ec_en[root_eclass_id] = root_enode_id
            
            # Attach orphan eclasses to this prefix root
            for orphan_ec_id in orphan_ecs:
                # Record parent enode id
                self.eclasses[orphan_ec_id].parent_enodes.add(root_enode_id)
                # Add this eclass as a child of the prefix_root enode
                if orphan_ec_id not in self.enodes[root_enode_id].children:
                    self.enodes[root_enode_id].children.append(orphan_ec_id)
                else:
                    print(f"Child {orphan_ec_id} already exists in {root_enode_id}")
            prefix_root_enodes[prefix] = root_eclass_id
        
        # Create global root node that connects all prefix roots
        if prefix_root_enodes:
            global_root_enode_id = "enode_root"
            global_root_eclass_id = "eclass_root"
            
            # Create global root eclass if not exists
            if global_root_eclass_id not in self.eclasses:
                self.eclasses[global_root_eclass_id] = EClass(global_root_eclass_id)
            else:
                print(f"Global root eclass already exists: {global_root_eclass_id}")
            # Create global root enode
            if global_root_enode_id not in self.enodes:
                prefix_root_ecs = list(prefix_root_enodes.values())
                self.enodes[global_root_enode_id] = ENode(
                    eclass_id=global_root_eclass_id,
                    enode_id=global_root_enode_id,
                    op="root",
                    children=prefix_root_ecs,
                    cost=0
                )
                self.eclasses[global_root_eclass_id].member_enodes.add(global_root_enode_id)
                self.root_ec_en[global_root_eclass_id] = global_root_enode_id
                
                # Set parent for each prefix root eclass
                for prefix_root_ec_id in prefix_root_ecs:
                    self.eclasses[prefix_root_ec_id].parent_enodes.add(global_root_enode_id)

    def to_json(self) -> dict:
        """Export e-graph with root nodes to JSON format."""
        nodes = {}
        for enode_id, enode in self.enodes.items():
            nodes[enode_id] = {
                "op": enode.op,
                "children": enode.children,  # Already eclass IDs
                "eclass": enode.eclass_id,
                "cost": enode.cost,
                "subsumed": False
            }
        return {"nodes": nodes}

def analyze_differences(original: dict, with_roots: dict) -> None:
    """Analyze differences between original and root-added JSON."""
    orig_nodes = original.get("nodes", {})
    root_nodes = with_roots.get("nodes", {})
    
    print(f"\n=== Difference Analysis ===")
    print(f"Original nodes: {len(orig_nodes)}")
    print(f"With root nodes: {len(root_nodes)}")
    print(f"Added nodes: {len(root_nodes) - len(orig_nodes)}")
    
    # Find added nodes (root nodes)
    added_nodes = set(root_nodes.keys()) - set(orig_nodes.keys())
    print(f"\nAdded root nodes: {len(added_nodes)}")
    
    # Categorize added nodes
    global_roots = [n for n in added_nodes if n == "enode_root"]
    prefix_roots = [n for n in added_nodes if n.endswith("_enode_root")]
    
    print(f"  - Global root: {len(global_roots)}")
    print(f"  - Prefix roots: {len(prefix_roots)}")
    
    # Check if any original nodes were modified (excluding expected leaf node changes)
    modified_nodes = []
    for node_id in orig_nodes:
        if node_id in root_nodes:
            orig_node = orig_nodes[node_id]
            root_node = root_nodes[node_id]
            
            # Check for meaningful differences (not just leaf node op changes)
            meaningful_diff = False
            for key in orig_node:
                if key == "op" and orig_node[key] != root_node[key]:
                    # Skip if it's just a leaf node op change (original -> "leaf")
                    if root_node[key] == "leaf" and orig_node[key] != "leaf":
                        continue
                if orig_node[key] != root_node[key]:
                    meaningful_diff = True
                    break
            
            if meaningful_diff:
                modified_nodes.append(node_id)
    
    if modified_nodes:
        print(f"\nModified original nodes (excluding leaf op changes): {len(modified_nodes)}")
        for node_id in modified_nodes[:5]:  # Show first 5
            print(f"  - {node_id}")
        if len(modified_nodes) > 5:
            print(f"  ... and {len(modified_nodes) - 5} more")
    else:
        print(f"\nNo original nodes were meaningfully modified ✓")
    
    # Count leaf node op changes
    leaf_changes = 0
    for node_id in orig_nodes:
        if node_id in root_nodes:
            orig_node = orig_nodes[node_id]
            root_node = root_nodes[node_id]
            if (orig_node.get("op") != "leaf" and 
                root_node.get("op") == "leaf" and 
                orig_node.get("children") == []):
                leaf_changes += 1
    
    if leaf_changes > 0:
        print(f"\nLeaf node op changes (original -> 'leaf'): {leaf_changes}")
        print(f"  This is expected behavior for nodes with no children")
    
    # Check node ID format differences
    orig_enode_format = [n for n in orig_nodes.keys() if "_enode_" in n]
    root_enode_format = [n for n in root_nodes.keys() if "_enode_" in n]
    
    print(f"\nNode ID format analysis:")
    print(f"  - Original with '_enode_' format: {len(orig_enode_format)}")
    print(f"  - With roots with '_enode_' format: {len(root_enode_format)}")
    
    # Sample of root node structure
    if global_roots:
        global_root = root_nodes["enode_root"]
        print(f"\nGlobal root structure:")
        print(f"  - op: {global_root['op']}")
        print(f"  - eclass: {global_root['eclass']}")
        print(f"  - children count: {len(global_root['children'])}")
        print(f"  - first 3 children: {global_root['children'][:3]}")
    
    if prefix_roots:
        sample_prefix = prefix_roots[0]
        sample_root = root_nodes[sample_prefix]
        print(f"\nSample prefix root ({sample_prefix}):")
        print(f"  - op: {sample_root['op']}")
        print(f"  - eclass: {sample_root['eclass']}")
        print(f"  - children count: {len(sample_root['children'])}")
        print(f"  - children: {sample_root['children'][:3]}")

        

def main(program_name=None):
    """
    Main function to merge JSON files from output/frontend directory.
    
    Args:
        program_name: Name of the program subdirectory in output/frontend/ (e.g., 'bitcnts_small_O3')
    """
    if not program_name:
        print(f"No program name provided!")
        return
    
    target_dir = os.path.join(DATA_DIR, program_name)
    if not os.path.exists(target_dir):
        print(f"Program directory not found: {target_dir}")
        return
    
    # Delete old merged.json if it exists
    clean_folder(target_dir)
    
    # Collect all JSON files from program directory
    json_files_with_prefixes = collect_program_json_files(target_dir)
    if not json_files_with_prefixes:
        print(f"No JSON files found in {target_dir}")
        return
    
    merged_path = os.path.join(target_dir, "merged.json")
    print(f"Found {len(json_files_with_prefixes)} JSON files:")
    for file_path, prefix in json_files_with_prefixes[:10]:  # Show first 10
        print(f"  - {prefix}: {os.path.basename(file_path)}")
    if len(json_files_with_prefixes) > 10:
        print(f"  ... and {len(json_files_with_prefixes) - 10} more files")
    
    # Create EGraph which includes root nodes
    egraph = EGraph(program_name)
    
    # Export to JSON with root nodes
    result = egraph.to_json()
    
    # Write merged result with root nodes
    merged_with_roots_path = os.path.join(target_dir, "merged_with_roots.json")
    with open(merged_with_roots_path, "w") as f:
        json.dump(result, f, indent=2)
    
    # Also save original merged.json (without root nodes)
    original_result = merge_json(json_files_with_prefixes)
    with open(merged_path, "w") as f:
        json.dump(original_result, f, indent=2)
    
    print(f"Successfully merged {len(json_files_with_prefixes)} files:")
    print(f"  - Original (no roots): {merged_path}")
    print(f"  - With root nodes: {merged_with_roots_path}")
    
    # Analyze differences
    analyze_differences(original_result, result)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Merge JSON files from e-graph programs')
    parser.add_argument('program_name', help='Name of the program subdirectory in output/frontend/ (e.g., bitcnts_small_O3)')
    args = parser.parse_args()
    main(args.program_name)

