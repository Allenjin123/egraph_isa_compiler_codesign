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
    
    def extract_registers_from_line(self, line: str) -> set:
        """从指令行中提取所有寄存器"""
        import re
        # 匹配寄存器：a0-a7, t0-t6, s0-s11, sp, ra, zero 等
        reg_pattern = r'\b([ast]\d+|zero|sp|ra|gp|tp|fp)\b'
        matches = re.findall(reg_pattern, line)
        return set(matches)
    
    def fix_div_lib_registers(self, lines: List[str], div_free_regs: List[str]) -> List[str]:
        """修复 __riscv_div_lib_L3 中使用的寄存器
        
        Args:
            lines: 完整的汇编代码行列表
            div_free_regs: div 可用的 free registers 列表
            
        Returns:
            修复后的代码行列表
        """
        if not div_free_regs:
            return lines
        
        # 1. 找到 __riscv_div_lib_L3 标签的位置
        start_idx = None
        end_idx = None
        
        for i, line in enumerate(lines):
            if '__riscv_div_lib_L3:' in line:
                start_idx = i
            elif start_idx is not None and self.is_label_line(line):
                # 遇到下一个标签，结束
                end_idx = i
                break
        
        if start_idx is None:
            if self.verbose:
                print("  未找到 __riscv_div_lib_L3 标签")
            return lines
        
        if end_idx is None:
            end_idx = len(lines)
        
        if self.verbose:
            print(f"  找到 __riscv_div_lib_L3: 行 {start_idx+1} 到 {end_idx}")
        
        # 2. 提取该段代码中使用的所有寄存器（排除 a0-a3）
        used_regs = set()
        protected_regs = {'a0', 'a1', 'a2', 'a3', 'zero', 'sp', 'ra'}
        
        for i in range(start_idx, end_idx):
            line = lines[i]
            if self.is_instruction_line(line):
                regs = self.extract_registers_from_line(line)
                used_regs.update(regs - protected_regs)
        
        if self.verbose:
            print(f"  使用的寄存器（除 a0-a3）: {sorted(used_regs)}")
        
        # 3. 找出哪些寄存器不在 div_free_regs 中
        div_free_set = set(div_free_regs)
        conflicting_regs = used_regs - div_free_set
        
        if not conflicting_regs:
            if self.verbose:
                print(f"  ✓ 所有寄存器都在 free list 中，无需替换")
            return lines
        
        if self.verbose:
            print(f"  需要替换的寄存器: {sorted(conflicting_regs)}")
        
        # 4. 为每个冲突寄存器分配一个 free 寄存器
        replacement_map = {}
        available_regs = [r for r in div_free_regs if r not in used_regs]
        
        for i, conflict_reg in enumerate(sorted(conflicting_regs)):
            if i < len(available_regs):
                replacement_map[conflict_reg] = available_regs[i]
            else:
                if self.verbose:
                    print(f"  警告: 没有足够的 free 寄存器来替换 {conflict_reg}")
                break
        
        if self.verbose:
            print(f"  替换映射: {replacement_map}")
        
        # 5. 在 __riscv_div_lib_L3 段中执行替换
        result_lines = lines[:start_idx]
        
        for i in range(start_idx, end_idx):
            line = lines[i]
            new_line = line
            
            # 对每个需要替换的寄存器进行替换
            for old_reg, new_reg in replacement_map.items():
                # 使用单词边界确保只替换完整的寄存器名
                import re
                new_line = re.sub(r'\b' + old_reg + r'\b', new_reg, new_line)
            
            result_lines.append(new_line)
        
        result_lines.extend(lines[end_idx:])
        
        if self.verbose:
            print(f"  ✓ 完成寄存器替换")
        
        return result_lines
    
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
            matches = re.findall(r'%pcrel_(?:lo|hi)\((\.Lpcrel_[\w]+)\)', line)
            pcrel_labels.update(matches)
        return pcrel_labels
    
    def insert_pcrel_labels_in_block(self, block_lines: List[str]) -> List[str]:
        """在 block 中正确位置插入 .Lpcrel 标签
        
        找到包含 %pcrel_lo(.Lpcrel_X) 的行，在其前一行（auipc）之前插入标签
        """
        result = []
        i = 0
        
        while i < len(block_lines):
            line = block_lines[i]
            
            # 跳过 block_lines 中已存在的 .Lpcrel 标签行（会从 %pcrel_lo 引用中自动插入）
            stripped = line.strip()
            if stripped.startswith('.Lpcrel_') and stripped.endswith(':'):
                i += 1
                continue
            
            # 检查当前行是否有 %pcrel_lo 引用
            match = re.search(r'%pcrel_lo\((\.Lpcrel_[\w]+)\)', line)
            if match and i > 0:
                pcrel_label = match.group(1)
                # 在前一行（auipc）之前插入标签
                # 先把之前已添加的最后一行（auipc）取出
                if result:
                    auipc_line = result.pop()
                    result.append(f"{pcrel_label}:\n")
                    result.append(auipc_line)
                else:
                    # 如果 result 为空，说明这是第一行，直接插入标签
                    result.append(f"{pcrel_label}:\n")
            
            result.append(line)
            i += 1
        
        return result
    
    def reconstruct_asm(self, clean_file: Path, output_dir: Path, benchmark_dir: Path):
        """重建汇编文件，将重写后的基本块替换回去
        
        Args:
            clean_file: 原始的 *_clean.s 文件路径
            output_dir: 输出目录 (output/frontend/<program_name>/)
            benchmark_dir: benchmark 目录，用于输出 _rewrite.s 文件
        """
        if self.verbose:
            print(f"\n处理: {clean_file}")
        
        # 读取 label_metadata（包含行数信息）
        label_metadata_file = output_dir / "label_metadata.json"
        if not label_metadata_file.exists():
            print(f"  错误: 找不到 {label_metadata_file}")
            return False
        
        with open(label_metadata_file, 'r', encoding='utf-8') as f:
            label_metadata = json.load(f)
        
        # 读取 label_to_block 映射（用于快速查找）
        label_to_block_file = output_dir / "label_to_block.json"
        if not label_to_block_file.exists():
            print(f"  错误: 找不到 {label_to_block_file}")
            return False
        
        with open(label_to_block_file, 'r', encoding='utf-8') as f:
            label_to_block = json.load(f)
        
        # 读取重写后的基本块
        rewrite_blocks_dir = output_dir / "basic_blocks_rewrite" / "variant_0"
        if not rewrite_blocks_dir.exists():
            print(f"  警告: 找不到 {rewrite_blocks_dir}，跳过")
            return False
        
        # 读取所有重写后的 block
        rewritten_blocks = {}
        for block_file in sorted(rewrite_blocks_dir.glob("*.txt")):
            # 跳过 div_reg.txt 等非数字命名的文件
            if block_file.stem == "div_reg":
                continue
            try:
                block_id = int(block_file.stem)
            except ValueError:
                # 跳过无法转换为整数的文件
                continue
            with open(block_file, 'r', encoding='utf-8') as f:
                rewritten_blocks[block_id] = f.readlines()
        
        # 读取 div_reg.txt（div 库函数可用的寄存器）
        # div_reg.txt 位于程序级别的输出目录 (output/frontend/<program_name>)
        div_reg_file = output_dir / "div_reg.txt"
        div_free_regs = []
        if div_reg_file.exists():
            with open(div_reg_file, 'r', encoding='utf-8') as f:
                div_free_regs = [line.strip() for line in f if line.strip()]
            if self.verbose:
                print(f"  加载了 div 可用寄存器: {div_free_regs}")

        # 读取 placeholder block（可选）
        placeholder_blocks = None
        placeholder_dirs = [
            output_dir / "basic_blocks_placeholder" / "variant_0",
            output_dir / "basic_blocks_placeholder",
        ]
        for placeholder_dir in placeholder_dirs:
            if placeholder_dir.exists():
                placeholder_blocks = {}
                for block_file in sorted(placeholder_dir.glob("*.txt")):
                    block_id = int(block_file.stem)
                    with open(block_file, 'r', encoding='utf-8') as f:
                        placeholder_blocks[block_id] = f.readlines()
                if placeholder_blocks:
                    break
        
        if self.verbose:
            print(f"  加载了 {len(rewritten_blocks)} 个重写后的基本块")
        
        # 读取原始 _clean.s 文件
        with open(clean_file, 'r', encoding='utf-8', errors='ignore') as f:
            lines = f.readlines()
        
        def build_output_lines(blocks_map: Dict[int, List[str]]) -> List[str]:
            output_lines = []
            i = 0
            while i < len(lines):
                line = lines[i]
                if self.is_label_line(line):
                    label = self.extract_label_from_line(line)
                    if label and label.startswith('.Lpcrel'):
                        i += 1
                        continue
                    if label and label in label_metadata:
                        metadata = label_metadata[label]
                        label_line_count = metadata['label_line_count']
                        
                        # 跳过 label_line_count 为 0 的标签（通常是数据段标签，不应该有代码）
                        if label_line_count == 0:
                            output_lines.append(line)
                            i += 1
                            continue
                        
                        output_lines.append(line)
                        i += 1
                        deleted = 0
                        current_block_lines = []
                        while i < len(lines) and deleted < label_line_count:
                            next_line = lines[i]
                            if (self.is_instruction_line(next_line) or
                                (next_line.strip().startswith('.Lpcrel_') and next_line.strip().endswith(':'))):
                                deleted += 1
                            current_block_lines.append(next_line)
                            i += 1
                        blocks_info = metadata['blocks']
                        # 按照 block_id 数字大小排序，而不是按 key 字符串排序
                        sorted_block_keys = sorted(blocks_info.keys(), key=lambda k: blocks_info[k]['id'])
                        # 检查是否所有 block 都不在 blocks_map 中（全部 fallback）
                        all_missing = all(blocks_info[k]['id'] not in blocks_map for k in sorted_block_keys)
                        if all_missing:
                            # 没有任何 rewrite block，原样输出原始行
                            output_lines.extend(current_block_lines)
                        else:
                            for block_key in sorted_block_keys:
                                block_id = blocks_info[block_key]['id']
                                if block_id in blocks_map:
                                    block_lines = blocks_map[block_id]
                                    processed_lines = self.insert_pcrel_labels_in_block(block_lines)
                                    for block_line in processed_lines:
                                        stripped = block_line.strip()
                                        if stripped.endswith(':') and not block_line.startswith(('\t', ' ')):
                                            output_lines.append(block_line)
                                        elif block_line.startswith(('\t', ' ')) or not stripped:
                                            output_lines.append(block_line)
                                        else:
                                            output_lines.append('\t' + block_line)
                        continue
                    else:
                        output_lines.append(line)
                        i += 1
                        continue
                else:
                    output_lines.append(line)
                    i += 1
            return output_lines

        # 重建输出
        output_lines = build_output_lines(rewritten_blocks)
        
        # 修复 __riscv_div_lib_L3 中的寄存器
        # if div_free_regs:
        #     if self.verbose:
        #         print(f"\n  修复 div 库函数寄存器...")
        #     output_lines = self.fix_div_lib_registers(output_lines, div_free_regs)

        # 写入 _rewrite.s 文件
        output_file = clean_file.parent / clean_file.name.replace('_clean.s', '_rewrite.s')
        with open(output_file, 'w', encoding='utf-8') as f:
            f.writelines(output_lines)
        print(f"  ✓ 生成重写文件: {output_file}")

        # 如果存在 placeholder，额外输出
        if placeholder_blocks is not None:
            placeholder_output_lines = build_output_lines(placeholder_blocks)
            
            # 修复 placeholder 中的 div 库函数寄存器
            if div_free_regs:
                placeholder_output_lines = self.fix_div_lib_registers(placeholder_output_lines, div_free_regs)
            
            placeholder_file = clean_file.parent / clean_file.name.replace('_clean.s', '_placeholder.s')
            with open(placeholder_file, 'w', encoding='utf-8') as f:
                f.writelines(placeholder_output_lines)
            print(f"  ✓ 生成占位符文件: {placeholder_file}")

        return True


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
