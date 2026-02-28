#!/bin/bash
# Reconstruct assembly variants from already-extracted ILP scale outputs.
# Mimics the collect (Step 2.5) + reconstruct (Step 3) + organize (Step 4/5)
# logic in run_multi_scale_variants.sh.
#
# Usage: ./reconstruct_from_ilp_scales.sh [program_names...]
#   If no program names are given, all programs found under output/ilp/ are processed.

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
ILP_BASE="$PROJECT_ROOT/output/ilp"
FRONTEND_DIR="$PROJECT_ROOT/frontend"
BACKEND_BASE="$PROJECT_ROOT/output/backend"

# Collect programs to process
if [ $# -gt 0 ]; then
    PROGRAMS=("$@")
else
    # Auto-discover: strip _scale_* suffix, deduplicate
    mapfile -t PROGRAMS < <(ls "$ILP_BASE" | sed 's/_scale_.*//' | sort -u)
fi

echo "Programs to reconstruct: ${PROGRAMS[*]}"
echo ""

for PROGRAM in "${PROGRAMS[@]}"; do
    echo "========================================"
    echo "Processing: $PROGRAM"
    echo "========================================"

    SOL_DEST="$ILP_BASE/$PROGRAM/sol"
    mkdir -p "$SOL_DEST"

    # Clear previous collected solutions
    rm -f "$SOL_DEST"/solution_*.sol

    # Collect solution files from each scale directory, numbering them sequentially
    IDX=0
    for SCALE_DIR in $(ls -d "$ILP_BASE/${PROGRAM}_scale_"* 2>/dev/null | sort); do
        SCALE_SOL_DIR="$SCALE_DIR/$PROGRAM/sol"
        if [ ! -d "$SCALE_SOL_DIR" ]; then
            echo "  Warning: sol dir not found: $SCALE_SOL_DIR"
            continue
        fi
        for SOL in $(ls "$SCALE_SOL_DIR"/solution*.sol 2>/dev/null | sort); do
            DST="$SOL_DEST/solution_${IDX}.sol"
            cp "$SOL" "$DST"
            echo "  $(basename "$SCALE_DIR") / $(basename "$SOL") -> solution_${IDX}.sol"
            IDX=$((IDX + 1))
        done
    done

    if [ "$IDX" -eq 0 ]; then
        echo "  No solution files found for $PROGRAM, skipping."
        continue
    fi

    echo "  Collected $IDX solution(s). Running reconstruct..."
    bash "$FRONTEND_DIR/run_reconstruct.sh" "$PROGRAM" "$IDX"

    # ---- Step 4/5: Organize into output/backend/<prog>/variants/variant_N/ ----
    REWRITE_BASE="$PROJECT_ROOT/output/frontend/$PROGRAM/basic_blocks_rewrite"
    FRONTEND_OUTPUT="$PROJECT_ROOT/output/frontend/$PROGRAM"
    FINAL_OUTPUT="$BACKEND_BASE/$PROGRAM/variants"
    mkdir -p "$FINAL_OUTPUT"

    for ((i=0; i<IDX; i++)); do
        VARIANT_DIR="$FINAL_OUTPUT/variant_${i}"
        mkdir -p "$VARIANT_DIR"

        # Copy rewritten basic blocks
        SRC_BB="$REWRITE_BASE/variant_${i}"
        if [ -d "$SRC_BB" ] && ls "$SRC_BB"/*.txt &>/dev/null; then
            DST_BB="$VARIANT_DIR/basic_blocks"
            mkdir -p "$DST_BB"
            cp "$SRC_BB"/*.txt "$DST_BB/"
        else
            echo "  Warning: no basic blocks for variant_${i}"
        fi

        # Copy label mapping files
        [ -f "$FRONTEND_OUTPUT/label_to_block.json" ] && cp "$FRONTEND_OUTPUT/label_to_block.json" "$VARIANT_DIR/"
        [ -f "$FRONTEND_OUTPUT/label_metadata.json" ] && cp "$FRONTEND_OUTPUT/label_metadata.json" "$VARIANT_DIR/"
    done
    echo "  Organized $IDX variants -> $FINAL_OUTPUT"
    echo "  Done: $PROGRAM"
    echo ""
done

echo "All programs reconstructed."
