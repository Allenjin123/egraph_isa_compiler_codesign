#!/usr/bin/env python3
"""
参数扫描脚本：收集不同参数组合下的 area 和 latency 数据
================================================================

遍历不同的 num_chip、best_k 和 alpha 参数组合，收集求解结果中的 area 和 latency 数据。

输出格式:
{
  "num_chip_1": [
    {
      "best_k": 1,
      "alpha": 0.0,
      "area": ...,
      "latency": ...,
      "objective_value": ...
    },
    ...
  ],
  "num_chip_2": [...],
  ...
}
"""

import argparse
import json
import sys
from pathlib import Path
from typing import Dict, List, Tuple, Optional
import time

# 导入求解器
from nre_ilp_solver import ISAILPSolver, load_data


def calculate_total_area_latency(solution: Dict) -> Tuple[float, float]:
    """
    计算解决方案的总 area 和总 latency
    
    Args:
        solution: 解决方案字典，包含 assignments
        
    Returns:
        (total_area, total_latency)
    """
    assignments = solution.get('assignments', {})
    if not assignments:
        return 0.0, 0.0
    
    total_area = sum(assign['area'] for assign in assignments.values())
    total_latency = sum(assign['latency'] for assign in assignments.values())
    
    return total_area, total_latency


def sweep_parameters(
    programs: List[Dict],
    chip_metadata: Optional[Dict],
    num_chips_range: range,
    best_k: int,
    alpha_values: List[float],
    timeout: Optional[int] = None,
    quiet: bool = False
) -> Dict:
    """
    扫描不同参数组合，收集 area 和 latency 数据
    
    Args:
        programs: 程序列表
        chip_metadata: 芯片元数据
        num_chips_range: num_chip 的范围（例如 range(1, 11)）
        best_k: best_k 的值（每个 alpha 会返回 best_k 个解）
        alpha_values: alpha 的值列表（0 到 1）
        timeout: 求解超时时间（秒）
        quiet: 是否安静模式（减少输出）
        
    Returns:
        收集到的数据字典
    """
    results = {}
    total_combinations = len(num_chips_range) * len(alpha_values)
    current_combination = 0
    
    print(f"开始参数扫描...")
    print(f"  - num_chip 范围: {num_chips_range.start} 到 {num_chips_range.stop - 1}")
    print(f"  - best_k: {best_k} (每个 alpha 将返回 {best_k} 个解)")
    print(f"  - alpha 值: {alpha_values}")
    print(f"  - 总组合数: {total_combinations}")
    print()
    
    start_time = time.time()
    
    for num_chips in num_chips_range:
        num_chips_key = f"num_chip_{num_chips}"
        results[num_chips_key] = []
        
        for alpha in alpha_values:
            current_combination += 1
            
            if not quiet:
                print(f"[{current_combination}/{total_combinations}] "
                      f"num_chip={num_chips}, alpha={alpha:.2f}...", end=" ")
            
            try:
                # 创建求解器
                solver = ISAILPSolver(
                    programs=programs,
                    num_chips=num_chips,
                    solver_type='gurobi',
                    chip_metadata=chip_metadata,
                    alpha=alpha,
                    best_k=best_k
                )
                
                # 求解
                success, solutions, obj_values = solver.solve(timeout=timeout)
                
                if success and solutions:
                    # 对于每个解，收集数据
                    for idx, (solution, obj_value) in enumerate(zip(solutions, obj_values)):
                        total_area, total_latency = calculate_total_area_latency(solution)
                        
                        result_entry = {
                            'alpha': alpha,
                            'area': total_area,
                            'latency': total_latency,
                            'objective_value': obj_value,
                            'solution_index': idx + 1 if len(solutions) > 1 else None
                        }
                        
                        # 如果只有一个解，不包含 solution_index
                        if len(solutions) == 1:
                            result_entry.pop('solution_index', None)
                        
                        results[num_chips_key].append(result_entry)
                    
                    if not quiet:
                        print(f"✓ (找到 {len(solutions)} 个解)")
                else:
                    if not quiet:
                        print("✗ (求解失败)")
                    # 即使失败也记录，但 area 和 latency 为 None
                    result_entry = {
                        'alpha': alpha,
                        'area': None,
                        'latency': None,
                        'objective_value': None,
                        'error': 'solver_failed'
                    }
                    results[num_chips_key].append(result_entry)
            
            except Exception as e:
                if not quiet:
                    print(f"✗ (错误: {e})")
                result_entry = {
                    'alpha': alpha,
                    'area': None,
                    'latency': None,
                    'objective_value': None,
                    'error': str(e)
                }
                results[num_chips_key].append(result_entry)
        
        if not quiet:
            print(f"\n完成 num_chip={num_chips}，共 {len(results[num_chips_key])} 个结果\n")
    
    elapsed_time = time.time() - start_time
    print(f"\n扫描完成！总耗时: {elapsed_time:.2f} 秒")
    print(f"平均每个组合: {elapsed_time / total_combinations:.2f} 秒")
    
    return results


def main():
    parser = argparse.ArgumentParser(
        description='参数扫描：收集不同参数组合下的 area 和 latency 数据',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  module load gurobi
  conda activate esip
  python nre/sweep.py --input nre/ilp_input.json --output nre/sweep_results.json
  python nre/sweep.py --input nre/ilp_input.json --output nre/sweep_results.json --num-chips-max 5 --alpha-step 0.1
        """
    )
    parser.add_argument('--input', '-i', required=True, help='输入JSON文件路径')
    parser.add_argument('--output', '-o', required=True, help='输出JSON文件路径')
    parser.add_argument('--num-chips-min', type=int, default=1, help='最小芯片数量（默认: 1）')
    parser.add_argument('--num-chips-max', type=int, default=10, help='最大芯片数量（默认: 10）')
    parser.add_argument('--best-k', type=int, default=1, 
                       help='best_k 值，每个 alpha 将返回 best_k 个解（默认: 1）')
    parser.add_argument('--alpha-min', type=float, default=0.0, help='alpha 最小值（默认: 0.0）')
    parser.add_argument('--alpha-max', type=float, default=1.0, help='alpha 最大值（默认: 1.0）')
    parser.add_argument('--alpha-step', type=float, default=0.1, help='alpha 步长（默认: 0.1）')
    parser.add_argument('--dense-extremes', dest='dense_extremes', action='store_true', default=True,
                       help='在极端区域（alpha 接近 0 和 1）使用更密集采样（默认: 启用）')
    parser.add_argument('--no-dense-extremes', dest='dense_extremes', action='store_false',
                       help='禁用极端区域密集采样')
    parser.add_argument('--extreme-step', type=float, default=0.01,
                       help='极端区域的步长（默认: 0.01，alpha 在 [0.1, 0.2) 时使用）')
    parser.add_argument('--extreme-threshold', type=float, default=0.2,
                       help='极端区域的阈值（默认: 0.2，alpha < 此值时使用密集采样）')
    parser.add_argument('--very-extreme-step', type=float, default=0.001,
                       help='非常极端区域的步长（默认: 0.001，alpha 在 [0.0, 0.1) 时使用）')
    parser.add_argument('--very-extreme-threshold', type=float, default=0.1,
                       help='非常极端区域的阈值（默认: 0.1，alpha < 此值时使用非常密集采样）')
    parser.add_argument('--timeout', '-t', type=int, default=None, help='每个求解的超时时间（秒）')
    parser.add_argument('--quiet', '-q', action='store_true', help='安静模式，减少输出')
    
    args = parser.parse_args()
    
    # 验证参数
    if args.num_chips_min < 1:
        print(f"错误: num-chips-min 必须 >= 1，当前值: {args.num_chips_min}", file=sys.stderr)
        sys.exit(1)
    
    if args.num_chips_max < args.num_chips_min:
        print(f"错误: num-chips-max 必须 >= num-chips-min，当前值: {args.num_chips_max}", file=sys.stderr)
        sys.exit(1)
    
    if not (0 <= args.alpha_min <= 1):
        print(f"错误: alpha-min 必须在 [0, 1] 范围内，当前值: {args.alpha_min}", file=sys.stderr)
        sys.exit(1)
    
    if not (0 <= args.alpha_max <= 1):
        print(f"错误: alpha-max 必须在 [0, 1] 范围内，当前值: {args.alpha_max}", file=sys.stderr)
        sys.exit(1)
    
    if args.alpha_max < args.alpha_min:
        print(f"错误: alpha-max 必须 >= alpha-min，当前值: {args.alpha_max}", file=sys.stderr)
        sys.exit(1)
    
    if args.alpha_step <= 0:
        print(f"错误: alpha-step 必须 > 0，当前值: {args.alpha_step}", file=sys.stderr)
        sys.exit(1)
    
    if args.dense_extremes:
        if args.extreme_step <= 0:
            print(f"错误: extreme-step 必须 > 0，当前值: {args.extreme_step}", file=sys.stderr)
            sys.exit(1)
        if not (0 < args.extreme_threshold < 0.5):
            print(f"错误: extreme-threshold 必须在 (0, 0.5) 范围内，当前值: {args.extreme_threshold}", file=sys.stderr)
            sys.exit(1)
        if args.very_extreme_step <= 0:
            print(f"错误: very-extreme-step 必须 > 0，当前值: {args.very_extreme_step}", file=sys.stderr)
            sys.exit(1)
        if not (0 < args.very_extreme_threshold <= args.extreme_threshold):
            print(f"错误: very-extreme-threshold 必须在 (0, extreme-threshold] 范围内，当前值: {args.very_extreme_threshold}", file=sys.stderr)
            sys.exit(1)
    
    # 生成 alpha 值列表
    if args.dense_extremes:
        # 在 alpha 小的区域使用更密集采样（latency 权重小的地方）
        # 策略：[0.0, 0.1) 步长 0.001, [0.1, 0.2) 步长 0.01, [0.2, 1.0] 步长 0.1
        alpha_values = []
        very_extreme_threshold = args.very_extreme_threshold  # 默认 0.1
        extreme_threshold = args.extreme_threshold  # 默认 0.2
        
        # 非常极端区域: [alpha_min, very_extreme_threshold) - 步长 0.001
        if args.alpha_min < very_extreme_threshold:
            very_extreme_min = max(args.alpha_min, 0.0)
            very_extreme_max = min(very_extreme_threshold, args.alpha_max)
            if very_extreme_min <= very_extreme_max:
                num_steps = int((very_extreme_max - very_extreme_min) / args.very_extreme_step) + 1
                for i in range(num_steps):
                    alpha = very_extreme_min + i * args.very_extreme_step
                    if alpha < very_extreme_max:  # 不包含上界，避免重复
                        alpha_values.append(alpha)
                # 注意：上界会在下一个区域处理，这里不添加避免重复
        
        # 极端区域: [very_extreme_threshold, extreme_threshold) - 步长 0.01
        if args.alpha_max >= very_extreme_threshold and args.alpha_min < extreme_threshold:
            extreme_min = max(args.alpha_min, very_extreme_threshold)
            extreme_max = min(extreme_threshold, args.alpha_max)
            if extreme_min <= extreme_max:
                num_steps = int((extreme_max - extreme_min) / args.extreme_step) + 1
                for i in range(num_steps):
                    alpha = extreme_min + i * args.extreme_step
                    if alpha < extreme_max:  # 不包含上界，避免重复
                        alpha_values.append(alpha)
                # 注意：上界会在下一个区域处理，这里不添加避免重复
        
        # 正常区域: [extreme_threshold, alpha_max] - 步长 0.1
        if args.alpha_max >= extreme_threshold:
            normal_min = max(args.alpha_min, extreme_threshold)
            normal_max = args.alpha_max
            if normal_min <= normal_max:
                num_steps = int((normal_max - normal_min) / args.alpha_step) + 1
                for i in range(num_steps):
                    alpha = normal_min + i * args.alpha_step
                    if alpha <= normal_max:
                        alpha_values.append(alpha)
        
        # 确保包含边界值
        if args.alpha_min not in alpha_values:
            alpha_values.append(args.alpha_min)
        if args.alpha_max not in alpha_values:
            alpha_values.append(args.alpha_max)
        
        # 去重并排序
        alpha_values = sorted(list(set(alpha_values)))
    else:
        # 均匀采样
        num_steps = int((args.alpha_max - args.alpha_min) / args.alpha_step) + 1
        alpha_values = [args.alpha_min + i * args.alpha_step for i in range(num_steps)]
        # 确保最后一个值是 alpha_max（处理浮点数精度问题）
        alpha_values[-1] = args.alpha_max
        # 去重并排序
        alpha_values = sorted(list(set(alpha_values)))
    
    # 加载数据
    input_path = Path(args.input)
    if not input_path.exists():
        print(f"错误: 输入文件不存在: {args.input}", file=sys.stderr)
        sys.exit(1)
    
    print(f"加载数据: {args.input}")
    programs, chip_metadata, statistics = load_data(str(input_path))
    
    if statistics:
        print(f"数据统计: {statistics.get('num_programs', 'N/A')} 个程序, "
              f"{statistics.get('num_chips', 'N/A')} 个候选芯片")
    else:
        print(f"加载了 {len(programs)} 个程序")
    
    # 验证 best_k
    if args.best_k < 1:
        print(f"错误: best-k 必须 >= 1，当前值: {args.best_k}", file=sys.stderr)
        sys.exit(1)
    
    # 执行扫描
    num_chips_range = range(args.num_chips_min, args.num_chips_max + 1)
    results = sweep_parameters(
        programs=programs,
        chip_metadata=chip_metadata,
        num_chips_range=num_chips_range,
        best_k=args.best_k,
        alpha_values=alpha_values,
        timeout=args.timeout,
        quiet=args.quiet
    )
    
    # 保存结果
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    output_data = {
        'metadata': {
            'num_chips_range': f"{args.num_chips_min}-{args.num_chips_max}",
            'best_k': args.best_k,
            'alpha_range': f"{args.alpha_min}-{args.alpha_max}",
            'alpha_step': args.alpha_step,
            'alpha_values': alpha_values,
            'timeout': args.timeout
        },
        'results': results
    }
    
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(output_data, f, indent=2, ensure_ascii=False)
    
    print(f"\n结果已保存到: {args.output}")
    
    # 统计信息
    total_results = sum(len(results[key]) for key in results)
    successful_results = sum(
        1 for key in results 
        for entry in results[key] 
        if entry.get('area') is not None
    )
    print(f"总结果数: {total_results}")
    print(f"成功结果数: {successful_results}")
    print(f"失败结果数: {total_results - successful_results}")


if __name__ == '__main__':
    main()

