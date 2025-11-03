#!/usr/bin/env python3
"""Replace RISC-V pseudo instructions with standard instructions in .s files
Only process dijkstra files and output with _clean suffix"""

from pathlib import Path
import re
import sys
from util import is_standard_instruction

def replace_pseudo_instructions(asm_content):
    """Replace all pseudo instructions with standard instructions"""
    lines = asm_content.split('\n')
    result = []
    label_counter = [0]  # Use list to allow modification in nested scope
    
    def get_unique_label():
        label_counter[0] += 1
        return f".Lpcrel_{label_counter[0]}"
    
    for line in lines:
        stripped = line.strip()
        
        # Skip empty lines, comments, labels, and directives
        if not stripped or stripped.startswith('#') or stripped.endswith(':') or stripped.startswith('.'):
            result.append(line)
            continue
        
        # Get indentation
        indent = line[:len(line) - len(line.lstrip())]
        
        # Check for pseudo instructions and replace
        replaced = False
        
        # ret -> jalr zero, ra, 0
        if re.match(r'^\s*ret\s*($|#)', line):
            result.append(f"{indent}jalr\tzero, ra, 0")
            replaced = True
        
        # mv rd, rs -> addi rd, rs, 0
        elif match := re.match(r'^\s*mv\s+(\w+),\s*(\w+)\s*($|#)', line):
            rd, rs = match.groups()[:2]
            result.append(f"{indent}addi\t{rd}, {rs}, 0")
            replaced = True
        
        # li rd, imm -> lui + addi (for large immediates) or just addi (for small)
        elif match := re.match(r'^\s*li\s+(\w+),\s*(-?\d+)\s*($|#)', line):
            rd, imm = match.groups()[:2]
            imm = int(imm)
            
            if -2048 <= imm <= 2047:
                # Small immediate: addi rd, zero, imm
                result.append(f"{indent}addi\t{rd}, zero, {imm}")
            else:
                # Large immediate: lui + addi
                # Convert to unsigned 32-bit to handle negative numbers correctly
                if imm < 0:
                    imm = imm & 0xFFFFFFFF
                
                # Calculate upper 20 bits for lui
                upper = (imm + 0x800) >> 12
                upper = upper & 0xFFFFF  # Keep only 20 bits (unsigned)
                
                # Calculate lower 12 bits for addi (signed)
                lower = imm & 0xfff
                if lower >= 0x800:
                    lower = lower - 0x1000
                
                result.append(f"{indent}lui\t{rd}, {upper}")
                if lower != 0:
                    result.append(f"{indent}addi\t{rd}, {rd}, {lower}")
            replaced = True
        
        # j offset -> jal zero, offset
        elif match := re.match(r'^\s*j\s+(\S+)\s*($|#)', line):
            target = match.group(1)
            result.append(f"{indent}jal\tzero, {target}")
            replaced = True
        
        # jr rs -> jalr zero, rs, 0
        elif match := re.match(r'^\s*jr\s+(\w+)\s*($|#)', line):
            rs = match.group(1)
            result.append(f"{indent}jalr\tzero, {rs}, 0")
            replaced = True
        
        # tail target -> auipc + jalr with zero (tail call, no return address saved)
        elif match := re.match(r'^\s*tail\s+(\S+)\s*($|#)', line):
            target = match.group(1)
            # Use auipc + jalr with proper label for relocation
            label = get_unique_label()
            result.append(f"{label}:")
            result.append(f"{indent}auipc\tt1, %pcrel_hi({target})")
            result.append(f"{indent}jalr\tzero, t1, %pcrel_lo({label})")
            replaced = True
        
        # call target -> auipc + jalr with ra (ra)
        elif match := re.match(r'^\s*call\s+(\S+)\s*($|#)', line):
            target = match.group(1)
            # Use auipc + jalr with proper label for PC-relative addressing
            label = get_unique_label()
            result.append(f"{label}:")
            result.append(f"{indent}auipc\tra, %pcrel_hi({target})")
            result.append(f"{indent}jalr\tra, ra, %pcrel_lo({label})")
            replaced = True
        
        # bgt rs, rt, offset -> blt rt, rs, offset (swap operands)
        elif match := re.match(r'^\s*bgt\s+(\w+),\s*(\w+),\s*(\S+)\s*($|#)', line):
            rs, rt, offset = match.groups()[:3]
            result.append(f"{indent}blt\t{rt}, {rs}, {offset}")
            replaced = True
        
        # ble rs, rt, offset -> bge rt, rs, offset (swap operands)
        elif match := re.match(r'^\s*ble\s+(\w+),\s*(\w+),\s*(\S+)\s*($|#)', line):
            rs, rt, offset = match.groups()[:3]
            result.append(f"{indent}bge\t{rt}, {rs}, {offset}")
            replaced = True
        
        # bgtu rs, rt, offset -> bltu rt, rs, offset (swap operands)
        elif match := re.match(r'^\s*bgtu\s+(\w+),\s*(\w+),\s*(\S+)\s*($|#)', line):
            rs, rt, offset = match.groups()[:3]
            result.append(f"{indent}bltu\t{rt}, {rs}, {offset}")
            replaced = True
        
        # bleu rs, rt, offset -> bgeu rt, rs, offset (swap operands)
        elif match := re.match(r'^\s*bleu\s+(\w+),\s*(\w+),\s*(\S+)\s*($|#)', line):
            rs, rt, offset = match.groups()[:3]
            result.append(f"{indent}bgeu\t{rt}, {rs}, {offset}")
            replaced = True
        
        # seqz rd, rs -> sltiu rd, rs, 1
        elif match := re.match(r'^\s*seqz\s+(\w+),\s*(\w+)\s*($|#)', line):
            rd, rs = match.groups()[:2]
            result.append(f"{indent}sltiu\t{rd}, {rs}, 1")
            replaced = True
        
        # snez rd, rs -> sltu rd, zero, rs
        elif match := re.match(r'^\s*snez\s+(\w+),\s*(\w+)\s*($|#)', line):
            rd, rs = match.groups()[:2]
            result.append(f"{indent}sltu\t{rd}, zero, {rs}")
            replaced = True
        
        # sgtu rd, rs, rt -> sltu rd, rt, rs (swap operands)
        elif match := re.match(r'^\s*sgtu\s+(\w+),\s*(\w+),\s*(\w+)\s*($|#)', line):
            rd, rs, rt = match.groups()[:3]
            result.append(f"{indent}sltu\t{rd}, {rt}, {rs}")
            replaced = True
        
        if not replaced:
            # Extract mnemonic from the line to validate
            mnemonic_match = re.match(r'^\s*(\w+(?:\.\w+)?)', line)
            if mnemonic_match:
                mnemonic = mnemonic_match.group(1)
                if not is_standard_instruction(mnemonic):
                    raise ValueError(
                        f"Unsupported instruction '{mnemonic}' not in RV32IM_Zicsr_Zifencei instruction set.\n"
                        f"Line: {line.strip()}\n"
                        f"This may be a pseudo instruction that needs to be handled or an invalid instruction."
                    )
            result.append(line)
    
    return '\n'.join(result)


def process_all_benchmark_files():
    """Process all .s files in benchmark directory recursively"""
    benchmark_dir = Path(__file__).parent.parent / "benchmark"
    
    if not benchmark_dir.exists():
        print(f"Error: benchmark directory not found at {benchmark_dir}")
        return
    
    # Find all .s files recursively in benchmark directory
    s_files = list(benchmark_dir.rglob("*.s"))
    
    # Filter out files that are already _clean files
    s_files = [f for f in s_files if not f.stem.endswith('_clean')]
    
    if not s_files:
        print(f"No .s files found in {benchmark_dir}")
        return
    
    print(f"Found {len(s_files)} .s files in benchmark directory")
    print("=" * 80)
    
    for s_file in sorted(s_files):
        # Get relative path for better display
        rel_path = s_file.relative_to(benchmark_dir)
        print(f"\nProcessing: {rel_path}")
        
        try:
            # Read original file
            with open(s_file, 'r', encoding='utf-8') as f:
                original = f.read()
            
            # Replace pseudo instructions
            cleaned = replace_pseudo_instructions(original)
            
            # Create output filename with _clean suffix
            output_file = s_file.parent / f"{s_file.stem}_clean.s"
            
            # Write cleaned version
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(cleaned)
            
            print(f"  → Generated: {output_file.name}")
            
            # Count changes
            orig_lines = original.split('\n')
            clean_lines = cleaned.split('\n')
            if len(clean_lines) != len(orig_lines):
                print(f"  → Line count: {len(orig_lines)} → {len(clean_lines)} (expanded by {len(clean_lines) - len(orig_lines)})")
        
        except Exception as e:
            print(f"  ✗ Error processing {s_file.name}: {e}")
            continue
    
    print("\n" + "=" * 80)
    print("Processing complete!")


if __name__ == "__main__":
    process_all_benchmark_files()
