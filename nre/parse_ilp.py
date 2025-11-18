#!/usr/bin/env python3
"""
解析analysis_results.json文件，转换为ILP求解器需要的格式
===========================================================

从每个程序的analysis_results.json中提取_uarchaware变体数据，
合并成ILP求解器需要的格式。

输入格式（analysis_results.json）:
{
  "program_name": "...",
  "variants": [
    {
      "variant_id": "...",
      "constraint_type": "uarchaware",
      "area": ...,
      "latency": ...,
      "instruction_subset": [...]
    }
  ]
}

输出格式（ILP求解器格式）:
{
  "programs": [
    {
      "name": "program_name",
      "implementations": [
        {
          "chip_id": "chip_0",  // 基于instruction_subset的唯一ID
          "area": ...,
          "latency": ...
        }
      ]
    }
  ],
  "chip_metadata": {
    "chip_0": {
      "instruction_subset": [...],
      "num_programs": ...  // 使用该芯片的程序数量
    }
  }
}
"""

import argparse
import json
import sys
from pathlib import Path
from typing import Dict, List, Set, Tuple, Optional
from collections import defaultdict
import re


def normalize_program_name(program_name: str) -> str:
    """
    规范化程序名称
    
    规则:
    1. qsort_small -> qsort_str
    2. qsort_large -> qsort_num
    3. 去掉_small, _O3等尾缀
    4. 如果开头有lib，去掉lib
    
    Args:
        program_name: 原始程序名称
        
    Returns:
        规范化后的程序名称
    """
    name = program_name
    
    # 特殊处理：qsort_small -> qsort_str, qsort_large -> qsort_num
    # 先处理qsort的特殊情况，因为需要保留qsort前缀
    if 'qsort_small' in name:
        name = name.replace('qsort_small', 'qsort_str')
    elif 'qsort_large' in name:
        name = name.replace('qsort_large', 'qsort_num')
    
    # 去掉开头的lib前缀
    if name.startswith('lib'):
        name = name[3:]
    
    # 去掉常见的尾缀：_small, _O3, _Oz等
    # 使用正则表达式匹配尾缀模式
    # 匹配: _small, _O3, _Oz, _small_O3等
    name = re.sub(r'_small(_O\d+)?$', '', name)
    name = re.sub(r'_large(_O\d+)?$', '', name)
    name = re.sub(r'_O\d+$', '', name)  # 去掉_O3, _Oz等
    name = re.sub(r'_Oz$', '', name)  # 确保去掉_Oz
    
    return name


def tupleize_instruction_subset(instruction_subset: List[str]) -> Tuple[str, ...]:
    """
    将指令子集转换为元组，用于作为字典键
    
    Args:
        instruction_subset: 指令列表
        
    Returns:
        排序后的元组
    """
    return tuple(sorted(instruction_subset))


def load_analysis_results(analysis_file: Path) -> Dict:
    """
    加载analysis_results.json文件
    
    Args:
        analysis_file: analysis_results.json文件路径
        
    Returns:
        解析后的JSON数据，如果文件不存在或解析失败返回None
    """
    if not analysis_file.exists():
        return None
    
    try:
        with open(analysis_file, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"警告: 无法解析 {analysis_file}: {e}", file=sys.stderr)
        return None


def extract_uarchaware_variants(analysis_data: Dict) -> Tuple[List[Dict], Optional[Dict]]:
    """
    从analysis_results.json中提取所有uarchaware变体和gp变体
    
    Args:
        analysis_data: 解析后的analysis_results.json数据
        
    Returns:
        (uarchaware变体列表, gp变体信息)
        uarchaware变体列表，每个变体包含：
        - variant_id
        - area
        - latency
        - instruction_subset
        gp变体信息包含：
        - area
        - latency
    """
    if not analysis_data or 'variants' not in analysis_data:
        return [], None
    
    uarchaware_variants = []
    gp_variant = None
    
    for variant in analysis_data['variants']:
        if variant.get('constraint_type') == 'gp':
            gp_variant = {
                'area': variant.get('area'),
                'latency': variant.get('latency')
            }
        elif variant.get('constraint_type') == 'uarchaware':
            uarchaware_variants.append({
                'variant_id': variant.get('variant_id', 'unknown'),
                'area': variant.get('area'),
                'latency': variant.get('latency'),
                'instruction_subset': variant.get('instruction_subset', [])
            })
    
    return uarchaware_variants, gp_variant


def build_chip_mapping(all_variants: List[Tuple[str, List[Dict], Optional[Dict]]]) -> Tuple[Dict[Tuple, str], Dict[str, Dict]]:
    """
    构建芯片映射：为每个唯一的instruction_subset分配chip_id
    
    Args:
        all_variants: 所有程序的变体列表，格式为 [(program_name, variants), ...]
        
    Returns:
        (chip_mapping, chip_metadata)
        - chip_mapping: {(instruction_subset_tuple): chip_id}
        - chip_metadata: {chip_id: {instruction_subset, num_programs}}
    """
    # 统计每个instruction_subset被多少程序使用
    subset_to_programs = defaultdict(set)
    
    for program_name, variants, gp_variant in all_variants:
        for variant in variants:
            subset_tuple = tupleize_instruction_subset(variant['instruction_subset'])
            subset_to_programs[subset_tuple].add(program_name)
    
    # 为每个唯一的instruction_subset分配chip_id
    chip_mapping = {}
    chip_metadata = {}
    
    # 按使用频率排序，常用的芯片分配更短的ID
    sorted_subsets = sorted(
        subset_to_programs.items(),
        key=lambda x: (-len(x[1]), x[0])  # 先按使用程序数降序，再按subset排序
    )
    
    for idx, (subset_tuple, programs) in enumerate(sorted_subsets):
        chip_id = f"chip_{idx}"
        chip_mapping[subset_tuple] = chip_id
        chip_metadata[chip_id] = {
            'instruction_subset': list(subset_tuple),
            'num_programs': len(programs),
            'programs': sorted(list(programs))
        }
    
    return chip_mapping, chip_metadata


def convert_to_ilp_format(
    all_variants: List[Tuple[str, List[Dict], Optional[Dict]]],
    chip_mapping: Dict[Tuple, str]
) -> Dict:
    """
    转换为ILP求解器需要的格式
    
    Args:
        all_variants: 所有程序的变体列表
        chip_mapping: instruction_subset到chip_id的映射
        
    Returns:
        ILP格式的数据
    """
    programs_data = []
    
    for program_name, variants, gp_variant in all_variants:
        if not variants:
            # 跳过没有uarchaware变体的程序
            continue
        
        # 检查是否有gp变体作为基准
        if gp_variant is None or gp_variant.get('area') is None or gp_variant.get('latency') is None:
            print(f"警告: 程序 {program_name} 没有gp变体，无法计算百分比，跳过", file=sys.stderr)
            continue
        
        gp_area = float(gp_variant['area'])
        gp_latency = float(gp_variant['latency'])
        
        if gp_area <= 0 or gp_latency <= 0:
            print(f"警告: 程序 {program_name} 的gp变体area或latency无效，跳过", file=sys.stderr)
            continue
        
        implementations = []
        for variant in variants:
            subset_tuple = tupleize_instruction_subset(variant['instruction_subset'])
            chip_id = chip_mapping.get(subset_tuple)
            
            if chip_id is None:
                print(f"警告: 程序 {program_name} 的变体 {variant['variant_id']} 没有找到对应的芯片", file=sys.stderr)
                continue
            
            # 计算相对于gp的百分比
            area_percent = (float(variant['area']) / gp_area) * 100.0
            latency_percent = (float(variant['latency']) / gp_latency) * 100.0
            
            implementations.append({
                'chip_id': chip_id,
                'area': area_percent,  # 相对于gp的百分比
                'latency': latency_percent,  # 相对于gp的百分比
                'variant_id': variant['variant_id']  # 保留用于调试
            })
        
        if implementations:
            programs_data.append({
                'name': program_name,
                'implementations': implementations
            })
    
    return programs_data


def main():
    parser = argparse.ArgumentParser(
        description='解析analysis_results.json文件，转换为ILP求解器格式'
    )
    parser.add_argument(
        '--input-dir',
        type=str,
        default='output/backend',
        help='包含各程序analysis_results.json的目录（默认: output/backend）'
    )
    parser.add_argument(
        '--output',
        type=str,
        default='nre/ilp_input.json',
        help='输出JSON文件路径（默认: nre/ilp_input.json）'
    )
    parser.add_argument(
        '--min-variants',
        type=int,
        default=1,
        help='程序至少需要有多少个uarchaware变体才包含在输出中（默认: 1）'
    )
    parser.add_argument(
        '--verbose',
        action='store_true',
        help='显示详细信息'
    )
    
    args = parser.parse_args()
    
    input_dir = Path(args.input_dir)
    output_file = Path(args.output)
    
    if not input_dir.exists():
        print(f"错误: 输入目录不存在: {input_dir}", file=sys.stderr)
        sys.exit(1)
    
    # 收集所有程序的变体数据
    all_variants = []
    program_stats = {}
    
    print(f"扫描目录: {input_dir}")
    
    # 遍历所有程序目录
    for program_dir in sorted(input_dir.iterdir()):
        if not program_dir.is_dir():
            continue
        
        original_program_name = program_dir.name
        program_name = normalize_program_name(original_program_name)
        analysis_file = program_dir / 'analysis_results.json'
        
        analysis_data = load_analysis_results(analysis_file)
        if analysis_data is None:
            if args.verbose:
                print(f"跳过 {original_program_name}: 未找到analysis_results.json")
            continue
        
        variants, gp_variant = extract_uarchaware_variants(analysis_data)
        
        if len(variants) < args.min_variants:
            if args.verbose:
                print(f"跳过 {program_name} ({original_program_name}): 只有 {len(variants)} 个uarchaware变体（需要至少 {args.min_variants} 个）")
            continue
        
        if gp_variant is None:
            if args.verbose:
                print(f"警告: 程序 {program_name} ({original_program_name}) 没有gp变体，将跳过")
            continue
        
        all_variants.append((program_name, variants, gp_variant))
        program_stats[program_name] = len(variants)
        
        if args.verbose:
            print(f"✓ {program_name} ({original_program_name}): {len(variants)} 个uarchaware变体")
    
    if not all_variants:
        print("错误: 没有找到任何有效的程序数据", file=sys.stderr)
        sys.exit(1)
    
    print(f"\n找到 {len(all_variants)} 个程序")
    print(f"总变体数: {sum(len(v) for _, v, _ in all_variants)}")
    
    # 构建芯片映射
    print("\n构建芯片映射...")
    chip_mapping, chip_metadata = build_chip_mapping(all_variants)
    
    print(f"发现 {len(chip_mapping)} 个唯一的ISA子集（芯片）")
    
    # 显示芯片统计信息
    if args.verbose:
        print("\n芯片统计:")
        for chip_id, metadata in sorted(chip_metadata.items(), key=lambda x: -x[1]['num_programs']):
            print(f"  {chip_id}: {metadata['num_programs']} 个程序使用, "
                  f"{len(metadata['instruction_subset'])} 条指令")
    
    # 转换为ILP格式
    print("\n转换为ILP格式...")
    programs_data = convert_to_ilp_format(all_variants, chip_mapping)
    
    # 构建最终输出
    output_data = {
        'programs': programs_data,
        'chip_metadata': chip_metadata,
        'statistics': {
            'num_programs': len(programs_data),
            'num_chips': len(chip_mapping),
            'total_variants': sum(len(p['implementations']) for p in programs_data),
            'program_stats': program_stats
        }
    }
    
    # 保存输出
    output_file.parent.mkdir(parents=True, exist_ok=True)
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(output_data, f, indent=2, ensure_ascii=False)
    
    print(f"\n✓ 输出已保存到: {output_file}")
    print(f"\n统计信息:")
    print(f"  - 程序数: {output_data['statistics']['num_programs']}")
    print(f"  - 芯片数: {output_data['statistics']['num_chips']}")
    print(f"  - 总实现数: {output_data['statistics']['total_variants']}")
    
    # 显示每个程序的变体数
    if args.verbose:
        print("\n各程序变体数:")
        for prog_name, count in sorted(program_stats.items()):
            print(f"  {prog_name}: {count}")


if __name__ == '__main__':
    main()

