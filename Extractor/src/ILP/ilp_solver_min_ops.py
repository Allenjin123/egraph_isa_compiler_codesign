#!/usr/bin/env python3
"""
ILP Solver for E-graph Extraction with Minimal Operator Types
==============================================================

Main program for running ILP-based e-graph extraction with the goal of minimizing operator types.

Usage:
    python ilp_solver_min_ops.py --timeout 1800
    solver must be gurobi
    input_file must be a list of json files

Parameters:
    input_file: Input JSON file path
    --solver: Solver type (gurobi/cplex/cbc), default gurobi
    --timeout: Solver timeout (seconds), default 1800
    --output: Output directory, default ./output
"""

import argparse
import json
import os
import sys
import time
import subprocess
from pathlib import Path
from typing import Dict, Set, Optional

# Add project path
sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from src.egraph import EGraph, DATA_DIR, clean_folder, sanitize
from src.ILP.ilp_gen_min_ops import generate_ilp_file

# Cache for original JSON data to avoid repeated file reads
_original_json_cache = {}


def parse_solution_file(solution_path: str) -> Dict[str, float]:
    """
    Parse the solution file output by the solver
    
    Format: Each line is "variable_name value", e.g.:
        N_class1_node1 1.0
        Op_add 1.0
    """
    variables = {}
    
    if not os.path.exists(solution_path):
        print(f"Warning: Solution file does not exist: {solution_path}")
        return variables
    
    with open(solution_path, 'r') as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            
            parts = line.split()
            if len(parts) >= 2:
                var_name = parts[0]
                try:
                    var_value = float(parts[1])
                    variables[var_name] = var_value
                except ValueError:
                    continue
    
    return variables


def extract_solution(egraph: EGraph, variables: Dict[str, float]) -> Dict[str, str]:
    """
    Extract the selected node for each eclass from the ILP solution
    
    Returns: {eclass_id: node_id}
    """
    choices = {}
    
    for var_name, value in variables.items():
        if var_name.startswith("N_") and abs(value - 1.0) < 0.01:
            # Parse variable name: N_<eclass_id>_<node_id>
            # Variable format: N_{eclass_id}_{complete_node_id}
            # Example: N_5_Reg_2_5_function_0_a5_2
            # where eclass_id = "5_Reg_2", node_id = "5_function_0_a5_2" (with prefix)
            
            # Remove "N_" prefix
            rest = var_name[2:]
            found = False
            # Search for matching node in egraph
            for node_id, node in egraph.enodes.items():
                # Check if variable name matches this node
                # Variable name should be N_{eclass_id}_{node_id}
                expected_var = f"N_{node.eclass_id}_{node_id}"
                if var_name == expected_var:
                    choices[node.eclass_id] = node_id
                    found = True
                    break
            if not found:
                print(f"Warning: Node {var_name} not found in egraph.enodes")
    
    return choices


def get_original_op(node_id: str) -> str:
    """
    Get the original operator name from the JSON file for leaf nodes
    
    Parameters:
        node_id: Node ID in format like "4_function_0_x0"
    
    Returns:
        Original operator name from the JSON file
    """
    global _original_json_cache
    
    # Extract prefix (file identifier) from node_id
    parts = node_id.split('_', 1)
    if len(parts) < 2:
        return node_id  # Cannot parse, return as-is
    
    prefix = parts[0]
    sanitized_rest = parts[1]
    
    # Load JSON file if not cached
    if prefix not in _original_json_cache:
        json_file = Path(DATA_DIR) / f"{prefix}.json"
        if json_file.exists():
            try:
                with open(json_file, 'r') as f:
                    data = json.load(f)
                    _original_json_cache[prefix] = data.get('nodes', {})
            except Exception as e:
                print(f"Warning: Failed to load {json_file}: {e}")
                _original_json_cache[prefix] = {}
        else:
            print(f"Warning: JSON file not found: {json_file}")
            _original_json_cache[prefix] = {}
    
    # Find the original node by matching sanitized node_id
    # The node_id in egraph is: prefix + "_" + sanitize(original_node_id)
    # So we need to find which original_node_id produces the matching sanitized form
    nodes = _original_json_cache[prefix]
    for original_node_id, node_data in nodes.items():
        if sanitize(original_node_id) == sanitized_rest:
            return node_data.get('op', node_id)
    
    # If not found, return the node_id
    return node_id


def build_sexpr(egraph: EGraph, choices: Dict[str, str], eclass_id: str, visited: set = None) -> str:
    """
    Recursively build S-expression from the selected nodes
    
    Parameters:
        egraph: EGraph object
        choices: {eclass_id: node_id} mapping of selected nodes
        eclass_id: Current eclass to build S-expr for
        visited: Set of visited eclasses to prevent infinite recursion
    
    Returns:
        S-expression string
    """
    if visited is None:
        visited = set()
    
    # Prevent cycles
    if eclass_id in visited:
        return f"<cycle:{eclass_id}>"
    visited.add(eclass_id)
    
    # Get the selected node for this eclass
    if eclass_id not in choices:
        return f"<missing:{eclass_id}>"
    
    node_id = choices[eclass_id]
    if node_id not in egraph.enodes:
        return f"<invalid:{node_id}>"
    
    node = egraph.enodes[node_id]
    op = node.op
    
    # If no children, it's a leaf node
    if not node.children:
        # For leaf nodes, restore original operator name from JSON
        if op == "leaf":
            op = get_original_op(node_id)
        return op
    
    # Build S-expr for children recursively
    child_sexprs = []
    for child_eclass in node.children:
        child_sexpr = build_sexpr(egraph, choices, child_eclass, visited.copy())
        child_sexprs.append(child_sexpr)
    
    # Format: (operator child1 child2 ...)
    if child_sexprs:
        return f"({op} {' '.join(child_sexprs)})"
    else:
        return op


def extract_sexprs(egraph: EGraph, choices: Dict[str, str]) -> Dict[str, str]:
    """
    Extract S-expressions for all root nodes
    
    Returns:
        Dictionary mapping root_eclass_id to S-expression
    """
    sexprs = {}
    
    # Find all root eclasses (those that have root operators)
    for eclass_id, node_id in choices.items():
        if node_id in egraph.enodes:
            node = egraph.enodes[node_id]
            # Check if this is a root node
            if node.op == "root" or node.op.endswith("_root"):
                # Build S-expr for each child of the root
                for i, child_eclass in enumerate(node.children):
                    sexpr = build_sexpr(egraph, choices, child_eclass)
                    root_name = f"{node.op}_{i}" if len(node.children) > 1 else node.op
                    sexprs[root_name] = sexpr
    
    return sexprs


def analyze_solution(egraph: EGraph, choices: Dict[str, str], variables: Dict[str, float]):
    """
    Analyze the extracted solution and count operator usage
    """
    print("\n" + "="*60)
    print("Solution Analysis")
    print("="*60)
    
    # Count selected nodes and operators
    selected_nodes = set(choices.values())
    selected_ops = set()
    op_counts = {}
    
    for node_id in selected_nodes:
        node = egraph.enodes[node_id]
        op_name = node.op
        selected_ops.add(op_name)
        op_counts[op_name] = op_counts.get(op_name, 0) + 1
    
    print(f"\nNumber of selected eclasses: {len(choices)}")
    print(f"Number of selected nodes: {len(selected_nodes)}")
    print(f"Actual operator types used (from node statistics): {len(selected_ops)}")
    
    # Get activated operator variables from ILP solution
    ilp_ops = set()
    ilp_ops_with_value = {}
    for var_name, value in variables.items():
        if var_name.startswith("Op_"):
            op_name = var_name[3:]  # Remove "Op_" prefix
            ilp_ops_with_value[op_name] = value
            if abs(value - 1.0) < 0.01:
                ilp_ops.add(op_name)
    
    print(f"Operator variables activated in ILP (Op_=1): {len(ilp_ops)}")
    
    # Display all activated operator variables in ILP
    print("\nOperator variables activated in ILP (Op_=1):")
    for op_name in sorted(ilp_ops):
        # Check if this operator is actually used
        actually_used = op_name in selected_ops
        status = "✓ Actually used" if actually_used else "⚠ Not actually used"
        count = op_counts.get(op_name, 0)
        print(f"  {op_name}: {status}, usage count={count}")
    
    # Display actually used operators
    print("\nActually used operators (from selected nodes):")
    for op_name in sorted(selected_ops):
        count = op_counts.get(op_name, 0)
        in_ilp = "✓ ILP activated" if op_name in ilp_ops else "✗ ILP not activated"
        print(f"  {op_name}: {count} times [{in_ilp}]")
    
    # Calculate total cost (DAG cost)
    total_cost = 0
    for node_id in selected_nodes:
        if node_id in egraph.enodes:
            total_cost += egraph.enodes[node_id].cost
    
    print(f"\nTotal node cost (DAG cost): {total_cost}")
    print(f"Objective value (minimize operator types): {len(ilp_ops)}")
    
    return {
        'num_eclasses': len(choices),
        'num_nodes': len(selected_nodes),
        'num_op_types': len(selected_ops),
        'num_op_types_ilp': len(ilp_ops),
        'operator_counts': op_counts,
        'ilp_activated_ops': list(ilp_ops),
        'total_cost': total_cost
    }


def run_gurobi_solver(lp_file: str, sol_file: str, log_file: str, timeout: int, mst_file: Optional[str] = None) -> bool:
    """Run Gurobi solver"""
    print(f"\nUsing Gurobi solver...")
    
    gurobi_solver = Path(__file__).parent / "gurobi" / "gurobi_solver"
    
    if not gurobi_solver.exists():
        print(f"Error: Gurobi solver does not exist: {gurobi_solver}")
        return False
    
    cmd = [
        str(gurobi_solver),
        "--lp_file", lp_file,
        "--output_file", sol_file,
        "--time_limit", str(timeout),
        "--log_file", log_file,
    ]
    
    if mst_file and os.path.exists(mst_file):
        cmd.extend(["--mst_file", mst_file])
        print(f"Using warm start file: {mst_file}")
    
    print(f"Command: {' '.join(cmd)}")
    
    try:
        result = subprocess.run(cmd, check=True, capture_output=True, text=True)
        print(result.stdout)
        return True
    except subprocess.CalledProcessError as e:
        print(f"Gurobi solver failed: {e}")
        print(e.stderr)
        return False



def main():
    parser = argparse.ArgumentParser(
        description="ILP-based e-graph extraction with minimal operator types"
    )
    parser.add_argument(
        "--timeout",
        type=int,
        default=1800,
        help="Solver timeout (seconds, default: 1800)"
    )
    parser.add_argument(
        "--output",
        default="./output_min_ops",
        help="Output directory (default: ./output_min_ops)"
    )
    
    args = parser.parse_args()
    
    # Create output directories
    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)
    
    lp_dir = output_dir / "lp"
    sol_dir = output_dir / "sol"
    result_dir = output_dir / "result"
    log_dir = output_dir / "log"
    
    lp_dir.mkdir(exist_ok=True)
    sol_dir.mkdir(exist_ok=True)
    result_dir.mkdir(exist_ok=True)
    log_dir.mkdir(exist_ok=True)

    print("="*60)
    print("ILP-based E-graph Extraction: Minimize Operator Types")
    print("="*60)
    print(f"Solver: gurobi")
    print(f"Timeout: {args.timeout} seconds")
    print(f"Output directory: {output_dir}")
    print()
    
    # Load all json files
    input_files = clean_folder(DATA_DIR)
    
    # Load e-graph
    print("Loading e-graph...")
    start_time = time.time()
    egraph = EGraph(input_files)
    load_time = time.time() - start_time
    
    print(f"Loading completed (time: {load_time:.2f}s)")
    print(f"  - EClasses: {len(egraph.eclasses)}")
    print(f"  - ENodes: {len(egraph.enodes)}")
    print(f"  - Operators: {len(egraph.ops)}")
    
    # Display operator statistics
    print("\nOperator statistics:")
    for op_name, op_obj in sorted(egraph.ops.items(), key=lambda x: -x[1].count):
        print(f"  {op_name}: {op_obj.count} times")
    
    # Generate ILP file
    lp_file = lp_dir / f"min_ops.lp"
    
    print(f"\nGenerating ILP file: {lp_file}")
    start_time = time.time()
    generate_ilp_file(egraph, str(lp_file))
    ilp_time = time.time() - start_time
    print(f"ILP generation completed (time: {ilp_time:.2f}s)")
    
    # Run solver
    sol_file = sol_dir / f"min_ops_gurobi.sol"
    log_file = log_dir / f"min_ops_gurobi.log"
    print(f"\nSolving ILP...")
    start_time = time.time()
    
    success = run_gurobi_solver(str(lp_file), str(sol_file), str(log_file), args.timeout)
    
    
    solve_time = time.time() - start_time
    
    if not success:
        print("\nSolving failed!")
        return 1
    
    print(f"\nSolving completed (time: {solve_time:.2f}s)")
    
    # Parse solution file
    print(f"\nParsing solution file: {sol_file}")
    variables = parse_solution_file(str(sol_file))
    print(f"Found {len(variables)} variable assignments")
    
    # Extract selected nodes
    choices = extract_solution(egraph, variables)
    print(f"Extracted {len(choices)} eclass choices")
    
    # Analyze solution
    analysis = analyze_solution(egraph, choices, variables)
    
    # Extract S-expressions
    print(f"\nExtracting S-expressions...")
    sexprs = extract_sexprs(egraph, choices)
    
    print(f"\n" + "="*60)
    print("S-expressions")
    print("="*60)
    for root_name, sexpr in sexprs.items():
        print(f"\n{root_name}:")
        print(f"  {sexpr}")
    
    # Save results
    result_file = result_dir / f"min_ops_gurobi.json"
    result_data = {
        'input_files': input_files,
        'solver': "gurobi",
        'timeout': args.timeout,
        'times': {
            'load': load_time,
            'ilp_gen': ilp_time,
            'solve': solve_time,
            'total': load_time + ilp_time + solve_time
        },
        'statistics': analysis,
        'choices': choices,
        'sexprs': sexprs
    }
    
    with open(result_file, 'w') as f:
        json.dump(result_data, f, indent=2)
    
    print(f"\nResults saved to: {result_file}")
    
    # Summary
    print("\n" + "="*60)
    print("Summary")
    print("="*60)
    print(f"Total time: {result_data['times']['total']:.2f}s")
    print(f"  - Loading: {load_time:.2f}s")
    print(f"  - ILP generation: {ilp_time:.2f}s")
    print(f"  - Solving: {solve_time:.2f}s")
    print(f"\nObjective value: {analysis['num_op_types']} operator types")
    print("="*60)
    
    return 0


if __name__ == "__main__":
    sys.exit(main())

