#!/usr/bin/env python3
"""Extract instruction statistics from all .s files in benchmark, distinguishing standard and pseudo instructions"""

from pathlib import Path
from collections import defaultdict
import sys

# Add SSA directory to path to import util
sys.path.insert(0, str(Path(__file__).parent))
from util import RV32IM_STANDARD_INSTRUCTIONS

BENCHMARK_DIR = Path(__file__).parent.parent / "benchmark"


def extract_instructions(asm_file):
    """Extract all instructions from assembly file"""
    instructions = set()

    with open(asm_file, 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            stripped = line.strip()
            if not stripped or stripped.startswith('#'):
                continue
            
            # Skip label definitions (ending with colon)
            if stripped.endswith(':'):
                continue
            
            if stripped.startswith('.LC'):
                continue

            # Real instructions (starting with tab or space)
            if not stripped.startswith('.') and line.startswith(('\t', ' ')):
                parts = stripped.split()
                if parts:
                    instructions.add(parts[0])
    
    return instructions


def classify_instructions(instructions):
    """Classify instructions into standard and pseudo instructions"""
    standard = set()
    pseudo = set()
    
    for inst in instructions:
        if inst in RV32IM_STANDARD_INSTRUCTIONS:
            standard.add(inst)
        else:
            pseudo.add(inst)
    
    return standard, pseudo


def main():
    file_stats = {}
    folder_inst = defaultdict(set)
    all_instructions = set()
    
    # Iterate over all .s files
    for s_file in sorted(BENCHMARK_DIR.rglob("*.s")):
        stem_lower = s_file.stem.lower()
        if "clean" in stem_lower or "rewrite" in stem_lower:
            continue
        insts = extract_instructions(s_file)
        rel_path = s_file.relative_to(BENCHMARK_DIR)
        folder = rel_path.parts[0]  # Only take the first level directory (e.g. automotive)
        
        file_stats[str(rel_path)] = insts
        folder_inst[folder].update(insts)
        all_instructions.update(insts)
    
    # Classify all instructions
    all_standard, all_pseudo = classify_instructions(all_instructions)
    
    # Output per-file statistics
    print("=" * 80)
    print("Instruction Set per File")
    print("=" * 80)
    for file, insts in sorted(file_stats.items()):
        std, psd = classify_instructions(insts)
        print(f"\n{file}:")
        print(f"  Total: {len(insts)} (Standard: {len(std)}, Pseudo: {len(psd)})")
        if std:
            print(f"  Standard instructions: {sorted(std)}")
        if psd:
            print(f"  Pseudo instructions: {sorted(psd)}")
    
    # Output per-folder statistics
    print("\n" + "=" * 80)
    print("Instruction Set per Folder")
    print("=" * 80)
    for folder in sorted(folder_inst.keys()):
        std, psd = classify_instructions(folder_inst[folder])
        print(f"\n{folder}:")
        print(f"  Total: {len(folder_inst[folder])} (Standard: {len(std)}, Pseudo: {len(psd)})")
        if std:
            print(f"  Standard instructions: {sorted(std)}")
        if psd:
            print(f"  Pseudo instructions: {sorted(psd)}")
    
    # Output overall benchmark statistics
    print("\n" + "=" * 80)
    print("Overall Benchmark Instruction Set Statistics")
    print("=" * 80)
    print(f"\nTotal instructions: {len(all_instructions)}")
    print(f"  - Standard RV32IM instructions: {len(all_standard)}")
    print(f"  - Pseudo instructions: {len(all_pseudo)}")
    
    print("\n" + "=" * 80)
    print("Standard RV32IM Instruction List")
    print("=" * 80)
    for i, inst in enumerate(sorted(all_standard), 1):
        print(f"  {i:2d}. {inst}")
    
    print("\n" + "=" * 80)
    print("Pseudo Instruction List")
    print("=" * 80)
    for i, inst in enumerate(sorted(all_pseudo), 1):
        print(f"  {i:2d}. {inst}")

    # Save results
    output_file = Path(__file__).parent / "instruction_stats.txt"
    output_file.parent.mkdir(exist_ok=True)
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("=" * 80 + "\n")
        f.write("Instruction Set Statistics Summary\n")
        f.write("=" * 80 + "\n\n")
        f.write(f"Total instructions: {len(all_instructions)}\n")
        f.write(f"  - Standard RV32IM instructions: {len(all_standard)}\n")
        f.write(f"  - Pseudo instructions: {len(all_pseudo)}\n\n")
        
        f.write("=" * 80 + "\n")
        f.write(f"Standard RV32IM Instructions ({len(all_standard)})\n")
        f.write("=" * 80 + "\n")
        for inst in sorted(all_standard):
            f.write(f"  {inst}\n")
        
        f.write("\n" + "=" * 80 + "\n")
        f.write(f"Pseudo Instructions ({len(all_pseudo)})\n")
        f.write("=" * 80 + "\n")
        for inst in sorted(all_pseudo):
            f.write(f"  {inst}\n")
        

    
    print(f"\nResults saved to: {output_file}")


if __name__ == "__main__":
    main()
