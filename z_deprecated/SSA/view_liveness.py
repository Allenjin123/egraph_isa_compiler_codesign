#!/usr/bin/env python3
"""
View Liveness Analysis Results
"""

import json
import argparse
from pathlib import Path
from typing import Dict


def load_liveness(liveness_file: Path) -> Dict:
    """Load liveness data"""
    with open(liveness_file, 'r') as f:
        return json.load(f)


def load_cfg(cfg_file: Path) -> Dict:
    """Load CFG data"""
    with open(cfg_file, 'r') as f:
        return json.load(f)


def print_summary(liveness: Dict, cfg_data: Dict):
    """Print summary"""
    cfg = cfg_data['cfg']
    
    print(f"\n{'='*70}")
    print("Liveness Analysis Summary")
    print(f"{'='*70}\n")
    
    # Basic information
    num_blocks = len(liveness)
    entry_blocks = [bid for bid, info in cfg.items() if not info['predecessors']]
    exit_blocks = [bid for bid, info in cfg.items() if not info['successors']]
    
    print(f"Number of blocks: {num_blocks}")
    print(f"Entry blocks: {entry_blocks}")
    print(f"Exit blocks: {exit_blocks}")
    print()
    
    # Statistics
    avg_live_in = sum(len(info['LIVE_IN']) for info in liveness.values()) / num_blocks
    avg_live_out = sum(len(info['LIVE_OUT']) for info in liveness.values()) / num_blocks
    avg_free = sum(len(info['FREE_at_exit']) for info in liveness.values()) / num_blocks
    
    max_live_in = max(len(info['LIVE_IN']) for info in liveness.values())
    max_live_out = max(len(info['LIVE_OUT']) for info in liveness.values())
    min_free = min(len(info['FREE_at_exit']) for info in liveness.values())
    
    print("Register Pressure Statistics:")
    print(f"  Average LIVE_IN:  {avg_live_in:5.1f} registers")
    print(f"  Average LIVE_OUT: {avg_live_out:5.1f} registers")
    print(f"  Average free:     {avg_free:5.1f} registers")
    print()
    print(f"  Max LIVE_IN:  {max_live_in} registers")
    print(f"  Max LIVE_OUT: {max_live_out} registers")
    print(f"  Min free:     {min_free} registers")
    print()


def print_block_detail(block_id: int, liveness: Dict, cfg: Dict, show_free=True):
    """Print detailed information for a single block"""
    block_id_str = str(block_id)
    
    if block_id_str not in liveness:
        print(f"Error: Block {block_id} does not exist")
        return
    
    info = liveness[block_id_str]
    cfg_info = cfg[block_id_str]
    
    print(f"\n{'='*70}")
    print(f"Block {block_id}")
    print(f"{'='*70}")
    print(f"Start address: {cfg_info['start_address']}")
    print(f"Terminator type: {cfg_info['terminator_type']}")
    if cfg_info['jump_target']:
        print(f"Jump target: {cfg_info['jump_target']}")
    print(f"Predecessors: {cfg_info['predecessors']}")
    print(f"Successors:   {cfg_info['successors']}")
    print()
    
    print(f"LIVE_IN  ({len(info['LIVE_IN']):2d}): {', '.join(info['LIVE_IN'])}")
    print(f"LIVE_OUT ({len(info['LIVE_OUT']):2d}): {', '.join(info['LIVE_OUT'])}")
    print()
    
    print(f"GEN  ({len(info['GEN']):2d}): {', '.join(info['GEN'])}")
    print(f"KILL ({len(info['KILL']):2d}): {', '.join(info['KILL'])}")
    
    if show_free:
        print()
        print(f"FREE_at_exit ({len(info['FREE_at_exit']):2d}): {', '.join(info['FREE_at_exit'])}")
    
    print()


def print_all_blocks(liveness: Dict, cfg_data: Dict, max_blocks=None, show_free=False):
    """Print information for all blocks"""
    cfg = cfg_data['cfg']
    
    block_ids = sorted([int(bid) for bid in liveness.keys()])
    if max_blocks:
        block_ids = block_ids[:max_blocks]
    
    for block_id in block_ids:
        print_block_detail(block_id, liveness, cfg, show_free)
    
    if max_blocks and max_blocks < len(liveness):
        print(f"... {len(liveness) - max_blocks} more blocks not shown")


def find_high_pressure_blocks(liveness: Dict, cfg_data: Dict, threshold=15):
    """Find blocks with high register pressure"""
    cfg = cfg_data['cfg']
    high_pressure = []
    
    for block_id_str, info in liveness.items():
        live_out_count = len(info['LIVE_OUT'])
        if live_out_count >= threshold:
            high_pressure.append((int(block_id_str), live_out_count))
    
    if high_pressure:
        print(f"\n{'='*70}")
        print(f"High Register Pressure Blocks (LIVE_OUT >= {threshold})")
        print(f"{'='*70}\n")
        
        high_pressure.sort(key=lambda x: x[1], reverse=True)
        for block_id, count in high_pressure:
            block_id_str = str(block_id)
            cfg_info = cfg[block_id_str]
            print(f"Block {block_id:3d}: {count:2d} live registers "
                  f"[{cfg_info['terminator_type']:12s}] "
                  f"@ {cfg_info['start_address']}")
        print()


def main():
    parser = argparse.ArgumentParser(
        description='View Liveness Analysis Results',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # View summary
  python view_liveness.py outputs/dhrystone.riscv/sections/__umoddi3/
  
  # View specific block
  python view_liveness.py outputs/dhrystone.riscv/sections/__umoddi3/ --block 0
  
  # View all blocks
  python view_liveness.py outputs/dhrystone.riscv/sections/__umoddi3/ --all
  
  # View first 10 blocks
  python view_liveness.py outputs/dhrystone.riscv/sections/__umoddi3/ --all --max 10
  
  # View high register pressure blocks
  python view_liveness.py outputs/dhrystone.riscv/sections/__umoddi3/ --pressure 12
        '''
    )
    
    parser.add_argument('section_path', help='Section directory path')
    parser.add_argument('--block', type=int, help='View specific block')
    parser.add_argument('--all', action='store_true', help='View all blocks')
    parser.add_argument('--max', type=int, help='Maximum number of blocks to display')
    parser.add_argument('--free', action='store_true', help='Show free registers')
    parser.add_argument('--pressure', type=int, metavar='N', 
                       help='Find high pressure blocks with LIVE_OUT >= N')
    
    args = parser.parse_args()
    
    section_path = Path(args.section_path)
    liveness_file = section_path / 'liveness.json'
    cfg_file = section_path / 'cfg.json'
    
    if not liveness_file.exists():
        print(f"Error: liveness.json not found: {liveness_file}")
        print("Please run first: python analyze_liveness.py")
        return 1
    
    if not cfg_file.exists():
        print(f"Error: cfg.json not found: {cfg_file}")
        return 1
    
    liveness = load_liveness(liveness_file)
    cfg_data = load_cfg(cfg_file)
    
    # Default: show summary
    print_summary(liveness, cfg_data)
    
    # View specific block
    if args.block is not None:
        print_block_detail(args.block, liveness, cfg_data['cfg'], args.free)
    
    # View all blocks
    if args.all:
        print_all_blocks(liveness, cfg_data, args.max, args.free)
    
    # Find high pressure blocks
    if args.pressure:
        find_high_pressure_blocks(liveness, cfg_data, args.pressure)
    
    return 0


if __name__ == "__main__":
    import sys
    sys.exit(main())

