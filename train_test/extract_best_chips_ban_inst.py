#!/usr/bin/env python3
"""
Extract best chips for num_chips=3,4,5 and generate ban_inst lists.
For the pareto point with minimum area_x_latency in each setting,
compute ban_inst = RV32IM - chip_instructions for each chip.
"""

import json
import sys
from pathlib import Path

# Import instruction set from local util
from util import ALL_INSTRUCTIONS

SCALES_3="0 0.0005 0.001 0.002 0.005 0.01 0.1 0.5 1"
SCALES_4="0 0.0005 0.001 0.003 0.01 0.3 1"
SCALES_5="0 0.0005 0.003 0.01 0.3 1"

SCALES_MAP = {
    3: SCALES_3,
    4: SCALES_4,
    5: SCALES_5
}

def find_best_chip_configs(input_file: Path, output_file: Path):
    """
    Extract best chip configurations and generate ban_inst lists.
    
    Args:
        input_file: Path to pareto_curves_train_best_chips.json
        output_file: Path to output JSON file
    """
    # Load input JSON
    with open(input_file, 'r') as f:
        data = json.load(f)
    
    results = {}
    
    # Process num_chips = 3, 4, 5
    for num_chips in [3, 4, 5]:
        key = f"num_chip_{num_chips}"
        
        if key not in data:
            print(f"Warning: {key} not found in input file", file=sys.stderr)
            continue
        
        chip_data = data[key]
        pareto_combos = chip_data.get('pareto_combos', [])
        
        if not pareto_combos:
            print(f"Warning: No pareto_combos found for {key}", file=sys.stderr)
            continue
        
        # Find the combo with minimum area_x_latency
        best_combo = min(pareto_combos, key=lambda x: x['area_x_latency'])
        
        # Extract chip information
        chip_instructions = best_combo['chip_instructions']
        chip_ban_inst = {}
        
        for chip_name, instructions in chip_instructions.items():
            # Convert to set with capitalized instruction names
            inst_set = {inst.capitalize() for inst in instructions}
            
            # Compute ban_inst = ALL_INSTRUCTIONS - chip_instructions
            ban_inst = sorted(list(ALL_INSTRUCTIONS - inst_set))
            chip_ban_inst[chip_name] = ban_inst
        
        # Store results for this num_chips setting
        results[key] = {
            'scales': SCALES_MAP[num_chips],
            'chip_ban_inst': chip_ban_inst
        }
        
        # Print summary
        print(f"\n{key}:")
        print(f"  Best area_x_latency: {best_combo['area_x_latency']:.4f}")
        for chip_name, ban_inst in chip_ban_inst.items():
            inst_count = len(chip_instructions[chip_name])
            print(f"    {chip_name}: {inst_count} instructions, {len(ban_inst)} banned")
    
    # Write output JSON
    with open(output_file, 'w') as f:
        json.dump(results, f, indent=2)
    
    print(f"\n✓ Results written to {output_file}")
    print(f"  Total instructions: {len(ALL_INSTRUCTIONS)}")
    return results


def main():
    # Set file paths
    script_dir = Path(__file__).parent
    input_file = script_dir / 'pareto_curves_train_best_chips.json'
    output_file = script_dir / 'best_chips_ban_inst.json'
    
    if not input_file.exists():
        print(f"Error: Input file not found: {input_file}", file=sys.stderr)
        sys.exit(1)
    
    # Process the data
    find_best_chip_configs(input_file, output_file)


if __name__ == '__main__':
    main()
