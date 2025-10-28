import os
import re
import sys
from pathlib import Path

# Support running as a script or as a module
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))

try:
    from util import BRANCH_INSTRUCTIONS, is_branch_mnemonic  # type: ignore
except ImportError as e:
    raise RuntimeError(f"Failed to import util.py: {e}")

class BasicBlockSplitter:
    def __init__(self):
        # Use shared branch/control-flow instruction set
        self.branch_instructions = BRANCH_INSTRUCTIONS
        
        # Jump target labels (potential basic block boundaries)
        self.jump_targets = set()
        
    def is_branch_instruction(self, instruction):
        """Check whether this is a branch / jump / control-flow instruction."""
        if not instruction:
            return False
        # 提取指令助记符，汇编格式: "地址:\t机器码\t助记符\t操作数"
        parts = instruction.split('\t')
        if len(parts) < 3:
            return False
        mnemonic = parts[2].strip()
        return is_branch_mnemonic(mnemonic)
    
    def is_instruction_line(self, line):
        """Check whether this is a valid instruction line (exclude function headers)."""
        # 匹配形如 "   10124:	bf41                	c.j	100b4 <exit>"
        # 但排除函数头如 "00010172 <main>:"
        if ':' not in line:
            return False
        if '<' in line and '>' in line and not '\t' in line:
            return False  # 函数头
        return re.match(r'\s*[0-9a-fA-F]+:', line.strip())
    
    def extract_instruction_address(self, line):
        """Extract instruction address.
        Examples:
        "   10124:    bf41                 c.j    100b4 <exit>" -> "10124"
        "   10110:    00008067             ret"                  -> "10110"
        """
        match = re.match(r'\s*([0-9a-fA-F]+):', line.strip())
        return match.group(1) if match else None
    
    def parse_instruction_parts(self, line):
        """Parse an instruction line; return (address, machine_code, mnemonic, operands) or None."""
        parts = line.split('\t')
        if len(parts) < 3:
            return None
        
        address = self.extract_instruction_address(line)
        machine_code = parts[1].strip() if len(parts) > 1 else ""
        mnemonic = parts[2].strip()
        operands = parts[3].strip() if len(parts) > 3 else ""
        
        return address, machine_code, mnemonic, operands
    
    # def collect_jump_targets(self, lines):
    #     """收集所有跳转目标地址"""
    #     targets = set()
    #     for line in lines:
    #         # 查找跳转指令中的目标地址
    #         # 例如: "   10124:	bf41                	c.j	100b4 <exit>"
    #         match = re.search(r'<([^>]+)>', line)
    #         if match:
    #             target = match.group(1)
    #             targets.add(target)
            
    #         # 查找直接的地址引用
    #         match = re.search(r'\b([0-9a-fA-F]{5,8})\b', line)
    #         if match:
    #             addr = match.group(1)
    #             targets.add(addr)
        
    #     return targets
    
    def split_into_basic_blocks(self, lines):
        """Split a sequence of disassembly lines into basic blocks."""
        basic_blocks = []
        current_block = []
        
    # Step 1: Collect all valid instruction lines (skip function headers)
        instruction_lines = []
        for line in lines:
            line = line.strip()
            if line and self.is_instruction_line(line):
                instruction_lines.append(line)
        
        if not instruction_lines:
            return basic_blocks
        
    # Step 2: Collect all branch target addresses
        jump_target_addrs = set()
        for line in instruction_lines:
            parsed = self.parse_instruction_parts(line)
            if parsed and parsed[2] in self.branch_instructions:
                # Extract precise branch target address (usually found in operands)
                operands = parsed[3]
                # Extract address like the "100ca" in: "100ca <exit+0x16>"
                addr_match = re.search(r'\b([0-9a-fA-F]{4,8})\b', operands)
                if addr_match:
                    addr = addr_match.group(1)
                    jump_target_addrs.add(addr.lower())
        
        # Step 3: Determine all basic block start indices
        block_starts = {0}  # First instruction always starts a block
        
        # Start new basic blocks at jump targets and immediately after branch instructions
        for i, line in enumerate(instruction_lines):
            parsed = self.parse_instruction_parts(line)
            if not parsed:
                continue
                
            address, _, mnemonic, _ = parsed
            
            # Jump target: begin new basic block
            if address and address.lower() in jump_target_addrs:
                block_starts.add(i)
            
            # Instruction after a branch: begin new basic block
            if mnemonic in self.branch_instructions:
                next_idx = i + 1
                if next_idx < len(instruction_lines):
                    block_starts.add(next_idx)
        
        # Sort block start indices
        block_starts = sorted(block_starts)
        
        # Step 4: Slice instructions into blocks
        for i in range(len(block_starts)):
            start_idx = block_starts[i]
            end_idx = block_starts[i + 1] if i + 1 < len(block_starts) else len(instruction_lines)
            
            block = instruction_lines[start_idx:end_idx]
            if block:
                basic_blocks.append(block)
        
        return basic_blocks
    
    def process_section_file(self, section_path):
        """Process a single section directory."""
        section_txt_path = os.path.join(section_path, 'section.txt')
        if not os.path.exists(section_txt_path):
            return
        
        with open(section_txt_path, 'r') as f:
            lines = f.readlines()
        
    # Split into basic blocks
        basic_blocks = self.split_into_basic_blocks(lines)
        
    # Create basic_blocks subdirectory
        bb_dir = os.path.join(section_path, 'basic_blocks')
        os.makedirs(bb_dir, exist_ok=True)
        
    # Create basic block files
        bb_counter = 0
        for i, bb in enumerate(basic_blocks):
            if bb:  # Ensure block is not empty
                bb_file_path = os.path.join(bb_dir, f'{bb_counter}.txt')
                with open(bb_file_path, 'w') as f:
                    f.write('\n'.join(bb) + '\n')
                bb_counter += 1
        
        print(f"Section {os.path.basename(section_path)}: Created {bb_counter} basic blocks")
        return bb_counter
    
    def process_all_sections(self, sections_dir):
        """Process all section subdirectories."""
        total_basic_blocks = 0
        section_count = 0
        
        for section_name in os.listdir(sections_dir):
            section_path = os.path.join(sections_dir, section_name)
            if os.path.isdir(section_path):
                bb_count = self.process_section_file(section_path)
                if bb_count:
                    total_basic_blocks += bb_count
                    section_count += 1
        
        print(f"\nProcessed {section_count} sections")
        print(f"Created {total_basic_blocks} basic blocks in total")

def main():
    sections_dir = "/home/yjrcs/Egglog_DSL/SSA/sections"
    splitter = BasicBlockSplitter()
    splitter.process_all_sections(sections_dir)

if __name__ == "__main__":
    main()