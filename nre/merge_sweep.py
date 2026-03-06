#!/usr/bin/env python3
"""
合并两个 sweep_results.json 文件
用法: python merge_sweep.py --base sweep_results.json --extra sweep_results_extra.json --output sweep_results_merged.json
"""
import argparse
import json
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description='合并两个 sweep_results.json')
    parser.add_argument('--base', '-b', required=True, help='基础结果文件')
    parser.add_argument('--extra', '-e', required=True, help='补充结果文件')
    parser.add_argument('--output', '-o', required=True, help='输出文件')
    args = parser.parse_args()

    with open(args.base, encoding='utf-8') as f:
        base = json.load(f)
    with open(args.extra, encoding='utf-8') as f:
        extra = json.load(f)

    merged_results = base['results']

    for num_chip_key, entries in extra['results'].items():
        if num_chip_key not in merged_results:
            merged_results[num_chip_key] = entries
        else:
            # 用 (alpha, solution_index) 去重，extra 覆盖 base 中相同 alpha 的条目
            existing = {(e['alpha'], e.get('solution_index')): e for e in merged_results[num_chip_key]}
            for e in entries:
                key = (e['alpha'], e.get('solution_index'))
                existing[key] = e
            merged_results[num_chip_key] = sorted(existing.values(), key=lambda x: x['alpha'])

    output_data = dict(base)
    output_data['results'] = merged_results

    Path(args.output).parent.mkdir(parents=True, exist_ok=True)
    with open(args.output, 'w', encoding='utf-8') as f:
        json.dump(output_data, f, indent=2, ensure_ascii=False)

    total = sum(len(v) for v in merged_results.values())
    print(f"合并完成，共 {total} 条记录，已保存到: {args.output}")


if __name__ == '__main__':
    main()
