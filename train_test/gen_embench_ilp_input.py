#!/usr/bin/env python3
"""
从 nre/ilp_input.json 中过滤出 TRAIN_SET 的程序，
生成对应的 ilp_input_train.json

用法:
  python train_test/gen_embench_ilp_input.py
  python train_test/gen_embench_ilp_input.py --input nre/ilp_input.json --output train_test/ilp_input_train.json
"""

import argparse
import json
import sys
from pathlib import Path

HERE = Path(__file__).parent
REPO_ROOT = HERE.parent
sys.path.insert(0, str(HERE))

from util import TRAIN_SET


def main():
    parser = argparse.ArgumentParser(
        description='从全局 ilp_input.json 过滤出 TRAIN_SET 程序，生成 ilp_input_train.json')
    parser.add_argument('--input', default=str(REPO_ROOT / 'nre' / 'ilp_input.json'))
    parser.add_argument('--output', default=None,
                        help='默认 train_test/ilp_input_train.json')
    args = parser.parse_args()

    program_set = set(TRAIN_SET)
    input_file = Path(args.input)
    output_file = Path(args.output) if args.output else HERE / 'ilp_input_train.json'

    if not input_file.exists():
        print(f"错误: 找不到 {input_file}", file=sys.stderr)
        sys.exit(1)

    d = json.loads(input_file.read_text())

    programs = [p for p in d['programs'] if p['name'] in program_set]

    missing = program_set - {p['name'] for p in programs}
    if missing:
        print(f"警告: 以下程序在输入中未找到: {sorted(missing)}", file=sys.stderr)

    # 保留所有芯片的 metadata（ILP solver 需要用超集芯片做指令集兼容性检测）
    chip_metadata = {k: dict(v) for k, v in d['chip_metadata'].items()}

    name_set = {p['name'] for p in programs}
    for meta in chip_metadata.values():
        meta['programs'] = [p for p in meta['programs'] if p in name_set]
        meta['num_programs'] = len(meta['programs'])

    output = {
        'programs': programs,
        'chip_metadata': chip_metadata,
        'statistics': {
            'num_programs': len(programs),
            'num_chips': len(chip_metadata),
            'total_variants': sum(len(p['implementations']) for p in programs),
            'program_stats': {p['name']: len(p['implementations']) for p in programs},
        },
    }

    output_file.write_text(json.dumps(output, indent=2))

    print(f"TRAIN_SET programs ({output['statistics']['num_programs']}): {sorted(p['name'] for p in programs)}")
    print(f"Chips:    {output['statistics']['num_chips']}")
    print(f"Variants: {output['statistics']['total_variants']}")
    print(f"Output:   {output_file}")


if __name__ == '__main__':
    main()
