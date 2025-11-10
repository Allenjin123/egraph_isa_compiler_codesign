#!/bin/bash
# 3-Level Parallel Cluster ASIP Builder
# ======================================
#
# Level 1: K values in parallel (bash backgrounding)
# Level 2: Clusters within K in parallel (bash backgrounding)
# Level 3: Synthesis within cluster (Python multiprocessing.Pool)
#
# Usage:
#   ./run_k_parallel.sh --clustering multi_k_clustering.json \
#       --k-values "1 2 3 6" \
#       --scales "0 0.1 0.5 1 10 100" \
#       --total-cores 72
#
# Resource allocation:
#   total_cores = k_parallel × cluster_parallel × synth_jobs
#
# Example with 72 cores, K={1,2,3,6}:
#   - K parallel: 4 (run all K at once)
#   - Cluster parallel: 3 (max 6 clusters for K=6)
#   - Synth jobs: 6 (72 / 4 / 3 = 6)

set -e  # Exit on error

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Default configuration
DEFAULT_SCALES="0 0.1 0.5 1 10 100"
DEFAULT_BEST_K=3
DEFAULT_ILP_TIMEOUT=900
DEFAULT_TOTAL_CORES=72
DEFAULT_OUTPUT_DIR="output/cluster_asips"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Function to display usage
usage() {
    echo "Usage: $0 --clustering <file> --k-values <values> [options]"
    echo ""
    echo "Required:"
    echo "  --clustering FILE          Clustering JSON file (e.g., multi_k_clustering.json)"
    echo "  --k-values VALUES          Space-separated K values (e.g., '1 2 3 6')"
    echo ""
    echo "Options:"
    echo "  --scales SCALES            Scaling factors (default: '$DEFAULT_SCALES')"
    echo "  --best-k K                 Variants per scale (default: $DEFAULT_BEST_K)"
    echo "  --ilp-timeout SECONDS      ILP timeout (default: $DEFAULT_ILP_TIMEOUT)"
    echo "  --total-cores CORES        Total CPU cores to use (default: $DEFAULT_TOTAL_CORES)"
    echo "  --output-dir DIR           Output directory (default: $DEFAULT_OUTPUT_DIR)"
    echo "  --roots-cache FILE         Pre-computed roots cache (skip pre-computation)"
    echo "  -h, --help                 Show this help"
    echo ""
    echo "Examples:"
    echo "  # Small test (K=2, 12 cores)"
    echo "  $0 --clustering multi_k_clustering.json --k-values '2' --total-cores 12"
    echo ""
    echo "  # Medium test (K={2,3}, 36 cores)"
    echo "  $0 --clustering multi_k_clustering.json --k-values '2 3' --total-cores 36"
    echo ""
    echo "  # Full production (K={1,2,3,6}, 72 cores)"
    echo "  $0 --clustering multi_k_clustering.json --k-values '1 2 3 6' --total-cores 72"
    echo ""
    exit 1
}

# Parse arguments
CLUSTERING_FILE=""
K_VALUES=""
SCALES="$DEFAULT_SCALES"
BEST_K="$DEFAULT_BEST_K"
ILP_TIMEOUT="$DEFAULT_ILP_TIMEOUT"
TOTAL_CORES="$DEFAULT_TOTAL_CORES"
OUTPUT_DIR="$DEFAULT_OUTPUT_DIR"
ROOTS_CACHE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --clustering)
            CLUSTERING_FILE="$2"
            shift 2
            ;;
        --k-values)
            K_VALUES="$2"
            shift 2
            ;;
        --scales)
            SCALES="$2"
            shift 2
            ;;
        --best-k)
            BEST_K="$2"
            shift 2
            ;;
        --ilp-timeout)
            ILP_TIMEOUT="$2"
            shift 2
            ;;
        --total-cores)
            TOTAL_CORES="$2"
            shift 2
            ;;
        --output-dir)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        --roots-cache)
            ROOTS_CACHE="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo -e "${RED}Error: Unknown option $1${NC}"
            usage
            ;;
    esac
done

# Validate required arguments
if [ -z "$CLUSTERING_FILE" ] || [ -z "$K_VALUES" ]; then
    echo -e "${RED}Error: --clustering and --k-values are required${NC}"
    usage
fi

if [ ! -f "$CLUSTERING_FILE" ]; then
    echo -e "${RED}Error: Clustering file not found: $CLUSTERING_FILE${NC}"
    exit 1
fi

# Parse K values into array
IFS=' ' read -ra K_ARRAY <<< "$K_VALUES"
NUM_K_VALUES=${#K_ARRAY[@]}

# Calculate parallelism distribution
# Strategy: Run all K in parallel, distribute remaining cores to clusters and synthesis
K_PARALLEL=$NUM_K_VALUES

# Remaining cores per K value
CORES_PER_K=$((TOTAL_CORES / K_PARALLEL))

# For cluster-level parallelism, assume max 6 clusters (for K=6)
# Use at most half the cores for cluster parallelism
MAX_CLUSTER_PARALLEL=$((CORES_PER_K / 2))
if [ $MAX_CLUSTER_PARALLEL -lt 1 ]; then
    MAX_CLUSTER_PARALLEL=1
fi

# Rest goes to synthesis
SYNTH_JOBS=$((CORES_PER_K / MAX_CLUSTER_PARALLEL))
if [ $SYNTH_JOBS -lt 1 ]; then
    SYNTH_JOBS=1
fi

echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}3-Level Parallel Cluster ASIP Builder${NC}"
echo -e "${CYAN}========================================${NC}"
echo -e "Clustering file: ${GREEN}$CLUSTERING_FILE${NC}"
echo -e "K values: ${GREEN}$K_VALUES${NC} (${NUM_K_VALUES} values)"
echo -e "Scales: ${GREEN}$SCALES${NC}"
echo -e "Variants per scale: ${GREEN}$BEST_K${NC}"
echo -e "ILP timeout: ${GREEN}${ILP_TIMEOUT}s${NC}"
echo -e "Output directory: ${GREEN}$OUTPUT_DIR${NC}"
echo ""
echo -e "${YELLOW}Parallelism Configuration:${NC}"
echo -e "  Total cores: ${GREEN}$TOTAL_CORES${NC}"
echo -e "  Level 1 (K values): ${GREEN}$K_PARALLEL${NC} parallel"
echo -e "  Level 2 (Clusters per K): ${GREEN}up to $MAX_CLUSTER_PARALLEL${NC} parallel"
echo -e "  Level 3 (Synthesis per cluster): ${GREEN}$SYNTH_JOBS${NC} processes"
echo -e "  Formula: $TOTAL_CORES = $K_PARALLEL × $MAX_CLUSTER_PARALLEL × $SYNTH_JOBS"
echo -e "${CYAN}========================================${NC}"
echo ""

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Step 0: Pre-compute roots (if not provided)
if [ -z "$ROOTS_CACHE" ]; then
    ROOTS_CACHE="$OUTPUT_DIR/roots_cache.json"

    echo -e "${BLUE}[Pre-computation] Computing root eclasses...${NC}"
    python3 "$SCRIPT_DIR/nre/precompute_roots.py" \
        "$CLUSTERING_FILE" \
        -o "$ROOTS_CACHE"

    if [ $? -ne 0 ]; then
        echo -e "${RED}Error: Root pre-computation failed${NC}"
        exit 1
    fi
    echo -e "${GREEN}✓ Roots cached to: $ROOTS_CACHE${NC}"
    echo ""
else
    echo -e "${YELLOW}Using existing roots cache: $ROOTS_CACHE${NC}"
    echo ""
fi

# Function to get number of clusters for a K value
get_num_clusters() {
    local k=$1
    # Query JSON file for number of clusters
    python3 -c "
import json
with open('$CLUSTERING_FILE', 'r') as f:
    data = json.load(f)
print(data['clusterings']['k${k}']['n_clusters'])
"
}

# Function to process one K value (Level 1)
process_k_value() {
    local k=$1
    local num_clusters=$(get_num_clusters $k)

    echo -e "${CYAN}[K=$k] Starting $num_clusters clusters...${NC}"

    local cluster_pids=()

    # Launch clusters in parallel (Level 2)
    for ((cluster_id=0; cluster_id<num_clusters; cluster_id++)); do
        # Wait if we've hit max cluster parallelism
        while [ ${#cluster_pids[@]} -ge $MAX_CLUSTER_PARALLEL ]; do
            # Wait for any cluster to finish
            for i in "${!cluster_pids[@]}"; do
                if ! kill -0 ${cluster_pids[$i]} 2>/dev/null; then
                    # This cluster finished
                    unset 'cluster_pids[$i]'
                fi
            done
            cluster_pids=("${cluster_pids[@]}")  # Re-index array
            sleep 1
        done

        # Launch cluster processor
        echo -e "${BLUE}  [K=$k Cluster $cluster_id] Launching...${NC}"

        python3 "$SCRIPT_DIR/nre/process_single_cluster.py" \
            --k $k \
            --cluster-id $cluster_id \
            --clustering "$CLUSTERING_FILE" \
            --roots "$ROOTS_CACHE" \
            --scales "$SCALES" \
            --best-k $BEST_K \
            --ilp-timeout $ILP_TIMEOUT \
            --synth-jobs $SYNTH_JOBS \
            --output-dir "$OUTPUT_DIR" \
            > "$OUTPUT_DIR/k${k}_cluster${cluster_id}.log" 2>&1 &

        cluster_pids+=($!)
    done

    # Wait for all clusters in this K to finish
    echo -e "${YELLOW}[K=$k] Waiting for ${#cluster_pids[@]} clusters to complete...${NC}"
    for pid in "${cluster_pids[@]}"; do
        wait $pid
    done

    echo -e "${GREEN}✓ [K=$k] All $num_clusters clusters complete${NC}"
}

# Main execution
START_TIME=$(date +%s)

echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}Level 1: Launching K values in parallel${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

# Launch all K values in parallel (Level 1)
k_pids=()
for k in "${K_ARRAY[@]}"; do
    echo -e "${BLUE}Launching K=$k...${NC}"
    process_k_value $k &
    k_pids+=($!)
done

# Wait for all K values to complete
echo ""
echo -e "${YELLOW}Waiting for all K values to complete...${NC}"
for pid in "${k_pids[@]}"; do
    wait $pid
done

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
DURATION_MIN=$((DURATION / 60))
DURATION_SEC=$((DURATION % 60))

echo ""
echo -e "${GREEN}✓ All K values complete (${DURATION_MIN}m ${DURATION_SEC}s)${NC}"
echo ""

# Step: Finalize results
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}Finalizing Results${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

python3 "$SCRIPT_DIR/nre/finalize_results.py" \
    --k-values "$K_VALUES" \
    --output-dir "$OUTPUT_DIR"

if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Finalization failed${NC}"
    exit 1
fi

# Final summary
echo ""
echo -e "${CYAN}========================================${NC}"
echo -e "${GREEN}✓ 3-Level Parallel ASIP Build Complete${NC}"
echo -e "${CYAN}========================================${NC}"
echo -e "Total time: ${GREEN}${DURATION_MIN}m ${DURATION_SEC}s${NC}"
echo -e "K values processed: ${GREEN}$K_VALUES${NC}"
echo -e "Output directory: ${GREEN}$OUTPUT_DIR${NC}"
echo ""
echo -e "${YELLOW}Results:${NC}"
echo -e "  - Performance plot: ${GREEN}$OUTPUT_DIR/k_vs_performance.png${NC}"
echo -e "  - Summary table: ${GREEN}$OUTPUT_DIR/k_vs_performance_table.txt${NC}"
echo -e "  - Summary JSON: ${GREEN}$OUTPUT_DIR/asip_summary.json${NC}"
echo ""
echo -e "${YELLOW}Logs:${NC}"
for k in "${K_ARRAY[@]}"; do
    num_clusters=$(get_num_clusters $k)
    for ((cluster_id=0; cluster_id<num_clusters; cluster_id++)); do
        echo -e "  - K=$k Cluster $cluster_id: ${GREEN}$OUTPUT_DIR/k${k}_cluster${cluster_id}.log${NC}"
    done
done
echo ""
echo -e "${CYAN}========================================${NC}"

exit 0
