#!/usr/bin/env python3
"""
Analyze execution counts for basic blocks.

Based on analyze_asm_blocks.py but modified to:
1. Track source line numbers while parsing
2. Map blocks to line numbers directly
3. Look up execution counts from asm_execution_map.txt
4. Verify uniform execution within each block

Usage: analyze_block_execution.py <source.s> <asm_execution_map.txt> <basic_blocks_dir> <output_file>
"""

import sys
import re
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Set

# Add frontend directory to path to import util
SCRIPT_DIR = Path(__file__).resolve().parent
FRONTEND_DIR = SCRIPT_DIR.parent / 'frontend'
if str(FRONTEND_DIR) not in sys.path:
    sys.path.insert(0, str(FRONTEND_DIR))

from util import BRANCH_INSTRUCTIONS, is_branch_mnemonic


class BlockExecutionAnalyzer:
    """Analyze basic blocks and their execution counts"""

    def __init__(self):
        self.branch_instructions = BRANCH_INSTRUCTIONS

    def is_label_line(self, line: str) -> bool:
        """Check if line is a label"""
        if not line or line.startswith('#'):
            return False
        if line[0] != ' ' and line[0] != '\t' and line.rstrip().endswith(':'):
            return True
        return False

    def is_instruction_line(self, line: str) -> bool:
        """Check if line is an instruction"""
        stripped = line.strip()
        if not stripped or stripped.startswith('#'):
            return False
        if not line.startswith(('\t', ' ')):
            return False
        if stripped.startswith('.'):
            return False
        if stripped.endswith(':'):
            return False
        return True

    def parse_instruction(self, line: str) -> Optional[Tuple[str, str]]:
        """Parse instruction line, return (mnemonic, operands)"""
        stripped = line.strip()
        parts = stripped.split(None, 1)
        if not parts:
            return None
        mnemonic = parts[0]
        operands = parts[1] if len(parts) > 1 else ""
        return mnemonic, operands

    def extract_label_from_line(self, line: str) -> Optional[str]:
        """Extract label name from label line"""
        stripped = line.strip()
        if stripped.endswith(':'):
            return stripped[:-1].strip()
        return None

    def is_branch_terminator(self, mnemonic: str) -> bool:
        """Check if mnemonic is a branch/control flow instruction"""
        return is_branch_mnemonic(mnemonic)

    def collect_branch_targets(self, lines: List[str]) -> Set[str]:
        """Collect all branch target labels from instructions"""
        targets = set()
        for line in lines:
            if not self.is_instruction_line(line):
                continue
            parsed = self.parse_instruction(line)
            if not parsed:
                continue
            mnemonic, operands = parsed
            if not self.is_branch_terminator(mnemonic):
                continue
            # Extract label from operands (last token)
            if operands:
                tokens = operands.split(',')
                last_token = tokens[-1].strip()
                # Remove offset if present (e.g., ".L1" from ".L1+4")
                if '+' in last_token or '-' in last_token:
                    last_token = re.split(r'[+-]', last_token)[0]
                if last_token and not last_token[0].isdigit():
                    targets.add(last_token)
        return targets

    def split_into_blocks_with_lines(self, asm_file: Path) -> List[Tuple[int, List[Tuple[int, str]]]]:
        """
        Split assembly file into basic blocks, tracking line numbers.

        Returns: List of (block_id, [(line_num, instruction), ...])
        """
        with open(asm_file, 'r', encoding='utf-8', errors='ignore') as f:
            lines = f.readlines()

        # Collect branch targets
        branch_targets = self.collect_branch_targets(lines)

        # Identify instruction lines and their indices
        instruction_indices = []  # List of (instruction_index_in_block_sequence, original_line_number)
        label_to_idx = {}
        pending_labels = []

        for line_num, line in enumerate(lines, start=1):
            if self.is_label_line(line):
                label = self.extract_label_from_line(line)
                if label:
                    pending_labels.append(label)
            elif self.is_instruction_line(line):
                current_idx = len(instruction_indices)
                instruction_indices.append(line_num)

                for label in pending_labels:
                    label_to_idx[label] = current_idx
                pending_labels = []

        if not instruction_indices:
            return []

        # Determine basic block boundaries
        block_starts = {0}

        for i, line_num in enumerate(instruction_indices):
            line = lines[line_num - 1]  # Convert to 0-indexed
            parsed = self.parse_instruction(line)
            if not parsed:
                continue

            mnemonic, operands = parsed

            # After a branch instruction, start new block
            if self.is_branch_terminator(mnemonic):
                next_idx = i + 1
                if next_idx < len(instruction_indices):
                    block_starts.add(next_idx)

        # Add blocks at branch target positions
        for label in branch_targets:
            if label in label_to_idx:
                block_starts.add(label_to_idx[label])

        # Create basic blocks with line numbers
        block_starts = sorted(block_starts)
        basic_blocks = []

        for i in range(len(block_starts)):
            start = block_starts[i]
            end = block_starts[i + 1] if i + 1 < len(block_starts) else len(instruction_indices)

            block_lines = []
            for j in range(start, end):
                line_num = instruction_indices[j]
                line_text = lines[line_num - 1]  # Convert to 0-indexed
                block_lines.append((line_num, line_text))

            if block_lines:
                basic_blocks.append((i, block_lines))

        return basic_blocks

    def parse_execution_map(self, map_file: Path) -> Dict[int, int]:
        """Parse asm_execution_map.txt to get line -> execution count"""
        line_to_count = {}

        with open(map_file, 'r') as f:
            for line in f:
                if line.startswith('Line') or line.startswith('---') or line.startswith('==='):
                    continue
                if 'Summary:' in line or 'Total' in line or 'Mapped' in line:
                    continue

                parts = [p.strip() for p in line.split('|')]
                if len(parts) >= 5:
                    try:
                        line_num = int(parts[0])
                        exec_count = int(parts[4])
                        line_to_count[line_num] = exec_count
                    except (ValueError, IndexError):
                        continue

        return line_to_count

    def analyze(self, asm_file: Path, map_file: Path, blocks_dir: Path, output_file: Path):
        """Analyze execution counts for all basic blocks"""

        print(f"Parsing source assembly: {asm_file}")
        blocks_with_lines = self.split_into_blocks_with_lines(asm_file)
        print(f"  Found {len(blocks_with_lines)} basic blocks")

        print(f"Parsing execution map: {map_file}")
        line_to_count = self.parse_execution_map(map_file)
        print(f"  Found {len(line_to_count)} line execution counts")

        # Analyze each block
        results = []
        errors = []

        for block_id, block_lines in blocks_with_lines:
            line_nums = [ln for ln, _ in block_lines]

            # Look up execution counts
            exec_counts = []
            for line_num in line_nums:
                if line_num in line_to_count:
                    exec_counts.append(line_to_count[line_num])
                else:
                    errors.append(f"Block {block_id}: Line {line_num} not in execution map")
                    break

            if len(exec_counts) != len(line_nums):
                continue

            # Check uniformity
            unique_counts = set(exec_counts)
            if len(unique_counts) != 1:
                errors.append(f"Block {block_id}: Non-uniform execution counts")
                errors.append(f"  Line numbers: {line_nums}")
                errors.append(f"  Exec counts: {exec_counts}")
                continue

            # Success
            block_count = exec_counts[0]
            results.append((block_id, block_count, len(block_lines), line_nums))
            print(f"  Block {block_id}: {block_count} executions ({len(block_lines)} instructions, lines {line_nums[0]}-{line_nums[-1]})")

        # Write results
        print(f"\nWriting results to: {output_file}")
        with open(output_file, 'w') as f:
            f.write(f"{'Block ID':<10} | {'Exec Count':<12} | {'Num Instrs':<11} | {'Source Lines'}\n")
            f.write("-" * 80 + "\n")

            for block_id, count, num_instr, line_nums in results:
                line_range = f"{line_nums[0]}-{line_nums[-1]}" if len(line_nums) > 1 else str(line_nums[0])
                f.write(f"{block_id:<10} | {count:<12} | {num_instr:<11} | {line_range}\n")

            f.write("\n")
            f.write("=" * 80 + "\n")
            f.write(f"Summary:\n")
            f.write(f"  Total blocks: {len(blocks_with_lines)}\n")
            f.write(f"  Successfully analyzed: {len(results)}\n")
            f.write(f"  Errors: {len(errors)}\n")

            if errors:
                f.write("\n")
                f.write("Errors:\n")
                for error in errors:
                    f.write(f"  {error}\n")

        print(f"\nSummary:")
        print(f"  Total blocks: {len(blocks_with_lines)}")
        print(f"  Successfully analyzed: {len(results)}")
        print(f"  Errors: {len(errors)}")

        if errors:
            print(f"\nFirst 10 errors:")
            for error in errors[:10]:
                print(f"  {error}")
            if len(errors) > 10:
                print(f"  ... and {len(errors) - 10} more errors")
            sys.exit(1)


def main():
    if len(sys.argv) != 5:
        print("Usage: analyze_block_execution.py <source.s> <asm_execution_map.txt> <basic_blocks_dir> <output_file>")
        print("\nExample:")
        print("  python3 analyze_block_execution.py \\")
        print("    benchmark/network/dijkstra/dijkstra_small_O3_clean.s \\")
        print("    benchmark/tmp/dijkstra_small_O3_clean_20251111_234755/asm_execution_map.txt \\")
        print("    output/frontend/dijkstra_small_O3/basic_blocks \\")
        print("    output/frontend/dijkstra_small_O3/block_execution_counts.txt")
        sys.exit(1)

    asm_file = Path(sys.argv[1])
    map_file = Path(sys.argv[2])
    blocks_dir = Path(sys.argv[3])
    output_file = Path(sys.argv[4])

    if not asm_file.exists():
        print(f"Error: Source assembly not found: {asm_file}")
        sys.exit(1)

    if not map_file.exists():
        print(f"Error: Execution map not found: {map_file}")
        sys.exit(1)

    if not blocks_dir.exists():
        print(f"Error: Basic blocks dir not found: {blocks_dir}")
        sys.exit(1)

    analyzer = BlockExecutionAnalyzer()
    analyzer.analyze(asm_file, map_file, blocks_dir, output_file)
    print(f"\nDone!")


if __name__ == "__main__":
    main()
