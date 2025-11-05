#!/usr/bin/env python3
"""
构建控制流图（CFG）
从basic_blocks目录和label_to_block.json构建CFG
"""

import os
import re
import json
import argparse
from pathlib import Path
from typing import Dict, List, Set, Optional, Tuple
import sys

# 添加当前目录到路径
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))

from util import BRANCH_INSTRUCTIONS, is_branch_mnemonic


class CFGBuilder:
    """构建控制流图"""
    
    def __init__(self, verbose=False):
        self.verbose = verbose
        self.branch_instructions = BRANCH_INSTRUCTIONS
    
    def extract_mnemonic_and_operands(self, line: str) -> Optional[Tuple[str, str]]:
        """提取指令的助记符和原始操作数字符串（不解析）
        
        Args:
            line: 指令行，例如 '  addi  sp,sp,-16'
            
        Returns:
            (mnemonic, operands_str) 或 None
            例如: ('addi', 'sp,sp,-16')
        """
        # 移除注释
        clean = re.sub(r'#.*$', '', line).strip()
        
        if not clean:
            return None
        
        # 分割mnemonic和operands
        parts = clean.split(None, 1)
        if not parts:
            return None
        
        mnemonic = parts[0]
        operands = parts[1] if len(parts) > 1 else ""
        
        return mnemonic, operands
    
    def extract_jump_target(self, operands: str) -> Optional[str]:
        """从操作数中提取跳转目标标签
        示例:
            "a5,zero,.L1" -> ".L1"
            "zero,.L2" -> ".L2"
            "ra,printf" -> "printf"
        """
        # 移除伪指令标记如 %pcrel_lo, %hi, %lo
        clean = re.sub(r'%\w+\([^)]*\)', '', operands).strip()
        
        # 用逗号分割，取最后一个操作数
        parts = clean.split(',')
        if not parts:
            return None
        
        target = parts[-1].strip()
        
        # 检查是否看起来像标签（以.或字母/下划线开头）
        if target and (target.startswith('.') or target[0].isalpha() or target[0] == '_'):
            return target
        
        return None
    
    def analyze_block_terminator(self, block_file: Path) -> Tuple[str, Optional[str]]:
        """分析基本块的终止指令（最后一条指令）
        返回: (terminator_type, jump_target)
        terminator_type: 'conditional', 'unconditional', 'call', 'return', 'fallthrough'
        """
        with open(block_file, 'r', encoding='utf-8', errors='ignore') as f:
            lines = [line.strip() for line in f if line.strip()]
        
        if not lines:
            return 'fallthrough', None
        
        # 只分析最后一条指令
        last_line = lines[-1]
        
        parsed = self.extract_mnemonic_and_operands(last_line)
        if not parsed:
            return 'fallthrough', None
        
        mnemonic, operands = parsed
        
        # jalr可以是返回或间接跳转/调用
        if mnemonic == 'jalr':
            # jalr zero,0(ra) 或 jalr ra - 这是返回
            if 'zero' in operands:
                if 'ra' in operands or operands.startswith('0(ra)'):
                    return 'return', None
                else:  # jalr zero,0(a5) - 间接跳转
                    return 'unconditional', None
            # jalr ra,... - 间接调用（会返回）
            elif operands.startswith('ra,'):
                return 'call', None
        
        if mnemonic == 'jal':
            # 检查目标寄存器是否为zero/x0（无条件跳转）
            operand_parts = operands.split(',', 1)
            if operand_parts:
                first_op = operand_parts[0].strip()
                if first_op in ['zero', 'x0']:
                    target = self.extract_jump_target(operands)
                    if target:
                        return 'unconditional', target
                # 否则如果使用ra寄存器（函数调用）
                elif first_op == 'ra':
                    target = self.extract_jump_target(operands)
                    return 'call', target
        
        # 条件分支
        if mnemonic in ['beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu']:
            target = self.extract_jump_target(operands)
            return 'conditional', target
        
        # ecall/ebreak - 系统调用/断点
        if mnemonic in ['ecall', 'ebreak']:
            return 'trap', None
        
        # 默认：顺序执行
        return 'fallthrough', None
    
    def build_cfg(self, program_dir: Path) -> Dict:
        """为程序构建完整的CFG
        
        Args:
            program_dir: 程序目录 (例如 output/frontend/dijkstra_small_O3/)
        
        Returns:
            包含CFG信息的字典
        """
        bb_dir = program_dir / 'basic_blocks'
        label_file = program_dir / 'label_to_block.json'
        
        if not bb_dir.exists():
            raise FileNotFoundError(f"basic_blocks目录不存在: {bb_dir}")
        
        if self.verbose:
            print(f"\n构建CFG: {program_dir.name}")
        
        # 1. 加载标签到块的映射
        label_to_block = {}
        if label_file.exists():
            with open(label_file, 'r', encoding='utf-8') as f:
                label_to_block = json.load(f)
        elif self.verbose:
            print("  警告: label_to_block.json不存在，无法解析跳转目标")
        
        # 2. 获取所有基本块文件
        block_files = sorted([f for f in bb_dir.iterdir() 
                            if f.suffix == '.txt' and f.stem.isdigit()],
                            key=lambda f: int(f.stem))
        
        if not block_files:
            raise ValueError(f"在{bb_dir}中未找到基本块文件")
        
        # 3. 为每个块分析后继
        cfg = {}
        
        for block_file in block_files:
            block_id = int(block_file.stem)
            
            # 分析终止指令
            terminator_type, jump_target = self.analyze_block_terminator(block_file)
            
            # 确定后继块
            successors = []
            
            if terminator_type == 'conditional':
                # 条件分支：两个后继（跳转目标 + 顺序执行）
                if jump_target and jump_target in label_to_block:
                    successors.append(label_to_block[jump_target])
                # 顺序执行到下一个块
                if block_id + 1 < len(block_files):
                    successors.append(block_id + 1)
            
            elif terminator_type == 'unconditional':
                # 无条件跳转：只有跳转目标
                if jump_target and jump_target in label_to_block:
                    successors.append(label_to_block[jump_target])
            
            elif terminator_type == 'call':
                # 函数调用：顺序执行到下一个块
                if block_id + 1 < len(block_files):
                    successors.append(block_id + 1)
            
            elif terminator_type == 'return':
                # 返回：无后继
                pass
            
            elif terminator_type == 'trap':
                # 系统调用/断点：无后继
                pass
            
            elif terminator_type == 'fallthrough':
                # 顺序执行：下一个块
                if block_id + 1 < len(block_files):
                    successors.append(block_id + 1)
            
            cfg[block_id] = {
                'terminator_type': terminator_type,
                'jump_target': jump_target,
                'successors': successors,
                'predecessors': []  # 稍后填充
            }
        
        # 4. 填充前驱
        for block_id, info in cfg.items():
            for succ_id in info['successors']:
                if succ_id in cfg:
                    cfg[succ_id]['predecessors'].append(block_id)
        
        if self.verbose:
            print(f"  构建了包含{len(cfg)}个块的CFG")
            print(f"  入口块: 0")
            exit_blocks = [bid for bid, info in cfg.items() if not info['successors']]
            print(f"  出口块: {exit_blocks}")
        
        return {
            'label_to_block': label_to_block,
            'cfg': cfg
        }
    
    def save_cfg(self, cfg_data: Dict, output_file: Path):
        """保存CFG到JSON文件"""
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(cfg_data, f, indent=2, ensure_ascii=False)
        
        if self.verbose:
            print(f"\n✓ 保存CFG到: {output_file}")


def process_program(program_dir: Path, verbose=False):
    """处理单个程序"""
    builder = CFGBuilder(verbose=verbose)
    cfg_data = builder.build_cfg(program_dir)
    
    # 保存到程序目录
    output_file = program_dir / 'cfg.json'
    builder.save_cfg(cfg_data, output_file)
    
    return cfg_data


def process_all_programs(output_dir: Path, verbose=False):
    """处理所有程序"""
    print(f"处理目录中的程序: {output_dir}\n")
    
    processed = 0
    failed = 0
    
    for program_name in sorted(os.listdir(output_dir)):
        program_path = output_dir / program_name
        if program_path.is_dir() and (program_path / 'basic_blocks').exists():
            try:
                process_program(program_path, verbose)
                processed += 1
            except Exception as e:
                print(f"处理{program_name}时出错: {e}")
                if verbose:
                    import traceback
                    traceback.print_exc()
                failed += 1
    
    print(f"\n{'='*60}")
    print(f"✓ 成功: {processed} 个程序")
    if failed > 0:
        print(f"✗ 失败: {failed} 个程序")
    print(f"{'='*60}")


def main():
    parser = argparse.ArgumentParser(
        description='构建控制流图（CFG）',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
示例:
  # 构建单个程序的CFG
  python build_cfg.py output/frontend/dijkstra_small_O3/
  
  # 构建所有程序的CFG
  python build_cfg.py output/frontend/
  
  # 详细输出
  python build_cfg.py output/frontend/dijkstra_small_O3/ -v
        '''
    )
    
    parser.add_argument('path', help='程序目录或包含多个程序的目录')
    parser.add_argument('-v', '--verbose', action='store_true', help='详细输出')
    
    args = parser.parse_args()
    
    path = Path(args.path)
    if not path.exists():
        print(f"错误: 路径不存在: {path}")
        return 1
    
    # 判断是单个程序还是包含多个程序的目录
    if (path / 'basic_blocks').exists():
        # 单个程序
        process_program(path, args.verbose)
    else:
        # 多个程序的目录
        process_all_programs(path, args.verbose)
    
    return 0


if __name__ == "__main__":
    sys.exit(main())

