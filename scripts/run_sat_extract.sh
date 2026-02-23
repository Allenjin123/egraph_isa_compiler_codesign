#!/bin/bash
# 饱和（步骤3）+ 抽取流程，记录各阶段耗时到 timing.json
#
# 用法:
#   ./run_sat_extract.sh                       # 遍历 output/frontend 下所有程序
#   ./run_sat_extract.sh dijkstra_small_O3     # 只跑指定程序
#   ./run_sat_extract.sh prog1 prog2 ...       # 跑多个指定程序
#
# 输出: scripts/timing.json

set -uo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
FRONTEND_DIR="$PROJECT_ROOT/output/frontend"
SAT_SCRIPT="$PROJECT_ROOT/Saturation/run_saturation.sh"
EXT_SCRIPT="$PROJECT_ROOT/Extractor/run_extractor.sh"
OUTPUT_JSON="$SCRIPT_DIR/timing.json"

# 颜色
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

# 收集要处理的程序列表
if [ $# -eq 0 ]; then
    if [ ! -d "$FRONTEND_DIR" ] || [ -z "$(ls -A "$FRONTEND_DIR" 2>/dev/null)" ]; then
        echo -e "${RED}错误: 找不到程序，目录不存在或为空: $FRONTEND_DIR${NC}"
        exit 1
    fi
    mapfile -t PROGRAMS < <(ls -1 "$FRONTEND_DIR")
    echo -e "${YELLOW}未指定程序名，将遍历所有 ${#PROGRAMS[@]} 个程序${NC}"
else
    PROGRAMS=("$@")
fi

TOTAL=${#PROGRAMS[@]}
echo -e "${CYAN}========================================"
echo -e "  饱和(步骤3) + 抽取 流程"
echo -e "  共 $TOTAL 个程序"
echo -e "========================================${NC}"
echo ""

# 临时文件：每行一条 JSON 记录，最后由 Python 汇总
TMP_RECORDS=$(mktemp /tmp/timing_records_XXXXXX.jsonl)

IDX=0
for PROG in "${PROGRAMS[@]}"; do
    IDX=$((IDX + 1))
    echo -e "${CYAN}[$IDX/$TOTAL] $PROG${NC}"

    # ---- 饱和步骤 3 ----
    echo -e "  -> 饱和（步骤3）..."
    SAT_START=$(date +%s%N)
    if bash "$SAT_SCRIPT" --steps 3 "$PROG" > /dev/null 2>&1; then
        SAT_OK="true"
    else
        SAT_OK="false"
        echo -e "  ${RED}✗ 饱和失败${NC}"
    fi
    SAT_END=$(date +%s%N)
    SAT_MS=$(( (SAT_END - SAT_START) / 1000000 ))
    echo -e "  饱和耗时: ${SAT_MS} ms  (成功: $SAT_OK)"

    # ---- 抽取 ----
    echo -e "  -> ILP 抽取..."
    EXT_START=$(date +%s%N)
    if bash "$EXT_SCRIPT" "$PROG" > /dev/null 2>&1; then
        EXT_OK="true"
    else
        EXT_OK="false"
        echo -e "  ${RED}✗ 抽取失败${NC}"
    fi
    EXT_END=$(date +%s%N)
    EXT_MS=$(( (EXT_END - EXT_START) / 1000000 ))
    echo -e "  抽取耗时: ${EXT_MS} ms  (成功: $EXT_OK)"
    echo ""

    # ---- 读取指令行数 ----
    META="$FRONTEND_DIR/$PROG/label_metadata.json"
    if [ -f "$META" ]; then
        INSN_COUNT=$(python3 -c "
import json
with open('$META') as f:
    d = json.load(f)
print(sum(v['label_line_count'] for v in d.values()))
")
    else
        INSN_COUNT="null"
    fi
    echo -e "  指令行数: $INSN_COUNT"
    echo ""

    # 追加一行 JSON 记录
    printf '{"program":"%s","insn_count":%s,"saturation_ms":%d,"extraction_ms":%d,"saturation_ok":%s,"extraction_ok":%s}\n' \
        "$PROG" "$INSN_COUNT" "$SAT_MS" "$EXT_MS" "$SAT_OK" "$EXT_OK" >> "$TMP_RECORDS"
done

# ---- 汇总成最终 JSON ----
echo -e "${GREEN}写入结果到 $OUTPUT_JSON ...${NC}"

python3 - "$TMP_RECORDS" "$OUTPUT_JSON" << 'PYEOF'
import json, sys

records_path = sys.argv[1]
out_path     = sys.argv[2]

records = []
with open(records_path) as f:
    for line in f:
        line = line.strip()
        if line:
            records.append(json.loads(line))

programs = {}
for r in records:
    programs[r["program"]] = {
        "insn_count":    r["insn_count"],
        "saturation_ms": r["saturation_ms"],
        "extraction_ms": r["extraction_ms"],
        "saturation_ok": r["saturation_ok"],
        "extraction_ok": r["extraction_ok"],
    }

output = {
    "programs": programs,
    "summary": {
        "total":       len(records),
        "sat_success": sum(1 for r in records if r["saturation_ok"]),
        "ext_success": sum(1 for r in records if r["extraction_ok"]),
    }
}

with open(out_path, "w") as f:
    json.dump(output, f, indent=2, ensure_ascii=False)

print(f"已写入 {out_path}")
PYEOF

rm -f "$TMP_RECORDS"
echo -e "${GREEN}完成！${NC}"
