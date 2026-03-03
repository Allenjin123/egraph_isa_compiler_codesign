"""
Randomly pick one program from output/frontend/,
merge all its basic_blocks/*.txt (sorted numerically) into a single file,
and write it to output/test/<program_name>/merged_basic_blocks.txt.
"""

import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "frontend"))
from convert_to_ssa import process_program_directory
from pathlib import Path

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FRONTEND_DIR = os.path.join(ROOT, "output", "frontend")



def merge_basic_blocks(program: str) -> str:
    blocks_dir = os.path.join(FRONTEND_DIR, program, "basic_blocks")

    txt_files = [f for f in os.listdir(blocks_dir) if f.endswith(".txt")]
    txt_files.sort(key=lambda f: int(os.path.splitext(f)[0]))

    lines = []
    for fname in txt_files:
        fpath = os.path.join(blocks_dir, fname)
        with open(fpath, "r") as f:
            for line in f:
                rstripped = line.rstrip('\n')
                if rstripped.strip():
                    lines.append(rstripped)

    return "\n".join(lines)


DEFAULT_PROGRAM = "libud"


def main():
    chosen = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_PROGRAM
    print(f"Selected program: {chosen}")

    merged = merge_basic_blocks(chosen)

    out_dir = os.path.join(FRONTEND_DIR, "test_merge", "basic_blocks")
    os.makedirs(out_dir, exist_ok=True)

    out_file = os.path.join(out_dir, "0.txt")
    with open(out_file, "w") as f:
        f.write(merged)

    print(f"Merged basic_blocks written to: {out_file}")

    print("Running SSA conversion...")
    count = process_program_directory(Path(os.path.join(FRONTEND_DIR, "test_merge")), verbose=True)
    print(f"SSA conversion done: {count} instructions -> output/frontend/test_merge/basic_blocks_ssa/0.txt")


if __name__ == "__main__":
    main()
