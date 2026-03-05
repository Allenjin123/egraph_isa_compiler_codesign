#!/bin/bash
# ============================================================================
# Run test set programs for all unique chips in best_chips_ban_inst.json
#
# Output layout: train_test/output/chip_N/
#   Chips are deduplicated by (chip_key, ban_ops) across all num_chip groups.
#   Each chip is generated in a temp dir under the repo root output/, then
#   moved to train_test/output/<chip_key>/ when done.
#
# Usage: ./train_test/run_test_set.sh [options forwarded to run_multi_scale_variants.sh]
# ============================================================================

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"
MAIN_SCRIPT="$REPO_DIR/run_multi_scale_variants.sh"
JSON="$SCRIPT_DIR/best_chips_ban_inst.json"
OUTPUT_BASE="$SCRIPT_DIR/output"
REPO_OUTPUT="$REPO_DIR/output"

# Build deduplicated set: chip_key -> (scales, ban_ops, test_progs)
# Keyed by chip_key; first occurrence wins for scales/test_progs.
# If the same chip_key appears in multiple num_chip groups with identical
# ban_ops, it is run only once.
ENTRIES=$(JSON="$JSON" python3 - <<'PYEOF'
import json, os

with open(os.environ["JSON"]) as f:
    data = json.load(f)

seen = {}  # chip_key -> (scales, ban_ops, test_progs)

for num_key, num_val in data.items():
    scales = num_val["scales"]
    test_set = " ".join(num_val["test_set"])
    for chip_key, ban_list in num_val["chip_ban_inst"].items():
        ban_ops = " ".join(ban_list)
        if chip_key not in seen:
            seen[chip_key] = (scales, ban_ops, test_set)

for chip_key, (scales, ban_ops, test_progs) in seen.items():
    print(f"{chip_key}|{scales}|{ban_ops}|{test_progs}")
PYEOF
)

echo "Unique chips to run:"
echo "$ENTRIES" | while IFS='|' read -r chip_key scales ban_ops test_progs; do
    echo "  $chip_key  ban='$ban_ops'"
done
echo ""

# Rename existing repo output/ to output__old/ to start clean
if [ -d "$REPO_OUTPUT" ]; then
    OLD_DIR="${REPO_OUTPUT}__old"
    echo "Renaming $REPO_OUTPUT -> $OLD_DIR"
    mv "$REPO_OUTPUT" "$OLD_DIR"
fi

mkdir -p "$OUTPUT_BASE"

while IFS='|' read -r chip_key scales ban_ops test_progs; do
    echo "========================================"
    echo "Running: $chip_key"
    echo "  Output : $REPO_OUTPUT  ->  $OUTPUT_BASE/$chip_key"
    echo "  Scales : $scales"
    echo "  Ban    : $ban_ops"
    echo "  Programs: $test_progs"
    echo "========================================"

    read -ra PROG_ARRAY <<< "$test_progs"

    bash "$MAIN_SCRIPT" \
        "${PROG_ARRAY[@]}" \
        -s "$scales" \
        --ban-ops "$ban_ops" \
        "$@"

    echo "Moving $REPO_OUTPUT -> $OUTPUT_BASE/$chip_key"
    mv "$REPO_OUTPUT" "$OUTPUT_BASE/$chip_key"

    echo ""
done <<< "$ENTRIES"

echo "All done. Output under: $OUTPUT_BASE"