#!/usr/bin/env python3
"""
Visualize Control Flow Graph (CFG)
Display CFG structure in text format
"""

import json
import argparse
from pathlib import Path
from typing import Dict, List, Set


def load_cfg(cfg_file: Path) -> Dict:
    """Load CFG JSON file"""
    with open(cfg_file, 'r') as f:
        return json.load(f)


def print_cfg_summary(cfg_data: Dict):
    """Print CFG summary information"""
    cfg = cfg_data['cfg']
    
    print(f"\n{'='*60}")
    print("Control Flow Graph (CFG) Summary")
    print(f"{'='*60}\n")
    
    # Basic information
    num_blocks = len(cfg)
    entry_blocks = [bid for bid, info in cfg.items() if not info['predecessors']]
    exit_blocks = [bid for bid, info in cfg.items() if not info['successors']]
    
    print(f"Number of blocks: {num_blocks}")
    print(f"Entry blocks: {entry_blocks}")
    print(f"Exit blocks: {exit_blocks}")
    print()
    
    # Statistics of terminator instruction types
    terminator_stats = {}
    for bid, info in cfg.items():
        term_type = info['terminator_type']
        terminator_stats[term_type] = terminator_stats.get(term_type, 0) + 1
    
    print("Terminator Instruction Type Statistics:")
    for term_type, count in sorted(terminator_stats.items()):
        print(f"  {term_type:15s}: {count:3d} blocks")
    print()


def print_cfg_blocks(cfg_data: Dict, max_blocks=None, show_addresses=True):
    """Print information for all basic blocks"""
    cfg = cfg_data['cfg']
    
    print(f"{'='*60}")
    print("Basic Block Details")
    print(f"{'='*60}\n")
    
    block_ids = sorted([int(bid) for bid in cfg.keys()])
    if max_blocks:
        block_ids = block_ids[:max_blocks]
    
    for bid in block_ids:
        bid_str = str(bid)
        info = cfg[bid_str]
        
        print(f"Block {bid}:")
        if show_addresses:
            print(f"  Start address: {info['start_address']}")
        print(f"  Terminator type: {info['terminator_type']}")
        if info['jump_target']:
            print(f"  Jump target: {info['jump_target']}")
        print(f"  Predecessors: {info['predecessors']}")
        print(f"  Successors: {info['successors']}")
        print()
    
    if max_blocks and max_blocks < len(cfg):
        print(f"... {len(cfg) - max_blocks} more blocks not shown")
        print()


def print_cfg_graph(cfg_data: Dict, format='ascii'):
    """Print CFG in graphical format"""
    cfg = cfg_data['cfg']
    
    print(f"{'='*60}")
    print("Control Flow Graph")
    print(f"{'='*60}\n")
    
    if format == 'ascii':
        # Simple ASCII art graph
        for bid in sorted([int(b) for b in cfg.keys()]):
            bid_str = str(bid)
            info = cfg[bid_str]
            
            # Block information
            term_symbol = {
                'conditional': '?',
                'unconditional': '→',
                'call': '⊙',
                'return': '⊗',
                'fallthrough': '↓'
            }.get(info['terminator_type'], ' ')
            
            print(f"┌─ Block {bid} {term_symbol} ─┐")
            print(f"│ Addr: {info['start_address']} │")
            
            # Successors
            if info['successors']:
                succ_str = ', '.join(map(str, info['successors']))
                print(f"│ → [{succ_str}]")
            else:
                print(f"│ → [EXIT]")
            
            print(f"└{'─'*20}┘")
            print()


def find_paths(cfg: Dict, start: int, end: int, max_depth=10) -> List[List[int]]:
    """Find all paths from start to end"""
    paths = []
    
    def dfs(current, path, visited):
        if len(path) > max_depth:
            return
        
        if current == end:
            paths.append(path.copy())
            return
        
        if current in visited:
            return
        
        visited.add(current)
        
        current_str = str(current)
        if current_str in cfg:
            for succ in cfg[current_str]['successors']:
                path.append(succ)
                dfs(succ, path, visited.copy())
                path.pop()
    
    dfs(start, [start], set())
    return paths


def print_paths(cfg_data: Dict, start: int, end: int):
    """Print all paths from start to end"""
    cfg = cfg_data['cfg']
    paths = find_paths(cfg, start, end)
    
    print(f"\n{'='*60}")
    print(f"Paths from Block {start} to Block {end}")
    print(f"{'='*60}\n")
    
    if not paths:
        print("No paths found")
    else:
        print(f"Found {len(paths)} path(s):\n")
        for i, path in enumerate(paths, 1):
            print(f"Path {i}: {' → '.join(map(str, path))}")
    print()


def main():
    parser = argparse.ArgumentParser(
        description='Visualize Control Flow Graph',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  # Display CFG summary
  python visualize_cfg.py outputs/dhrystone.riscv/sections/__umoddi3/cfg.json
  
  # Display detailed information for all blocks
  python visualize_cfg.py outputs/dhrystone.riscv/sections/__umoddi3/cfg.json --blocks
  
  # Display first 10 blocks
  python visualize_cfg.py outputs/dhrystone.riscv/sections/__umoddi3/cfg.json --blocks --max 10
  
  # Find paths
  python visualize_cfg.py outputs/dhrystone.riscv/sections/__umoddi3/cfg.json --path 0 21
  
  # Display graph
  python visualize_cfg.py outputs/dhrystone.riscv/sections/__umoddi3/cfg.json --graph
        '''
    )
    
    parser.add_argument('cfg_file', help='CFG JSON file path')
    parser.add_argument('--blocks', action='store_true', help='Display detailed information for all blocks')
    parser.add_argument('--graph', action='store_true', help='Display graphical representation')
    parser.add_argument('--max', type=int, help='Maximum number of blocks to display')
    parser.add_argument('--path', nargs=2, type=int, metavar=('START', 'END'),
                       help='Find paths from START to END')
    parser.add_argument('--no-addr', action='store_true', help='Do not show addresses')
    
    args = parser.parse_args()
    
    cfg_file = Path(args.cfg_file)
    if not cfg_file.exists():
        print(f"Error: CFG file not found: {cfg_file}")
        return 1
    
    cfg_data = load_cfg(cfg_file)
    
    # Default: show summary
    print_cfg_summary(cfg_data)
    
    if args.blocks:
        print_cfg_blocks(cfg_data, args.max, not args.no_addr)
    
    if args.graph:
        print_cfg_graph(cfg_data)
    
    if args.path:
        start, end = args.path
        print_paths(cfg_data, start, end)
    
    return 0


if __name__ == "__main__":
    import sys
    sys.exit(main())

