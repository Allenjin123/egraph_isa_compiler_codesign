#!/usr/bin/env python3
"""
Map assembly source lines to disassembly and execution counts.

Output format:
  asm_line | asm_instruction | disasm_instruction | disasm_pc | exec_count
"""

import sys
import re
from pathlib import Path
from typing import Dict, Optional


def parse_source_asm(asm_file: Path) -> Dict[int, str]:
    """Parse source assembly file to get line number -> instruction mapping."""
    line_to_instr = {}

    with open(asm_file, 'r') as f:
        for line_num, line in enumerate(f, start=1):
            # Remove leading/trailing whitespace but keep the instruction
            stripped = line.strip()
            if stripped and not stripped.startswith('.') and not stripped.endswith(':'):
                # This looks like an instruction
                line_to_instr[line_num] = stripped

    return line_to_instr


def parse_full_dump(dump_file: Path, asm_filename: str) -> Dict[int, tuple]:
    """
    Parse full.dump to get source line -> (disasm_pc, disasm_instruction) mapping.

    Returns: {source_line: (pc, instruction)}
    """
    line_to_disasm = {}
    current_source_line = None

    with open(dump_file, 'r') as f:
        for line in f:
            # Look for source file reference like:
            # /path/to/file.s:123
            source_match = re.search(rf'{re.escape(asm_filename)}:(\d+)', line)
            if source_match:
                current_source_line = int(source_match.group(1))
                continue

            # Look for disassembly line like:
            #    10334:	00359793          	slli	a5,a1,0x3
            disasm_match = re.match(r'\s+([0-9a-f]+):\s+[0-9a-f]+\s+(.+)', line)
            if disasm_match and current_source_line is not None:
                pc = disasm_match.group(1)
                instruction = disasm_match.group(2).strip()

                # Filter out library/kernel code (high addresses)
                if not pc.startswith('ffffffff'):
                    line_to_disasm[current_source_line] = (f"0x{pc}", instruction)

                # Reset after processing one instruction
                current_source_line = None

    return line_to_disasm


def parse_addr_counts(counts_file: Path) -> Dict[str, int]:
    """Parse addr_counts.txt to get PC -> execution count mapping."""
    pc_to_count = {}

    with open(counts_file, 'r') as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) == 2:
                pc, count = parts
                pc_to_count[pc] = int(count)

    return pc_to_count


def generate_mapping(asm_file: Path, dump_file: Path, counts_file: Path, output_file: Path):
    """Generate the complete mapping from assembly source to execution counts."""

    print(f"Parsing source assembly: {asm_file}")
    source_lines = parse_source_asm(asm_file)
    print(f"  Found {len(source_lines)} instruction lines")

    asm_filename = asm_file.name
    print(f"Parsing disassembly: {dump_file}")
    disasm_map = parse_full_dump(dump_file, asm_filename)
    print(f"  Found {len(disasm_map)} mapped instructions")

    print(f"Parsing execution counts: {counts_file}")
    exec_counts = parse_addr_counts(counts_file)
    print(f"  Found {len(exec_counts)} unique PCs")

    # Generate output
    print(f"Generating mapping: {output_file}")
    with open(output_file, 'w') as f:
        # Write header
        f.write(f"{'Line':<8} | {'Source Instruction':<40} | {'Disasm Instruction':<40} | {'PC':<12} | {'Exec Count':<12}\n")
        f.write("-" * 125 + "\n")

        # Write data for each source line that has a mapping
        total_mapped = 0
        total_executed = 0

        for line_num in sorted(source_lines.keys()):
            source_instr = source_lines[line_num]

            if line_num in disasm_map:
                pc, disasm_instr = disasm_map[line_num]
                exec_count = exec_counts.get(pc, 0)

                f.write(f"{line_num:<8} | {source_instr:<40} | {disasm_instr:<40} | {pc:<12} | {exec_count:<12}\n")

                total_mapped += 1
                if exec_count > 0:
                    total_executed += 1

        # Write summary
        f.write("\n")
        f.write("=" * 125 + "\n")
        f.write(f"Summary:\n")
        f.write(f"  Total source instructions: {len(source_lines)}\n")
        f.write(f"  Mapped to disassembly: {total_mapped}\n")
        f.write(f"  Actually executed: {total_executed}\n")

        # Calculate total instruction count
        total_instr_count = sum(
            exec_counts.get(pc, 0)
            for _, (pc, _) in disasm_map.items()
        )
        f.write(f"  Total instructions executed: {total_instr_count}\n")

    print(f"Done! Output written to {output_file}")
    print(f"  Mapped {total_mapped} instructions")
    print(f"  {total_executed} were executed")


def main():
    if len(sys.argv) != 5:
        print("Usage: map_asm_to_execution.py <source.s> <full.dump> <addr_counts.txt> <output.txt>")
        sys.exit(1)

    asm_file = Path(sys.argv[1])
    dump_file = Path(sys.argv[2])
    counts_file = Path(sys.argv[3])
    output_file = Path(sys.argv[4])

    # Validate inputs
    for f in [asm_file, dump_file, counts_file]:
        if not f.exists():
            print(f"Error: File not found: {f}")
            sys.exit(1)

    generate_mapping(asm_file, dump_file, counts_file, output_file)


if __name__ == "__main__":
    main()
