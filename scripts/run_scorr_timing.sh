#!/bin/bash
# 对每个 program 的每个 variant 单独运行一次 scorr（analyze_one_variant.py），
# 将每个 variant 的实际耗时写到 timing.json 对应 variant 的 scorr_ms，
# 并将 program 级总耗时写到 program 级的 scorr_ms。
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

    # 枚举 variants 目录下的 variant_N（只取数字编号，不含 original/gp）
    mapfile -t VARIANT_DIRS < <(ls -d "$VARIANTS_DIR"/variant_[0-9]* 2>/dev/null | sort -V)

    if [ ${#VARIANT_DIRS[@]} -eq 0 ]; then
        echo -e "${YELLOW}  跳过: 没有找到 variant_N 目录${NC}"
        echo ""
        continue
    fi

    PROG_TOTAL_MS=0
    PROG_OK="true"

    # 收集每个 variant 的耗时，格式: "variant_idx scorr_ms ok"
    VARIANT_RESULTS=()

    for VDIR in "${VARIANT_DIRS[@]}"; do
        VID=$(basename "$VDIR" | sed 's/variant_//')
        echo -e "  -> variant_${VID}..."

        START=$(date +%s%N)
        if python3 "$SCRIPT_DIR/analyze_one_variant.py" \
                "$VARIANTS_DIR" "$PROG" "$OUTPUT_DIR" "$VID" \
                > /tmp/scorr_${PROG}_${VID}.log 2>&1; then
            V_OK="true"
        else
            V_OK="false"
            PROG_OK="false"
            echo -e "  ${RED}✗ variant_${VID} 失败，见 /tmp/scorr_${PROG}_${VID}.log${NC}"
        fi
        END=$(date +%s%N)
        V_MS=$(( (END - START) / 1000000 ))
        PROG_TOTAL_MS=$(( PROG_TOTAL_MS + V_MS ))
        echo -e "     耗时: ${V_MS} ms (成功: $V_OK)"

        VARIANT_RESULTS+=("${VID} ${V_MS} ${V_OK}")
    done

    echo -e "  program 总耗时: ${PROG_TOTAL_MS} ms"

    # 写入 timing.json：每个 variant 记实际耗时，program 级记总耗时
    python3 - "$TIMING_JSON" "$PROG" "$PROG_TOTAL_MS" "$PROG_OK" "${VARIANT_RESULTS[@]}" << 'PYEOF'
import json, sys

path   = sys.argv[1]
prog   = sys.argv[2]
total_ms = int(sys.argv[3])
prog_ok  = sys.argv[4] == "true"
# 剩余参数每个格式: "vid ms ok"
raw_variants = sys.argv[5:]

variant_map = {}  # vid_str -> (ms, ok)
for item in raw_variants:
    parts = item.split()
    vid, ms, ok = parts[0], int(parts[1]), parts[2] == "true"
    variant_map[vid] = (ms, ok)

import statistics as _st

with open(path) as f:
    d = json.load(f)

p = d["programs"][prog]

# program 级
p["scorr_ms"] = total_ms
p["scorr_ok"] = prog_ok

# 每个 variant 按顺序对应 variant_0, variant_1, ...
scorr_ms_list = []
for idx, v in enumerate(p["variants"]):
    vid_str = str(idx)
    if vid_str in variant_map:
        v["scorr_ms"] = variant_map[vid_str][0]
        v["scorr_ok"] = variant_map[vid_str][1]
        if variant_map[vid_str][1]:
            scorr_ms_list.append(variant_map[vid_str][0])

# program 级 scorr 平均（仅成功 variant）
p["scorr_ms_average"] = _st.mean(scorr_ms_list) if scorr_ms_list else None

# 全局 scorr 平均（跨所有程序的成功 variant）
all_scorr = [
    v["scorr_ms"]
    for pp in d["programs"].values()
    for v in pp.get("variants", [])
    if v.get("scorr_ok") and "scorr_ms" in v
]
d["summary"]["global_scorr_ms_average"] = _st.mean(all_scorr) if all_scorr else None

with open(path, "w") as f:
    json.dump(d, f, indent=2, ensure_ascii=False)
PYEOF

    echo ""
done

echo -e "${GREEN}完成！结果已写入 $TIMING_JSON${NC}"
