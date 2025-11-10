#!/usr/bin/env python3
"""
Cluster ASIP Utility Functions
================================

Shared utilities for cluster-based ASIP building:
- Assembly reconstruction from ILP solutions
- Basic blocks generation from assembly
- Synthesis (area/latency calculation)
- ASIP variant selection

Extracted from build_cluster_asips.py for modular 3-level parallelization.
"""

import json
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Dict, List, Tuple, Optional

import numpy as np

# Add project paths
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))
sys.path.insert(0, str(project_root / "Extractor"))

import Saturation.data_structure as ds
import backend.area_parser as ap
import backend.latency_parser as lp


def reconstruct_program(
    program_name: str,
    solution_file: str,
    variant_id: int,
    cluster_id: int,
    k_output: Path
) -> Optional[str]:
    """
    Reconstruct assembly for a single program using ILP solution.

    Args:
        program_name: Name of the program (e.g., 'dijkstra_small_O3')
        solution_file: Path to ILP solution file (.sol)
        variant_id: Variant identifier (0, 1, 2...)
        cluster_id: Cluster identifier
        k_output: Output directory for this K value

    Returns:
        Path to generated .s file, or None if failed
    """
    try:
        # Final output location
        variant_dir = k_output / f"cluster_{cluster_id}" / "variants" / f"variant_{variant_id}"
        variant_dir.mkdir(parents=True, exist_ok=True)

        # Step 1: Call restructure.py with unique output directory per variant
        blocks_dir = variant_dir / program_name / "blocks"
        blocks_dir.mkdir(parents=True, exist_ok=True)

        print(f"      [1/4] Running restructure.py...")
        print(f"        Solution: {Path(solution_file).name}")
        print(f"        Output blocks: {blocks_dir}")

        cmd1 = [
            "python3",
            str(project_root / "frontend" / "restructure.py"),
            program_name,
            "--solution", solution_file,
            "--output", str(blocks_dir),
            "--single-variant"
        ]

        result1 = subprocess.run(cmd1, capture_output=True, text=True, timeout=300)
        if result1.returncode != 0:
            print(f"        ✗ restructure.py failed:")
            print(f"        {result1.stderr[:300]}")
            return None

        # Check if blocks were created
        block_files = list(blocks_dir.glob("*.txt"))
        print(f"        ✓ Created {len(block_files)} block files")

        # Step 2: Create symlink and copy required metadata files
        # reconstruct_rewritten_asm.py expects: <output_dir>/<program_name>/basic_blocks_rewrite
        print(f"      [2/4] Setting up reconstruction environment...")
        program_dir = variant_dir / program_name
        program_dir.mkdir(parents=True, exist_ok=True)

        # Create symlink: variant_dir/program_name/basic_blocks_rewrite -> blocks_dir
        rewrite_symlink = program_dir / "basic_blocks_rewrite"
        if rewrite_symlink.exists() or rewrite_symlink.is_symlink():
            if rewrite_symlink.is_symlink():
                rewrite_symlink.unlink()
            else:
                shutil.rmtree(str(rewrite_symlink))

        rewrite_symlink.symlink_to(blocks_dir.resolve())
        print(f"        Symlink: {rewrite_symlink} -> {blocks_dir}")

        # Copy metadata files from original frontend output
        original_frontend = project_root / "output" / "frontend" / program_name
        for metadata_file in ["label_metadata.json", "label_to_block.json"]:
            src_metadata = original_frontend / metadata_file
            if src_metadata.exists():
                dst_metadata = program_dir / metadata_file
                shutil.copy2(str(src_metadata), str(dst_metadata))
                print(f"        Copied: {metadata_file}")
            else:
                print(f"        Warning: {metadata_file} not found in original frontend")

        # Step 3: Find clean.s and call reconstruct_rewritten_asm.py
        print(f"      [3/4] Running reconstruct_rewritten_asm.py...")
        clean_file = list(project_root.glob(f"benchmark/**/{program_name}_clean.s"))
        if not clean_file:
            print(f"        ✗ clean.s not found for {program_name}")
            return None

        print(f"        Clean file: {clean_file[0]}")
        print(f"        Output dir: {variant_dir}")

        # Output to variant directory (not program subdirectory)
        # reconstruct_rewritten_asm.py will look for <output_dir>/<program_name>/basic_blocks_rewrite
        cmd2 = [
            "python3",
            str(project_root / "frontend" / "reconstruct_rewritten_asm.py"),
            str(clean_file[0]),
            "-o", str(variant_dir)  # Points to variant_dir/ (parent of program_name/)
        ]

        result2 = subprocess.run(cmd2, capture_output=True, text=True, timeout=300)
        if result2.returncode != 0:
            print(f"        ✗ reconstruct_rewritten_asm.py failed:")
            print(f"        {result2.stderr[:300]}")
            return None

        print(f"        ✓ reconstruct_rewritten_asm.py completed")

        # Step 4: Find the generated .s file
        print(f"      [4/4] Locating generated .s file...")

        # Check in benchmark/ (standard location)
        rewrite_file = list(project_root.glob(f"benchmark/**/{program_name}_rewrite.s"))
        if rewrite_file:
            print(f"        Found in benchmark/: {rewrite_file[0]}")
            asm_output = variant_dir / f"{program_name}_rewrite_variant_{variant_id}.s"
            shutil.move(str(rewrite_file[0]), str(asm_output))
            print(f"        Moved to: {asm_output}")
            return str(asm_output)

        # Also check in variant directory
        variant_rewrite = list(variant_dir.rglob(f"{program_name}_rewrite.s"))
        if variant_rewrite:
            print(f"        Found in variant dir: {variant_rewrite[0]}")
            asm_output = variant_dir / f"{program_name}_rewrite_variant_{variant_id}.s"
            shutil.move(str(variant_rewrite[0]), str(asm_output))
            print(f"        Moved to: {asm_output}")
            return str(asm_output)

        print(f"        ✗ No .s file found in:")
        print(f"          - benchmark/**/{program_name}_rewrite.s")
        print(f"          - {variant_dir}/**/{program_name}_rewrite.s")
        return None

    except Exception as e:
        print(f"      Error: {e}")
        return None


def _check_asm_has_instructions(asm_file: str) -> bool:
    """
    Check if assembly file has actual instructions (not just labels/directives).

    Returns:
        True if file has instructions, False if empty/invalid
    """
    try:
        with open(asm_file, 'r') as f:
            for line in f:
                stripped = line.strip()
                # Skip empty lines, comments, directives, and labels
                if not stripped or stripped.startswith('#') or stripped.startswith('.') or stripped.endswith(':'):
                    continue
                # Found an actual instruction line
                return True
        return False
    except Exception:
        return False


def generate_basic_blocks_ssa(asm_file: str, variant_dir: Path) -> bool:
    """
    Generate basic_blocks and basic_blocks_ssa from a reconstructed .s file.

    This is needed for latency calculation in synthesis.

    Args:
        asm_file: Path to .s assembly file
        variant_dir: Directory to output basic_blocks

    Returns:
        True if successful
    """
    try:
        # Check if assembly file has actual instructions
        if not _check_asm_has_instructions(asm_file):
            print(f"        Warning: Assembly file has no instructions (likely scale=0 degenerate solution)")
            return False

        # Step 1: Extract basic blocks
        cmd1 = [
            "python3",
            str(project_root / "frontend" / "analyze_asm_blocks.py"),
            asm_file,
            "-o", str(variant_dir)
        ]

        result1 = subprocess.run(cmd1, capture_output=True, text=True, timeout=300)
        if result1.returncode != 0:
            print(f"        analyze_asm_blocks.py failed: {result1.stderr[:500]}")
            return False

        # Step 2: Convert to SSA
        cmd2 = [
            "python3",
            str(project_root / "frontend" / "convert_to_ssa.py"),
            str(variant_dir)
        ]

        result2 = subprocess.run(cmd2, capture_output=True, text=True, timeout=300)
        if result2.returncode != 0:
            print(f"        convert_to_ssa.py failed: {result2.stderr[:200]}")
            return False

        # Check if SSA was created
        if (variant_dir / "basic_blocks_ssa").exists():
            return True
        else:
            return False

    except Exception as e:
        print(f"        Error generating basic blocks: {e}")
        return False


def synthesize_single(
    job: Tuple,
    k_output: Path,
    cluster_id: int
) -> Optional[Tuple]:
    """
    Synthesize a single variant for a single program.

    Args:
        job: Tuple of (variant_id, prog_name, asm_path, instruction_set)
        k_output: Output directory for this K value
        cluster_id: Cluster identifier

    Returns:
        Tuple of (variant_id, prog_name, area, latency) or None if failed
    """
    variant_id, prog_name, asm_path, instruction_set = job

    try:
        # variant_dir should be the directory we want to write basic_blocks to
        # asm_path is like: .../variant_0/patricia_O3_rewrite_variant_0.s
        # We want basic_blocks in: .../variant_0/ (not .../variant_0/patricia_O3/)
        asm_file = Path(asm_path)
        variant_dir = asm_file.parent  # This is the variant_X directory

        prog = ds.text_program(f"{prog_name}_cluster{cluster_id}_v{variant_id}")

        # Try to load from basic_blocks_ssa if available
        if (variant_dir / "basic_blocks_ssa").exists():
            prog.from_directory(str(variant_dir), suffix="_ssa")
        elif (variant_dir / "basic_blocks").exists():
            prog.from_directory(str(variant_dir), suffix="")
        else:
            # Generate basic blocks from .s file
            print(f"    Generating basic blocks for {prog_name} variant {variant_id}...")
            if not generate_basic_blocks_ssa(str(asm_file), variant_dir):
                print(f"    Warning: Failed to generate basic blocks for {prog_name} variant {variant_id}")
                return None

            # Try loading again
            if (variant_dir / "basic_blocks_ssa").exists():
                prog.from_directory(str(variant_dir), suffix="_ssa")
            else:
                print(f"    Warning: No basic blocks_ssa after generation for {prog_name} variant {variant_id}")
                return None

        # Calculate latency
        latency = lp.parse_latency(prog)

        # Generate DSL for synthesis
        dsl_dir = k_output / f"cluster_{cluster_id}" / "dsl_files"
        dsl_dir.mkdir(parents=True, exist_ok=True)
        dsl_file = dsl_dir / f"variant_{variant_id}_{prog_name}.dsl"

        # Calculate area (runs synthesis)
        area = ap.parse_area(set(instruction_set), str(dsl_file))

        return (variant_id, prog_name, area, latency)

    except Exception as e:
        print(f"    Error synthesizing {prog_name} variant {variant_id}: {e}")
        return None


def select_best_asip(
    cluster_programs: List[str],
    variants: List[Dict],
    synthesis_results: Dict
) -> Optional[Dict]:
    """
    Select best ASIP variant based on geometric mean of area×latency.

    Args:
        cluster_programs: Programs in this cluster
        variants: List of variant data with instruction sets
        synthesis_results: {variant_id: {prog: {area, latency, area_latency}}}

    Returns:
        Best ASIP info with geomean score, or None if no valid variants
    """
    variant_scores = {}

    for variant_id, prog_results in synthesis_results.items():
        # Calculate area×latency for each program
        products = []
        for prog_name in cluster_programs:
            if prog_name in prog_results:
                products.append(prog_results[prog_name]['area_latency'])

        # Geometric mean (only if we have results for all programs)
        if products and len(products) == len(cluster_programs):
            geomean = np.exp(np.mean(np.log(products)))
            variant_scores[variant_id] = {
                'geomean': geomean,
                'products': products,
                'coverage': len(products)
            }

    if not variant_scores:
        return None

    # Select minimum geomean
    best_variant_id = min(variant_scores, key=lambda v: variant_scores[v]['geomean'])
    best_data = variant_scores[best_variant_id]

    # Get instruction set for best variant
    best_instruction_set = None
    for variant in variants:
        if variant['variant_id'] == best_variant_id:
            best_instruction_set = variant['instruction_set']
            break

    return {
        'variant_id': best_variant_id,
        'geomean': best_data['geomean'],
        'products': best_data['products'],
        'coverage': best_data['coverage'],
        'programs': cluster_programs,
        'instruction_set': best_instruction_set,
        'num_instructions': len(best_instruction_set) if best_instruction_set else 0
    }
