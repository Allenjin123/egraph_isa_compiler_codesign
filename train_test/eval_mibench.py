#!/usr/bin/env python3
"""
对比两种芯片选择策略的 area-latency 表现
=========================================

实验 A：使用 TRAIN_SET 上搜出的最优 n 张芯片，固定芯片集合，在 TEST_SET 上做 mapping
实验 B：使用全局（22个程序）搜出的最优 n 张芯片，同样在 TEST_SET 上评估

用法：
  python train_test/eval_mibench.py
  python train_test/eval_mibench.py --num-chips-min 3 --num-chips-max 6
  python train_test/eval_mibench.py --global-sweep nre/sweep_results.json
"""

import argparse
import json
import sys
from pathlib import Path
from typing import Dict, List, Tuple, Optional

HERE = Path(__file__).parent
REPO_ROOT = HERE.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))
sys.path.insert(0, str(REPO_ROOT / 'nre'))

from util import TRAIN_SET, TEST_SET
from nre.nre_ilp_solver import ISAILPSolver, load_data
from nre.plot_pareto import compute_pareto_frontier
from nre.sweep import sweep_parameters

import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns

DEFAULT_ILP_INPUT       = REPO_ROOT / 'nre' / 'ilp_input.json'
DEFAULT_GLOBAL_SWEEP    = REPO_ROOT / 'nre' / 'sweep_results.json'
DEFAULT_TRAIN_BEST      = HERE / 'pareto_curves_train_best_chips.json'
DEFAULT_TEST_BEST       = HERE / 'pareto_curves_test_best_chips.json'
DEFAULT_TEST_NRE_SWEEP  = HERE / 'sweep_results_test_nre.json'
DEFAULT_OUTPUT          = HERE / 'eval_test_comparison.pdf'
DEFAULT_RESULTS_OUT     = HERE / 'eval_test_results.json'


# ─────────────────────────────────────────────────────────────────────────────
# 工具函数
# ─────────────────────────────────────────────────────────────────────────────

def build_alpha_values(dense: bool = True) -> List[float]:
    """生成 alpha 采样列表"""
    if not dense:
        return [round(i * 0.1, 1) for i in range(11)]
    alphas = []
    # [0.0, 0.1) 步长 0.001
    a = 0.0
    while a < 0.1 - 1e-9:
        alphas.append(round(a, 4))
        a += 0.001
    # [0.1, 0.2) 步长 0.01
    a = 0.1
    while a < 0.2 - 1e-9:
        alphas.append(round(a, 4))
        a += 0.01
    # [0.2, 1.0] 步长 0.1
    a = 0.2
    while a <= 1.0 + 1e-9:
        alphas.append(round(a, 4))
        a += 0.1
    return sorted(set(alphas))


def sweep_fixed_chips(
    programs: List[Dict],
    chip_metadata: Dict,
    fixed_chips: List[str],
    alpha_values: List[float],
    timeout: Optional[int],
    quiet: bool,
    label: str,
    eval_programs: List[str] = None,
) -> Tuple[List[Tuple[float, float]], List[Dict]]:
    """
    固定 chip 集合，扫描 alpha，只在 eval_programs 上做 mapping。
    返回 (area, latency) 点列表 和 完整 entry 列表。
    """
    if eval_programs is None:
        eval_programs = TEST_SET
    points = []
    entries = []
    n = len(alpha_values)

    for i, alpha in enumerate(alpha_values):
        if not quiet:
            print(f"  [{i+1}/{n}] {label} alpha={alpha:.4f}...", end=" ", flush=True)
        try:
            solver = ISAILPSolver(
                programs=programs,
                num_chips=len(fixed_chips),
                chip_metadata=chip_metadata,
                alpha=alpha,
                fixed_chips=fixed_chips,
                program_filter=eval_programs,
            )
            if solver.uncovered_programs and i == 0:
                print(f"\n  警告: 以下程序无法被覆盖: {solver.uncovered_programs}")

            success, solutions, obj_values = solver.solve(timeout=timeout)
            if success and solutions:
                sol = solutions[0]
                per_prog = sol.get('assignments', {})
                mi_area    = sum(per_prog[p]['area']    for p in eval_programs if p in per_prog)
                mi_latency = sum(per_prog[p]['latency'] for p in eval_programs if p in per_prog)
                if not quiet:
                    print(f"✓  area={mi_area/len(eval_programs):.2f}% lat={mi_latency/len(eval_programs):.2f}%")
                points.append((mi_area, mi_latency))
                entries.append({
                    'alpha': alpha,
                    'area': mi_area,
                    'latency': mi_latency,
                    'per_program': {
                        p: {'chip_id': per_prog[p]['chip_id'],
                            'area': per_prog[p]['area'],
                            'latency': per_prog[p]['latency']}
                        for p in eval_programs if p in per_prog
                    },
                    'uncovered_programs': sol.get('uncovered_programs', []),
                })
            else:
                if not quiet:
                    print("✗ 失败")
                entries.append({'alpha': alpha, 'area': None, 'latency': None})
        except Exception as e:
            if not quiet:
                print(f"✗ 错误: {e}")
            entries.append({'alpha': alpha, 'area': None, 'latency': None, 'error': str(e)})

    return points, entries


def extract_test_best_entries(test_best: Dict, num_chips: int,
                              num_eval_programs: int) -> List[Dict]:
    """
    从 pareto_curves_test_best_chips.json 读取 num_chip_N 的帕累托点，
    转换为与 global/train entries 相同的 {area, latency} 格式（sum = avg * n）。
    """
    key = f"num_chip_{num_chips}"
    if key not in test_best:
        return []
    result = []
    for pt in test_best[key].get('pareto_points', []):
        if pt.get('area') is None or pt.get('latency') is None:
            continue
        result.append({
            'alpha':   pt.get('alpha'),
            'area':    pt['area'] * num_eval_programs,
            'latency': pt['latency'] * num_eval_programs,
        })
    return result


def run_test_nre_sweep(
    ilp_input_path: str,
    eval_programs: List[str],
    num_chips_range: List[int],
    alpha_values: List[float],
    timeout: Optional[int],
    quiet: bool,
    sweep_cache_path: str,
) -> Dict:
    """
    实验 D：只用 TEST_SET 程序跑 NRE 搜索，搜完后直接在 TEST_SET 上评估。
    结果缓存到 sweep_cache_path，下次可 --skip-test-nre-sweep 复用。
    返回 sweep results dict（格式同 sweep_results.json 的 results 部分）。
    """
    cache = Path(sweep_cache_path)
    if cache.exists():
        print(f"  加载缓存 test_nre sweep: {cache}")
        data = json.loads(cache.read_text())
        return data.get('results', data)

    print(f"  从 {ilp_input_path} 过滤 TEST_SET 程序...")
    raw = json.loads(Path(ilp_input_path).read_text())
    prog_set = set(eval_programs)
    programs_filtered = [p for p in raw['programs'] if p['name'] in prog_set]
    chip_metadata = raw['chip_metadata']
    # 过滤每个 chip 的 programs 列表
    for meta in chip_metadata.values():
        meta['programs'] = [p for p in meta.get('programs', []) if p in prog_set]
        meta['num_programs'] = len(meta['programs'])

    print(f"  TEST_SET NRE sweep: {len(programs_filtered)} 个程序, num_chips={num_chips_range}")
    results = sweep_parameters(
        programs=programs_filtered,
        chip_metadata=chip_metadata,
        num_chips_range=num_chips_range,
        best_k=1,
        alpha_values=alpha_values,
        timeout=timeout,
        quiet=quiet,
    )

    cache.parent.mkdir(parents=True, exist_ok=True)
    cache.write_text(json.dumps({'results': results}, indent=2, ensure_ascii=False))
    print(f"  test_nre sweep 结果已缓存: {cache}")
    return results


def extract_global_entries_for_eval(global_sweep: Dict, num_chips: int,
                                    eval_programs: List[str]) -> List[Dict]:
    """
    从全局 sweep 的 per_program 字段，直接取 eval_programs 的子集，
    求平均 area/latency，不需要重跑 ILP。
    """
    key = f"num_chip_{num_chips}"
    if key not in global_sweep:
        return []
    result = []
    for e in global_sweep[key]:
        pp = e.get('per_program', {})
        if not pp:
            continue
        covered = [p for p in eval_programs if p in pp]
        if len(covered) < len(eval_programs):
            continue
        area    = sum(pp[p]['area']    for p in covered)
        latency = sum(pp[p]['latency'] for p in covered)
        result.append({
            'alpha':          e.get('alpha'),
            'area':           area,
            'latency':        latency,
            'selected_chips': e.get('selected_chips', []),
        })
    return result


# ─────────────────────────────────────────────────────────────────────────────
# 画图
# ─────────────────────────────────────────────────────────────────────────────

def plot_comparison(
    results: Dict,
    output_file: str,
    num_eval_programs: int = None,
    figsize: Tuple[int, int] = (4, 5),
    dpi: int = 400,
):
    from matplotlib.ticker import FuncFormatter

    if num_eval_programs is None:
        num_eval_programs = len(TEST_SET) if TEST_SET else len(TRAIN_SET)

    num_chips_list = sorted(results.keys())
    fig, ax = plt.subplots(figsize=figsize, dpi=dpi)

    # 每个 source 有自己的 marker、颜色、大小（类似 plot_pareto.py 中每条线一个 marker）
    source_style = {
        'global':    {'color': '#0984e3', 'marker': 'o', 's': 90},
        'test_nre':  {'color': '#e17055', 'marker': 's', 's': 75},
        'test_best': {'color': '#00b894', 'marker': '^', 's': 120},
        'train':     {'color': '#636e72', 'marker': 'v', 's': 120},
    }

    handles_by_source = {}

    for n in num_chips_list:
        for source in ('train', 'global', 'test_nre', 'test_best'):
            entries = [e for e in results[n].get(source, [])
                       if e.get('area') is not None and e.get('latency') is not None]
            if not entries:
                continue
            pts = [(e['area'], e['latency']) for e in entries]
            pareto = compute_pareto_frontier(pts)
            xs = [p[0] / num_eval_programs for p in pareto]
            ys = [p[1] / num_eval_programs for p in pareto]
            st = source_style[source]
            label = source
            sc = ax.scatter(xs, ys, color=st['color'], marker=st['marker'],
                            s=st['s'], alpha=1.0, edgecolors='black', linewidths=0.7,
                            label=label)
            if source not in handles_by_source:
                handles_by_source[source] = (sc, label)

    # legend：每个 source 一个条目，格式同 plot_pareto.py
    legend_handles, legend_labels = [], []
    for src in ('global', 'test_nre', 'test_best'):
        if src in handles_by_source:
            legend_handles.append(handles_by_source[src][0])
            legend_labels.append(handles_by_source[src][1])
    ncol = 1

    ax.set_xlabel('Area', fontsize=16)
    ax.xaxis.set_major_formatter(FuncFormatter(lambda x, _: f'{x:.0f}%'))
    ax.yaxis.set_major_formatter(FuncFormatter(lambda x, _: f'{int(x/100)}x'))
    ax.tick_params(axis='both', which='major', labelsize=10)
    ax.grid(True, alpha=0.3)
    ax.legend(legend_handles, legend_labels,
              loc='upper right', ncol=ncol, fontsize=12,
              columnspacing=0.3, handletextpad=-0.1)

    plt.tight_layout()
    Path(output_file).parent.mkdir(parents=True, exist_ok=True)
    plt.savefig(output_file, dpi=dpi, bbox_inches='tight')
    plt.close()
    print(f"\n图片已保存: {output_file}")


# ─────────────────────────────────────────────────────────────────────────────
# main
# ─────────────────────────────────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(
        description='对比 train-set chips vs global chips 在 TEST_SET 上的表现')
    parser.add_argument('--run-train-chips', action='store_true', default=False,
                        help='是否跑 train-set chips 实验（默认跳过，因为跨 benchmark 芯片覆盖率极低）')
    parser.add_argument('--ilp-input',      default=str(DEFAULT_ILP_INPUT),    help='ilp_input.json 路径')
    parser.add_argument('--train-best',     default=str(DEFAULT_TRAIN_BEST),
                        help='训练集 best_chips.json 路径')
    parser.add_argument('--test-best',      default=str(DEFAULT_TEST_BEST),
                        help='测试集 best_chips pareto 路径（pareto_curves_test_best_chips.json）')
    parser.add_argument('--global-sweep',   default=str(DEFAULT_GLOBAL_SWEEP), help='全局 sweep_results.json 路径')
    parser.add_argument('--output',         default=str(DEFAULT_OUTPUT),       help='输出图片路径')
    parser.add_argument('--results-output', default=str(DEFAULT_RESULTS_OUT),  help='输出结果 JSON 路径')
    parser.add_argument('--num-chips-min',  type=int, default=3)
    parser.add_argument('--num-chips-max',  type=int, default=3)
    parser.add_argument('--num-chips',      type=int, nargs='+', default=None,
                        help='直接指定 n 的列表，例如 --num-chips 3 5（优先于 min/max）')
    parser.add_argument('--timeout',        type=int, default=None)
    parser.add_argument('--run-test-nre',   action='store_true', default=True,
                        help='跑实验D：只用 TEST_SET 程序做 NRE 搜索，在 TEST_SET 上评估')
    parser.add_argument('--test-nre-sweep', default=str(DEFAULT_TEST_NRE_SWEEP),
                        help='test_nre sweep 缓存路径（存在则直接复用）')
    parser.add_argument('--all-combos',     action='store_true', default=False,
                        help='遍历 train_best 中所有 pareto_combos 并合并结果（默认只取最优的第一个）')
    parser.add_argument('--no-dense',       action='store_true', help='alpha 均匀采样（步长0.1），不密集采样')
    parser.add_argument('--quiet', '-q',    action='store_true')
    args = parser.parse_args()

    # TEST_SET 为空时（train_ratio=1），用 TRAIN_SET 自身做 eval（验证自洽性）
    eval_programs = TEST_SET if TEST_SET else TRAIN_SET
    train_best_path  = Path(args.train_best)
    output_path      = args.output
    results_out_path = Path(args.results_output)

    # ── 加载数据 ──────────────────────────────────────────────────────────────
    print(f"TRAIN_SET ({len(TRAIN_SET)}): {TRAIN_SET}")
    print(f"TEST_SET  ({len(TEST_SET)}):  {TEST_SET}")
    if not TEST_SET:
        print(f"TEST_SET 为空，使用 TRAIN_SET 做 eval（自洽性验证）")

    print(f"\n加载 ilp_input: {args.ilp_input}")
    programs, chip_metadata, statistics = load_data(args.ilp_input)
    print(f"  {statistics.get('num_programs') if statistics else len(programs)} 个程序, "
          f"{statistics.get('num_chips') if statistics else '?'} 个候选芯片")

    print(f"\n加载训练集 best chips: {train_best_path}")
    train_best = json.loads(train_best_path.read_text())

    test_best = None
    test_best_path = Path(args.test_best)
    if test_best_path.exists():
        print(f"加载测试集 best chips pareto: {test_best_path}")
        test_best = json.loads(test_best_path.read_text())
    else:
        print(f"警告: 找不到 test_best 文件 {test_best_path}，跳过 test_best 曲线")

    global_sweep = None
    global_sweep_path = Path(args.global_sweep)
    if global_sweep_path.exists():
        print(f"加载全局 sweep: {args.global_sweep}")
        global_data = json.loads(global_sweep_path.read_text())
        global_sweep = global_data.get('results', global_data)
    else:
        print(f"警告: 找不到全局 sweep 文件 {args.global_sweep}，跳过全局实验")

    alpha_values = build_alpha_values(dense=not args.no_dense)
    print(f"\nalpha 采样: {len(alpha_values)} 个值")
    print(f"eval 集: {eval_programs}")

    if args.num_chips is not None:
        num_chips_range = sorted(set(args.num_chips))
    else:
        num_chips_range = range(args.num_chips_min, args.num_chips_max + 1)

    # ── 跑实验 ────────────────────────────────────────────────────────────────
    all_results = {}

    for n in num_chips_range:
        key = f"num_chip_{n}"
        print(f"\n{'='*60}")
        print(f"n = {n} 张芯片")
        all_results[n] = {}

        # 实验 A：train-set chips（默认跳过，跨 benchmark 覆盖率极低）
        if args.run_train_chips:
            if key in train_best:
                v = train_best[key]
                # 兼容新格式（pareto_combos）和旧格式（selected_chips）
                if 'pareto_combos' in v and v['pareto_combos']:
                    combos = v['pareto_combos'] if args.all_combos else [v['pareto_combos'][0]]
                else:
                    combos = [{'selected_chips': v['selected_chips']}]

                all_entries_a = []
                for ci, combo in enumerate(combos):
                    train_chips = combo['selected_chips']
                    print(f"\n[A] combo {ci+1}/{len(combos)} chips: {train_chips}")
                    _, entries = sweep_fixed_chips(
                        programs=programs,
                        chip_metadata=chip_metadata,
                        fixed_chips=train_chips,
                        alpha_values=alpha_values,
                        timeout=args.timeout,
                        quiet=args.quiet,
                        label=f'A(train,n={n},c{ci})',
                        eval_programs=eval_programs,
                    )
                    for e in entries:
                        e['combo_index'] = ci
                        e['combo_chips'] = train_chips
                    all_entries_a.extend(entries)

                all_results[n]['train'] = all_entries_a
                all_results[n]['train_chips'] = [c['selected_chips'] for c in combos]
            else:
                print(f"[A] 跳过: {key} 不在 train_best 中")
        else:
            print(f"[A] 跳过 train-set chips（使用 --run-train-chips 启用）")

        # 实验 C：test_best chips 在 test set 上的帕累托（直接读 pareto_curves_test_best_chips.json）
        if test_best is not None:
            entries_c = extract_test_best_entries(test_best, n, len(eval_programs))
            if entries_c:
                print(f"\n[C] Test-best chips pareto 直接读取，{len(entries_c)} 个点")
                all_results[n]['test_best'] = entries_c
            else:
                print(f"[C] 跳过: test_best 中找不到 n={n} 的数据")

        # 实验 D：只用 TEST_SET 程序跑 NRE 搜索，在 TEST_SET 上评估
        if args.run_test_nre:
            print(f"\n[D] Test-only NRE sweep, n={n}...")
            test_nre_results = run_test_nre_sweep(
                ilp_input_path=args.ilp_input,
                eval_programs=eval_programs,
                num_chips_range=[n],
                alpha_values=alpha_values,
                timeout=args.timeout,
                quiet=args.quiet,
                sweep_cache_path=args.test_nre_sweep,
            )
            key_d = f"num_chip_{n}"
            entries_d = [
                {'alpha': e.get('alpha'), 'area': e.get('area'), 'latency': e.get('latency')}
                for e in test_nre_results.get(key_d, [])
                if e.get('area') is not None and e.get('latency') is not None
            ]
            if entries_d:
                print(f"  {len(entries_d)} 个点")
                all_results[n]['test_nre'] = entries_d
            else:
                print(f"  跳过: test_nre sweep 中找不到 n={n} 的数据")

        # 实验 B：从全局 sweep 的 per_program 直接读取 eval bench 子集性能
        if global_sweep is not None:
            entries_b = extract_global_entries_for_eval(global_sweep, n, eval_programs)
            if entries_b:
                print(f"\n[B] Global sweep 直接读取，{len(entries_b)} 个点")
                all_results[n]['global'] = entries_b
                # 收集所有不同的芯片组合
                seen_chips = set()
                global_chips_list = []
                for eb in entries_b:
                    ck = tuple(sorted(eb.get('selected_chips', [])))
                    if ck and ck not in seen_chips:
                        seen_chips.add(ck)
                        global_chips_list.append(list(ck))
                all_results[n]['global_chips'] = global_chips_list
            else:
                print(f"[B] 跳过: 全局 sweep 中找不到 n={n} 的数据")
        else:
            print(f"[B] 跳过: 没有全局 sweep 数据")

    # ── 保存结果 JSON ─────────────────────────────────────────────────────────
    results_out_path.parent.mkdir(parents=True, exist_ok=True)
    results_out_path.write_text(json.dumps(all_results, indent=2, ensure_ascii=False))
    print(f"\n结果已保存: {results_out_path}")

    # ── 打印汇总 ──────────────────────────────────────────────────────────────
    print(f"\n{'='*60}")
    print(f"{'n':>4}  {'source':>10}  {'pareto pts':>10}  {'best area%':>11}  {'best latency%':>14}  chips")
    for n in sorted(all_results.keys()):
        for source in ('train', 'global', 'test_nre', 'test_best'):
            entries = [e for e in all_results[n].get(source, [])
                       if e.get('area') is not None]
            if not entries:
                continue
            pts = [(e['area'], e['latency']) for e in entries]
            pareto = compute_pareto_frontier(pts)
            best_area    = min(p[0] for p in pareto) / len(eval_programs)
            best_latency = min(p[1] for p in pareto) / len(eval_programs)
            chips = all_results[n].get(f'{source}_chips', [])
            print(f"{n:>4}  {source:>10}  {len(pareto):>10}  "
                  f"{best_area:>10.2f}%  {best_latency:>13.2f}%  {chips}")

    # ── 画图 ──────────────────────────────────────────────────────────────────
    if not Path(output_path).suffix:
        output_path += '.pdf'
    plot_comparison(all_results, output_path)


if __name__ == '__main__':
    main()
