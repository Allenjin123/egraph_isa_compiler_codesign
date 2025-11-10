# Cluster ASIP 3-Level Parallelization Implementation Guide

## Status Summary

Today we've successfully implemented and debugged the cluster-based ASIP optimization pipeline with these major achievements:

### ✅ Completed
1. **Program similarity clustering** - K-means based on instruction usage
2. **Multi-program e-graph merging** - Combines multiple programs for joint optimization
3. **Accurate root detection** - Union of individual program roots (5× better than structural)
4. **Cluster ILP optimization** - Multi-scale ILP for merged e-graphs
5. **Assembly reconstruction** - Full pipeline from ILP solutions to .s files
6. **Metadata handling** - Proper file copying for reconstruction
7. **Basic blocks generation** - Auto-generate from reconstructed .s files

### 🔧 Remaining Work: Parallelization

**Current State**: Sequential execution of K values takes 12-16 hours

**Target**: 3-level bash-controlled parallelization for 4-6× speedup

---

## Implementation Plan

### Files to Create

```
asip_builder/
├── __init__.py                    # Empty (make it a package)
├── precompute_roots.py           # ✅ DONE (71 lines)
├── cluster_utils.py              # TODO (~300 lines)
├── process_single_cluster.py     # TODO (~250 lines)
└── finalize_results.py           # TODO (~150 lines)

run_k_parallel.sh                 # TODO (~120 lines)
```

---

## Detailed Component Specs

### `asip_builder/cluster_utils.py`

Extract from `build_cluster_asips.py`:
- `reconstruct_program()` - Lines 293-425
- `generate_basic_blocks_ssa()` - Lines 427-476
- `synthesize_single_variant()` - Lines 568-606
- `select_best_asip()` - Lines 608-659

### `asip_builder/process_single_cluster.py`

Main cluster processor with CLI:
```python
def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--k', type=int, required=True)
    parser.add_argument('--cluster-id', type=int, required=True)
    parser.add_argument('--clustering', required=True)
    parser.add_argument('--roots', required=True)
    parser.add_argument('--scales', required=True)
    parser.add_argument('--best-k', type=int, default=3)
    parser.add_argument('--ilp-timeout', type=int, default=900)
    parser.add_argument('--synth-jobs', type=int, default=18)
    parser.add_argument('--output-dir', default='output/cluster_asips')

    # Load clustering and roots
    # Run ILP for cluster
    # Generate variants
    # Synthesize with multiprocessing.Pool (LEVEL 3 parallelism)
    # Select best ASIP
    # Save results
```

### `asip_builder/finalize_results.py`

```python
def main():
    # Read k1/, k2/, k3/, k6/ results
    # Compute geometric mean for each K
    # Plot K vs geomean(area×latency)
    # Save summary
```

### `run_k_parallel.sh`

```bash
# Parse args
# Pre-compute roots
# Calculate parallelism: k_parallel × cluster_parallel × synth_jobs = total_cores
# Launch K values in parallel (Level 1)
#   Within each K, launch clusters in parallel (Level 2)
#   Within each cluster, Python does synthesis parallel (Level 3)
# Wait for all K
# Finalize results
```

---

## Next Steps

1. Create `asip_builder/cluster_utils.py` - Extract shared utilities
2. Create `asip_builder/process_single_cluster.py` - Main cluster processor
3. Create `asip_builder/finalize_results.py` - Post-processing
4. Create `run_k_parallel.sh` - Bash orchestrator with 3-level parallelism
5. Test with small config (K=2, 1 cluster, 2 synth jobs)
6. Run full pipeline (K∈{1,2,3,6}, auto resource allocation)

---

## Current Bugs to Fix First

Before parallelization, fix these path issues:

1. **`analyze_asm_blocks.py` output path** - Creates `<prog>_rewrite_variant_X/` subdirectory
   - Need to account for this in `_synthesize_single()`
   - Update to look for `basic_blocks_ssa` in correct subdirectory

2. **Gurobi threading** - Recompile with thread support
   ```bash
   cd Extractor/src/ILP/gurobi
   g++ -std=c++17 -O2 -m64 main.cpp \
       -I$GUROBI_HOME/include -L$GUROBI_HOME/lib \
       -lgurobi_c++ -lgurobi120 -Wl,-rpath,$GUROBI_HOME/lib \
       -o gurobi_solver
   ```

---

## Estimated Timeline

**Sequential (current)**: 12-16 hours for K∈{1,2,3,6}

**With 3-level parallelization (72 cores):**
- K parallel: 4
- Cluster parallel: 2-3 (varies by K)
- Synth parallel: 6-9 (adaptive)
- **Total: 3-4 hours** (4× speedup)

---

## Testing Strategy

```bash
# Small test
./run_k_parallel.sh --clustering multi_k_clustering.json \
    --k-values "2" --scales "0 1" --best-k 1 --total-cores 12

# Medium test
./run_k_parallel.sh --k-values "2 3" --total-cores 36

# Full production
./run_k_parallel.sh --k-values "1 2 3 6" --total-cores 72
```

---

For next session:
- Implement remaining files
- Fix path bugs
- Test parallelization
- Generate K vs performance plots
