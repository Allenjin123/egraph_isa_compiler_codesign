#!/bin/bash
# 1. Patch run_egglog_all.py with large limits
# 2. Run merge_basic_blocks.py (merge + SSA)
# 3. Run saturation steps 1+2 (generate .egg files and extract eclasses)
# 4. Run run_sat_extract.sh on test_merge (step 3 + ILP extraction)
# 5. Restore run_egglog_all.py to original values

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
EGGLOG_ALL="$PROJECT_ROOT/Saturation/run_egglog_all.py"
ILP_SOLVER="$PROJECT_ROOT/Extractor/src/ILP/ilp_solver.py"

restore() {
    echo ""
    echo "==> Restoring run_egglog_all.py..."
    sed -i \
        "s/'--max-functions', '[^']*'/'--max-functions', '50000'/g" \
        "$EGGLOG_ALL"
    sed -i \
        "s/'--max-calls-per-function', '[^']*'/'--max-calls-per-function', '20000'/g" \
        "$EGGLOG_ALL"
    sed -i \
        "s/timeout=[0-9]*/timeout=300/" \
        "$EGGLOG_ALL"
    echo "    Restored: max-functions=50000, max-calls-per-function=20000, timeout=300s"

    echo "==> Restoring ilp_solver.py..."
    sed -i \
        '/\"--timeout\"/{n;n;s/default=[0-9]*/default=300/}' \
        "$ILP_SOLVER"
    echo "    Restored: ilp timeout=300s"
}

trap restore EXIT INT TERM TSTP

echo "==> Patching run_egglog_all.py..."
sed -i \
    "s/'--max-functions', '[^']*'/'--max-functions', '100000000'/g" \
    "$EGGLOG_ALL"
sed -i \
    "s/'--max-calls-per-function', '[^']*'/'--max-calls-per-function', '100000000'/g" \
    "$EGGLOG_ALL"
sed -i \
    "s/timeout=[0-9]*/timeout=3600/" \
    "$EGGLOG_ALL"
echo "    max-functions=100000000, max-calls-per-function=100000000, timeout=3600s"

echo "==> Patching ilp_solver.py..."
sed -i \
    '/\"--timeout\"/{n;n;s/default=[0-9]*/default=3600/}' \
    "$ILP_SOLVER"
echo "    ilp timeout=3600s"

SAT_DIR="$PROJECT_ROOT/Saturation"
PROGRAM_DIR="$PROJECT_ROOT/output/frontend/test_merge"

# Find egglog binary (same logic as run_saturation.sh)
EGGLOG_PATH=$(which egglog 2>/dev/null)
if [ -z "$EGGLOG_PATH" ]; then
    for path in \
        "/home/allenjin/egglog/target/release/egglog" \
        "$HOME/egglog/target/release/egglog" \
        "$PROJECT_ROOT/egglog/target/release/egglog"; do
        if [ -f "$path" ]; then
            EGGLOG_PATH="$path"
            break
        fi
    done
fi
if [ -z "$EGGLOG_PATH" ]; then
    echo "Error: egglog binary not found"
    exit 1
fi

echo "==> Running merge_basic_blocks.py..."
python3 "$SCRIPT_DIR/merge_basic_blocks.py"

echo "==> Running saturation step 1 (generate .egg files)..."
python3 "$SAT_DIR/local_saturation.py" "$PROGRAM_DIR" -v

echo "==> Running saturation step 2 (extract eclasses)..."
python3 "$SAT_DIR/extract_eclasses.py" "$PROGRAM_DIR" -v --egglog "$EGGLOG_PATH"

echo "==> Running run_sat_extract.sh on test_merge (step 3 + ILP)..."
bash "$SCRIPT_DIR/run_sat_extract.sh" test_merge

echo "==> Done."
