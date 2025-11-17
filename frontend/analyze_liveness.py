#!/usr/bin/env python3
"""
活性分析（Liveness Analysis）
基于CFG和DEF/USE信息，计算每个基本块的LIVE_IN和LIVE_OUT
"""

import os
import json
import argparse
from pathlib import Path
from typing import Dict, Set
import sys

# 添加当前目录到路径
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))


class LivenessAnalyzer:
    """活性分析器"""
    
    def __init__(self, verbose=False):
        self.verbose = verbose
        # RISC-V ABI约定
        # caller-saved: 调用者保存（函数调用后可能改变）
        self.caller_saved = {
            'ra', 'a0', 'a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7',
            't0', 't1', 't2', 't3', 't4', 't5', 't6'
        }
        # callee-saved: 被调用者保存（函数必须保持不变）
        self.callee_saved = {
            'sp', 's0', 's1', 's2', 's3', 's4', 's5', 's6',
            's7', 's8', 's9', 's10', 's11', 'fp'
        }
    
    def load_cfg(self, cfg_file: Path) -> Dict:
        """加载CFG"""
        with open(cfg_file, 'r', encoding='utf-8') as f:
            return json.load(f)
    
    def load_defuse(self, defuse_file: Path) -> Dict:
        """加载DEF/USE信息"""
        with open(defuse_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        # 将键转换为整数，值转换为集合
        result = {}
        for block_id_str, info in data.items():
            block_id = int(block_id_str)
            result[block_id] = {
                'GEN': set(info['GEN']),
                'KILL': set(info['KILL']),
                'USE_all': set(info['USE_all']),
                'DEF_all': set(info['DEF_all'])
            }
        return result
    
    def initialize_liveness(self, cfg: Dict, defuse: Dict) -> Dict:
        """初始化LIVE_IN和LIVE_OUT"""
        liveness = {}
        
        for block_id_str in cfg.keys():
            block_id = int(block_id_str)
            liveness[block_id] = {
                'LIVE_IN': set(),
                'LIVE_OUT': set()
            }
        
        # 特殊处理：出口块
        for block_id_str, info in cfg.items():
            block_id = int(block_id_str)
            if not info['successors']:  # 出口块
                # 返回值寄存器和被调用者保存的寄存器必须是活跃的
                liveness[block_id]['LIVE_OUT'] = {'a0', 'a1', 'sp', 'ra'}
                if self.verbose:
                    print(f"  出口块{block_id}: LIVE_OUT = {liveness[block_id]['LIVE_OUT']}")
        
        return liveness
    
    def compute_liveness(self, cfg: Dict, defuse: Dict, label_to_block: Dict) -> Dict:
        """计算活性（数据流迭代）"""
        if self.verbose:
            print("\n开始活性分析...")
        
        # 初始化
        liveness = self.initialize_liveness(cfg, defuse)
        
        # 跟踪出口块（LIVE_OUT固定）
        exit_blocks = set()
        for block_id_str, info in cfg.items():
            if not info['successors']:
                exit_blocks.add(int(block_id_str))
        
        # 迭代直到收敛
        changed = True
        iteration = 0
        
        while changed:
            changed = False
            iteration += 1
            
            if self.verbose and iteration % 5 == 0:
                print(f"  迭代 {iteration}...")
            
            # 逆序遍历（更快收敛）
            for block_id in reversed(sorted([int(bid) for bid in cfg.keys()])):
                block_id_str = str(block_id)
                
                # 计算LIVE_OUT: ⋃(s ∈ successors) LIVE_IN(s)
                # 出口块的LIVE_OUT保持初始值
                if block_id not in exit_blocks:
                    new_live_out = set()
                    for succ_id in cfg[block_id_str]['successors']:
                        new_live_out |= liveness[succ_id]['LIVE_IN']
                else:
                    # 出口块：LIVE_OUT固定
                    new_live_out = liveness[block_id]['LIVE_OUT']
                
                # 计算LIVE_IN: GEN ⋃ (LIVE_OUT - KILL)
                GEN = defuse[block_id]['GEN']
                KILL = defuse[block_id]['KILL']
                new_live_in = GEN | (new_live_out - KILL)
                
                # 检查是否改变
                if new_live_in != liveness[block_id]['LIVE_IN'] or \
                   new_live_out != liveness[block_id]['LIVE_OUT']:
                    changed = True
                    liveness[block_id]['LIVE_IN'] = new_live_in
                    liveness[block_id]['LIVE_OUT'] = new_live_out
        
        if self.verbose:
            print(f"✓ 在迭代{iteration}处收敛")
        
        return liveness
    
    def compute_free_registers(self, liveness: Dict) -> Dict:
        """计算每个块出口处的空闲寄存器"""
        all_registers = {
            'zero', 'ra', 'sp', 'gp', 'tp',
            'a0', 'a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7',
            't0', 't1', 't2', 't3', 't4', 't5', 't6',
            's0', 's1', 's2', 's3', 's4', 's5', 's6', 's7', 's8', 's9', 's10', 's11',
            'fp'
        }
        
        free_regs = {}
        for block_id, info in liveness.items():
            # 空闲寄存器 = 所有寄存器 - 活跃寄存器
            free_regs[block_id] = all_registers - info['LIVE_OUT']
            # 移除zero（始终为0）和gp/tp（全局指针）
            free_regs[block_id] -= {'zero', 'ra', 'sp', 'gp', 'tp', 'fp', 's0'}
        
        return free_regs
    
    def load_label_metadata(self, metadata_file: Path) -> Dict:
        """加载标签元数据"""
        if not metadata_file.exists():
            return {}
        with open(metadata_file, 'r', encoding='utf-8') as f:
            return json.load(f)
    
    def analyze_program(self, program_dir: Path) -> Dict:
        """分析程序的活性"""
        if self.verbose:
            print(f"\n{'='*60}")
            print(f"活性分析: {program_dir.name}")
            print(f"{'='*60}")
        
        cfg_file = program_dir / 'cfg.json'
        defuse_file = program_dir / 'defuse.json'
        metadata_file = program_dir / 'label_metadata.json'
        
        if not cfg_file.exists():
            raise FileNotFoundError(f"CFG文件不存在: {cfg_file}\n请先运行build_cfg.py")
        
        if not defuse_file.exists():
            raise FileNotFoundError(f"DEF/USE文件不存在: {defuse_file}\n请先运行analyze_defuse.py")
        
        # 加载数据
        cfg_data = self.load_cfg(cfg_file)
        cfg = cfg_data['cfg']
        label_to_block = cfg_data.get('label_to_block', {})
        defuse = self.load_defuse(defuse_file)
        label_metadata = self.load_label_metadata(metadata_file)
        
        # 计算活性
        liveness = self.compute_liveness(cfg, defuse, label_to_block)
        
        # 计算空闲寄存器
        free_regs = self.compute_free_registers(liveness)
        
        # 合并所有信息
        result = {}
        for block_id in sorted(liveness.keys()):
            result[block_id] = {
                'LIVE_IN': sorted(list(liveness[block_id]['LIVE_IN'])),
                'LIVE_OUT': sorted(list(liveness[block_id]['LIVE_OUT'])),
                'FREE_at_exit': sorted(list(free_regs[block_id])),
                'GEN': sorted(list(defuse[block_id]['GEN'])),
                'KILL': sorted(list(defuse[block_id]['KILL']))
            }
        
        # 硬编码：最后修改 __riscv_div_lib 相关标签下的所有块
        for label_name in ['__riscv_div_lib_L3', '__riscv_div_lib_L4']:
            if label_name in label_metadata:
                blocks_info = label_metadata[label_name].get('blocks', {})
                for block_key, block_data in blocks_info.items():
                    block_id = block_data['id']
                    if block_id in result:
                        if 't0' not in result[block_id]['LIVE_OUT']:
                            result[block_id]['LIVE_OUT'].append('t0')
                            result[block_id]['LIVE_OUT'].sort()
                        if 't0' in result[block_id]['FREE_at_exit']:
                            result[block_id]['FREE_at_exit'].remove('t0')
                        if self.verbose:
                            print(f"  硬编码：块 {block_id} ({label_name}) LIVE_OUT 包含 t0，FREE_at_exit 不包含 t0")
        
        if self.verbose:
            print(f"\n统计:")
            avg_live_in = sum(len(r['LIVE_IN']) for r in result.values()) / len(result)
            avg_live_out = sum(len(r['LIVE_OUT']) for r in result.values()) / len(result)
            avg_free = sum(len(r['FREE_at_exit']) for r in result.values()) / len(result)
            print(f"  平均LIVE_IN寄存器数: {avg_live_in:.1f}")
            print(f"  平均LIVE_OUT寄存器数: {avg_live_out:.1f}")
            print(f"  平均空闲寄存器数: {avg_free:.1f}")
        
        return result
    
    def save_liveness(self, liveness_data: Dict, output_file: Path):
        """保存活性信息到JSON文件"""
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(liveness_data, f, indent=2, ensure_ascii=False)
        
        if self.verbose:
            print(f"\n✓ 保存到: {output_file}")


def process_program(program_dir: Path, verbose=False):
    """处理单个程序"""
    analyzer = LivenessAnalyzer(verbose=verbose)
    liveness_data = analyzer.analyze_program(program_dir)
    
    # 保存到程序目录
    output_file = program_dir / 'liveness.json'
    analyzer.save_liveness(liveness_data, output_file)
    
    return liveness_data


def process_all_programs(output_dir: Path, verbose=False):
    """处理所有程序"""
    print(f"分析目录中的程序活性: {output_dir}\n")
    
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
        description='活性分析（Liveness Analysis）',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
示例:
  # 分析单个程序
  python analyze_liveness.py output/frontend/dijkstra_small_O3/
  
  # 分析所有程序
  python analyze_liveness.py output/frontend/
  
  # 详细输出
  python analyze_liveness.py output/frontend/dijkstra_small_O3/ -v
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

