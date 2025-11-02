#!/bin/bash
# Test all SSA processing tools
# Usage: ./test_all_tools.sh

set -e  # Exit on error

echo "=========================================="
echo "SSA Toolchain Complete Test"
echo "=========================================="
echo ""

# Enter SSA directory
cd "$(dirname "$0")"

# Clean old outputs
echo "Cleaning old test outputs..."
rm -rf outputs/bitcnts_small_O3.riscv 2>/dev/null || true
echo "✓ Done"
echo ""

# ========================================
# Step 1: Basic Processing
# ========================================
echo "=========================================="
echo "Step 1: Process dump file"
echo "=========================================="
python process_dump.py ../benchmark/automotive/bitcount/bitcnts_small_O3.dump -v -s main __adddf3
echo ""

# ========================================
# Step 2: Statistical Analysis
# ========================================
echo "=========================================="
echo "Step 2: Basic Block Statistics Analysis"
echo "=========================================="
python analyze_blocks.py outputs/bitcnts_small_O3 | head -40
echo ""

# ========================================
# Step 3: ⭐ One-Click Analysis (CFG + DEF/USE + Liveness)
# ========================================
echo "=========================================="
echo "Step 3: One-Click Analysis (CFG + DEF/USE + Liveness)"
echo "=========================================="
python analyze_all.py outputs/bitcnts_small_O3/sections/ -v
echo ""

# ========================================
# Step 4: View Analysis Results
# ========================================
echo "=========================================="
echo "Step 4: View Liveness Analysis Results"
echo "=========================================="
python view_liveness.py outputs/bitcnts_small_O3/sections/main/ --block 0
echo ""

# ========================================
# Step 5: Visualize CFG
# ========================================
echo "=========================================="
echo "Step 5: Visualize CFG"
echo "=========================================="
python visualize_cfg.py outputs/bitcnts_small_O3/sections/main/cfg.json --blocks --max 3
echo ""

# ========================================
# Step 6: SSA Conversion
# ========================================
echo "=========================================="
echo "Step 6: SSA Conversion"
echo "=========================================="
python convert_to_ssa.py outputs/bitcnts_small_O3/ -v
echo ""

# ========================================
# Step 7: Compare Before/After SSA
# ========================================
echo "=========================================="
echo "Step 7: Compare Before/After SSA Conversion"
echo "=========================================="
echo "Original Basic Block (first 5 lines):"
head -5 outputs/bitcnts_small_O3/sections/main/basic_blocks/0.txt
echo ""
echo "SSA Form (first 5 lines):"
head -5 outputs/bitcnts_small_O3/sections/main/basic_blocks_ssa/0.txt
echo ""

# ========================================
# Test Complete
# ========================================
echo "=========================================="
echo "✓ All Tools Tested Successfully!"
echo "=========================================="
echo ""
echo "Generated files located at: outputs/bitcnts_small_O3/"
echo ""
echo "Main output files:"
echo "  - outputs/bitcnts_small_O3/sections/main/cfg.json"
echo "  - outputs/bitcnts_small_O3/sections/main/defuse.json"
echo "  - outputs/bitcnts_small_O3/sections/main/liveness.json"
echo "  - outputs/bitcnts_small_O3/sections/main/basic_blocks/*.txt"
echo "  - outputs/bitcnts_small_O3/sections/main/basic_blocks_ssa/*.txt"
echo ""

