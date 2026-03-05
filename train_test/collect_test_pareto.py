#!/usr/bin/env python3
"""
从 train_test/output/ 的测试结果收集帕累托数据。

对于 best_chips_ban_inst.json 中每个 num_chip 设置：
  - 按 num_chip 找对应的 chip（如 num_chip_3 -> chip_1, chip_2, chip_73）
  - 对每个程序，在这些 chip 的 analysis_results.json 中找其 pareto_frontier 上的所有变体
  - 每个变体按该程序自己的 gp 归一化（area_pct = area/gp_area*100, latency_pct = latency/gp_latency*100）
  - 无法 extract 的（缺文件、缺 gp）按无穷处理
  - 每个程序选择在某个 chip 上的最优分配，汇总后计算均值帕累托

输出: train_test/pareto_curves_test_best_chips.json
"""

import json
import math
from pathlib import Path

HERE = Path(__file__).parent
OUTPUT_DIR = HERE / 'output'
BAN_INST_FILE = HERE / 'best_chips_ban_inst.json'
OUTPUT_FILE = HERE / 'pareto_curves_test_best_chips.json'

INF = math.inf


def load_analysis(chip_name: str, prog_name: str):
    """读取 analysis_results.json，返回 (gp_area, gp_latency, pareto_frontier_variants) 或 None。"""
    path = OUTPUT_DIR / chip_name / 'backend' / prog_name / 'analysis_results.json'
    if not path.exists():
        return None
    with open(path) as f:
        data = json.load(f)

    # 找 gp 变体
    gp_area = None
    gp_latency = None
    for v in data.get('variants', []):
        if v.get('is_general_purpose') or v.get('variant_id') == 'gp':
            a, l = v.get('area'), v.get('latency')
            if a and l:
                gp_area, gp_latency = float(a), float(l)
                break

    if gp_area is None or gp_latency is None or gp_area <= 0 or gp_latency <= 0:
        return None

    # pareto_frontier 中各变体的 (area_pct, latency_pct)
    # 过滤掉 original 和 gp（不允许选这两个）
    variant_map = {v['variant_id']: v for v in data.get('variants', [])}
    pareto_points = []
    for pf in data.get('pareto_frontier', []):
        vid = pf['variant_id']
        v_meta = variant_map.get(vid, {})
        if v_meta.get('is_original') or v_meta.get('is_general_purpose'):
            continue
        a = pf.get('area') or v_meta.get('area')
        l = pf.get('latency') or v_meta.get('latency')
        if a is not None and l is not None:
            pareto_points.append((float(a) / gp_area * 100.0,
                                  float(l) / gp_latency * 100.0))

    return pareto_points  # list of (area_pct, latency_pct)


def compute_pareto_frontier(points):
    """返回帕累托前沿点集（最小化 area 和 latency）。"""
    sorted_pts = sorted(set(points), key=lambda p: (p[0], p[1]))
    pareto = []
    min_lat = INF
    for area, lat in sorted_pts:
        if lat < min_lat:
            pareto.append((area, lat))
            min_lat = lat
    return pareto


def collect_program_points(chips: list, programs: list):
    """
    对每个程序，收集在所有 chip 上的 pareto 点（归一化后）。
    返回 dict: prog_name -> list of (chip, area_pct, latency_pct)
    不可用的程序返回空列表（后续按无穷处理）。
    """
    prog_chip_points = {}
    for prog in programs:
        all_pts = []
        for chip in chips:
            pts = load_analysis(chip, prog)
            if pts:
                for a, l in pts:
                    all_pts.append((chip, a, l))
        prog_chip_points[prog] = all_pts
    return prog_chip_points


def build_combined_pareto(chips: list, programs: list):
    """
    构建联合帕累托：对每个 (area_weight, latency_weight) 的 alpha 扫描，
    每个程序选在哪个 chip 哪个点上的线性组合最小，汇总所有程序的面积和延迟均值。

    实际上，我们穷举所有程序各自的帕累托点的笛卡尔积太大，改用如下方法：
    对一组 alpha 值，对每个程序独立选最优点（最小化 alpha*lat + (1-alpha)*area），
    汇总均值，得到帕累托前沿。
    """
    prog_chip_points = collect_program_points(chips, programs)

    # 统计不可用程序
    missing = [p for p, pts in prog_chip_points.items() if not pts]
    if missing:
        print(f"  警告: 以下程序无法提取（按无穷计）: {missing}")

    n = len(programs)

    # alpha 扫描
    alpha_values = []
    # 极细粒度覆盖
    for v in [0, 0.0001, 0.0005, 0.001, 0.002, 0.005, 0.01, 0.02, 0.05,
              0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
              0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95,
              0.98, 0.99, 0.995, 0.999, 1.0]:
        alpha_values.append(v)

    raw_points = []  # (total_area, total_latency, alpha, per_prog_info)

    for alpha in alpha_values:
        total_area = 0.0
        total_latency = 0.0
        per_prog = {}
        feasible = True

        for prog in programs:
            pts = prog_chip_points.get(prog, [])
            if not pts:
                # 无穷：该程序贡献无穷大
                feasible = False
                per_prog[prog] = {'chip': None, 'area': None, 'latency': None}
                continue

            # 选使 alpha*lat + (1-alpha)*area 最小的点
            best = min(pts, key=lambda t: alpha * t[2] + (1 - alpha) * t[1])
            chip, a, l = best
            total_area += a
            total_latency += l
            per_prog[prog] = {'chip': chip, 'area': round(a, 4), 'latency': round(l, 4)}

        if feasible:
            raw_points.append({
                'alpha': alpha,
                'area': round(total_area / n, 6),
                'latency': round(total_latency / n, 6),
                'per_program': per_prog,
            })

    # 去重并计算帕累托前沿
    seen_al = {}
    for pt in raw_points:
        key = (pt['area'], pt['latency'])
        score = pt['area'] * pt['latency']
        if key not in seen_al or score < seen_al[key][0]:
            seen_al[key] = (score, pt)

    all_pts_2d = list(seen_al.keys())
    pareto_set = set(map(tuple, compute_pareto_frontier(all_pts_2d)))

    pareto_entries = []
    for (a, l), (score, pt) in seen_al.items():
        if (a, l) in pareto_set:
            pareto_entries.append({
                'alpha': pt['alpha'],
                'area': a,
                'latency': l,
                'area_x_latency': round(score, 6),
                'per_program': pt['per_program'],
            })

    pareto_entries.sort(key=lambda x: x['area'])

    return pareto_entries, missing


def main():
    with open(BAN_INST_FILE) as f:
        ban_inst = json.load(f)

    output = {}

    for key, cfg in ban_inst.items():
        chips = sorted(cfg['chip_ban_inst'].keys())
        programs = cfg['test_set']

        print(f"\n{key}: chips={chips}, programs={programs}")

        pareto_entries, missing = build_combined_pareto(chips, programs)

        output[key] = {
            'chips': chips,
            'programs': programs,
            'missing_programs': missing,
            'num_pareto_points': len(pareto_entries),
            'pareto_points': pareto_entries,
        }

        print(f"  帕累托点数: {len(pareto_entries)}")
        if pareto_entries:
            best = min(pareto_entries, key=lambda x: x['area_x_latency'])
            print(f"  最优 area*latency: {best['area_x_latency']:.4f}  "
                  f"(area={best['area']:.4f}, latency={best['latency']:.4f})")

    OUTPUT_FILE.write_text(json.dumps(output, indent=2, ensure_ascii=False))
    print(f"\n结果已保存: {OUTPUT_FILE}")


if __name__ == '__main__':
    main()
