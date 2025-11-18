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


def plot_pareto_curves(
    results: Dict,
    output_file: str,
    num_chips_range: Tuple[int, int] = None,
    figsize: Tuple[int, int] = (12, 8),
    dpi: int = 300
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
    
    # 过滤 num_chip 范围
    if num_chips_range:
        min_chip, max_chip = num_chips_range
        num_chip_keys = [
            k for k in num_chip_keys
            if min_chip <= int(k.split('_')[-1]) <= max_chip
        ]
        # 重新按数值排序
        num_chip_keys = sorted(num_chip_keys, key=lambda x: int(x.split('_')[-1]))
    
    # 创建图形
    fig, ax = plt.subplots(figsize=figsize, dpi=dpi)
    
    # 颜色和标记样式
    colors = plt.cm.tab10(np.linspace(0, 1, len(num_chip_keys)))
    markers = ['o', 's', '^', 'v', 'D', 'p', '*', 'h', 'X', 'P']
    
    # 为每个 num_chip 绘制帕累托曲线
    for idx, num_chip_key in enumerate(num_chip_keys):
        num_chip_value = int(num_chip_key.split('_')[-1])
        # 将编号改为0~9（1->0, 2->1, ..., 10->9）
        display_num = num_chip_value - 1
        
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
        
        # 绘制所有点（浅色，小点），坐标除以22
        all_areas = [p[0] / 22.0 for p in all_points]
        all_latencies = [p[1] / 22.0 for p in all_points]
        ax.scatter(
            all_areas, all_latencies,
            alpha=0.2, s=10,
            color=colors[idx], label=None
        )
        
        # 绘制帕累托前沿（深色，大点，不连线），坐标除以22
        ax.scatter(
            pareto_areas, pareto_latencies,
            color=colors[idx], s=100, marker='o',
            label=f'num_chip={display_num} (Pareto)',
            alpha=0.8, edgecolors='black', linewidths=1
        )
        
        print(f"{num_chip_key}: {len(all_points)} 个总点, {len(pareto_points)} 个帕累托点")
    
    # 设置标签和标题
    ax.set_xlabel('Area', fontsize=12)
    ax.set_ylabel('Latency', fontsize=12)
    ax.set_title('Pareto Frontiers for Different num_chip Values', fontsize=14, fontweight='bold')
    ax.grid(True, alpha=0.3)
    
    # 获取图例并按显示编号排序
    handles, labels = ax.get_legend_handles_labels()
    # 提取编号并排序
    legend_items = []
    for handle, label in zip(handles, labels):
        # 从标签中提取编号，例如 "num_chip=0 (Pareto)" -> 0
        try:
            num = int(label.split('=')[1].split()[0])
            legend_items.append((num, handle, label))
        except:
            legend_items.append((999, handle, label))  # 无法解析的放在最后
    
    # 按编号排序
    legend_items.sort(key=lambda x: x[0])
    sorted_handles = [item[1] for item in legend_items]
    sorted_labels = [item[2] for item in legend_items]
    
    ax.legend(sorted_handles, sorted_labels, loc='best', fontsize=10)
    
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
  python nre/plot_pareto.py --input nre/sweep_results.json --output nre/pareto_curves.png
  python nre/plot_pareto.py --input nre/sweep_results.json --output nre/pareto_curves.png --num-chips-min 1 --num-chips-max 5
        """
    )
    parser.add_argument('--input', '-i', required=True, help='输入JSON文件路径（sweep_results.json）')
    parser.add_argument('--output', '-o', required=True, help='输出图片文件路径（支持 .png, .pdf, .svg）')
    parser.add_argument('--num-chips-min', type=int, default=None, help='最小芯片数量（可选）')
    parser.add_argument('--num-chips-max', type=int, default=None, help='最大芯片数量（可选）')
    parser.add_argument('--figsize', type=int, nargs=2, default=[12, 8], 
                       help='图片大小（宽 高），默认: 12 8')
    parser.add_argument('--dpi', type=int, default=300, help='图片分辨率，默认: 300')
    
    args = parser.parse_args()
    
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
    num_chips_range = None
    if args.num_chips_min is not None or args.num_chips_max is not None:
        min_chip = args.num_chips_min if args.num_chips_min is not None else 1
        max_chip = args.num_chips_max if args.num_chips_max is not None else 10
        num_chips_range = (min_chip, max_chip)
    
    # 绘制
    print("\n计算帕累托前沿...")
    plot_pareto_curves(
        results=results,
        output_file=args.output,
        num_chips_range=num_chips_range,
        figsize=tuple(args.figsize),
        dpi=args.dpi
    )


if __name__ == '__main__':
    main()

