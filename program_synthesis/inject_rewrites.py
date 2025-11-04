#!/usr/bin/env python3
"""
Inject greenthumb-generated rewrite rules into Saturation/base.egg

This script safely appends the generated rewrite rules to the base egglog file,
with options for backup and dry-run.
"""

import argparse
import shutil
from pathlib import Path
from datetime import datetime


def create_backup(base_egg_path: Path) -> Path:
    """
    Create a timestamped backup of base.egg

    Args:
        base_egg_path: Path to base.egg

    Returns:
        Path to backup file
    """
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_path = base_egg_path.with_suffix(f'.egg.backup_{timestamp}')
    shutil.copy2(base_egg_path, backup_path)
    return backup_path


def read_rewrites(rewrites_path: Path) -> str:
    """
    Read greenthumb rewrite rules from file.

    Args:
        rewrites_path: Path to greenthumb_rewrites.egg

    Returns:
        Rewrite rules content as string
    """
    if not rewrites_path.exists():
        raise FileNotFoundError(f"Rewrites file not found: {rewrites_path}")

    return rewrites_path.read_text()


def inject_rewrites(base_egg_path: Path, rewrites_content: str, backup: bool = True) -> None:
    """
    Inject rewrite rules into base.egg

    Args:
        base_egg_path: Path to base.egg
        rewrites_content: Rewrite rules to inject
        backup: Whether to create backup before modifying
    """
    if not base_egg_path.exists():
        raise FileNotFoundError(f"Base egg file not found: {base_egg_path}")

    # Create backup if requested
    if backup:
        backup_path = create_backup(base_egg_path)
        print(f"Created backup: {backup_path}")

    # Read current base.egg content
    current_content = base_egg_path.read_text()

    # Check if rewrites are already injected
    if "Greenthumb-Generated Rewrite Rules" in current_content:
        print("Warning: Greenthumb rewrites appear to already be in base.egg")
        response = input("Continue anyway? (y/N): ")
        if response.lower() != 'y':
            print("Aborted.")
            return

    # Append rewrites with separator
    separator = "\n\n" + ";; " + "="*60 + "\n"
    separator += ";; INJECTED GREENTHUMB REWRITE RULES\n"
    separator += ";; " + "="*60 + "\n\n"

    new_content = current_content.rstrip() + separator + rewrites_content

    # Write updated content
    base_egg_path.write_text(new_content)
    print(f"Successfully injected {rewrites_content.count('birewrite')} rewrite rules into {base_egg_path}")


def show_preview(rewrites_content: str, num_lines: int = 20) -> None:
    """
    Show preview of what will be injected.

    Args:
        rewrites_content: Rewrite rules content
        num_lines: Number of lines to preview
    """
    lines = rewrites_content.split('\n')
    print("\n" + "="*60)
    print(f"Preview (first {num_lines} lines):")
    print("="*60)
    for i, line in enumerate(lines[:num_lines], 1):
        print(f"{i:3}: {line}")
    if len(lines) > num_lines:
        print(f"... ({len(lines) - num_lines} more lines)")
    print("="*60)
    print(f"Total: {len(lines)} lines, {rewrites_content.count('birewrite')} rewrite rules")
    print("="*60 + "\n")


def remove_injected_rewrites(base_egg_path: Path, backup: bool = True) -> bool:
    """
    Remove previously injected greenthumb rewrites from base.egg

    Args:
        base_egg_path: Path to base.egg
        backup: Whether to create backup before modifying

    Returns:
        True if rewrites were found and removed, False otherwise
    """
    if not base_egg_path.exists():
        raise FileNotFoundError(f"Base egg file not found: {base_egg_path}")

    content = base_egg_path.read_text()

    # Find the injection marker
    marker = ";; INJECTED GREENTHUMB REWRITE RULES"
    if marker not in content:
        print("No injected greenthumb rewrites found in base.egg")
        return False

    # Create backup if requested
    if backup:
        backup_path = create_backup(base_egg_path)
        print(f"Created backup: {backup_path}")

    # Split at marker and keep only the part before
    parts = content.split(";; " + "="*60 + "\n;; INJECTED GREENTHUMB REWRITE RULES")
    if len(parts) >= 2:
        # Keep everything before the injection
        new_content = parts[0].rstrip() + "\n"
        base_egg_path.write_text(new_content)
        print(f"Successfully removed injected rewrites from {base_egg_path}")
        return True
    else:
        print("Error: Could not find injection boundary")
        return False


def main():
    parser = argparse.ArgumentParser(
        description='Inject greenthumb rewrite rules into Saturation/base.egg',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Preview what will be injected (dry-run)
  python inject_rewrites.py --dry-run

  # Inject rewrites (creates backup automatically)
  python inject_rewrites.py

  # Inject without backup (not recommended)
  python inject_rewrites.py --no-backup

  # Remove previously injected rewrites
  python inject_rewrites.py --remove

  # Custom paths
  python inject_rewrites.py -r custom_rewrites.egg -b ../Saturation/base.egg

Workflow:
  1. Generate rewrites: python greenthumb_parser.py
  2. Preview injection: python inject_rewrites.py --dry-run
  3. Inject rewrites: python inject_rewrites.py
  4. Test with egglog
  5. If issues, remove: python inject_rewrites.py --remove
        '''
    )

    parser.add_argument('-r', '--rewrites',
                       default='rewrites/greenthumb_rewrites.egg',
                       help='Path to greenthumb rewrites file (default: rewrites/greenthumb_rewrites.egg)')
    parser.add_argument('-b', '--base',
                       default='../Saturation/base.egg',
                       help='Path to base.egg file (default: ../Saturation/base.egg)')
    parser.add_argument('--no-backup', action='store_true',
                       help='Skip creating backup (not recommended)')
    parser.add_argument('--dry-run', action='store_true',
                       help='Preview what will be injected without modifying files')
    parser.add_argument('--remove', action='store_true',
                       help='Remove previously injected rewrites instead of adding')
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Verbose output')

    args = parser.parse_args()

    rewrites_path = Path(args.rewrites)
    base_egg_path = Path(args.base)

    # Handle --remove flag
    if args.remove:
        print(f"Removing injected rewrites from {base_egg_path}...")
        success = remove_injected_rewrites(base_egg_path, backup=not args.no_backup)
        return 0 if success else 1

    # Read rewrites
    try:
        rewrites_content = read_rewrites(rewrites_path)
    except FileNotFoundError as e:
        print(f"Error: {e}")
        print("\nPlease run greenthumb_parser.py first to generate rewrites:")
        print("  python greenthumb_parser.py")
        return 1

    # Show preview
    if args.verbose or args.dry_run:
        show_preview(rewrites_content)

    # Dry-run mode - just preview
    if args.dry_run:
        print("DRY-RUN MODE: No files were modified.")
        print("\nTo actually inject rewrites, run without --dry-run:")
        print("  python inject_rewrites.py")
        return 0

    # Inject rewrites
    try:
        inject_rewrites(base_egg_path, rewrites_content, backup=not args.no_backup)
        print("\nSuccess! Rewrites have been injected into base.egg")

        if not args.no_backup:
            print("\nBackup created. To restore if needed:")
            print(f"  cp {base_egg_path}.backup_* {base_egg_path}")

        print("\nTo remove injected rewrites:")
        print("  python inject_rewrites.py --remove")

        return 0

    except Exception as e:
        print(f"Error: {e}")
        return 1


if __name__ == "__main__":
    exit(main())
