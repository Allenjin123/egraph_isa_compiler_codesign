#!/usr/bin/env python3
"""
绘制帕累托曲线：为每个 num_chip 绘制 area-latency 帕累托前沿
================================================================

从 sweep_results.json 中读取数据，为每个 num_chip 计算并绘制帕累托曲线。
"""

import argparse
import json
import sys
from pathlib import Path
from typing import List, Tuple, Dict
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns

import scienceplots

plt.style.use(['science','no-latex'])

def compute_pareto_frontier(points: List[Tuple[float, float]]) -> List[Tuple[float, float]]:
    """
    计算帕累托前沿（优化算法）
    
    帕累托最优：不存在另一个点同时具有更小的 area 和更小的 latency
    
    Args:
        points: 点列表，每个点是 (area, latency) 元组
        
    Returns:
        帕累托前沿点列表，按 area 排序
    """
    if not points:
        return []
    
    # 过滤掉无效点（None 值）
    valid_points = [(a, l) for a, l in points if a is not None and l is not None]
    if not valid_points:
        return []
    
    # 去重
    unique_points = list(set(valid_points))
    
    if len(unique_points) == 1:
        return unique_points
    
    # 计算帕累托前沿
    pareto_points = []
    
    for i, (area_i, latency_i) in enumerate(unique_points):
        is_pareto = True
        for j, (area_j, latency_j) in enumerate(unique_points):
            if i == j:
                continue
            # 如果存在另一个点，同时具有更小的 area 和更小的 latency
            if area_j < area_i and latency_j < latency_i:
                is_pareto = False
                break
        
        if is_pareto:
            pareto_points.append((area_i, latency_i))
    
    # 按 area 排序
    pareto_points.sort(key=lambda x: x[0])
    
    return pareto_points


def load_sweep_results(file_path: str) -> Dict:
    """加载扫描结果文件"""
    with open(file_path, 'r', encoding='utf-8') as f:
        return json.load(f)


def extract_points_for_num_chip(results: Dict, num_chip: str) -> List[Tuple[float, float]]:
    """
    从结果中提取某个 num_chip 的所有 (area, latency) 点
    
    Args:
        results: 结果字典
        num_chip: num_chip 键（例如 "num_chip_1"）
        
    Returns:
        (area, latency) 点列表
    """
    if num_chip not in results:
        return []
    
    points = []
    for entry in results[num_chip]:
        area = entry.get('area')
        latency = entry.get('latency')
        if area is not None and latency is not None:
            points.append((area, latency))
    
    return points


def print_pareto_points(
    results: Dict,
    num_chips_range: Tuple[int, int] = None
):
    """
    打印每个 num_chip 的帕累托点详细信息
    
    Args:
        results: 结果字典
        num_chips_range: (min, max) 元组，指定要打印的 num_chip 范围
    """
    # 获取所有 num_chip 键，按数值排序
    num_chip_keys = [k for k in results.keys() if k.startswith('num_chip_')]
    num_chip_keys = sorted(num_chip_keys, key=lambda x: int(x.split('_')[-1]))
    
    if not num_chip_keys:
        print("错误: 没有找到任何 num_chip 数据", file=sys.stderr)
        return
    
    # 过滤 num_chip 范围（同时包含 22，如果数据中有的话）
    if num_chips_range:
        min_chip, max_chip = num_chips_range
        num_chip_keys = [
            k for k in num_chip_keys
            if min_chip <= int(k.split('_')[-1]) <= max_chip or int(k.split('_')[-1]) == 22
        ]
        num_chip_keys = sorted(num_chip_keys, key=lambda x: int(x.split('_')[-1]))
    
    print("\n" + "="*80)
    print("帕累托点详细信息")
    print("="*80)
    
    for num_chip_key in num_chip_keys:
        num_chip_value = int(num_chip_key.split('_')[-1])
        
        # 提取所有点
        all_points = extract_points_for_num_chip(results, num_chip_key)
        
        if not all_points:
            print(f"\n{num_chip_key} (显示编号: {num_chip_value}): 没有有效数据点")
            continue
        
        # 计算帕累托前沿
        pareto_points = compute_pareto_frontier(all_points)
        
        if not pareto_points:
            print(f"\n{num_chip_key} (显示编号: {num_chip_value}): 没有帕累托点")
            continue
        
        # 按 area 排序（已经在 compute_pareto_frontier 中排序了）
        print(f"\n{num_chip_key} (显示编号: {num_chip_value}):")
        print(f"  总点数: {len(all_points)}, 帕累托点数: {len(pareto_points)}")
        print(f"  帕累托点列表 (Area, Latency):")
        
        for idx, (area, latency) in enumerate(pareto_points, 1):
            # 显示原始值和除以22后的值
            area_normalized = area / 22.0
            latency_normalized = latency / 22.0
            print(f"    [{idx}] Area: {area:8.2f} ({area_normalized:6.2f}), "
                  f"Latency: {latency:8.2f} ({latency_normalized:6.2f})")
    
    print("="*80)


def plot_pareto_curves(
    results: Dict,
    output_file: str,
    num_chips_range: Tuple[int, int] = None,
    figsize: Tuple[int, int] = (8, 6),
    dpi: int = 400,
    palette: str = "Set2",
    marker_size: int = 50
):
    """
    绘制所有 num_chip 的帕累托曲线
    
    Args:
        results: 结果字典
        output_file: 输出图片文件路径
        num_chips_range: (min, max) 元组，指定要绘制的 num_chip 范围
        figsize: 图片大小
        dpi: 图片分辨率
    """
    # 获取所有 num_chip 键，按数值排序
    num_chip_keys = [k for k in results.keys() if k.startswith('num_chip_')]
    num_chip_keys = sorted(num_chip_keys, key=lambda x: int(x.split('_')[-1]))
    
    if not num_chip_keys:
        print("错误: 没有找到任何 num_chip 数据", file=sys.stderr)
        sys.exit(1)
    
    # 过滤 num_chip 范围（同时包含 22，如果数据中有的话）
    if num_chips_range:
        min_chip, max_chip = num_chips_range
        num_chip_keys = [
            k for k in num_chip_keys
            if min_chip <= int(k.split('_')[-1]) <= max_chip or int(k.split('_')[-1]) == 22
        ]
        # 重新按数值排序
        num_chip_keys = sorted(num_chip_keys, key=lambda x: int(x.split('_')[-1]))
    
    # 创建图形
    fig, ax = plt.subplots(figsize=figsize, dpi=dpi)
    
    colors = sns.color_palette(palette, len(num_chip_keys))
    markers = ['o', 's', '^', 'v', 'D', 'p',  'h','*', 'X', 'P', '<']
    
    # 为每个 num_chip 绘制帕累托曲线
    for idx, num_chip_key in enumerate(num_chip_keys):
        num_chip_value = int(num_chip_key.split('_')[-1])
        
        # 提取所有点
        all_points = extract_points_for_num_chip(results, num_chip_key)
        
        if not all_points:
            print(f"警告: {num_chip_key} 没有有效数据点，跳过", file=sys.stderr)
            continue
        
        # 计算帕累托前沿
        pareto_points = compute_pareto_frontier(all_points)
        
        if not pareto_points:
            print(f"警告: {num_chip_key} 没有帕累托点，跳过", file=sys.stderr)
            continue
        
        # 分离坐标并除以22
        pareto_areas = [p[0] / 22.0 for p in pareto_points]
        pareto_latencies = [p[1] / 22.0 for p in pareto_points]
        
        # 绘制帕累托前沿，坐标除以22
        ax.scatter(
            pareto_areas, pareto_latencies,
            color=colors[idx], s=marker_size, marker=markers[idx % len(markers)],
            label=f'num-chip={num_chip_value} (Pareto)',
            alpha=1.0, edgecolors='black', linewidths=1
        )
        
        print(f"{num_chip_key}: {len(all_points)} 个总点, {len(pareto_points)} 个帕累托点")
    
    # 设置标签和标题
    ax.set_xlabel('Area', fontsize=14, fontweight='bold')
    ax.set_ylabel('Latency', fontsize=14, fontweight='bold')
    ax.tick_params(axis='both', which='major', labelsize=12)
    from matplotlib.ticker import FuncFormatter
    ax.xaxis.set_major_formatter(FuncFormatter(lambda x, _: f'{x:.0f}%'))
    ax.yaxis.set_major_formatter(FuncFormatter(lambda x, _: f'{x:.0f}%'))
    ax.grid(True, alpha=0.3)
    
    # 获取图例并按显示编号排序（按 int 大小排序）
    handles, labels = ax.get_legend_handles_labels()
    # 提取编号并排序
    legend_items = []
    for handle, label in zip(handles, labels):
        # 从标签中提取编号，例如 "num-chip=1 (Pareto)" -> 1
        try:
            num = int(label.split('=')[1].split()[0])
            legend_items.append((num, handle, label))
        except:
            legend_items.append((999, handle, label))  # 无法解析的放在最后
    
    # 按编号排序（按 int 大小，不是字典序）
    legend_items.sort(key=lambda x: x[0])
    sorted_handles = [item[1] for item in legend_items]
    sorted_labels = [item[2] for item in legend_items]
    
    ax.legend(sorted_handles, sorted_labels, loc='best', fontsize=12, prop={'weight': 'bold'})
    
    # 保存图片
    output_path = Path(output_file)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    plt.tight_layout()
    plt.savefig(output_path, dpi=dpi, bbox_inches='tight')
    print(f"\n图片已保存到: {output_path}")
    
    plt.close()


def main():
    parser = argparse.ArgumentParser(
        description='绘制帕累托曲线：为每个 num_chip 绘制 area-latency 帕累托前沿',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  python nre/plot_pareto.py --input nre/sweep_results.json --output nre/pareto_curves.pdf
  python nre/plot_pareto.py --input nre/sweep_results.json --output nre/pareto_curves.pdf --num-chips-min 1 --num-chips-max 5
        """
    )
    parser.add_argument('--input', '-i', required=True, help='输入JSON文件路径（sweep_results.json）')
    parser.add_argument('--output', '-o', required=True, help='输出图片文件路径（默认使用 PDF 格式，如果没有扩展名则自动添加 .pdf）')
    parser.add_argument('--num-chips-min', type=int, default=None, help='最小芯片数量（可选）')
    parser.add_argument('--num-chips-max', type=int, default=None, help='最大芯片数量（可选）')
    parser.add_argument('--num-chips-n', type=int, default=7, help='显示 1~n 加上第22个，默认: 7')
    parser.add_argument('--figsize', type=int, nargs=2, default=[8, 6], 
                       help='图片大小（宽 高），默认: 8 6')
    parser.add_argument('--dpi', type=int, default=400, help='图片分辨率，默认: 400')
    parser.add_argument('--palette', type=str, default='Set2', help='seaborn 配色方案，默认: Set2')
    parser.add_argument('--marker-size', type=int, default=90, help='帕累托点大小，默认: 20')
    
    args = parser.parse_args()
    
    # 如果没有扩展名，自动添加 .pdf
    output_path = Path(args.output)
    if not output_path.suffix:
        output_path = output_path.with_suffix('.pdf')
        args.output = str(output_path)
    
    # 加载数据
    input_path = Path(args.input)
    if not input_path.exists():
        print(f"错误: 输入文件不存在: {args.input}", file=sys.stderr)
        sys.exit(1)
    
    print(f"加载数据: {args.input}")
    data = load_sweep_results(str(input_path))
    
    if 'results' not in data:
        print("错误: 数据格式不正确，缺少 'results' 键", file=sys.stderr)
        sys.exit(1)
    
    results = data['results']
    
    # 确定 num_chips 范围
    # --num-chips-min/max 优先；否则用 --num-chips-n 设置 1~n
    if args.num_chips_min is not None or args.num_chips_max is not None:
        min_chip = args.num_chips_min if args.num_chips_min is not None else 1
        max_chip = args.num_chips_max if args.num_chips_max is not None else 10
        num_chips_range = (min_chip, max_chip)
    else:
        num_chips_range = (1, args.num_chips_n)
    
    # 打印帕累托点信息
    print_pareto_points(results, num_chips_range)
    
    # 绘制
    print("\n计算帕累托前沿...")
    plot_pareto_curves(
        results=results,
        output_file=args.output,
        num_chips_range=num_chips_range,
        figsize=tuple(args.figsize),
        dpi=args.dpi,
        palette=args.palette,
        marker_size=args.marker_size
    )


if __name__ == '__main__':
    main()

