#!/usr/bin/env python3
import os
import re
import argparse
from pathlib import Path

INSTR_LINE_REGEXES = [
    # Full form: address: <hex/machinecode> <spacing> mnemonic ...
    re.compile(r"^\s*([0-9a-fA-F]+):\s+([0-9a-fA-F]{4,16})\s+(.*\S)\s*$"),
    # Address + mnemonic (no machine code captured separately)
    re.compile(r"^\s*([0-9a-fA-F]+):\s+(\S.*\S)\s*$"),
]

# Some disassemblies use tabs aligning mnemonic; collapse multiple whitespace later.
WS_COLLAPSE = re.compile(r"\s+")
# Angle bracket annotations pattern: <symbol>, <symbol+0xXX>, <...>
ANGLE_ANNOT = re.compile(r"<[^>]+>")

def strip_prefix_from_line(line: str) -> str:
    original = line.rstrip('\n')
    if not original.strip():
        return ''  # preserve blank as empty
    for rx in INSTR_LINE_REGEXES:
        m = rx.match(original)
        if m:
            # Group 3 for first regex is the rest (mnemonic+operands)
            # Group 2 for second regex is the rest
            if len(m.groups()) == 3:
                tail = m.group(3)
            else:
                tail = m.group(2)
            # Normalize tabs -> single space groups, but keep inner operand commas
            tail = tail.replace('\t', ' ')
            tail = WS_COLLAPSE.sub(' ', tail).strip()
            # Remove inline comment starting with '#'
            hash_pos = tail.find('#')
            if hash_pos != -1:
                tail = tail[:hash_pos].rstrip()
            # Remove angle bracket annotations like <symbol+0x76>
            tail = ANGLE_ANNOT.sub('', tail).strip()
            return tail
    # If it already looks stripped (no leading address colon pattern), still remove trailing comment
    stripped = original.strip()
    hash_pos = stripped.find('#')
    if hash_pos != -1:
        stripped = stripped[:hash_pos].rstrip()
    stripped = ANGLE_ANNOT.sub('', stripped).strip()
    return stripped

def process_block_file(path: Path, dry_run=False) -> int:
    with path.open('r') as f:
        lines = f.readlines()
    stripped = [strip_prefix_from_line(l) for l in lines]
    # Remove possible leading/trailing empty lines produced by stripping (optional decision: keep order)
    # Here we keep exact line count except we ensure newline termination.
    if not dry_run:
        with path.open('w') as f:
            for s in stripped:
                f.write(s + '\n')
    return len(stripped)

def iter_block_files(sections_dir: Path):
    # If the path itself contains numeric block files (single section dir case)
    contains_blocks = any(p.is_file() and p.name.endswith('.txt') and p.stem.isdigit() for p in sections_dir.iterdir())
    if contains_blocks:
        for candidate in sections_dir.iterdir():
            if candidate.is_file() and candidate.name.endswith('.txt') and candidate.stem.isdigit():
                yield candidate
        return
    # Otherwise treat each subdirectory as a section
    for section in sections_dir.iterdir():
        if section.is_dir():
            for candidate in section.iterdir():
                if candidate.is_file() and candidate.name.endswith('.txt') and candidate.stem.isdigit():
                    yield candidate

def main():
    parser = argparse.ArgumentParser(description='Strip address/machine-code prefixes, # comments, and <symbol> annotations from basic block files in-place.')
    parser.add_argument('--sections-dir', default='SSA/sections', help='Root sections directory (relative or absolute).')
    parser.add_argument('--dry-run', action='store_true', help='Do not modify files, just report what would be done.')
    args = parser.parse_args()

    root = Path(args.sections_dir).resolve()
    if not root.exists():
        print(f'[ERROR] Sections dir not found: {root}')
        return 1

    count_files = 0
    total_lines = 0
    for file_path in iter_block_files(root):
        lines = process_block_file(file_path, dry_run=args.dry_run)
        count_files += 1
        total_lines += lines
    action = 'Would modify' if args.dry_run else 'Modified'
    print(f'{action} {count_files} files, total {total_lines} lines processed.')
    return 0

if __name__ == '__main__':
    raise SystemExit(main())
