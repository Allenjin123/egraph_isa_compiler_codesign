#!/usr/bin/env python3
"""
Incremental Revert and Test Script

Reverts each hunk from diff one at a time, testing after each revert.
This identifies which rewrites break correctness.

Usage:
    python incremental_revert.py <diff_file> --verify-script <script>
"""

import sys
import re
from pathlib import Path
import shutil
import subprocess
import argparse


def parse_diff_hunks(diff_path):
    """Parse unified diff into hunks"""
    with open(diff_path, 'r') as f:
        lines = f.readlines()

    clean_file = None
    rewrite_file = None
    hunks = []

    i = 0
    while i < len(lines):
        line = lines[i]

        if line.startswith('---'):
            clean_file = line.split('\t')[0].replace('--- ', '').strip()
        elif line.startswith('+++'):
            rewrite_file = line.split('\t')[0].replace('+++ ', '').strip()
        elif line.startswith('@@'):
            match = re.match(r'@@ -(\d+),?(\d+)? \+(\d+),?(\d+)? @@', line)
            if match:
                old_start = int(match.group(1))
                new_start = int(match.group(3))

                old_lines = []
                new_lines = []

                i += 1
                while i < len(lines) and not lines[i].startswith('@@'):
                    if lines[i].startswith('---') or lines[i].startswith('+++'):
                        break
                    if lines[i].startswith('-'):
                        old_lines.append(lines[i][1:])
                    elif lines[i].startswith('+'):
                        new_lines.append(lines[i][1:])
                    elif not lines[i].startswith(' '):
                        break
                    i += 1

                # Add hunk to list
                if old_lines or new_lines:
                    hunks.append({
                        'old_start': old_start,
                        'new_start': new_start,
                        'old_lines': old_lines,
                        'new_lines': new_lines
                    })
                continue

        i += 1

    return clean_file, rewrite_file, hunks


def apply_hunk_revert(file_lines, hunk):
    """
    Replace new_lines with old_lines at the specified location

    Returns:
        Modified file lines
    """
    new_start_idx = hunk['new_start'] - 1
    skip_count = len(hunk['new_lines'])

    result = file_lines[:new_start_idx]
    result.extend(hunk['old_lines'])
    result.extend(file_lines[new_start_idx + skip_count:])

    return result


def run_verification(file_path, verify_script=None):
    """
    Run verification on the file

    Returns:
        True if passes, False otherwise
    """
    if not verify_script:
        # No verification - just return True
        return True

    try:
        result = subprocess.run(
            [verify_script, file_path],
            capture_output=True,
            text=True,
            timeout=300
        )
        return result.returncode == 0
    except Exception as e:
        print(f"    Verification error: {e}")
        return False


def main():
    parser = argparse.ArgumentParser(description='Incremental revert with testing')
    parser.add_argument('diff_file', help='Path to .diff file')
    parser.add_argument('--verify-script', help='Optional verification script')
    parser.add_argument('--auto', action='store_true', help='Auto-accept all reverts without verification')

    args = parser.parse_args()

    diff_file = args.diff_file

    if not Path(diff_file).exists():
        print(f"Error: Diff file not found: {diff_file}")
        return 1

    print(f"Parsing diff: {diff_file}")
    clean_file, rewrite_file, hunks = parse_diff_hunks(diff_file)

    print(f"  Clean file: {clean_file}")
    print(f"  Rewrite file: {rewrite_file}")
    print(f"  Found {len(hunks)} hunks")

    if not Path(rewrite_file).exists():
        print(f"Error: Rewrite file not found: {rewrite_file}")
        return 1

    # Backup
    backup_file = rewrite_file + '.incremental_backup'
    shutil.copy(rewrite_file, backup_file)
    print(f"  Backup: {backup_file}\n")

    # Read file
    with open(rewrite_file, 'r') as f:
        file_lines = f.readlines()

    print("="*60)
    print("Incremental Revert Process")
    print("="*60)

    reverted_count = 0
    failed_count = 0

    for i, hunk in enumerate(hunks, 1):
        old_count = len(hunk['old_lines'])
        new_count = len(hunk['new_lines'])

        print(f"\n[{i}/{len(hunks)}] Hunk @{hunk['new_start']}: -{old_count} +{new_count}")

        # Apply revert
        reverted_lines = apply_hunk_revert(file_lines, hunk)

        # Save temporary version
        temp_file = rewrite_file + '.temp'
        with open(temp_file, 'w') as f:
            f.writelines(reverted_lines)

        # Verify
        if args.auto or run_verification(temp_file, args.verify_script):
            print(f"  ✓ Revert applied")
            file_lines = reverted_lines
            reverted_count += 1
        else:
            print(f"  ✗ Verification failed - keeping original")
            failed_count += 1

    # Write final result
    with open(rewrite_file, 'w') as f:
        f.writelines(file_lines)

    # Cleanup temp
    if Path(temp_file).exists():
        Path(temp_file).unlink()

    print("\n" + "="*60)
    print("Complete!")
    print("="*60)
    print(f"  Reverted: {reverted_count}/{len(hunks)} hunks")
    print(f"  Failed: {failed_count}/{len(hunks)} hunks")
    print(f"  Modified: {rewrite_file}")
    print(f"  Backup: {backup_file}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
