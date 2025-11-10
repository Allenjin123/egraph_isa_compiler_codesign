#!/usr/bin/env python3
"""
Pre-compute Root Eclasses for All Programs
==========================================

Loads each program individually and extracts accurate root eclasses
using the existing add_pseudo_root() logic. Saves to JSON for reuse.

Usage:
    python precompute_roots.py multi_k_clustering.json -o roots_cache.json
"""

import argparse
import json
import sys
from pathlib import Path

# Add project paths
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))
sys.path.insert(0, str(project_root / "Extractor"))

from Extractor.src.egraph import EGraph


def main():
    parser = argparse.ArgumentParser(description="Pre-compute root eclasses for all programs")
    parser.add_argument('clustering_file', help="Path to multi_k_clustering.json")
    parser.add_argument('-o', '--output', default='roots_cache.json',
                       help="Output file for roots cache (default: roots_cache.json)")
    parser.add_argument('--base-dir', default='output/frontend',
                       help="Base directory with frontend outputs (default: output/frontend)")

    args = parser.parse_args()

    # Load clustering to get program list
    with open(args.clustering_file, 'r') as f:
        clustering_data = json.load(f)

    programs = clustering_data['programs']

    print("="*60)
    print("Pre-computing Root Eclasses")
    print("="*60)
    print(f"Programs: {len(programs)}")
    print(f"Output: {args.output}")
    print("="*60)
    print()

    # Pre-compute roots for all programs
    program_roots = {}
    for prog_name in programs:
        try:
            print(f"Loading {prog_name}...", end=" ")
            individual_egraph = EGraph(prog_name)

            # Extract ACTUAL roots (children of synthetic root enodes)
            # root_ec_en maps eclass_id -> enode_id
            # We need the children of these root enodes (the actual program outputs)
            actual_roots = []
            for root_eclass_id, root_enode_id in individual_egraph.root_ec_en.items():
                if root_enode_id in individual_egraph.enodes:
                    root_enode = individual_egraph.enodes[root_enode_id]
                    # Children are the actual root eclasses
                    # Filter out synthetic roots (ending with _root)
                    actual_children = [
                        child for child in root_enode.children
                        if not (child.endswith('_eclass_root') or child.endswith('_enode_root'))
                    ]
                    actual_roots.extend(actual_children)

            # Store as list of actual root eclass IDs (remove duplicates)
            program_roots[prog_name] = list(set(actual_roots))
            print(f"✓ {len(program_roots[prog_name])} actual roots")
        except Exception as e:
            print(f"✗ Failed: {e}")
            program_roots[prog_name] = []

    total_roots = sum(len(roots) for roots in program_roots.values())
    print(f"\n✓ Pre-computed {total_roots} total roots across {len(programs)} programs")

    # Save to JSON
    with open(args.output, 'w') as f:
        json.dump(program_roots, f, indent=2)

    print(f"✓ Saved roots cache to: {args.output}")
    print()

    return 0


if __name__ == "__main__":
    sys.exit(main())
