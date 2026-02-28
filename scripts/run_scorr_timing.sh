#!/bin/bash
# 对每个 program 运行一次 scorr（analyze_all_variants.py 单线程），
# 将总耗时写到 timing.json program 级的 scorr_ms，
# 并将均摊耗时写到每个 variant 的 extraction_ms 下面的 scorr_ms。
#
# 用法:
#   ./run_scorr_timing.sh                      # 跑 timing.json 里所有程序
#   ./run_scorr_timing.sh dijkstra_small_O3    # 只跑指定程序
#   ./run_scorr_timing.sh prog1 prog2 ...

set -uo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
TIMING_JSON="$SCRIPT_DIR/timing.json"
BACKEND_OUTPUT="$PROJECT_ROOT/output/backend"

GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ ! -f "$TIMING_JSON" ]; then
    echo -e "${RED}错误: 找不到 $TIMING_JSON${NC}"
    exit 1
fi

# 如果指定了程序名就用指定的，否则从 timing.json 读取所有程序
if [ $# -gt 0 ]; then
    PROGRAMS=("$@")
else
    mapfile -t PROGRAMS < <(python3 -c "
import json
with open('$TIMING_JSON') as f:
    d = json.load(f)
for p in d['programs']:
    print(p)
")
fi

TOTAL=${#PROGRAMS[@]}
echo -e "${CYAN}========================================"
echo -e "  Scorr 计时"
echo -e "  共 $TOTAL 个程序（单线程）"
echo -e "========================================${NC}"
echo ""

for PROG in "${PROGRAMS[@]}"; do
    VARIANTS_DIR="$BACKEND_OUTPUT/$PROG/variants"
    OUTPUT_DIR="$BACKEND_OUTPUT/$PROG"

    if [ ! -d "$VARIANTS_DIR" ]; then
        echo -e "${YELLOW}跳过 $PROG: 找不到 variants 目录 $VARIANTS_DIR${NC}"
        echo -e "${YELLOW}  请先运行 reconstruct_from_ilp_scales.sh${NC}"
        continue
    fi

    echo -e "${CYAN}$PROG${NC}"
    echo -e "  -> scorr (所有 variants 一次)..."

    START=$(date +%s%N)
    if python3 "$PROJECT_ROOT/analyze_all_variants.py" \
            "$VARIANTS_DIR" "$PROG" "$OUTPUT_DIR" 1 \
            > /tmp/scorr_${PROG}.log 2>&1; then
        SCORR_OK="true"
    else
        SCORR_OK="false"
        echo -e "  ${RED}✗ scorr 失败，见 /tmp/scorr_${PROG}.log${NC}"
    fi
    END=$(date +%s%N)
    SCORR_MS=$(( (END - START) / 1000000 ))
    echo -e "  scorr 耗时: ${SCORR_MS} ms (成功: $SCORR_OK)"

    # 写入 timing.json：program 级记总耗时，每个 variant 记均摊耗时
    python3 - "$TIMING_JSON" "$PROG" "$SCORR_MS" "$SCORR_OK" << 'PYEOF'
import json, sys

path, prog, scorr_ms, scorr_ok = sys.argv[1], sys.argv[2], int(sys.argv[3]), sys.argv[4] == "true"

with open(path) as f:
    d = json.load(f)

p = d["programs"][prog]
variants = p["variants"]
n = len(variants)

# program 级：总耗时
p["scorr_ms"] = scorr_ms
p["scorr_ok"] = scorr_ok

# 每个 variant：均摊耗时（scorr 是对全部 variants 一次性跑的）
per_variant_ms = round(scorr_ms / n) if n > 0 else scorr_ms
for v in variants:
    v["scorr_ms"] = per_variant_ms
    v["scorr_ok"] = scorr_ok

with open(path, "w") as f:
    json.dump(d, f, indent=2, ensure_ascii=False)
PYEOF

    echo ""
done

echo -e "${GREEN}完成！结果已写入 $TIMING_JSON${NC}"
