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
import re
import sys
import time
import subprocess
from pathlib import Path
from typing import Dict, Set, Optional, Tuple

# Add project path
sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from src.egraph import EGraph, DATA_DIR, collect_program_json_files, sanitize, merge_json
def ensure_merged_json(program_name: str, json_files_with_prefixes: list) -> None:
    """Ensure output/frontend/<program>/ contains merged.json and merged_with_roots.json."""
    target_dir = Path(DATA_DIR) / program_name
    merged_path = target_dir / 'merged.json'
    merged_roots_path = target_dir / 'merged_with_roots.json'

    if not target_dir.exists():
        return

    need_merged = not merged_path.exists()
    need_roots = not merged_roots_path.exists()

    if not (need_merged or need_roots):
        return

    try:
        if need_merged:
            merged_data = merge_json(json_files_with_prefixes)
            with open(merged_path, 'w') as f:
                json.dump(merged_data, f, indent=2)
        if need_roots:
            egraph = EGraph(program_name)
            with open(merged_roots_path, 'w') as f:
                json.dump(egraph.to_json(), f, indent=2)
    except Exception as exc:
        print(f"Warning: failed to generate merged artifacts: {exc}")

from src.ILP.ilp_gen import generate_ilp_file

# Cache for original JSON data to avoid repeated file reads
_original_json_cache = {}
# Map from prefix (without _eclass suffix) to file path
_prefix_to_file_map = {}


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
        node_id: Node ID in format like "program_1_eclass_sanitized_original_id"
                The format is: {program}_{block_num}_eclass_{sanitized_original_node_id}
    
    Returns:
        Original operator name from the JSON file
    """
    global _original_json_cache, _prefix_to_file_map
    
    # Split by _eclass to separate prefix from rest
    if '_eclass' not in node_id:
        return node_id  # Cannot parse, return as-is
    
    prefix_with_eclass, sanitized_rest = node_id.split('_eclass', 1)
    # Remove leading underscore from sanitized_rest if present
    sanitized_rest = sanitized_rest.lstrip('_')
    
    # prefix_with_eclass is like "program_1", which is "{program}_{block_num}"
    prefix_key = prefix_with_eclass  # This is "{program}_{block_num}"
    
    # Load JSON file if not cached
    if prefix_key not in _original_json_cache:
        # Get file path from the map
        json_file_path = _prefix_to_file_map.get(prefix_key)
        if json_file_path and Path(json_file_path).exists():
            try:
                with open(json_file_path, 'r') as f:
                    data = json.load(f)
                    _original_json_cache[prefix_key] = data.get('nodes', {})
            except Exception as e:
                print(f"Warning: Failed to load {json_file_path}: {e}")
                _original_json_cache[prefix_key] = {}
        else:
            print(f"Warning: JSON file not found for prefix {prefix_key}")
            _original_json_cache[prefix_key] = {}
    
    # Find the original node by matching sanitized node_id
    # The node_id in egraph is: {program}_{block_num}_eclass_{sanitize(original_node_id)}
    # So sanitized_rest should match sanitize(original_node_id)
    nodes = _original_json_cache[prefix_key]
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


def extract_sexprs(egraph: EGraph, choices: Dict[str, str]) -> Dict[str, Dict[str, str]]:
    """
    Extract S-expressions for all root nodes
    
    Returns:
        Dictionary mapping root_name to {"eclass": eclass_id, "sexpr": s_expression}
    """
    sexprs = {}
    
    # Find all root eclasses (those that have root operators)
    for eclass_id, node_id in choices.items():
        if node_id in egraph.enodes:
            node = egraph.enodes[node_id]
            # Check if this is a root node
            if eclass_id != "eclass_root" and eclass_id.endswith("_root"):
                # Extract <program>_<block> prefix from eclass_id or node_id: {program}_{block_num}_eclass_... or {program}_{block_num}_enode_...
                prefix = eclass_id.split('_eclass')[0]
                # Build S-expr for each child of the root
                for i, child_eclass in enumerate(node.children):
                    sexpr = build_sexpr(egraph, choices, child_eclass)
                    root_name = f"{prefix}_root_{i}" if len(node.children) > 1 else f"{prefix}_root"
                    sexprs[root_name] = {"eclass": child_eclass, "sexpr": sexpr}
    
    return sexprs


def analyze_solution(egraph: EGraph, choices: Dict[str, str], variables: Dict[str, float]):
    """
    Analyze the extracted solution and count operator usage
    """
    # Exclude special operators from analysis: root, ImmVal, RegVal, leaf
    excluded_ops = {"root", "ImmVal", "RegVal", "leaf"}
    
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
    
    # Filter out excluded operators for statistics
    selected_ops_filtered = {op for op in selected_ops if op not in excluded_ops}
    
    print(f"\nNumber of selected eclasses: {len(choices)}")
    print(f"Number of selected nodes: {len(selected_nodes)}")
    print(f"Actual operator types used (excluding root, ImmVal, RegVal, leaf): {len(selected_ops_filtered)}")
    
    # Get activated operator variables from ILP solution
    ilp_ops = set()
    ilp_ops_with_value = {}
    for var_name, value in variables.items():
        if var_name.startswith("Op_"):
            op_name = var_name[3:]  # Remove "Op_" prefix
            ilp_ops_with_value[op_name] = value
            if abs(value - 1.0) < 0.01:
                ilp_ops.add(op_name)
    
    # Filter out excluded operators for ILP statistics
    ilp_ops_filtered = {op for op in ilp_ops if op not in excluded_ops}
    
    print(f"Operator variables activated in ILP (Op_=1, excluding excluded ops): {len(ilp_ops_filtered)}")
    
    # Display all activated operator variables in ILP (excluding special operators)
    print("\nOperator variables activated in ILP (Op_=1, excluding root, ImmVal, RegVal, leaf):")
    for op_name in sorted(ilp_ops_filtered):
        # Check if this operator is actually used
        actually_used = op_name in selected_ops
        status = "✓ Actually used" if actually_used else "⚠ Not actually used"
        count = op_counts.get(op_name, 0)
        print(f"  {op_name}: {status}, usage count={count}")
    
    # Display actually used operators (excluding special operators)
    print("\nActually used operators (from selected nodes, excluding root, ImmVal, RegVal, leaf):")
    for op_name in sorted(selected_ops_filtered):
        count = op_counts.get(op_name, 0)
        in_ilp = "✓ ILP activated" if op_name in ilp_ops else "✗ ILP not activated"
        print(f"  {op_name}: {count} times [{in_ilp}]")
    
    # Calculate total cost (DAG cost)
    total_cost = 0
    for node_id in selected_nodes:
        if node_id in egraph.enodes:
            total_cost += egraph.enodes[node_id].cost
    
    print(f"\nTotal node cost (DAG cost): {total_cost}")
    print(f"Objective value (minimize operator types, excluding excluded ops): {len(ilp_ops_filtered)}")
    
    return {
        'num_eclasses': len(choices),
        'num_nodes': len(selected_nodes),
        'num_op_types': len(selected_ops_filtered),
        'num_op_types_ilp': len(ilp_ops_filtered),
        'operator_counts': {op: count for op, count in op_counts.items() if op not in excluded_ops},
        'ilp_activated_ops': list(ilp_ops_filtered),
        'total_cost': total_cost
    }


def run_gurobi_solver(lp_file: str, sol_file: str, log_file: str, timeout: int, mst_file: Optional[str] = None, best_k: int = 1) -> bool:
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
        "--best_k", str(best_k),
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
        "program_name",
        help="Name of the program subdirectory in output/frontend/ (e.g., bitcnts_small_O3)"
    )
    parser.add_argument(
        "--timeout",
        type=int,
        default=1800,
        help="Solver timeout (seconds, default: 1800)"
    )
    parser.add_argument(
        "--output",
        default=str(Path(__file__).resolve().parents[3] / "output" / "ilp"),
        help="Output directory (default: output/ilp)"
    )
    parser.add_argument(
        "--best_k",
        type=int,
        default=1,
        help="Number of best solutions to find (default: 1)"
    )
    parser.add_argument(
        "--node-cost-scale",
        type=float,
        default=1.0,
        help="Scaling factor for node costs in objective function. "
             "0=ignore node costs (only operator diversity), "
             "1=default balance, "
             ">1=emphasize node costs (prefer simpler expressions). "
             "(default: 1.0)"
    )

    args = parser.parse_args()
    
    # Create output directories (append program name under the base output path)
    output_dir = Path(args.output) / args.program_name
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
    print("ILP-based E-graph Extraction")
    print("="*60)
    print(f"Program: {args.program_name}")
    print(f"Solver: gurobi")
    print(f"Timeout: {args.timeout} seconds")
    print(f"Output directory: {output_dir}")
    print()
    
    # Get program directory
    program_dir = os.path.join(DATA_DIR, args.program_name)
    if not os.path.exists(program_dir):
        print(f"Error: Program directory not found: {program_dir}")
        return 1
    
    # Build prefix to file path mapping (for get_original_op)
    # We need to collect files first to build the mapping
    print("Collecting JSON files from program directory...")
    json_files_with_prefixes = collect_program_json_files(program_dir)
    
    if not json_files_with_prefixes:
        print(f"Error: No JSON files found in {program_dir}")
        return 1
    
    ensure_merged_json(args.program_name, json_files_with_prefixes)

    # Build prefix to file path mapping (for get_original_op)
    global _prefix_to_file_map
    for file_path, prefix in json_files_with_prefixes:
        # prefix is like "program_1", which is already in the correct format
        _prefix_to_file_map[prefix] = file_path
    
    print(f"Found {len(json_files_with_prefixes)} JSON files")
    
    # Load e-graph
    print("Loading e-graph...")
    start_time = time.time()
    egraph = EGraph(args.program_name)
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
    lp_file = lp_dir / f"extraction.lp"
    
    print(f"\nGenerating ILP file: {lp_file}")
    print(f"  Node cost scale: {args.node_cost_scale}")
    start_time = time.time()
    generate_ilp_file(egraph, str(lp_file), node_cost_scale=args.node_cost_scale)
    ilp_time = time.time() - start_time
    print(f"ILP generation completed (time: {ilp_time:.2f}s)")
    
    # Run solver
    sol_file = sol_dir / f"solution.sol"
    log_file = log_dir / f"extraction_gurobi.log"
    print(f"\nSolving ILP...")
    start_time = time.time()
    
    success = run_gurobi_solver(str(lp_file), str(sol_file), str(log_file), args.timeout, best_k=args.best_k)
    
    
    solve_time = time.time() - start_time
    
    if not success:
        print("\nSolving failed!")
        return 1
    
    print(f"\nSolving completed (time: {solve_time:.2f}s)")
    
    # Parse solution files (handle multiple solutions)
    if args.best_k == 1:
        # Single solution case (original behavior)
        solution_files = [str(sol_file)]
    else:
        # Multiple solutions case
        solution_files = []
        for i in range(args.best_k):
            base_name = str(sol_file)
            dot_pos = base_name.find('.')
            if dot_pos != -1:
                solution_file = base_name[:dot_pos] + f"_{i}" + base_name[dot_pos:]
            else:
                solution_file = base_name + f"_{i}"
            if os.path.exists(solution_file):
                solution_files.append(solution_file)
    
    print(f"\nFound {len(solution_files)} solution file(s)")
    
    # Process each solution
    for i, solution_file in enumerate(solution_files):
        print(f"\nProcessing solution {i+1}: {solution_file}")
        
        # Parse solution file
        variables = parse_solution_file(solution_file)
        print(f"Found {len(variables)} variable assignments")
        
        # Extract selected nodes
        choices = extract_solution(egraph, variables)
        print(f"Extracted {len(choices)} eclass choices")
        
        # Analyze solution
        analysis = analyze_solution(egraph, choices, variables)
        
        # Extract S-expressions
        print(f"Extracting S-expressions...")
        sexprs = extract_sexprs(egraph, choices)
    
        # Display S-expressions for this solution
        print(f"\n" + "="*60)
        print(f"S-expressions (Solution {i+1})")
        print("="*60)
        for root_name, data in sexprs.items():
            print(f"\n{root_name}:")
            print(f"  eclass: {data['eclass']}")
            print(f"  sexpr:  {data['sexpr']}")
        
        # Sort sexprs by section (dict order), then block_num, then index
        def sort_key(name):
            if '_root' not in name:
                return ('', 0, 0)
            prefix = name.split('_root')[0]  # Everything before _root
            suffix = name.split('_root', 1)[1] if '_root' in name else ''
            # Extract block_num from prefix (last number before _root)
            numbers_in_prefix = re.findall(r'\d+', prefix)
            block_num = int(numbers_in_prefix[-1]) if numbers_in_prefix else 0
            # Extract section by removing the last "_block_num" part
            if numbers_in_prefix:
                # Remove the last number and its preceding underscore from prefix
                section = re.sub(r'_\d+$', '', prefix) if prefix else ''
            else:
                section = prefix
            # Extract index from suffix (e.g., "_0" -> 0, "" -> -1)
            index = int(suffix.lstrip('_')) if suffix and suffix.lstrip('_').isdigit() else -1
            return (section, block_num, index)
        
        sexprs_sorted = dict(sorted(sexprs.items(), key=lambda x: sort_key(x[0])))
    
        # Save results for this solution
        if len(solution_files) == 1:
            result_file = result_dir / f"result.json"
        else:
            result_file = result_dir / f"result_{i}.json"
        
        # Convert json_files_with_prefixes (tuples) to a serializable format
        input_files_serializable = [
            {'file_path': fp, 'prefix': p} for fp, p in json_files_with_prefixes
        ]
        result_data = {
            'program_name': args.program_name,
            'input_files': input_files_serializable,
            'solver': "gurobi",
            'timeout': args.timeout,
            'best_k': args.best_k,
            'solution_id': i,
            'solution_file': solution_file,
            'times': {
                'load': load_time,
                'ilp_gen': ilp_time,
                'solve': solve_time,
                'total': load_time + ilp_time + solve_time
            },
            'statistics': analysis,
            'choices': choices,
            'sexprs': sexprs_sorted
        }
        
        with open(result_file, 'w') as f:
            json.dump(result_data, f, indent=2)
        
        print(f"Results saved to: {result_file}")
    
    # Summary
    print("\n" + "="*60)
    print("Summary")
    print("="*60)
    print(f"Total time: {load_time + ilp_time + solve_time:.2f}s")
    print(f"  - Loading: {load_time:.2f}s")
    print(f"  - ILP generation: {ilp_time:.2f}s")
    print(f"  - Solving: {solve_time:.2f}s")
    print(f"\nProcessed {len(solution_files)} solution(s)")
    print(f"Objective value: {analysis['num_op_types_ilp']} operator types (excluding root, ImmVal, RegVal, leaf)")
    print("="*60)
    
    return 0


if __name__ == "__main__":
    sys.exit(main())

