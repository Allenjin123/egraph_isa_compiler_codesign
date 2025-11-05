#!/usr/bin/env python3
"""
分析基本块的DEF/USE信息
计算每个块的GEN、KILL、DEF_all、USE_all
"""

import os
import re
import json
import argparse
from pathlib import Path
from typing import Dict, List, Set, Tuple, Optional
import sys

# 添加当前目录到路径
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))

from util import analyze_instruction, is_register, parse_instruction


class DefUseAnalyzer:
    """分析DEF/USE关系"""
    
    def __init__(self, verbose=False):
        self.verbose = verbose
    
    def analyze_block(self, block_file: Path) -> Dict:
        """分析一个基本块"""
        GEN = set()
        KILL = set()
        USE_all = set()
        DEF_all = set()
        defined_so_far = set()
        
        with open(block_file, 'r', encoding='utf-8', errors='ignore') as f:
            lines = [line.strip() for line in f if line.strip()]
        
        for line in lines:
            mnemonic, operands = parse_instruction(line)
            if not mnemonic:
                continue
            
            try:
                use_regs, def_regs = analyze_instruction(mnemonic, operands)
            except ValueError as e:
                if self.verbose:
                    print(f"  警告: 跳过未知指令 {mnemonic}: {e}")
                continue
            
            # 累积USE_all和DEF_all
            USE_all.update(use_regs)
            DEF_all.update(def_regs)
            
            # GEN: 在被定义之前使用的寄存器
            for reg in use_regs:
                if reg not in defined_so_far:
                    GEN.add(reg)
            
            # KILL: 被定义的寄存器
            KILL.update(def_regs)
            defined_so_far.update(def_regs)
        
        return {
            'GEN': sorted(list(GEN)),
            'KILL': sorted(list(KILL)),
            'USE_all': sorted(list(USE_all)),
            'DEF_all': sorted(list(DEF_all))
        }
    
    def analyze_program(self, program_dir: Path) -> Dict:
        """分析程序中的所有基本块"""
        bb_dir = program_dir / 'basic_blocks'
        if not bb_dir.exists():
            raise FileNotFoundError(f"basic_blocks目录不存在: {bb_dir}")
        
        if self.verbose:
            print(f"\n分析DEF/USE: {program_dir.name}")
        
        defuse_info = {}
        
        block_files = sorted([f for f in bb_dir.iterdir() 
                            if f.suffix == '.txt' and f.stem.isdigit()],
                            key=lambda f: int(f.stem))
        
        for block_file in block_files:
            block_id = int(block_file.stem)
            defuse_info[block_id] = self.analyze_block(block_file)
        
        if self.verbose:
            print(f"  分析了{len(defuse_info)}个块")
        
        return defuse_info
    
    def save_defuse(self, defuse_data: Dict, output_file: Path):
        """保存DEF/USE信息到JSON文件"""
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(defuse_data, f, indent=2, ensure_ascii=False)
        
        if self.verbose:
            print(f"✓ 保存到: {output_file}")


def process_program(program_dir: Path, verbose=False):
    """处理单个程序"""
    analyzer = DefUseAnalyzer(verbose=verbose)
    defuse_data = analyzer.analyze_program(program_dir)
    
    # 保存到程序目录
    output_file = program_dir / 'defuse.json'
    analyzer.save_defuse(defuse_data, output_file)
    
    return defuse_data


def process_all_programs(output_dir: Path, verbose=False):
    """处理所有程序"""
    print(f"分析目录中的程序: {output_dir}")
    
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
        description='分析基本块的DEF/USE信息',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
示例:
  # 分析单个程序
  python analyze_defuse.py output/frontend/dijkstra_small_O3/
  
  # 分析所有程序
  python analyze_defuse.py output/frontend/
  
  # 详细输出
  python analyze_defuse.py output/frontend/dijkstra_small_O3/ -v
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
