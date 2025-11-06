#!/usr/bin/env python3
"""
逐步回退测试工具
根据 diff 文件，逐个将 rewrite 中的修改替换回 clean 版本，每次替换后运行验证
用于定位是哪个修改块导致了验证失败
"""

import os
import sys
import subprocess
import shutil
import re
from pathlib import Path
from typing import List, Tuple, Dict
from dataclasses import dataclass

@dataclass
class DiffHunk:
    """表示一个 diff 修改块"""
    clean_start: int  # clean 文件中整个 hunk 的起始行号
    clean_count: int  # clean 文件中整个 hunk 的行数
    rewrite_start: int  # rewrite 文件中整个 hunk 的起始行号
    rewrite_count: int  # rewrite 文件中整个 hunk 的行数
    clean_lines: List[str]  # "-" 开头的行（clean 版本）
    rewrite_lines: List[str]  # "+" 开头的行（rewrite 版本）
    context_before: List[str]  # 修改之前的上下文
    context_after: List[str]  # 修改之后的上下文
    hunk_index: int  # 块的索引号
    actual_rewrite_line: int = 0  # rewrite 文件中实际修改开始的行号

def parse_diff_file(diff_path: str) -> List[DiffHunk]:
    """解析 unified diff 文件，提取所有修改块"""
    with open(diff_path, 'r') as f:
        lines = f.readlines()
    
    hunks = []
    i = 0
    hunk_index = 0
    
    while i < len(lines):
        line = lines[i]
        
        # 找到 hunk 头部: @@ -clean_start,clean_count +rewrite_start,rewrite_count @@
        if line.startswith('@@'):
            match = re.match(r'@@ -(\d+),(\d+) \+(\d+),(\d+) @@', line)
            if match:
                clean_start = int(match.group(1))
                clean_count = int(match.group(2))
                rewrite_start = int(match.group(3))
                rewrite_count = int(match.group(4))
                
                i += 1
                clean_lines = []
                rewrite_lines = []
                context_before = []
                context_after = []
                in_change = False
                context_line_count = 0  # 修改前的上下文行数
                
                # 读取 hunk 内容
                while i < len(lines) and not lines[i].startswith('@@'):
                    curr = lines[i]
                    
                    if curr.startswith('-') and not curr.startswith('---'):
                        clean_lines.append(curr[1:])  # 去掉 '-' 前缀
                        in_change = True
                    elif curr.startswith('+') and not curr.startswith('+++'):
                        rewrite_lines.append(curr[1:])  # 去掉 '+' 前缀
                        in_change = True
                    elif curr.startswith(' '):
                        # 上下文行
                        if not in_change:
                            context_before.append(curr[1:])
                            context_line_count += 1
                        else:
                            # 修改之后的上下文
                            context_after.append(curr[1:])
                    
                    i += 1
                
                # 只保留有实际修改的 hunk（即有 + 或 - 行）
                if clean_lines or rewrite_lines:
                    # 计算实际修改在 rewrite 文件中的起始行号
                    # = hunk起始行号 + 修改前的上下文行数
                    actual_rewrite_line = rewrite_start + context_line_count
                    
                    hunk = DiffHunk(
                        clean_start=clean_start,
                        clean_count=clean_count,
                        rewrite_start=rewrite_start,
                        rewrite_count=rewrite_count,
                        clean_lines=clean_lines,
                        rewrite_lines=rewrite_lines,
                        context_before=context_before,
                        context_after=context_after,
                        hunk_index=hunk_index,
                        actual_rewrite_line=actual_rewrite_line
                    )
                    hunks.append(hunk)
                    hunk_index += 1
                continue
        
        i += 1
    
    return hunks

def apply_hunk_reverse(file_path: str, hunk: DiffHunk, line_offset: int = 0) -> int:
    """
    将一个修改块从 rewrite 版本回退到 clean 版本
    
    Args:
        file_path: 文件路径
        hunk: 要回退的 hunk
        line_offset: 累积的行号偏移（由于之前的修改导致）
    
    Returns:
        本次修改导致的行号变化量（可能为正或负）
    """
    with open(file_path, 'r') as f:
        lines = f.readlines()
    
    # 在 rewrite 文件中找到要替换的位置（考虑累积偏移）
    # actual_rewrite_line 是从1开始的行号，指向实际修改开始的位置
    start_idx = hunk.actual_rewrite_line - 1 + line_offset
    
    # 需要替换的行数
    replace_count = len(hunk.rewrite_lines)
    insert_count = len(hunk.clean_lines)
    
    # 验证我们要替换的内容是否匹配（去除首尾空白进行比较）
    if replace_count > 0 and start_idx >= 0 and start_idx + replace_count <= len(lines):
        actual_lines = lines[start_idx:start_idx + replace_count]
        mismatch = False
        for i, (actual, expected) in enumerate(zip(actual_lines, hunk.rewrite_lines)):
            if actual.strip() != expected.strip():
                if not mismatch:
                    print(f"  警告: 行 {start_idx + i + 1} 内容不匹配")
                    print(f"    期望: {expected.strip()[:60]}...")
                    print(f"    实际: {actual.strip()[:60]}...")
                    mismatch = True
    
    # 执行替换：用 clean_lines 替换 rewrite_lines
    new_lines = (
        lines[:start_idx] + 
        hunk.clean_lines + 
        lines[start_idx + replace_count:]
    )
    
    # 写回文件
    with open(file_path, 'w') as f:
        f.writelines(new_lines)
    
    # 返回行号变化量
    return insert_count - replace_count

def find_file_in_dir(directory: Path, pattern: str) -> Path:
    """在目录中查找匹配的文件"""
    matches = list(directory.rglob(pattern))
    
    if len(matches) == 0:
        raise FileNotFoundError(f"未找到文件: {pattern}")
    elif len(matches) > 1:
        raise ValueError(f"找到多个匹配文件:\n" + "\n".join(f"  - {m}" for m in matches))
    
    return matches[0]

def run_verify(program_name: str, script_dir: str) -> Tuple[bool, str]:
    """运行 verify_rewrite.sh (不生成diff)"""
    verify_script = os.path.join(script_dir, "verify_rewrite.sh")
    
    try:
        result = subprocess.run(
            ["bash", verify_script, program_name],
            capture_output=True,
            text=True,
            timeout=600
        )
        
        # 检查输出中是否包含成功标志
        success = result.returncode == 0
        output = result.stdout + result.stderr
        
        return success, output
    except subprocess.TimeoutExpired:
        return False, "验证超时"
    except Exception as e:
        return False, f"运行验证脚本出错: {str(e)}"

def main():
    if len(sys.argv) != 2:
        print("用法: python3 bisect_rewrite.py <program_name>")
        print("示例: python3 bisect_rewrite.py dijkstra_small_O3")
        print()
        print("说明:")
        print("  该脚本会逐步将 rewrite 文件的修改回退到 clean 版本")
        print("  每次回退一个修改块后，运行验证测试")
        print("  用于定位是哪个修改导致了验证失败")
        sys.exit(1)
    
    program_name = sys.argv[1]
    
    # 获取路径
    script_dir = Path(__file__).parent
    project_root = script_dir.parent
    benchmark_dir = project_root / "benchmark"
    diff_dir = project_root / "output" / "diff"
    
    # 查找 diff 文件
    diff_file = diff_dir / f"{program_name}.diff"
    if not diff_file.exists():
        print(f"错误: diff 文件不存在: {diff_file}")
        print(f"请先运行: ./verify_rewrite.sh {program_name} diff")
        sys.exit(1)
    
    # 在 benchmark 目录中查找 rewrite 文件
    try:
        rewrite_file = find_file_in_dir(benchmark_dir, f"{program_name}_rewrite.s")
        print(f"找到 rewrite 文件: {rewrite_file}")
    except FileNotFoundError:
        print(f"错误: 在 {benchmark_dir} 中未找到 {program_name}_rewrite.s")
        sys.exit(1)
    except ValueError as e:
        print(f"错误: {e}")
        sys.exit(1)
    
    # 备份文件放在 rewrite 文件的同一目录
    backup_file = rewrite_file.parent / f"{rewrite_file.name}.backup"
    
    print()
    print("=" * 70)
    print(f"逐步回退测试: {program_name}")
    print("=" * 70)
    print(f"Diff 文件: {diff_file}")
    print(f"Rewrite 文件: {rewrite_file}")
    print(f"备份位置: {backup_file}")
    print()
    
    # 1. 备份 rewrite 文件
    print(f"[1] 备份 rewrite 文件...")
    shutil.copy2(rewrite_file, backup_file)
    print(f"    ✓ 备份保存到: {backup_file}")
    print()
    
    # 2. 解析 diff 文件
    print(f"[2] 解析 diff 文件...")
    hunks = parse_diff_file(str(diff_file))
    print(f"    ✓ 找到 {len(hunks)} 个修改块")
    print()
    
    if not hunks:
        print("没有找到修改块，退出")
        sys.exit(0)
    
    # 3. 测试原始 rewrite 版本
    print(f"[3] 测试原始 rewrite 版本...")
    success, output = run_verify(program_name, str(script_dir))
    if success:
        print("    ✓ 原始版本验证通过")
        print("    没有需要修复的问题")
        sys.exit(0)
    else:
        print("    ✗ 原始版本验证失败（符合预期）")
    print()
    
    # 4. 逐个回退修改块并测试
    print(f"[4] 开始逐步回退测试...")
    print("=" * 70)
    print()
    
    results = []
    cumulative_offset = 0  # 累积的行号偏移
    
    for i, hunk in enumerate(hunks):
        print(f"[回退 {i+1}/{len(hunks)}] Hunk #{hunk.hunk_index}")
        print(f"  Hunk 位置: 第 {hunk.rewrite_start} 行")
        print(f"  实际修改位置: 第 {hunk.actual_rewrite_line} 行 (当前偏移: {cumulative_offset})")
        print(f"  删除: {len(hunk.rewrite_lines)} 行 (rewrite 版本)")
        print(f"  插入: {len(hunk.clean_lines)} 行 (clean 版本)")
        
        # 显示修改内容预览
        if hunk.rewrite_lines:
            preview = hunk.rewrite_lines[0].strip()[:60]
            print(f"  移除内容预览: {preview}...")
        if hunk.clean_lines:
            preview = hunk.clean_lines[0].strip()[:60]
            print(f"  恢复内容预览: {preview}...")
        
        # 应用回退（考虑累积偏移）
        try:
            offset_delta = apply_hunk_reverse(str(rewrite_file), hunk, cumulative_offset)
            cumulative_offset += offset_delta
            print(f"  ✓ 已回退此修改块 (行号变化: {offset_delta:+d})")
        except Exception as e:
            print(f"  ✗ 回退失败: {e}")
            results.append((i, hunk, False, f"回退失败: {e}"))
            continue
        
        # 运行验证
        print(f"  运行验证测试...")
        success, verify_output = run_verify(program_name, str(script_dir))
        
        if success:
            print(f"  ✓ 验证通过")
            results.append((i, hunk, True, "通过"))
        else:
            print(f"  ✗ 验证失败")
            results.append((i, hunk, False, "失败"))
        
        print()
    
    # 5. 汇总结果
    print("=" * 70)
    print("测试结果汇总")
    print("=" * 70)
    print()
    
    passed = [r for r in results if r[2]]
    failed = [r for r in results if not r[2]]
    
    print(f"总共测试: {len(results)} 个修改块")
    print(f"通过: {len(passed)} 个")
    print(f"失败: {len(failed)} 个")
    print()
    
    if passed:
        print("✓ 回退后验证通过的修改块:")
        for i, hunk, success, msg in passed:
            print(f"  - Hunk #{hunk.hunk_index} (第 {hunk.actual_rewrite_line} 行): {msg}")
        print()
    
    if failed:
        print("✗ 回退后仍然失败的修改块:")
        for i, hunk, success, msg in failed:
            print(f"  - Hunk #{hunk.hunk_index} (第 {hunk.actual_rewrite_line} 行): {msg}")
        print()
    
    # 6. 恢复备份
    print("=" * 70)
    print(f"恢复原始 rewrite 文件...")
    shutil.copy2(backup_file, rewrite_file)
    print(f"✓ 已恢复原始文件")
    print(f"  备份文件保留在: {backup_file}")
    print()
    
    # 给出建议
    if passed:
        print("建议:")
        print(f"  发现 {len(passed)} 个回退后验证通过的修改块")
        first_pass = passed[0]
        print(f"\n  关键发现:")
        print(f"  第 {first_pass[0] + 1} 次回退后首次验证通过！")
        print(f"  对应修改块: Hunk #{first_pass[1].hunk_index} (第 {first_pass[1].actual_rewrite_line} 行)")
        print(f"\n  这说明 Hunk #{first_pass[1].hunk_index} 很可能导致了验证失败")
        print(f"  建议重点检查第 {first_pass[1].actual_rewrite_line} 行附近的修改")
        
        # 如果最后一次回退（即全部回退完）验证通过了
        if len(results) > 0 and results[-1][2]:
            print(f"\n  ✓ 完全回退后验证通过，确认问题出在 rewrite 的修改中")
    else:
        print("注意:")
        print(f"  所有修改都回退后仍然验证失败")
        print(f"  这可能说明:")
        print(f"    1. diff 文件可能不完整或已过期")
        print(f"    2. 问题可能在 diff 未覆盖的部分")
        print(f"    3. clean 版本本身可能也有问题")
        print(f"\n  建议:")
        print(f"    - 重新生成 diff: ./verify_rewrite.sh {program_name} diff")
        print(f"    - 检查 clean 版本是否能正常验证")

if __name__ == "__main__":
    main()

