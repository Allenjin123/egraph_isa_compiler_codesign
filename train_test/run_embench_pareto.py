#!/usr/bin/env python3
"""
帕累托图生成脚本（在 TRAIN_SET 上做参数扫描）
==============================================
1. 调用 nre/sweep.py 的逻辑，对 ilp_input_train.json 做参数扫描
2. 调用 nre/plot_pareto.py 的逻辑，绘制帕累托图

输出:
  train_test/sweep_results_train.json
  train_test/pareto_curves_train.pdf
  train_test/pareto_curves_train_best_chips.json

用法:
  python train_test/run_embench_pareto.py
  python train_test/run_embench_pareto.py --num-chips-max 8 --alpha-step 0.05
  python train_test/run_embench_pareto.py --no-dense-extremes
"""

import argparse
import json
import sys
import numpy as np
from pathlib import Path

HERE = Path(__file__).parent
REPO_ROOT = HERE.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))
sys.path.insert(0, str(REPO_ROOT / 'nre'))

from util import TRAIN_SET
from nre.sweep import sweep_parameters
from nre.plot_pareto import plot_pareto_curves, print_pareto_points, compute_pareto_frontier
from nre.nre_ilp_solver import load_data

NUM_PROGRAMS = len(TRAIN_SET)


def build_alpha_values(alpha_min, alpha_max, alpha_step,
                       dense_extremes, extreme_step, extreme_threshold,
                       very_extreme_step, very_extreme_threshold):
    if not dense_extremes:
        num_steps = int((alpha_max - alpha_min) / alpha_step) + 1
        alpha_values = [alpha_min + i * alpha_step for i in range(num_steps)]
        alpha_values[-1] = alpha_max
        return sorted(set(alpha_values))

    alpha_values = []

    # 非常极端区域: [alpha_min, very_extreme_threshold)
    if alpha_min < very_extreme_threshold:
        ve_min = max(alpha_min, 0.0)
        ve_max = min(very_extreme_threshold, alpha_max)
        steps = int((ve_max - ve_min) / very_extreme_step) + 1
        for i in range(steps):
            a = ve_min + i * very_extreme_step
            if a < ve_max:
                alpha_values.append(a)

    # 极端区域: [very_extreme_threshold, extreme_threshold)
    if alpha_max >= very_extreme_threshold and alpha_min < extreme_threshold:
        e_min = max(alpha_min, very_extreme_threshold)
        e_max = min(extreme_threshold, alpha_max)
        steps = int((e_max - e_min) / extreme_step) + 1
        for i in range(steps):
            a = e_min + i * extreme_step
            if a < e_max:
                alpha_values.append(a)

    # 正常区域: [extreme_threshold, alpha_max]
    if alpha_max >= extreme_threshold:
        n_min = max(alpha_min, extreme_threshold)
        steps = int((alpha_max - n_min) / alpha_step) + 1
        for i in range(steps):
            a = n_min + i * alpha_step
            if a <= alpha_max:
                alpha_values.append(a)

    if alpha_min not in alpha_values:
        alpha_values.append(alpha_min)
    if alpha_max not in alpha_values:
        alpha_values.append(alpha_max)

    return sorted(set(alpha_values))


def dump_best_chip_selections(results, chip_metadata, output_path, num_programs=None):
    """
    对每个 num_chip，收集帕累托前沿上所有不同的芯片组合，
    输出每个组合使用的芯片编号及各芯片的 instruction_subset。
    """
    if num_programs is None:
        num_programs = NUM_PROGRAMS

    output = {}

    num_chip_keys = sorted(
        [k for k in results if k.startswith('num_chip_')],
        key=lambda x: int(x.split('_')[-1])
    )

    for key in num_chip_keys:
        num = int(key.split('_')[-1])
        entries = [e for e in results[key] if e.get('area') is not None and e.get('latency') is not None]
        if not entries:
            continue

        # 计算帕累托前沿
        points = [(e['area'], e['latency']) for e in entries]
        pareto_set = set(compute_pareto_frontier(points))

        pareto_entries = [e for e in entries if (e['area'], e['latency']) in pareto_set]

        # 去重：按 selected_chips 集合去重，保留每种组合中 area*latency 最小的代表点
        seen = {}
        for e in pareto_entries:
            chips_key = frozenset(e.get('selected_chips', []))
            score = (e['area'] / num_programs) * (e['latency'] / num_programs)
            if chips_key not in seen or score < seen[chips_key][0]:
                seen[chips_key] = (score, e)

        # 按 area*latency 排序
        unique_entries = sorted(seen.values(), key=lambda x: x[0])

        combos = []
        for score, e in unique_entries:
            chips = e.get('selected_chips', [])
            chip_info = {}
            for chip_id in chips:
                meta = chip_metadata.get(chip_id, {})
                chip_info[chip_id] = meta.get('instruction_subset', [])
            combos.append({
                'area': round(e['area'] / num_programs, 4),
                'latency': round(e['latency'] / num_programs, 4),
                'area_x_latency': round(score, 4),
                'alpha': e.get('alpha'),
                'selected_chips': chips,
                'chip_instructions': chip_info,
            })

        output[key] = {
            'num_chips': num,
            'num_unique_combos': len(combos),
            'pareto_combos': combos,
        }

    Path(output_path).write_text(json.dumps(output, indent=2, ensure_ascii=False))
    print(f"最优芯片选择已保存: {output_path}")

    # 简要打印
    print(f"\n{'num_chip':<12} {'combos':>8}  best area*lat  chips")
    for key, v in output.items():
        if v['pareto_combos']:
            best = v['pareto_combos'][0]
            chips_str = ', '.join(best['selected_chips'])
            print(f"{key:<12} {v['num_unique_combos']:>8}  {best['area_x_latency']:>12.4f}  {chips_str}")
        else:
            print(f"{key:<12} {0:>8}  {'N/A':>12}")


def main():
    parser = argparse.ArgumentParser(description='在 TRAIN_SET 上做帕累托图生成')
    parser.add_argument('--input',  default=None, help='ilp_input json路径（默认 train_test/ilp_input_train.json）')
    parser.add_argument('--sweep',  default=None, help='sweep结果输出路径（默认 train_test/sweep_results_train.json）')
    parser.add_argument('--output', default=None, help='帕累托图输出路径（默认 train_test/pareto_curves_train.pdf）')
    parser.add_argument('--num-chips-min', type=int, default=3)
    parser.add_argument('--num-chips-max', type=int, default=6)
    parser.add_argument('--best-k', type=int, default=1)
    parser.add_argument('--alpha-min', type=float, default=0.0)
    parser.add_argument('--alpha-max', type=float, default=1.0)
    parser.add_argument('--alpha-step', type=float, default=0.1)
    parser.add_argument('--dense-extremes', dest='dense_extremes', action='store_true', default=True)
    parser.add_argument('--no-dense-extremes', dest='dense_extremes', action='store_false')
    parser.add_argument('--extreme-step', type=float, default=0.01)
    parser.add_argument('--extreme-threshold', type=float, default=0.2)
    parser.add_argument('--very-extreme-step', type=float, default=0.001)
    parser.add_argument('--very-extreme-threshold', type=float, default=0.1)
    parser.add_argument('--timeout', type=int, default=None)
    parser.add_argument('--skip-sweep', action='store_true', help='跳过sweep步骤')
    parser.add_argument('--skip-plot', action='store_true', help='跳过画图步骤')
    parser.add_argument('--skip-best', action='store_true', help='跳过最优芯片选择输出')
    parser.add_argument('--num-chips-plot-max', type=int, default=None,
                        help='画图时显示到第几个chip（默认跟随程序数）')
    parser.add_argument('--dpi', type=int, default=400)
    parser.add_argument('--figsize', type=int, nargs=2, default=[8, 6])
    parser.add_argument('--palette', type=str, default='Set2')
    parser.add_argument('--quiet', '-q', action='store_true')
    args = parser.parse_args()

    # ── 默认路径 ────────────────────────────────────────────────────────────
    if args.input is None:
        args.input = str(HERE / 'ilp_input_train.json')
    if args.sweep is None:
        args.sweep = str(HERE / 'sweep_results_train.json')
    if args.output is None:
        args.output = str(HERE / 'pareto_curves_train.pdf')

    print(f"TRAIN_SET ({NUM_PROGRAMS} programs): {TRAIN_SET}")

    # ── 1. Sweep ─────────────────────────────────────────────────────────────
    if not args.skip_sweep:
        input_path = Path(args.input)
        if not input_path.exists():
            print(f"错误: 找不到输入文件 {input_path}", file=sys.stderr)
            sys.exit(1)

        print(f"加载数据: {input_path}")
        programs, chip_metadata, statistics = load_data(str(input_path))
        if statistics:
            print(f"数据统计: {statistics.get('num_programs')} 个程序, "
                  f"{statistics.get('num_chips')} 个候选芯片")

        alpha_values = build_alpha_values(
            args.alpha_min, args.alpha_max, args.alpha_step,
            args.dense_extremes,
            args.extreme_step, args.extreme_threshold,
            args.very_extreme_step, args.very_extreme_threshold,
        )
        print(f"alpha 共 {len(alpha_values)} 个值")

        # num_chips列表：1~max，加上程序数作为上界参考
        num_chips_list = list(range(args.num_chips_min, args.num_chips_max + 1))
        if NUM_PROGRAMS not in num_chips_list:
            num_chips_list.append(NUM_PROGRAMS)
            num_chips_list.sort()

        results = sweep_parameters(
            programs=programs,
            chip_metadata=chip_metadata,
            num_chips_range=num_chips_list,
            best_k=args.best_k,
            alpha_values=alpha_values,
            timeout=args.timeout,
            quiet=args.quiet,
        )

        output_data = {
            'metadata': {
                'num_chips_range': f"{args.num_chips_min}-{args.num_chips_max}",
                'best_k': args.best_k,
                'alpha_range': f"{args.alpha_min}-{args.alpha_max}",
                'alpha_step': args.alpha_step,
                'alpha_values': alpha_values,
                'timeout': args.timeout,
                'input_file': str(input_path),
            },
            'results': results,
        }

        sweep_path = Path(args.sweep)
        sweep_path.parent.mkdir(parents=True, exist_ok=True)
        sweep_path.write_text(json.dumps(output_data, indent=2, ensure_ascii=False))
        print(f"\nSweep结果已保存: {sweep_path}")
    else:
        sweep_path = Path(args.sweep)
        if not sweep_path.exists():
            print(f"错误: 找不到sweep结果文件 {sweep_path}", file=sys.stderr)
            sys.exit(1)
        print(f"跳过sweep，使用已有结果: {sweep_path}")

    # ── 加载 sweep 结果（plot/best 都需要）────────────────────────────────────
    if not args.skip_plot or not args.skip_best:
        print("\n加载sweep结果...")
        data = json.loads(sweep_path.read_text())
        if 'results' not in data:
            print("错误: sweep结果格式不正确，缺少 'results' 键", file=sys.stderr)
            sys.exit(1)
        results = data['results']

    # ── 2. Plot ───────────────────────────────────────────────────────────────
    if not args.skip_plot:
        plot_max = args.num_chips_plot_max or args.num_chips_max
        num_chips_range = (args.num_chips_min, plot_max)

        print_pareto_points(results, num_chips_range)

        output_path = Path(args.output)
        if not output_path.suffix:
            output_path = output_path.with_suffix('.pdf')

        plot_pareto_curves(
            results=results,
            output_file=str(output_path),
            num_chips_range=num_chips_range,
            figsize=tuple(args.figsize),
            dpi=args.dpi,
            palette=args.palette,
            num_programs=NUM_PROGRAMS,
        )
    else:
        output_path = Path(args.output)
        if not output_path.suffix:
            output_path = output_path.with_suffix('.pdf')

    # ── 3. Best chip selections ───────────────────────────────────────────────
    if not args.skip_best:
        chip_metadata = json.loads(Path(args.input).read_text())['chip_metadata']
        best_output = output_path.with_name(output_path.stem + '_best_chips.json')
        dump_best_chip_selections(results, chip_metadata, best_output, num_programs=NUM_PROGRAMS)


if __name__ == '__main__':
    main()
