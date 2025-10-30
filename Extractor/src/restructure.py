#!/usr/bin/env python3
"""
将S-expression重构为汇编风格的指令序列
从ILP求解器的结果中读取S-expression并转换为汇编指令
"""

import sys
import json
from pathlib import Path
from typing import List, Dict
from sexpdata import loads, Symbol
import re

# a2_0 -> a2
def norm_reg(s: str) -> str:
    m = re.match(r'^([A-Za-z0-9]+)(?:_.*)?$', s)
    return m.group(1) if m else s

def parse_sexpr(s: str) -> any:
    """基于sexpdata的S-expression解析器"""
    try:
        parsed = loads(s)
        return parsed
    except Exception as e:
        print(f"解析S-expression时出错: {e}")
        print(f"输入字符串: {s}")
        return s


def sexpr_to_asm(sexpr: str) -> List[str]:
    """将S-expression转换为汇编指令序列"""
    instructions = []
    counter = [0]  # 使用列表以便在闭包中修改
    
    def traverse(node):
        """后序遍历，返回该节点的操作数名称"""
        if isinstance(node, str):
            # 叶子节点，直接返回简化后的名称
            return norm_reg(node)
        
        # sexpdata返回的是列表，第一个元素是操作符，其余是子节点
        if isinstance(node, list) and len(node) > 0:
            op = node[0]
            children = node[1:]
            
            # 处理Symbol类型（sexpdata中的符号）
            if hasattr(op, 'value'):
                op = op.value()
            elif isinstance(op, Symbol):
                op = str(op)
            
            # 跳过某些包装操作符，直接使用其子节点
            if op in ['RegVal', 'ImmVal'] and len(children) == 1:
                return traverse(children[0])
            
            # 递归处理所有子节点
            operands = [traverse(child) for child in children]
            
            # 为当前操作生成指令
            counter[0] += 1
            dest = f"op{counter[0]}"
            
            # 生成指令字符串（标准汇编格式：指令 目标, 源操作数...）
            if len(operands) == 0:
                instructions.append(f"{op} {dest}")
            elif len(operands) == 1:
                instructions.append(f"{op} {dest}, {operands[0]}")
            elif len(operands) == 2:
                instructions.append(f"{op} {dest}, {operands[0]}, {operands[1]}")
            else:
                instructions.append(f"{op} {dest}, {', '.join(operands)}")
            
            return dest
        
        # 如果不是预期的格式，返回原值
        return str(node)
    
    # 解析并遍历
    tree = parse_sexpr(sexpr)
    
    # 如果是root节点，特殊处理
    if isinstance(tree, list) and len(tree) > 0:
        op = tree[0]
        # 处理Symbol类型
        if hasattr(op, 'value'):
            op = op.value()
        elif isinstance(op, Symbol):
            op = str(op)
        
        if str(op).endswith('_root') and len(tree) > 1:
            # 处理root的所有子节点
            for child in tree[1:]:
                traverse(child)
        else:
            traverse(tree)
    else:
        traverse(tree)
    
    return instructions


def process_result_file(result_json_path: str, output_dir: Path) -> Dict[str, List[str]]:
    """处理结果JSON文件，生成汇编风格输出"""
    
    print(f"\n读取ILP求解结果: {result_json_path}")
    with open(result_json_path, 'r') as f:
        data = json.load(f)
    
    sexprs = data.get('sexprs', {})
    if not sexprs:
        print("警告：未找到S-expressions")
        return {}
    
    print(f"找到 {len(sexprs)} 个S-expression")
    
    all_asm = {}
    
    # 生成文本输出
    output_file = output_dir / "assembly.txt"
    with open(output_file, 'w') as f:
        f.write("="*80 + "\n")
        f.write("汇编风格指令序列 (从ILP求解结果生成)\n")
        f.write("="*80 + "\n\n")
        
        for root_name, sexpr in sexprs.items():
            instructions = sexpr_to_asm(sexpr)
            all_asm[root_name] = instructions
            
            f.write(f"# {root_name}\n")
            f.write(f"# S-expr: {sexpr}\n")
            f.write(f"# 指令数: {len(instructions)}\n")
            f.write("-"*80 + "\n")
            
            for inst in instructions:
                f.write(f"    {inst}\n")
            
            f.write("\n")
    
    print(f"输出已保存到: {output_file}")
    
    # 生成JSON格式输出
    json_file = output_dir / "assembly.json"
    with open(json_file, 'w') as f:
        json.dump(all_asm, f, indent=2, ensure_ascii=False)
    
    print(f"JSON格式已保存到: {json_file}")
    
    return all_asm


if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description="将ILP求解器的S-expression结果转换为汇编指令")
    parser.add_argument(
        "result_file",
        nargs='?',
        help="ILP结果JSON文件路径（可选，默认使用最新的结果文件）"
    )
    parser.add_argument(
        "--output",
        default=None,
        help="输出目录（默认：../output/rewrite）"
    )
    
    args = parser.parse_args()
    
    # 确定结果文件
    if args.result_file:
        result_file = Path(args.result_file)
    else:
        # 查找最新的结果文件
        result_dir = Path(__file__).parent.parent / "output" / "result"
        if not result_dir.exists():
            print(f"错误：结果目录不存在: {result_dir}")
            print("请先运行ILP求解器生成结果")
            sys.exit(1)
        
        result_files = list(result_dir.glob("*.json"))
        if not result_files:
            print(f"错误：在 {result_dir} 中未找到结果文件")
            print("请先运行ILP求解器: python src/ILP/ilp_solver.py")
            sys.exit(1)
        
        result_file = max(result_files, key=lambda p: p.stat().st_mtime)
    
    if not result_file.exists():
        print(f"错误：文件不存在: {result_file}")
        sys.exit(1)
    
    # 确定输出目录
    if args.output:
        output_dir = Path(args.output)
    else:
        output_dir = Path(__file__).parent.parent / "output" / "rewrite"
    
    output_dir.mkdir(parents=True, exist_ok=True)
    
    print("="*80)
    print("S-expression 到汇编指令转换器")
    print("="*80)
    
    # 处理文件
    all_asm = process_result_file(str(result_file), output_dir)
    
    # 打印统计信息
    print("\n" + "="*80)
    print("统计信息")
    print("="*80)
    for root_name, instructions in all_asm.items():
        print(f"{root_name}: {len(instructions)} 条指令")
    
    print("\n完成！")
