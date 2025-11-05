#!/usr/bin/env python3
"""
将 basic_blocks_rewrite 中重写后的基本块替换回 .s 文件
根据 label_to_block.json 的映射，把对应的 block 替换到原汇编文件中
"""

import os
import re
import sys
import json
from pathlib import Path
from typing import List, Dict, Optional

# Add current directory to path for imports
CURRENT_DIR = Path(__file__).resolve().parent
if str(CURRENT_DIR) not in sys.path:
    sys.path.insert(0, str(CURRENT_DIR))


class AsmReconstructor:
    """重建带有重写后基本块的汇编文件"""
    
    def __init__(self, verbose=False):
        self.verbose = verbose
    
    def is_label_line(self, line: str) -> bool:
        """检查是否是标签行（从第0列开始且以':'结尾）"""
        if not line or line.startswith('#'):
            return False
        # Label必须从第0列开始（无前导空白）且以':'结尾
        if line[0] not in (' ', '\t') and line.rstrip().endswith(':'):
            return True
        return False
    
    def is_instruction_line(self, line: str) -> bool:
        """检查是否是指令行（有缩进，不是指令、标签或注释）"""
        stripped = line.strip()
        if not stripped or stripped.startswith('#'):
            return False
        
        # 应该以空白开头（缩进的指令）
        if not line.startswith(('\t', ' ')):
            return False
        
        # 排除指令（以'.'开头）
        if stripped.startswith('.'):
            return False
        
        # 排除标签（以':'结尾）
        if stripped.endswith(':'):
            return False
        
        return True
    
    def extract_label_from_line(self, line: str) -> Optional[str]:
        """从标签行提取标签名"""
        stripped = line.strip()
        if stripped.endswith(':'):
            return stripped[:-1].strip()
        return None
    
    def extract_pcrel_labels(self, lines: List[str]) -> set:
        """提取指令操作数中引用的所有 .Lpcrel 标签"""
        pcrel_labels = set()
        for line in lines:
            # 查找 %pcrel_lo(.Lpcrel_X) 或 %pcrel_hi(.Lpcrel_X)
            matches = re.findall(r'%pcrel_(?:lo|hi)\((\.Lpcrel_\d+)\)', line)
            pcrel_labels.update(matches)
        return pcrel_labels
    
    def reconstruct_asm(self, clean_file: Path, output_dir: Path, benchmark_dir: Path):
        """重建汇编文件，将重写后的基本块替换回去
        
        Args:
            clean_file: 原始的 *_clean.s 文件路径
            output_dir: 输出目录 (output/frontend/<program_name>/)
            benchmark_dir: benchmark 目录，用于输出 _rewrite.s 文件
        """
        if self.verbose:
            print(f"\n处理: {clean_file}")
        
        # 读取 label_to_block 映射
        label_to_block_file = output_dir / "label_to_block.json"
        if not label_to_block_file.exists():
            print(f"  错误: 找不到 {label_to_block_file}")
            return False
        
        with open(label_to_block_file, 'r', encoding='utf-8') as f:
            label_to_block = json.load(f)
        
        # 读取重写后的基本块
        rewrite_blocks_dir = output_dir / "basic_blocks_rewrite"
        if not rewrite_blocks_dir.exists():
            print(f"  警告: 找不到 {rewrite_blocks_dir}，跳过")
            return False
        
        # 读取所有重写后的 block
        rewritten_blocks = {}
        for block_file in sorted(rewrite_blocks_dir.glob("*.txt")):
            block_id = int(block_file.stem)
            with open(block_file, 'r', encoding='utf-8') as f:
                rewritten_blocks[block_id] = f.readlines()
        
        if self.verbose:
            print(f"  加载了 {len(rewritten_blocks)} 个重写后的基本块")
        
        # 读取原始 _clean.s 文件
        with open(clean_file, 'r', encoding='utf-8', errors='ignore') as f:
            lines = f.readlines()
        
        # 重建输出
        output_lines = []
        i = 0
        current_block_id = None
        pending_labels = []  # 等待写入的标签
        in_block = False
        
        while i < len(lines):
            line = lines[i]
            
            # 如果是标签行
            if self.is_label_line(line):
                label = self.extract_label_from_line(line)
                
                # 检查是否是 .Lpcrel 标签（这种标签不算真正的块起始标签）
                if label and label.startswith('.Lpcrel'):
                    # 这种标签会在后面处理，直接跳过原文件中的
                    i += 1
                    continue
                
                # 其他标签：保留标签，准备替换后面的 block
                if label and label in label_to_block:
                    # 如果之前有未完成的 block，先输出
                    if in_block:
                        in_block = False
                    
                    # 保留标签行
                    output_lines.append(line)
                    
                    # 记录当前 block ID
                    current_block_id = label_to_block[label]
                    in_block = True
                    
                    # 跳过原文件中该 block 的所有指令，直到下一个标签或非指令行
                    i += 1
                    while i < len(lines):
                        next_line = lines[i]
                        if self.is_instruction_line(next_line):
                            i += 1
                        elif self.is_label_line(next_line):
                            # 遇到下一个标签，不增加 i，让下一轮循环处理
                            break
                        else:
                            # 非指令行（空行、注释、指令等），保留
                            break
                    
                    # 插入重写后的 block
                    if current_block_id in rewritten_blocks:
                        block_lines = rewritten_blocks[current_block_id]
                        
                        # 处理 .Lpcrel 标签插入
                        # 注释掉这里的插入，改为在 postprocess_pcrel_labels 中统一处理
                        # processed_lines = self.insert_pcrel_labels(block_lines)
                        processed_lines = block_lines
                        
                        # 为指令添加缩进（制表符）
                        indented_lines = []
                        for line in processed_lines:
                            # 如果是标签行（以':'结尾且无前导空白），不添加缩进
                            stripped = line.strip()
                            if stripped.endswith(':') and not line.startswith(('\t', ' ')):
                                indented_lines.append(line)
                            else:
                                # 指令行添加制表符缩进
                                if not line.startswith(('\t', ' ')) and stripped:
                                    indented_lines.append('\t' + line)
                                else:
                                    indented_lines.append(line)
                        
                        output_lines.extend(indented_lines)
                    
                    in_block = False
                    continue
                else:
                    # 不在 label_to_block 中的标签，直接保留
                    output_lines.append(line)
                    i += 1
                    continue
            
            # 如果是指令行且在 block 中，说明我们漏掉了，理论上不应该到这里
            elif self.is_instruction_line(line) and in_block:
                # 已经在上面处理了，跳过
                i += 1
                continue
            
            # 其他行（指令、注释、空行等）直接保留
            else:
                output_lines.append(line)
                i += 1
        
        # 后处理：为所有 %pcrel_lo 引用插入标签
        output_lines = self.postprocess_pcrel_labels(output_lines)
        
        # 写入 _rewrite.s 文件
        output_file = clean_file.parent / clean_file.name.replace('_clean.s', '_rewrite.s')
        with open(output_file, 'w', encoding='utf-8') as f:
            f.writelines(output_lines)
        
        print(f"  ✓ 生成重写文件: {output_file}")
        return True
    
    def postprocess_pcrel_labels(self, lines: List[str]) -> List[str]:
        """后处理：为整个文件中所有 %pcrel_lo 引用插入标签
        
        扫描所有指令，找到包含 %pcrel_lo(.Lpcrel_X) 的行，
        在其前一行（通常是 auipc 指令）之前插入 .Lpcrel_X: 标签
        """
        # 第一遍：找出所有需要插入标签的位置和已存在的标签
        pcrel_positions = {}  # {行号: 标签名}
        existing_labels = set()  # 已存在的标签
        labels_to_insert = set()  # 待插入的标签（用于去重）
        
        for i, line in enumerate(lines):
            # 记录已存在的标签
            if self.is_label_line(line):
                label = self.extract_label_from_line(line)
                if label:
                    existing_labels.add(label)
            
            # 检查是否有 pcrel_lo 引用
            if self.is_instruction_line(line):
                match = re.search(r'%pcrel_lo\((\.Lpcrel_\d+)\)', line)
                if match:
                    pcrel_label = match.group(1)
                    # 如果标签已存在或已经准备插入，跳过
                    if pcrel_label in existing_labels or pcrel_label in labels_to_insert:
                        continue
                    # 计算插入位置：当前行的前一行（auipc 之前）
                    insert_pos = max(0, i - 1)
                    pcrel_positions[insert_pos] = pcrel_label
                    labels_to_insert.add(pcrel_label)  # 标记为待插入
        
        # 第二遍：构建结果，在合适的位置插入标签
        result = []
        for i, line in enumerate(lines):
            # 如果这个位置需要插入标签，先插入
            if i in pcrel_positions:
                result.append(f"{pcrel_positions[i]}:\n")
            
            # 添加当前行
            result.append(line)
        
        return result
    
    def insert_pcrel_labels(self, block_lines: List[str]) -> List[str]:
        """在 block 中插入 .Lpcrel 标签
        
        如果指令操作数中有 %pcrel_lo(.Lpcrel_X)，在该指令前两行（即 auipc 之前）插入 .Lpcrel_X:
        """
        # 第一遍：找出所有需要插入标签的位置
        pcrel_positions = {}  # {行号: 标签名}
        
        for i, line in enumerate(block_lines):
            # 检查是否有 pcrel_lo 引用
            match = re.search(r'%pcrel_lo\((\.Lpcrel_\d+)\)', line)
            if match:
                pcrel_label = match.group(1)
                # 计算插入位置：当前行的前两行（即 auipc 指令之前）
                # 如果前面不够两行，就插在最前面
                insert_pos = max(0, i - 1)
                pcrel_positions[insert_pos] = pcrel_label
        
        # 第二遍：构建结果，在合适的位置插入标签
        result = []
        for i, line in enumerate(block_lines):
            # 如果这个位置需要插入标签，先插入
            if i in pcrel_positions:
                result.append(f"{pcrel_positions[i]}:\n")
            
            # 添加当前指令
            result.append(line)
        
        return result


def reconstruct_single_file(clean_file: Path, output_base: Path, benchmark_dir: Path, verbose=False):
    """重建单个文件
    
    Args:
        clean_file: *_clean.s 文件路径
        output_base: 输出基础目录 (output/frontend/)
        benchmark_dir: benchmark 目录
        verbose: 详细输出
    """
    # 获取程序名（去掉 _clean.s 后缀）
    program_name = clean_file.stem.replace('_clean', '')
    
    # 输出目录: output/frontend/<program_name>/
    output_dir = output_base / program_name
    
    if not output_dir.exists():
        print(f"错误: 找不到输出目录 {output_dir}")
        return False
    
    reconstructor = AsmReconstructor(verbose=verbose)
    return reconstructor.reconstruct_asm(clean_file, output_dir, benchmark_dir)


def reconstruct_all_files(output_base: Path, verbose=False):
    """重建所有已分析的文件
    
    Args:
        output_base: 输出基础目录 (output/frontend/)
        verbose: 详细输出
    """
    # 获取 benchmark 目录
    script_dir = Path(__file__).resolve().parent
    benchmark_dir = script_dir.parent / "benchmark"
    
    if not benchmark_dir.exists():
        print(f"错误: 找不到 benchmark 目录 {benchmark_dir}")
        return 0
    
    # 查找所有 *_clean.s 文件
    clean_files = list(benchmark_dir.rglob("*_clean.s"))
    
    if not clean_files:
        print(f"在 {benchmark_dir} 中找不到 *_clean.s 文件")
        return 0
    
    print(f"找到 {len(clean_files)} 个 *_clean.s 文件")
    print("=" * 80)
    
    success_count = 0
    
    for clean_file in sorted(clean_files):
        # 获取相对路径以便显示
        rel_path = clean_file.relative_to(benchmark_dir)
        print(f"\n处理: {rel_path}")
        
        try:
            if reconstruct_single_file(clean_file, output_base, benchmark_dir, verbose):
                success_count += 1
        except Exception as e:
            print(f"  ✗ 处理 {clean_file.name} 时出错: {e}")
            if verbose:
                import traceback
                traceback.print_exc()
            continue
    
    print("\n" + "=" * 80)
    print(f"处理完成!")
    print(f"  成功处理: {success_count}/{len(clean_files)} 个文件")
    
    return success_count


def main():
    import argparse
    
    parser = argparse.ArgumentParser(
        description='将重写后的基本块重建回 .s 汇编文件',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
示例:
  # 重建所有文件（默认模式）
  # 从 output/frontend/<program_name>/basic_blocks_rewrite/ 读取重写后的块
  # 输出到 benchmark/<category>/<program>/<program>_rewrite.s
  python reconstruct_rewritten_asm.py
  
  # 重建单个文件
  python reconstruct_rewritten_asm.py benchmark/network/dijkstra/dijkstra_small_O3_clean.s
  
  # 指定自定义输出目录
  python reconstruct_rewritten_asm.py -o custom_output
  
  # 详细输出
  python reconstruct_rewritten_asm.py -v
        '''
    )
    
    parser.add_argument('clean_file', nargs='?', default=None,
                       help='*_clean.s 文件路径（可选，如果不提供则处理所有文件）')
    parser.add_argument('-o', '--output', default='output/frontend',
                       help='输出目录（默认: output/frontend）')
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='详细输出')
    
    args = parser.parse_args()
    
    output_base = Path(args.output)
    
    try:
        # 模式1: 处理所有文件
        if args.clean_file is None:
            print("模式: 重建所有 *_clean.s 文件")
            print(f"输出目录: {output_base}")
            print("")
            success_count = reconstruct_all_files(output_base, args.verbose)
            if success_count > 0:
                print(f"\n✓ 重建完成: {success_count} 个文件")
            return 0
        
        # 模式2: 处理单个指定文件
        else:
            clean_file = Path(args.clean_file)
            if not clean_file.exists():
                print(f"错误: 找不到文件: {clean_file}")
                return 1
            
            print(f"模式: 重建单个文件: {clean_file}")
            print(f"输出目录: {output_base}")
            print("")
            
            script_dir = Path(__file__).resolve().parent
            benchmark_dir = script_dir.parent / "benchmark"
            
            if reconstruct_single_file(clean_file, output_base, benchmark_dir, args.verbose):
                print(f"\n✓ 重建完成")
            return 0
            
    except Exception as e:
        print(f"错误: {e}")
        import traceback
        traceback.print_exc()
        return 1


if __name__ == "__main__":
    sys.exit(main())

