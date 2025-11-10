# NRE (Non-Recurring Engineering) Cost Optimization - Usage Guide

## Overview

The NRE package implements 3-level parallelization for cluster-based ASIP (Application-Specific ISA Processor) optimization:

- **Level 1**: K values in parallel (bash backgrounding)
- **Level 2**: Clusters within each K in parallel (bash backgrounding)
- **Level 3**: Synthesis within each cluster (Python multiprocessing.Pool)

This allows efficient use of multi-core systems to minimize total runtime.

---

## Quick Start

### 1. Prepare Clustering Data

Run program similarity analysis to generate clustering:

```bash
python analyze_program_similarity.py \
    --k-values 1 2 3 6 \
    --export-multi-k multi_k_clustering.json \
    basicmath_small_O3 bitcnts_O3 qsort_small_O3 \
    qsort_large_O3 dijkstra_small_O3 patricia_O3
```

**Output**: `multi_k_clustering.json` - Contains cluster assignments for each K value

---

### 2. Run 3-Level Parallel ASIP Building

#### Small Test (K=1, 12 cores, ~30 minutes)

```bash
./run_k_parallel.sh \
    --clustering multi_k_clustering.json \
    --k-values "1" \
    --scales "0 1" \
    --best-k 2 \
    --total-cores 12 \
    --output-dir output/cluster_asips_test
```

#### Medium Test (K={2,3}, 36 cores, ~1 hour)

```bash
./run_k_parallel.sh \
    --clustering multi_k_clustering.json \
    --k-values "2 3" \
    --scales "0 0.1 1 10" \
    --best-k 3 \
    --total-cores 36
```

#### Full Production (K={1,2,3,6}, 72 cores, ~3-4 hours)

```bash
./run_k_parallel.sh \
    --clustering multi_k_clustering.json \
    --k-values "1 2 3 6" \
    --scales "0 0.1 0.5 1 10 100" \
    --best-k 3 \
    --ilp-timeout 900 \
    --total-cores 72 \
    --output-dir output/cluster_asips
```

---

## Architecture

### File Structure

```
nre/
├── __init__.py                    # Package initialization
├── precompute_roots.py           # One-time root eclass pre-computation
├── cluster_utils.py              # Shared utilities (reconstruction, synthesis)
├── process_single_cluster.py     # Main cluster processor (CLI)
└── finalize_results.py           # Post-processing and plotting

run_k_parallel.sh                 # Bash orchestrator (3-level parallelism)
```

### Data Flow

```
1. run_k_parallel.sh
   ├─> Pre-compute roots (once)
   │   └─> nre/precompute_roots.py → roots_cache.json
   │
   ├─> Level 1: Launch K values in parallel
   │   └─> For each K:
   │       ├─> Level 2: Launch clusters in parallel
   │       │   └─> For each cluster:
   │       │       └─> nre/process_single_cluster.py
   │       │           ├─> Run ILP optimization
   │       │           ├─> Generate assembly variants (nre/cluster_utils.reconstruct_program)
   │       │           ├─> Level 3: Synthesize variants in parallel
   │       │           │   └─> multiprocessing.Pool (nre/cluster_utils.synthesize_single)
   │       │           ├─> Select best ASIP (nre/cluster_utils.select_best_asip)
   │       │           └─> Save cluster results
   │       │
   │       └─> Wait for all clusters
   │
   └─> Wait for all K values

2. Finalize results
   └─> nre/finalize_results.py
       ├─> Compute K vs performance
       ├─> Generate plot
       └─> Save summary
```

---

## Parameters

### run_k_parallel.sh

| Parameter | Default | Description |
|-----------|---------|-------------|
| `--clustering FILE` | *required* | Clustering JSON file |
| `--k-values VALUES` | *required* | Space-separated K values (e.g., "1 2 3 6") |
| `--scales SCALES` | "0 0.1 0.5 1 10 100" | ILP scaling factors |
| `--best-k K` | 3 | Variants per scale |
| `--ilp-timeout SECONDS` | 900 | ILP solver timeout (15 minutes) |
| `--total-cores CORES` | 72 | Total CPU cores to use |
| `--output-dir DIR` | "output/cluster_asips" | Output directory |
| `--roots-cache FILE` | *(auto)* | Pre-computed roots cache (skip pre-computation) |

### Parallelism Distribution

**Formula**: `total_cores = k_parallel × cluster_parallel × synth_jobs`

- **k_parallel**: Number of K values (run all in parallel)
- **cluster_parallel**: Max clusters per K (adaptive, ≤ total_cores / k_parallel / 2)
- **synth_jobs**: Synthesis processes per cluster (remaining cores)

**Example with 72 cores, K={1,2,3,6}**:
- k_parallel = 4
- cluster_parallel = 9 (72 / 4 / 2 = 9, but capped by actual cluster count)
- synth_jobs = 2 (72 / 4 / 9 ≈ 2)

---

## Outputs

### Directory Structure

```
output/cluster_asips/
├── roots_cache.json                    # Pre-computed root eclasses
├── k1/
│   └── cluster_0/
│       ├── merged.json                 # Merged e-graph (all programs)
│       ├── scale_0/, scale_0.1/, ...   # ILP outputs per scale
│       ├── variants/                   # Assembly variants
│       │   ├── variant_0/
│       │   │   ├── program1_rewrite_variant_0.s
│       │   │   ├── basic_blocks_ssa/
│       │   │   └── ...
│       │   └── variant_1/
│       │       └── ...
│       ├── dsl_files/                  # ISA definitions
│       └── cluster_results.json        # Best ASIP selection
├── k2/
│   ├── cluster_0/
│   └── cluster_1/
├── k3/
│   ├── cluster_0/
│   ├── cluster_1/
│   └── cluster_2/
├── k6/
│   ├── cluster_0/
│   ├── cluster_1/
│   ├── ...
│   └── cluster_5/
├── k_vs_performance.png               # ← Main result!
├── k_vs_performance_table.txt
├── asip_summary.json
└── k*_cluster*.log                    # Execution logs
```

### Key Results

**k_vs_performance.png**:
- X-axis: Number of specialized processors (K)
- Y-axis: Geometric mean(Area × Latency) across all programs
- Optimal K marked with red star

**k_vs_performance_table.txt**:
```
K vs Performance Summary
======================================================================
    K    Geomean(Area×Latency)     Improvement vs K=1
----------------------------------------------------------------------
    1               1.50e+09                  0.0%
    2               9.80e+08                 34.7%  ← Optimal
    3               1.05e+09                 30.0%
    6               1.20e+09                 20.0%
======================================================================
```

**asip_summary.json**: Complete results including per-cluster details

---

## Advanced Usage

### Running Individual Components

#### Pre-compute roots only

```bash
python nre/precompute_roots.py \
    multi_k_clustering.json \
    -o roots_cache.json
```

#### Process a single cluster

```bash
python nre/process_single_cluster.py \
    --k 2 \
    --cluster-id 0 \
    --clustering multi_k_clustering.json \
    --roots roots_cache.json \
    --scales "0 1 10" \
    --best-k 3 \
    --ilp-timeout 900 \
    --synth-jobs 18
```

#### Finalize results manually

```bash
python nre/finalize_results.py \
    --k-values "1 2 3 6" \
    --output-dir output/cluster_asips
```

---

## Troubleshooting

### ILP Timeout

If large clusters (K=1 with 6 programs) timeout:

```bash
./run_k_parallel.sh \
    --k-values "1" \
    --ilp-timeout 1800 \  # Increase to 30 minutes
    --total-cores 72
```

### Memory Issues

For large e-graphs, reduce parallelism:

```bash
./run_k_parallel.sh \
    --k-values "1 2 3 6" \
    --total-cores 36 \  # Reduce from 72 to 36
    --scales "0 1 10"   # Use fewer scales
```

### Missing Frontend Outputs

If programs are missing basic_blocks_ssa:

```bash
cd frontend
./run_full_analysis.sh <program_name>
cd ..
```

### Check Logs

Each cluster writes to a separate log file:

```bash
# Check K=2 cluster 0 log
tail -f output/cluster_asips/k2_cluster0.log

# Check all logs for errors
grep -i error output/cluster_asips/*.log
```

---

## Performance Tuning

### Core Allocation Strategy

**For maximum throughput**:
- Favor cluster-level parallelism (Level 2) over synthesis parallelism (Level 3)
- Synthesis jobs are I/O bound (disk writes)
- Cluster-level parallelism is CPU bound

**Example**: 72 cores, K={1,2,3,6}
- Good: k_parallel=4, cluster_parallel=6, synth_jobs=3
- Bad: k_parallel=4, cluster_parallel=2, synth_jobs=9

### Scale Selection

**Fewer scales, better coverage**:
- Geometric progression: 0, 0.1, 1, 10, 100 (5 scales)
- Avoid dense sampling: 0, 0.5, 1, 5, 10, 50, 100 (7 scales)

**Why**: Synthesis is the bottleneck. More scales → more variants → longer synthesis.

### Best-K Selection

**Tradeoff**: More variants per scale = better ASIP quality but longer runtime

- Small test: `--best-k 1` (fastest)
- Production: `--best-k 3` (balanced)
- Research: `--best-k 5` (best quality)

**Runtime**: Total variants = num_scales × best_k
- 5 scales × 3 variants = 15 ASIP candidates per cluster
- 5 scales × 5 variants = 25 ASIP candidates per cluster

---

## Comparison to Sequential Approach

### Sequential (build_cluster_asips.py)

```bash
python build_cluster_asips.py \
    --clustering multi_k_clustering.json \
    --k-values 1 2 3 6 \
    --synth-jobs 72  # Only Level 3 parallelism
```

**Runtime**: 12-16 hours (sequential K values, sequential clusters)

### 3-Level Parallel (run_k_parallel.sh)

```bash
./run_k_parallel.sh \
    --clustering multi_k_clustering.json \
    --k-values "1 2 3 6" \
    --total-cores 72  # All 3 levels parallel
```

**Runtime**: 3-4 hours (4× speedup)

---

## Testing Strategy

### Phase 1: Sanity Check (5-10 minutes)

Test with minimal config to verify pipeline:

```bash
./run_k_parallel.sh \
    --clustering multi_k_clustering.json \
    --k-values "1" \
    --scales "0" \
    --best-k 1 \
    --total-cores 6 \
    --output-dir output/test_sanity
```

Expected: 1 K value, 1 cluster, 1 scale, 1 variant → 6 synthesis jobs (6 programs)

### Phase 2: Small Test (30 minutes)

```bash
./run_k_parallel.sh \
    --clustering multi_k_clustering.json \
    --k-values "2" \
    --scales "0 1" \
    --best-k 2 \
    --total-cores 12 \
    --output-dir output/test_small
```

Expected: 1 K value, 2 clusters, 2 scales, 2 variants/scale → ~24 synthesis jobs

### Phase 3: Medium Test (1-2 hours)

```bash
./run_k_parallel.sh \
    --clustering multi_k_clustering.json \
    --k-values "2 3" \
    --scales "0 0.1 1 10" \
    --best-k 3 \
    --total-cores 36
```

Expected: 2 K values, ~5 clusters total, 4 scales, 3 variants/scale → ~180 synthesis jobs

### Phase 4: Full Production (3-4 hours)

```bash
./run_k_parallel.sh \
    --clustering multi_k_clustering.json \
    --k-values "1 2 3 6" \
    --scales "0 0.1 0.5 1 10 100" \
    --best-k 3 \
    --total-cores 72
```

Expected: 4 K values, 12 clusters total, 6 scales, 3 variants/scale → ~648 synthesis jobs

---

## Integration with Existing Pipeline

### Before NRE Parallelization

```bash
# 1. Frontend analysis
cd frontend
./run_full_analysis.sh <programs...>
cd ..

# 2. Saturation
cd Saturation
./run_saturation.sh <programs...>
cd ..

# 3. Clustering
python analyze_program_similarity.py --k-values 1 2 3 6

# 4. Build ASIPs (sequential)
python build_cluster_asips.py --k-values 1 2 3 6
```

**Total**: ~14-18 hours

### After NRE Parallelization

```bash
# 1-2. Frontend + Saturation (use run_multi_scale_variants.sh)
./run_multi_scale_variants.sh --skip-saturation --no-clean

# 3. Clustering
python analyze_program_similarity.py --k-values 1 2 3 6

# 4. Build ASIPs (3-level parallel)
./run_k_parallel.sh --k-values "1 2 3 6" --total-cores 72
```

**Total**: ~5-6 hours (3× speedup)

---

## FAQ

**Q: Can I use the old build_cluster_asips.py?**
A: Yes, it still works. run_k_parallel.sh is the new parallelized version.

**Q: What if I have fewer cores?**
A: Adjust `--total-cores` accordingly. The script will auto-distribute resources.

**Q: Can I run different K values separately?**
A: Yes:
```bash
./run_k_parallel.sh --k-values "1" --total-cores 18
./run_k_parallel.sh --k-values "2" --total-cores 18
# Then manually run finalize_results.py
```

**Q: How do I resume if a cluster fails?**
A: Re-run with the same parameters. Existing results will be reused if cluster_results.json exists.

**Q: Can I customize cluster parallelism?**
A: Not directly. The script auto-calculates based on `--total-cores`. For manual control, call `nre/process_single_cluster.py` directly.

---

## Citation

If you use this in research:

```bibtex
@software{nre_cluster_asip,
  title={NRE Cost Optimization: 3-Level Parallel Cluster ASIP Builder},
  author={E-graph ISA Compiler Codesign Project},
  year={2025},
  url={https://github.com/...}
}
```

---

## Contact

For issues or questions, see project README.
