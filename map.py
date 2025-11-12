#!/usr/bin/env python3
import re, sys
from collections import defaultdict

if len(sys.argv) != 3:
    print("Usage: python verify_objdump_mapping.py <source.s> <objdump_dl.txt>")
    sys.exit(1)

src_path, dis_path = sys.argv[1], sys.argv[2]

SRC_MARKER_RE = re.compile(r'^(.+\.(?:s|S)):(\d+)$')
DISASM_INSTR_RE = re.compile(r'^\s*([0-9a-fA-F]+):\s+([0-9a-fA-F]{4,})\s+(.*)$')
FUNC_LABEL_RE = re.compile(r'^[0-9a-fA-F]+\s+<[^>]+>:$')

mapping = defaultdict(list)
current_src_line = None

with open(dis_path, encoding="utf-8", errors="replace") as f:
    for lineno, line in enumerate(f, start=1):
        line = line.rstrip("\n")

        # Case 1: A source line marker (e.g. ".../file.s:2605")
        msrc = SRC_MARKER_RE.match(line.strip())
        if msrc:
            current_src_line = int(msrc.group(2))
            continue

        # Case 2: A function label, e.g. "000109d4 <register_fini>:"
        if FUNC_LABEL_RE.match(line.strip()):
            current_src_line = None
            continue

        # Case 3: A disassembly instruction line
        md = DISASM_INSTR_RE.match(line)
        if md and current_src_line is not None:
            addr, instr_text = md.group(1), md.group(3).strip()
            mapping[current_src_line].append((addr, instr_text, lineno))

# Determine valid instruction lines in source
def is_instr(line):
    s = line.strip()
    return bool(s and not s.startswith('#') and not s.endswith(':') and not s.startswith('.'))

zero, multi, total, single = [], [], 0, 0

with open(src_path, encoding="utf-8", errors="replace") as f:
    for i, line in enumerate(f, start=1):
        if not is_instr(line): continue
        total += 1
        hits = mapping.get(i, [])
        if len(hits) == 0:
            zero.append((i, line))
        elif len(hits) == 1:
            single += 1
        else:
            multi.append((i, line, hits))

print(f"Checked {total} instruction lines")
print(f"  ✓ Exactly 1 match: {single}")
print(f"  ⚠ 0 matches: {len(zero)}")
print(f"  ⚠ >1 matches: {len(multi)}\n")

if zero:
    print("=== 0-match lines ===")
    for ln, txt in zero[:10]:
        print(f"{src_path}:{ln} — {txt.strip()}")
    if len(zero) > 10:
        print(f"... ({len(zero)-10} more)")
    print()

if multi:
    print("=== Multi-match lines ===")
    for ln, txt, hits in multi[:5]:
        print(f"{src_path}:{ln} — {txt.strip()} (found {len(hits)} matches)")
        for addr, instr, lno in hits[:10]:
            print(f"    → {addr}: {instr} (disasm line {lno})")
        print()
    if len(multi) > 5:
        print(f"... ({len(multi)-5} more)")
