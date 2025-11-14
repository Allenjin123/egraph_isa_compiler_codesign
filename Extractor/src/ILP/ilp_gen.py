"""
ILP Generator for E-graph Extraction with Minimal Operator Types
=================================================================

This module generates an Integer Linear Programming (ILP) formulation for 
e-graph extraction where the objective is to minimize the number of distinct 
operator types used in the extracted expression tree/DAG.

Key differences from Rust version:
- Objective function: Minimize operator types instead of total node cost
- New variables: Op_<op_name> indicates whether the operator is used
- New constraints: If a node is selected, its operator must be activated
"""

from typing import Set, Dict, List, Optional
import re
from pathlib import Path
import sys
# Add project path
sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from src.egraph import sanitize, DATA_DIR, get_file_name, clean_folder, EGraph

# Operator-specific weights for cost model
# Higher weight = more expensive = ILP tries harder to avoid
OP_TYPE_WEIGHTS = {
    # M-extension operations (very expensive - larger area, higher latency)
    'Op_Mul': 3000,
    'Op_Mulh': 3000,
    'Op_Mulhsu': 3000,
    'Op_Mulhu': 3000,
    'Op_Div': 5000,      # Division is especially expensive
    'Op_Divu': 5000,
    'Op_Rem': 4000,
    'Op_Remu': 4000,

    # Memory operations (medium cost)
    'Op_Lw': 150,
    'Op_Lb': 150,
    'Op_Lh': 150,
    'Op_Lbu': 150,
    'Op_Lhu': 150,
    'Op_Sw': 150,
    'Op_Sb': 150,
    'Op_Sh': 150,

    # Branch/Jump (medium cost)
    'Op_Beq': 120,
    'Op_Bne': 120,
    'Op_Blt': 120,
    'Op_Bge': 120,
    'Op_Bltu': 120,
    'Op_Bgeu': 120,
    'Op_Jal': 110,
    'Op_Jalr': 110,

    # Default weight for unlisted operations (cheap ALU ops like Add, Sub, And, etc.)
}
DEFAULT_OP_WEIGHT = 100


def generate_ilp_file(
    egraph,
    #root_eclasses: List[str],
    file_path: str,
    zero_nodes: Optional[Set[str]] = None,
    node_cost_scale: float = 1.0
):
    """
    Generate ILP file (LP format) with objective to minimize operator types

    Parameters:
        egraph: EGraph object
        root_eclasses: List of root eclass IDs
        file_path: Output LP file path
        zero_nodes: Set of nodes to force to 0 (warm start pruning)
        node_cost_scale: Scaling factor for node costs (0=ignore, 1=default, >1=emphasize)
    """
    
    if zero_nodes is None:
        zero_nodes = set()
    
    lp_lines = []
    
    # ============================================
    # 1. Generate variable names
    # ============================================
    
    # A_<class_id>: eclass activation variable
    class_active_vars: Dict[str, str] = {}
    # N_<class_id>_<node_index>: node selection variable
    node_vars: Dict[tuple, str] = {}
    # L_<class_id>: level variable (prevent cycles)
    level_vars: Dict[str, str] = {}
    # Opp_<class_id>_<node. _index>: opposite variable (prevent cycles)
    opposite_vars: Dict[tuple, str] = {}
    # Op_<op_name>: operator usage variable (NEW!)
    op_vars: Dict[str, str] = {}
    # node_to_op: Record operator used by each node
    node_to_op: Dict[str, str] = {}
    
    # Collect all operators
    all_ops = set()
    
    for eclass_id, eclass in egraph.eclasses.items():
        # Skip root_eclass
        # if root in eclass_id:
        #     continue
            
        a_var = f"A_{sanitize(eclass_id)}"
        class_active_vars[eclass_id] = a_var
        
        l_var = f"L_{sanitize(eclass_id)}"
        level_vars[eclass_id] = l_var
        
        for node_id in eclass.member_enodes:
            if node_id not in egraph.enodes:
                continue
                
            n_var = f"N_{sanitize(eclass_id)}_{sanitize(node_id)}"
            node_vars[(eclass_id, node_id)] = n_var
            
            opp_var = f"Opp_{sanitize(eclass_id)}_{sanitize(node_id)}"
            opposite_vars[(eclass_id, node_id)] = opp_var
            
            # Record the operator of the node
            op_name = egraph.enodes[node_id].op
            node_to_op[node_id] = op_name
            all_ops.add(op_name)
    
    # Create variable for each operator (exclude special root operators)
    for op_name in sorted(all_ops):
        # if op_name != "root" and not op_name.endswith("_root"):
        op_var = f"Op_{sanitize(op_name)}"
        op_vars[op_name] = op_var
    
    print(f"Generated {len(class_active_vars)} eclass variables")
    print(f"Generated {len(node_vars)} node variables")
    print(f"Generated {len(op_vars)} operator variables")
    
    # ============================================
    # 2. Objective function: Minimize operator types + node costs
    # ============================================
    # Primary: Minimize operator types (weighted by 100)
    # Secondary: Minimize total node costs
    # Exclude special operators from objective: root, ImmVal, RegVal, leaf
    excluded_ops = {"root", "ImmVal", "RegVal", "leaf", "ImmLabel", "Seq2", "CallMul", "CallDiv","CallDivu", "CallRem","CallRemu"}
    
    lp_lines.append("Minimize")
    obj_terms = []
    
    # Part 1: Operator type cost (operator-specific weights)
    for op_name in sorted(op_vars.keys()):
        if op_name not in excluded_ops:
            # Get operator-specific weight (default 100 for cheap ops)
            weight = OP_TYPE_WEIGHTS.get(op_vars[op_name], DEFAULT_OP_WEIGHT)
            print(f"Operator {op_name} has weight {weight}")
            obj_terms.append(f"{weight} {op_vars[op_name]}")
    
    # Part 2: Node selection cost (scaled by node_cost_scale parameter)
    for eclass_id, eclass in egraph.eclasses.items():
        for node_id in eclass.member_enodes:
            if node_id not in egraph.enodes:
                continue
            if (eclass_id, node_id) not in node_vars:
                continue

            node = egraph.enodes[node_id]
            cost = node.cost

            # Apply scaling factor to node cost
            scaled_cost = cost * node_cost_scale

            # Only add non-zero cost terms
            if scaled_cost != 0.0:
                node_var = node_vars[(eclass_id, node_id)]
                if scaled_cost == 1.0:
                    obj_terms.append(node_var)
                else:
                    obj_terms.append(f"{scaled_cost} {node_var}")
    
    if obj_terms:
        lp_lines.append(" obj: " + " + ".join(obj_terms))
    else:
        # If no operator variables, use 0 as objective
        lp_lines.append(" obj: 0")
    lp_lines.append("")
    
    # ============================================
    # 3. Constraints
    # ============================================
    lp_lines.append("Subject To")
    
    # 3.1 Each eclass must select one node (if activated)
    for eclass_id, eclass in egraph.eclasses.items():
        # if eclass_id == "root_eclass":
        #     continue
        if eclass_id not in class_active_vars:
            print(f"Eclass {eclass_id} not found in class_active_vars")
            continue
            
        active_var = class_active_vars[eclass_id]
        sum_terms = []
        
        for node_id in eclass.member_enodes:
            if (eclass_id, node_id) in node_vars:
                sum_terms.append(node_vars[(eclass_id, node_id)])

        if sum_terms:
            constraint = f" C_ACT_{sanitize(eclass_id)}: {' + '.join(sum_terms)} - {active_var} = 0"
            lp_lines.append(constraint)

    # 3.2 If a node is activated, all its child classes must be activated
    for eclass_id, eclass in egraph.eclasses.items():
        # if eclass_id == "root_eclass":
        #     continue
        for node_id in eclass.member_enodes:
            if node_id not in egraph.enodes:
                print(f"Node {node_id} not found in egraph.enodes")
                continue
            if (eclass_id, node_id) not in node_vars:
                print(f"Node {eclass_id}_{node_id} not found in node_vars")
                continue
                
            node = egraph.enodes[node_id]
            node_var = node_vars[(eclass_id, node_id)]
            
            # Get all child eclasses (deduplicated)
            child_classes = set(node.children)
            
            for child_cid in child_classes:
                if child_cid in class_active_vars:
                    child_active = class_active_vars[child_cid]
                    constraint = f" NODE_CHILD_{sanitize(eclass_id)}_{sanitize(node_id)}_{sanitize(child_cid)}: {node_var} - {child_active} <= 0"
                    lp_lines.append(constraint)
    
    # 3.3 Root eclasses must be activated
    for root_id in egraph.root_ec_en.keys():
        active_var = class_active_vars[root_id]
        constraint = f" ROOT_{sanitize(root_id)}: {active_var} >= 1"
        lp_lines.append(constraint)
        
    # 3.4 Intersection constraint: If all nodes in an eclass depend on a child class, that child class must be activated
    for eclass_id, eclass in egraph.eclasses.items():
        # if eclass_id == "root_eclass":
        #     continue
        if eclass_id not in class_active_vars:
            print(f"Eclass {eclass_id} not found in class_active_vars")
            continue
            
        node_list = [nid for nid in eclass.member_enodes if nid in egraph.enodes]
        if not node_list:
            continue
            
        # Calculate intersection of child classes for all nodes
        first_node = egraph.enodes[node_list[0]]
        intersection = set(first_node.children)
        
        for node_id in node_list[1:]:
            node = egraph.enodes[node_id]
            intersection = intersection.intersection(set(node.children))
        
        # Add constraint for each child class in the intersection
        for child_cid in intersection:
            if child_cid in class_active_vars:
                constraint = f" INTERSECT_{sanitize(eclass_id)}_{sanitize(child_cid)}: {class_active_vars[eclass_id]} - {class_active_vars[child_cid]} <= 0"
                lp_lines.append(constraint)
    
    # 3.5 Cycle prevention constraints
    # 3.5.1 N + Opp = 1
    for (eclass_id, node_id), node_var in node_vars.items():
        opp_var = opposite_vars[(eclass_id, node_id)]
        constraint = f" OPP_{sanitize(eclass_id)}_{sanitize(node_id)}: {node_var} + {opp_var} = 1"
        lp_lines.append(constraint)
    
    # 3.5.2 Self-loop nodes set to 0
    for eclass_id, eclass in egraph.eclasses.items():
        # if eclass_id == "root_eclass":
        #     continue
        for node_id in eclass.member_enodes:
            if node_id not in egraph.enodes:
                print(f"Node {node_id} not found in egraph.enodes")
                continue
            if (eclass_id, node_id) not in node_vars:
                print(f"Node {eclass_id}_{node_id} not found in node_vars")
                continue
                
            node = egraph.enodes[node_id]
            if eclass_id in node.children:
                node_var = node_vars[(eclass_id, node_id)]
                constraint = f" SELF_LOOP_{sanitize(eclass_id)}_{sanitize(node_id)}: {node_var} = 0"
                lp_lines.append(constraint)
    
    # 3.5.3 Level constraint: -L_parent + L_child + M * Opp >= 1
    num_classes = len([c for c in egraph.eclasses.keys()])
    M = num_classes + 1
    
    for eclass_id, eclass in egraph.eclasses.items():
        # if eclass_id == "root_eclass":
        #     continue
        if eclass_id not in level_vars:
            print(f"Eclass {eclass_id} not found in level_vars")
            continue
            
        level_var = level_vars[eclass_id]
        
        for node_id in eclass.member_enodes:
            if node_id not in egraph.enodes:
                print(f"Node {node_id} not found in egraph.enodes")
                continue
            if (eclass_id, node_id) not in opposite_vars:
                print(f"Node {eclass_id}_{node_id} not found in opposite_vars")
                continue
                
            node = egraph.enodes[node_id]
            opp_var = opposite_vars[(eclass_id, node_id)]
            
            # For all non-self-loop child classes
            child_classes = set(node.children)
            child_classes.discard(eclass_id)
            
            for child_cid in child_classes:
                if child_cid in level_vars:
                    child_level = level_vars[child_cid]
                    constraint = f" LEVEL_{sanitize(eclass_id)}_{sanitize(node_id)}_{sanitize(child_cid)}: {child_level} - {level_var} + {M} {opp_var} >= 1"
                    lp_lines.append(constraint)
    
    # 3.6 Operator activation constraint (NEW!)
    # If a node is selected, its operator must be activated
    for (eclass_id, node_id), node_var in node_vars.items():
        op_name = node_to_op.get(node_id)
        if op_name and op_name in op_vars:
            op_var = op_vars[op_name]
            constraint = f" OP_ACT_{sanitize(eclass_id)}_{sanitize(node_id)}: {node_var} - {op_var} <= 0"
            lp_lines.append(constraint)
        else:
            print(f"Op {op_name} not found in op_vars")

    # 3.7 Warm start pruning constraints
    if zero_nodes:
        for node_id in zero_nodes:
            # Find the corresponding variable for this node
            for (eclass_id, nid), node_var in node_vars.items():
                if nid == node_id:
                    constraint = f" WARM_START_{sanitize(eclass_id)}_{sanitize(node_id)}: {node_var} = 0"
                    lp_lines.append(constraint)
                    break
    
    lp_lines.append("")
    
    # ============================================
    # 4. Variable bounds
    # ============================================
    lp_lines.append("Bounds")
    
    # Level variable bounds
    for eclass_id, level_var in level_vars.items():
        lp_lines.append(f" 0 <= {level_var} <= {num_classes}")
    
    lp_lines.append("")
    
    # ============================================
    # 5. Binary variable declarations
    # ============================================
    lp_lines.append("Binaries")
    
    # eclass activation variables
    for var in class_active_vars.values():
        lp_lines.append(f" {var}")
    
    # node selection variables
    for var in node_vars.values():
        lp_lines.append(f" {var}")
    
    # opposite variables
    for var in opposite_vars.values():
        lp_lines.append(f" {var}")
    
    # operator usage variables (NEW!)
    for var in op_vars.values():
        lp_lines.append(f" {var}")
    
    lp_lines.append("")
    lp_lines.append("End")
    
    # ============================================
    # 6. Write to file
    # ============================================
    with open(file_path, 'w') as f:
        f.write('\n'.join(lp_lines))
    
    print(f"ILP file generated: {file_path}")
    excluded_ops = {"root", "ImmVal", "RegVal", "leaf"}
    obj_op_count = len([op for op in op_vars.keys() if op not in excluded_ops])
    
    # Count nodes with non-zero cost
    nodes_with_cost = sum(1 for eclass in egraph.eclasses.values() 
                         for node_id in eclass.member_enodes 
                         if node_id in egraph.enodes and egraph.enodes[node_id].cost != 0.0)
    
    print(f"Objective function:")
    print(f"  - Primary: minimize {obj_op_count} operator types (weight=100, excluding root/ImmVal/RegVal/leaf)")
    print(f"  - Secondary: minimize node costs ({nodes_with_cost} nodes with non-zero cost)")
    print(f"Number of constraints: {sum(1 for line in lp_lines if line.strip() and line.strip()[0].isupper() and ':' in line)}")
