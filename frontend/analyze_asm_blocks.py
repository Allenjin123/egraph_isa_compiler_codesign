#!/usr/bin/env python3
"""
Analyze basic blocks from .s assembly files (no section needed)
Traverse from beginning to end, identify basic blocks, numbered from 0
"""

import os
import re
import sys
from pathlib import Path
from typing import List, Set, Optional, Tuple

# Add current directory to path for imports
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))

from util import BRANCH_INSTRUCTIONS, is_branch_mnemonic


class AsmBlockAnalyzer:
    """Analyze basic blocks from assembly (.s) files"""
    
    def __init__(self, verbose=False):
        self.verbose = verbose
        self.branch_instructions = BRANCH_INSTRUCTIONS
    
    def is_label_line(self, line: str) -> bool:
        """Check if line is a label (starts at column 0 and ends with ':')
        Examples:
            'main:' -> True
            '.L1:' -> True
            '  100b4:' -> False (instruction address, has leading spaces)
            '    mov x0, x1' -> False (instruction, indented)
        """
        if not line or line.startswith('#'):
            return False
        # Label must start at column 0 (no leading whitespace) and end with ':'
        if line[0] != ' ' and line[0] != '\t' and line.rstrip().endswith(':'):
            return True
        return False
    
    def is_instruction_line(self, line: str) -> bool:
        """Check if line is an instruction (starts with whitespace/tab)
        Exclude directives, labels, and comments
        """
        stripped = line.strip()
        if not stripped or stripped.startswith('#'):
            return False
        
        # Should start with whitespace (indented instruction)
        if not line.startswith(('\t', ' ')):
            return False
        
        # Exclude directives (starting with '.')
        if stripped.startswith('.'):
            return False
        
        # Exclude labels (ending with ':')
        if stripped.endswith(':'):
            return False
        
        return True
    
    def parse_instruction(self, line: str) -> Optional[Tuple[str, str]]:
        """Parse instruction line, return (mnemonic, operands)
        Example: '  addi  sp,sp,-16' -> ('addi', 'sp,sp,-16')
        """
        stripped = line.strip()
        parts = stripped.split(None, 1)  # Split on first whitespace
        
        if not parts:
            return None
        
        mnemonic = parts[0]
        operands = parts[1] if len(parts) > 1 else ""
        
        return mnemonic, operands
    
    def extract_label_from_line(self, line: str) -> Optional[str]:
        """Extract label name from label line
        Example: 'main:' -> 'main', '.L1:' -> '.L1'
        """
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
        prev_line = None
        
        for line in lines:
            if not self.is_instruction_line(line):
                if not line.strip().startswith('#'):  # Keep non-comment lines for context
                    prev_line = line
                continue
            
            parsed = self.parse_instruction(line)
            if not parsed:
                prev_line = line
                continue
            
            mnemonic, operands = parsed
            
            # Check if this is a branch instruction
            if self.is_branch_terminator(mnemonic):
                # Extract label from operands
                # jalr: check if it's a function call or return
                # jal: last operand is the label (e.g., 'jal zero,.L1')
                # other branches: last operand is the label (e.g., 'beq a0,zero,.L1')
                
                if mnemonic == 'jalr':
                    # Check the last operand
                    parts = operands.split(',')
                    if parts:
                        last_op = parts[-1].strip()
                        # If it's 0, this is a return or simple indirect jump, skip
                        if last_op == '0':
                            prev_line = line
                            continue
                        # If it contains %pcrel_lo, extract function name from previous auipc
                        if '%pcrel_lo' in last_op:
                            if prev_line and 'auipc' in prev_line:
                                # Extract function name from %pcrel_hi(function_name)
                                match = re.search(r'%pcrel_hi\(([^)]+)\)', prev_line)
                                if match:
                                    func_name = match.group(1)
                                    targets.add(func_name)
                    prev_line = line
                    continue
                
                # For jal and conditional branches, extract the last operand
                # Split by comma and take the last part
                parts = operands.split(',')
                if parts:
                    target = parts[-1].strip()
                    # Remove any immediate offset markers like %pcrel_lo, %hi, %lo
                    target = re.sub(r'%\w+\([^)]*\)', '', target).strip()
                    # Only add if it looks like a label (starts with . or letter/underscore)
                    if target and (target.startswith('.') or target[0].isalpha() or target[0] == '_'):
                        targets.add(target)
            
            prev_line = line
        
        if self.verbose:
            print(f"  Found {len(targets)} branch targets: {sorted(targets)}")
        
        return targets
    
    def split_into_basic_blocks(self, asm_file: Path) -> List[List[str]]:
        """Split assembly file into basic blocks
        Returns: List of basic blocks, each block is a list of instruction lines
        """
        with open(asm_file, 'r', encoding='utf-8', errors='ignore') as f:
            lines = f.readlines()
        
        # Step 1: Collect branch target labels
        branch_targets = self.collect_branch_targets(lines)
        
        # Step 2: Identify instruction lines and their indices
        instruction_indices = []
        label_to_idx = {}  # Map label to first instruction index after it
        
        pending_labels = []  # Labels before next instruction
        
        for i, line in enumerate(lines):
            # Collect labels
            if self.is_label_line(line):
                label = self.extract_label_from_line(line)
                if label:
                    pending_labels.append(label)
            # Process instruction
            elif self.is_instruction_line(line):
                current_idx = len(instruction_indices)
                instruction_indices.append(i)
                
                # Map all pending labels to this instruction index
                # In case of a label after a label
                for label in pending_labels:
                    label_to_idx[label] = current_idx
                pending_labels = []
        
        if not instruction_indices:
            return []
        
        # Step 3: Determine basic block boundaries
        block_starts = {0}  # First instruction always starts a block
        
        for i, line_idx in enumerate(instruction_indices):
            line = lines[line_idx]
            parsed = self.parse_instruction(line)
            
            if not parsed:
                raise ValueError(
                    f"Logic error: Line {line_idx} was identified as an instruction line "
                    f"but failed to parse.\nContent: {line.strip()}"
                )
            
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
        
        # Step 4: Create basic blocks
        block_starts = sorted(block_starts)
        basic_blocks = []
        
        for i in range(len(block_starts)):
            start = block_starts[i]
            end = block_starts[i + 1] if i + 1 < len(block_starts) else len(instruction_indices)
            
            block_lines = []
            for j in range(start, end):
                block_lines.append(lines[instruction_indices[j]])
            
            if not block_lines:
                raise ValueError(
                    f"Logic error: Empty basic block created. Block {i} has start={start}, "
                    f"end={end}, but no instructions found. This indicates a bug in block "
                    f"boundary calculation."
                )
            
            basic_blocks.append(block_lines)
        
        if self.verbose:
            print(f"  Split into {len(basic_blocks)} basic blocks")
        
        return basic_blocks
    
    def analyze_asm_file(self, asm_file: Path, output_dir: Path):
        """Analyze one .s file and output basic blocks
        
        Args:
            asm_file: Path to .s assembly file
            output_dir: Directory to save output (saturation_output/<program_name>/)
        """
        if self.verbose:
            print(f"\nAnalyzing: {asm_file}")
        
        # Split into basic blocks
        basic_blocks = self.split_into_basic_blocks(asm_file)
        
        if not basic_blocks:
            print(f"  Warning: No basic blocks found in {asm_file}")
            return
        
        # Create output directory
        output_dir.mkdir(parents=True, exist_ok=True)
        
        # Save each basic block to numbered file (starting from 0)
        for block_id, block in enumerate(basic_blocks):
            block_file = output_dir / f"{block_id}.txt"
            with open(block_file, 'w', encoding='utf-8') as f:
                for line in block:
                    f.write(line)
        
        print(f"  ✓ Created {len(basic_blocks)} basic blocks in {output_dir}")
        
        return len(basic_blocks)


def analyze_single_file(asm_file: Path, output_base: Path, verbose=False):
    """Analyze a single .s file
    
    Args:
        asm_file: Path to .s file
        output_base: Base output directory (saturation_output/)
        verbose: Verbose output
    """
    # Get program name (remove .s suffix)
    program_name = asm_file.stem
    
    # Create output directory: output/<program_name>/basic_blocks
    output_dir = output_base / program_name / 'basic_blocks'
    
    analyzer = AsmBlockAnalyzer(verbose=verbose)
    return analyzer.analyze_asm_file(asm_file, output_dir)


def analyze_all_clean_files(output_base: Path, verbose=False):
    """Analyze all *_clean.s files in benchmark directory recursively
    
    Args:
        output_base: Base output directory (default: output/)
        verbose: Verbose output
    """
    # Get benchmark directory
    script_dir = Path(__file__).resolve().parent
    benchmark_dir = script_dir.parent / "benchmark"
    
    if not benchmark_dir.exists():
        print(f"Error: benchmark directory not found at {benchmark_dir}")
        return 0
    
    # Find all *_clean.s files recursively
    clean_files = list(benchmark_dir.rglob("*_clean.s"))
    
    if not clean_files:
        print(f"No *_clean.s files found in {benchmark_dir}")
        return 0
    
    print(f"Found {len(clean_files)} *_clean.s files in benchmark directory")
    print("=" * 80)
    
    total_blocks = 0
    success_count = 0
    
    for asm_file in sorted(clean_files):
        # Get relative path for better display
        rel_path = asm_file.relative_to(benchmark_dir)
        print(f"\nProcessing: {rel_path}")
        
        try:
            block_count = analyze_single_file(asm_file, output_base, verbose)
            if block_count:
                total_blocks += block_count
                success_count += 1
        except Exception as e:
            print(f"  ✗ Error processing {asm_file.name}: {e}")
            if verbose:
                import traceback
                traceback.print_exc()
            continue
    
    print("\n" + "=" * 80)
    print(f"Processing complete!")
    print(f"  Successfully processed: {success_count}/{len(clean_files)} files")
    print(f"  Total basic blocks created: {total_blocks}")
    
    return total_blocks


def main():
    import argparse
    
    parser = argparse.ArgumentParser(
        description='Analyze basic blocks from .s assembly files',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Analyze all *_clean.s files in benchmark directory (default mode)
  python analyze_asm_blocks.py
  
  # Analyze a single .s file
  python analyze_asm_blocks.py benchmark/network/dijkstra/dijkstra_small_O3_clean.s
  
  # Specify output directory
  python analyze_asm_blocks.py -o saturation_output
  
  # Verbose output
  python analyze_asm_blocks.py -v
        '''
    )
    
    parser.add_argument('asm_file', nargs='?', default=None,
                       help='Path to .s assembly file (optional, if not provided, analyze all *_clean.s files)')
    parser.add_argument('-o', '--output', default='output',
                       help='Output directory (default: output)')
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Verbose output')
    
    args = parser.parse_args()
    
    output_base = Path(args.output)
    
    try:
        # Mode 1: Process all *_clean.s files in benchmark directory
        if args.asm_file is None:
            print("Mode: Analyze all *_clean.s files in benchmark directory")
            print(f"Output directory: {output_base}")
            print("")
            total_blocks = analyze_all_clean_files(output_base, args.verbose)
            if total_blocks > 0:
                print(f"\n✓ Analysis complete: {total_blocks} total basic blocks created")
            return 0
        
        # Mode 2: Process a single specified file
        else:
            asm_file = Path(args.asm_file)
            if not asm_file.exists():
                print(f"Error: File not found: {asm_file}")
                return 1
            
            print(f"Mode: Analyze single file: {asm_file}")
            print(f"Output directory: {output_base}")
            print("")
            
            block_count = analyze_single_file(asm_file, output_base, args.verbose)
            if block_count:
                print(f"\n✓ Analysis complete: {block_count} basic blocks created")
            return 0
            
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        return 1


if __name__ == "__main__":
    sys.exit(main())
