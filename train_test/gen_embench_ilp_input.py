#!/usr/bin/env python3
"""
从 nre/ilp_input.json 中过滤出14个embench程序，
生成 train_test/ilp_input_embench.json
"""

import json
import sys
from pathlib import Path

# 14个embench程序（normalize_program_name之后的名字）
EMBENCH = {
    'mont64', 'edn', 'huffbench', 'matmult-int', 'md5',
    'nsichneu', 'picojpeg_test', 'primecount', 'combined',
    'slre', 'statemate', 'tarfind', 'ud', 'wikisort',
}

REPO_ROOT = Path(__file__).parent.parent
INPUT_FILE = REPO_ROOT / 'nre' / 'ilp_input.json'
OUTPUT_FILE = Path(__file__).parent / 'ilp_input_embench.json'


def main():
    if not INPUT_FILE.exists():
        print(f"错误: 找不到 {INPUT_FILE}", file=sys.stderr)
        sys.exit(1)

    d = json.loads(INPUT_FILE.read_text())

    # 过滤程序
    embench_programs = [p for p in d['programs'] if p['name'] in EMBENCH]

    missing = EMBENCH - {p['name'] for p in embench_programs}
    if missing:
        print(f"警告: 以下embench程序在输入中未找到: {sorted(missing)}", file=sys.stderr)

    # 只保留embench程序实际用到的chip
    used_chip_ids = {impl['chip_id'] for p in embench_programs for impl in p['implementations']}
    embench_chip_metadata = {k: v for k, v in d['chip_metadata'].items() if k in used_chip_ids}

    # 重新计算chip_metadata中的programs和num_programs
    embench_name_set = {p['name'] for p in embench_programs}
    for meta in embench_chip_metadata.values():
        meta['programs'] = [p for p in meta['programs'] if p in embench_name_set]
        meta['num_programs'] = len(meta['programs'])

    output = {
        'programs': embench_programs,
        'chip_metadata': embench_chip_metadata,
        'statistics': {
            'num_programs': len(embench_programs),
            'num_chips': len(embench_chip_metadata),
            'total_variants': sum(len(p['implementations']) for p in embench_programs),
            'program_stats': {p['name']: len(p['implementations']) for p in embench_programs},
        },
    }

    OUTPUT_FILE.write_text(json.dumps(output, indent=2))

    print(f"Programs ({output['statistics']['num_programs']}): {sorted(p['name'] for p in embench_programs)}")
    print(f"Chips:    {output['statistics']['num_chips']}")
    print(f"Variants: {output['statistics']['total_variants']}")
    print(f"Output:   {OUTPUT_FILE}")


if __name__ == '__main__':
    main()
