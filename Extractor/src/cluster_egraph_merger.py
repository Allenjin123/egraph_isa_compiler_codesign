#!/usr/bin/env python3
"""
Cluster E-graph Merger
======================

Merges e-graphs from multiple programs in a cluster for joint ILP optimization.
Reuses the existing merge_json infrastructure from egraph.py.

Usage:
    from cluster_egraph_merger import ClusterEGraphMerger

    merger = ClusterEGraphMerger(base_dir="output/frontend")
    merged_path = merger.merge_cluster(
        ["dijkstra_small_O3", "basicmath_small_O3"],
        output_path="output/ilp/cluster_merged/merged.json"
    )
"""

import json
from pathlib import Path
from typing import List, Tuple
import sys

# Add project paths
extractor_dir = Path(__file__).resolve().parents[1]  # Extractor/
project_root = extractor_dir.parent  # egraph_isa_compiler_codesign/
sys.path.insert(0, str(extractor_dir))
sys.path.insert(0, str(project_root))

from src.egraph import merge_json, sanitize, ENode


class ClusterEGraphMerger:
    """Merges e-graphs from multiple programs in a cluster."""

    def __init__(self, base_dir: str = "output/frontend"):
        """
        Initialize merger.

        Args:
            base_dir: Base directory containing program outputs
        """
        self.base_dir = Path(base_dir)

    def collect_program_json_files(self, program_name: str) -> List[Tuple[str, str]]:
        """
        Collect all JSON files for a single program with appropriate prefixes.

        Args:
            program_name: Name of the program

        Returns:
            List of (file_path, prefix) tuples
        """
        program_dir = self.base_dir / program_name
        json_dir = program_dir / "basic_blocks_json"

        if not json_dir.exists():
            raise FileNotFoundError(
                f"JSON directory not found: {json_dir}\n"
                f"Make sure saturation has been run for {program_name}"
            )

        json_files = []
        for json_file in sorted(json_dir.glob("*.json")):
            # Extract block ID from filename (e.g., "0.json" -> "0")
            block_id = json_file.stem

            # Create unique prefix: program_block
            prefix = f"{program_name}_{block_id}"

            json_files.append((str(json_file), prefix))

        if not json_files:
            raise ValueError(f"No JSON files found in {json_dir}")

        return json_files

    def merge_cluster(
        self,
        program_names: List[str],
        output_path: str = None
    ) -> str:
        """
        Merge e-graphs from all programs in a cluster.

        Args:
            program_names: List of program names to merge
            output_path: Path to save merged.json (optional)

        Returns:
            Path to merged.json file
        """
        if len(program_names) == 0:
            raise ValueError("Must provide at least one program")

        print(f"Merging e-graphs for cluster: {program_names}")

        # Collect all JSON files from all programs
        all_json_files = []
        total_blocks = 0

        for prog_name in program_names:
            try:
                prog_json_files = self.collect_program_json_files(prog_name)
                all_json_files.extend(prog_json_files)
                total_blocks += len(prog_json_files)
                print(f"  ✓ {prog_name}: {len(prog_json_files)} blocks")
            except Exception as e:
                print(f"  ✗ {prog_name}: {e}")
                raise

        print(f"Total blocks to merge: {total_blocks}")

        # Merge using existing infrastructure
        print("Merging JSON files...")
        merged = merge_json(all_json_files)

        print(f"Merged e-graph contains {len(merged['nodes'])} nodes")

        # Determine output path
        if output_path is None:
            # Create cluster name from sorted program names
            cluster_name = "_".join(sorted(program_names))
            if len(cluster_name) > 100:
                # Use hash if name is too long
                import hashlib
                cluster_hash = hashlib.md5(cluster_name.encode()).hexdigest()[:8]
                cluster_name = f"cluster_{len(program_names)}prog_{cluster_hash}"

            output_path = f"output/ilp/{cluster_name}/merged.json"

        # Save merged JSON
        output_file = Path(output_path)
        output_file.parent.mkdir(parents=True, exist_ok=True)

        with open(output_file, 'w') as f:
            json.dump(merged, f, indent=2)

        print(f"✓ Merged e-graph saved to: {output_path}")
        print(f"  File size: {output_file.stat().st_size / 1024 / 1024:.2f} MB")

        return str(output_path)

    def get_cluster_name(self, program_names: List[str]) -> str:
        """
        Generate a consistent cluster name.

        Args:
            program_names: List of programs in cluster

        Returns:
            Cluster name string
        """
        cluster_name = "_".join(sorted(program_names))
        if len(cluster_name) > 100:
            import hashlib
            cluster_hash = hashlib.md5(cluster_name.encode()).hexdigest()[:8]
            return f"cluster_{len(program_names)}prog_{cluster_hash}"
        return cluster_name


def main():
    """CLI interface for testing."""
    import argparse

    parser = argparse.ArgumentParser(description="Merge e-graphs from multiple programs")
    parser.add_argument('programs', nargs='+', help="Program names to merge")
    parser.add_argument('--base-dir', default="output/frontend",
                       help="Base directory (default: output/frontend)")
    parser.add_argument('-o', '--output', help="Output path for merged.json")

    args = parser.parse_args()

    merger = ClusterEGraphMerger(base_dir=args.base_dir)
    merged_path = merger.merge_cluster(args.programs, output_path=args.output)

    print(f"\n✓ Complete! Merged e-graph: {merged_path}")


if __name__ == "__main__":
    main()
