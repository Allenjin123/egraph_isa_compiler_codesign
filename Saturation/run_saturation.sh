#!/bin/bash
# E-graph 饱和分析流程脚本（Saturation Pipeline）
# 使用方法: ./run_saturation.sh <program_name1> [program_name2] [...]
# 示例: ./run_saturation.sh dijkstra_small_O3
#       ./run_saturation.sh dijkstra_small_O3 basicmath_small_O3

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# 检查参数
if [ $# -eq 0 ]; then
    echo -e "${RED}错误: 请提供至少一个程序名${NC}"
    echo "用法: $0 <program_name1> [program_name2] [...]"
    echo "示例: $0 dijkstra_small_O3"
    echo "      $0 dijkstra_small_O3 basicmath_small_O3"
    echo ""
    echo "可用的程序:"
    if [ -d "$PROJECT_ROOT/output/frontend" ]; then
        ls -1 "$PROJECT_ROOT/output/frontend" 2>/dev/null | sed 's/^/  - /'
    fi
    exit 1
fi

# 检查 egglog 是否可用
EGGLOG_PATH=$(which egglog 2>/dev/null)
if [ -z "$EGGLOG_PATH" ]; then
    echo -e "${YELLOW}警告: 未找到 egglog 命令，尝试使用默认路径...${NC}"
    # 尝试几个常见路径
    for path in \
        "/home/allenjin/egglog/target/release/egglog" \
        "$HOME/egglog/target/release/egglog" \
        "$PROJECT_ROOT/egglog/target/release/egglog"; do
        if [ -f "$path" ]; then
            EGGLOG_PATH="$path"
            break
        fi
    done
    
    if [ -z "$EGGLOG_PATH" ]; then
        echo -e "${RED}错误: 找不到 egglog 二进制文件${NC}"
        echo "请安装 egglog 或设置正确的路径"
        exit 1
    fi
fi

echo -e "${GREEN}使用 egglog: $EGGLOG_PATH${NC}"
echo ""

# 统计变量
TOTAL_PROGRAMS=$#
SUCCESS_COUNT=0
FAIL_COUNT=0
declare -a FAILED_PROGRAMS

# 处理单个程序的函数
process_program() {
    local PROGRAM_NAME="$1"
    local PROGRAM_INDEX="$2"
    
    echo -e "${CYAN}========================================${NC}"
    echo -e "${CYAN}程序 [$PROGRAM_INDEX/$TOTAL_PROGRAMS]: $PROGRAM_NAME${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    
    # 查找程序目录
    local PROGRAM_DIR="$PROJECT_ROOT/output/frontend/$PROGRAM_NAME"
    
    if [ ! -d "$PROGRAM_DIR" ]; then
        echo -e "${RED}错误: 找不到程序目录: $PROGRAM_DIR${NC}"
        echo -e "${YELLOW}提示: 请先运行前端分析流程生成 SSA 基本块${NC}"
        echo ""
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (目录不存在)")
        return 1
    fi
    
    # 检查是否有 basic_blocks_ssa 目录
    if [ ! -d "$PROGRAM_DIR/basic_blocks_ssa" ]; then
        echo -e "${RED}错误: 找不到 SSA 基本块目录: $PROGRAM_DIR/basic_blocks_ssa${NC}"
        echo -e "${YELLOW}提示: 请先运行 convert_to_ssa.py${NC}"
        echo ""
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (缺少SSA)")
        return 1
    fi
    
    echo -e "${GREEN}找到程序目录: $PROGRAM_DIR${NC}"
    echo ""
    
    # ============================================================
    # 步骤 1/3: 生成 .egg 文件 (local_saturation.py)
    # ============================================================
    echo -e "${MAGENTA}步骤 1/3: 生成 E-graph 文件 (.egg)${NC}"
    echo "输入: $PROGRAM_DIR/basic_blocks_ssa/"
    echo "输出: $PROGRAM_DIR/basic_blocks_egglog/"
    
    if ! python3 "$SCRIPT_DIR/local_saturation.py" "$PROGRAM_DIR" -v; then
        echo -e "${RED}步骤 1 失败: local_saturation.py${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤1失败)")
        return 1
    fi
    echo ""
    
    # ============================================================
    # 步骤 2/3: 运行 egglog 生成可视化 (run_egglog_all.py)
    # ============================================================
    echo -e "${MAGENTA}步骤 2/3: 运行 E-graph 饱和分析${NC}"
    echo "输入: $PROGRAM_DIR/basic_blocks_egglog/*.egg"
    echo "输出: $PROGRAM_DIR/basic_blocks_json/"
    
    if ! python3 "$SCRIPT_DIR/run_egglog_all.py" "$PROGRAM_DIR" -v; then
        echo -e "${RED}步骤 2 失败: run_egglog_all.py${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤2失败)")
        return 1
    fi
    echo ""
    
    # ============================================================
    # 步骤 3/3: 提取 eclass 信息 (extract_eclasses.py)
    # ============================================================
    echo -e "${MAGENTA}步骤 3/3: 提取 E-class 注释${NC}"
    echo "输入: $PROGRAM_DIR/basic_blocks_egglog/*.egg"
    echo "输出: $PROGRAM_DIR/basic_blocks_eclass/"
    
    if ! python3 "$SCRIPT_DIR/extract_eclasses.py" "$PROGRAM_DIR" -v --egglog "$EGGLOG_PATH"; then
        echo -e "${RED}步骤 3 失败: extract_eclasses.py${NC}"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_PROGRAMS+=("$PROGRAM_NAME (步骤3失败)")
        return 1
    fi
    echo ""
    
    # ============================================================
    # 完成统计
    # ============================================================
    echo -e "${BLUE}--------------------------------${NC}"
    echo -e "${GREEN}✓ $PROGRAM_NAME E-graph 分析完成！${NC}"
    echo -e "${BLUE}--------------------------------${NC}"
    echo ""
    echo "生成的文件："
    echo "  - $PROGRAM_DIR/basic_blocks_egglog/*.egg"
    echo "  - $PROGRAM_DIR/basic_blocks_json/*.json"
    echo "  - $PROGRAM_DIR/basic_blocks_eclass/*.txt"
    echo ""
    
    # 统计
    if [ -d "$PROGRAM_DIR/basic_blocks_egglog" ]; then
        local EGG_COUNT=$(ls -1 "$PROGRAM_DIR/basic_blocks_egglog"/*.egg 2>/dev/null | wc -l)
        echo "统计: $EGG_COUNT 个 E-graph 文件"
    fi
    
    if [ -d "$PROGRAM_DIR/basic_blocks_json" ]; then
        local JSON_COUNT=$(ls -1 "$PROGRAM_DIR/basic_blocks_json"/*.json 2>/dev/null | wc -l)
        echo "      $JSON_COUNT 个 JSON 文件"
    fi
    
    if [ -d "$PROGRAM_DIR/basic_blocks_eclass" ]; then
        local ECLASS_COUNT=$(ls -1 "$PROGRAM_DIR/basic_blocks_eclass"/*.txt 2>/dev/null | wc -l)
        echo "      $ECLASS_COUNT 个 E-class 注释文件"
    fi
    echo ""
    
    SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    return 0
}

# ============================================================
# 主循环：处理所有程序
# ============================================================
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}批量 E-graph 饱和分析流程${NC}"
echo -e "${BLUE}总共 $TOTAL_PROGRAMS 个程序${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

PROGRAM_INDEX=0
for PROGRAM_NAME in "$@"; do
    PROGRAM_INDEX=$((PROGRAM_INDEX + 1))
    
    # 处理每个程序，即使失败也继续处理下一个
    process_program "$PROGRAM_NAME" "$PROGRAM_INDEX" || true
done

# ============================================================
# 最终总结
# ============================================================
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}批量处理完成！${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "总计: $TOTAL_PROGRAMS 个程序"
echo -e "${GREEN}成功: $SUCCESS_COUNT${NC}"
echo -e "${RED}失败: $FAIL_COUNT${NC}"

if [ $FAIL_COUNT -gt 0 ]; then
    echo ""
    echo -e "${RED}失败的程序:${NC}"
    for failed in "${FAILED_PROGRAMS[@]}"; do
        echo -e "  ${RED}✗${NC} $failed"
    done
fi

echo ""
echo -e "${YELLOW}提示: 可以查看生成的 JSON 和 E-class 文件${NC}"
echo -e "${YELLOW}下一步: 可以继续运行 ILP 优化流程${NC}"
echo ""

# 如果有失败的程序，返回非零退出码
if [ $FAIL_COUNT -gt 0 ]; then
    exit 1
fi

exit 0

