# Cluster-Based Application-Specific ISA Processor (ASIP) Generation Guide

This guide explains how to use the cluster-based ASIP optimization pipeline to automatically design specialized instruction sets for groups of programs.

## Overview

The pipeline performs:
1. **Program Similarity Analysis** - Clusters programs based on instruction usage patterns
2. **Multi-Program ILP Optimization** - Merges e-graphs and finds minimal ISA per cluster
3. **Variant Generation** - Creates multiple ASIP variants with different optimization parameters
4. **Performance Evaluation** - Synthesizes designs and computes geometric mean(area×latency)
5. **Optimal Specialization** - Determines best K (number of specialized processors)

---

## Quick Start

### Step 1: Cluster Analysis

```bash
# Cluster programs for K=1,2,3,6 and export results
python analyze_program_similarity.py \
    --k-values 1 2 3 6 \
    --export-multi-k multi_k_clustering.json
```

**Outputs:**
- `multi_k_clustering.json` - Cluster assignments for each K value
- `instruction_heatmap.png` - Instruction usage patterns
- `program_clusters_k*.png` - PCA visualizations
- `cluster_optimization.png` - Elbow method analysis

**Example output:**
```
Clustering with K=1...
  K=1: 1 clusters
    Cluster 0: ['basicmath_small_O3', 'bitcnts_O3', 'qsort_small_O3',
                 'qsort_large_O3', 'dijkstra_small_O3', 'patricia_O3']

Clustering with K=2...
  K=2: 2 clusters
    Cluster 0: ['basicmath_small_O3', 'qsort_small_O3', 'qsort_large_O3']
    Cluster 1: ['bitcnts_O3', 'dijkstra_small_O3', 'patricia_O3']

Clustering with K=3...
  K=3: 3 clusters
    Cluster 0: ['basicmath_small_O3', 'qsort_large_O3']
    Cluster 1: ['bitcnts_O3', 'patricia_O3']
    Cluster 2: ['qsort_small_O3', 'dijkstra_small_O3']
```

---

### Step 2: Build Application-Specific ISA Processors

```bash
# Build ASIPs for each K configuration
python build_cluster_asips.py \
    --clustering multi_k_clustering.json \
    --k-values 1 2 3 6 \
    --scales "0 0.1 0.5 1 10 100" \
    --best-k 3 \
    --ilp-timeout 900 \
    --synth-jobs 72
```

**What happens:**
- **K=1**: Single ASIP for all 6 programs
  - Merges all program e-graphs
  - Runs ILP with 6 scales × 3 variants = 18 ASIP variants
  - Synthesizes each variant for all 6 programs (108 synthesis jobs)
  - Selects best variant based on geometric mean

- **K=2**: Two specialized ASIPs
  - Cluster 0: ~3 programs → 18 ASIP variants
  - Cluster 1: ~3 programs → 18 ASIP variants
  - Total: ~108 synthesis jobs

- **K=3**: Three specialized ASIPs
  - Each cluster: ~2 programs → 18 variants each
  - Total: ~108 synthesis jobs

- **K=6**: Six specialized ASIPs (one per program)
  - Each cluster: 1 program → 18 variants
  - Equivalent to per-program optimization

**Outputs:**
```
output/cluster_asips/
├── k1/
│   └── cluster_0/
│       ├── merged.json              # Merged e-graph (6 programs)
│       ├── scale_0/, scale_0.1/, ...
│       ├── variants/                # Reconstructed assembly variants
│       ├── dsl_files/               # ISA definitions
│       └── asip_results.json        # Best ASIP selection
├── k2/
│   ├── cluster_0/                   # ASIP for 3 programs
│   └── cluster_1/                   # ASIP for 3 programs
├── k3/
│   ├── cluster_0/, cluster_1/, cluster_2/
├── k6/
│   ├── cluster_0/, ..., cluster_5/  # Per-program ASIPs
├── k_vs_performance.png             # ← Main result!
├── k_vs_performance_table.txt
└── asip_summary.json
```

---

## Key Result: K vs Performance Plot

The final plot (`k_vs_performance.png`) shows:
- **X-axis**: Number of specialized processors (K)
- **Y-axis**: Geometric mean(Area × Latency) across all 6 programs
- **Optimal K**: Marked with red star

This answers: *"How many specialized processors minimize overall area×latency cost?"*

### Interpretation

- **K=1** (Single general-purpose processor)
  - Highest geomean - supports all instructions
  - Largest area, highest average latency

- **K=2-3** (Few specialized processors)
  - **Likely optimal** - balances specialization vs. complexity
  - Smaller ISAs per cluster
  - Better area-latency product

- **K=6** (Fully specialized, one per program)
  - Minimal ISA per program
  - Best individual performance
  - But requires 6 separate processors (higher total area)

---

## Performance Metric

### Geometric Mean Calculation

For each K value:

```python
# For each cluster's best ASIP variant:
for cluster in clusters_at_K:
    for program in cluster.programs:
        # Run program on cluster's ASIP
        area, latency = synthesize(program, cluster_best_asip)
        products.append(area * latency)

# Overall performance for this K
geomean_K = exp(mean(log(products)))  # Geometric mean of area×latency
```

**Why geometric mean?**
- Handles different program scales (small vs. large programs)
- Multiplicative improvement is meaningful (e.g., 2× better)
- Standard metric for geometric quantities (area, cycles)

---

## Advanced Usage

### Custom Clustering

If you want specific program groupings instead of k-means:

```json
{
  "programs": ["prog1", "prog2", "prog3", "prog4"],
  "clusterings": {
    "k2": {
      "n_clusters": 2,
      "clusters": {
        "cluster_0": {
          "programs": ["prog1", "prog2"],
          "size": 2
        },
        "cluster_1": {
          "programs": ["prog3", "prog4"],
          "size": 2
        }
      }
    }
  }
}
```

Then run:
```bash
python build_cluster_asips.py --clustering custom_clusters.json --k-values 2
```

### Testing Single Cluster

Test ILP merging for a specific cluster:

```bash
# Merge e-graphs
python Extractor/src/cluster_egraph_merger.py \
    dijkstra_small_O3 basicmath_small_O3 \
    -o output/ilp/test_cluster/merged.json

# Run ILP
python Extractor/src/ILP/cluster_ilp_solver.py \
    --programs dijkstra_small_O3 basicmath_small_O3 \
    --scales "0 1 10" \
    --best-k 2 \
    --timeout 600
```

---

## Configuration Parameters

### ILP Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `--scales` | `"0 0.1 0.5 1 10 100"` | Node cost scaling factors |
| `--best-k` | `3` | Variants per scale |
| `--ilp-timeout` | `900` | Timeout in seconds (15 min) |

**Scale interpretation:**
- `0`: Minimize only operator types (ignore node costs)
- `0.1-1`: Balanced (prefer fewer operators, but consider expression complexity)
- `10-100`: Emphasize node costs (simpler expressions, more operators)

### Synthesis Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `--synth-jobs` | `72` | Parallel synthesis processes |

**Runtime scaling:**
- Each synthesis job: ~30-60 seconds
- With 72 processes: Can handle ~4000 jobs/hour

---

## Output Files

### Per-Cluster Outputs

**`merged.json`** (~10-50 MB)
- Combined e-graph from all programs in cluster
- Preserves node IDs with program-specific prefixes

**`scale_X/`** directories
- `lp/problem.lp`: ILP formulation
- `sol/solution_*.sol`: ILP solutions
- `result/result_*.json`: Extracted instruction sets

**`asip_results.json`**
```json
{
  "cluster_id": 0,
  "programs": ["prog1", "prog2"],
  "best_variant": {
    "variant_id": 5,
    "scale": 1.0,
    "geomean": 1.23e9,
    "instruction_set": ["Add", "Sub", "Lw", "Sw", "Beq", ...],
    "num_instructions": 25
  }
}
```

### Global Outputs

**`k_vs_performance.png`**
- Line plot showing K vs. geomean(area×latency)
- Optimal K highlighted

**`k_vs_performance_table.txt`**
```
K vs Performance Summary
==========================================================
    K    Geomean(Area×Latency)     Improvement vs K=1
----------------------------------------------------------
    1               1.50e+09                  0.0%
    2               9.80e+08                 34.7%  ← Optimal
    3               1.05e+09                 30.0%
    6               1.20e+09                 20.0%
```

**`asip_summary.json`**
- Complete results for all K values and clusters
- Best ASIP selections
- Performance metrics

---

## Workflow Integration

### Full End-to-End Pipeline

```bash
# 1. Run frontend analysis for all programs (if not done)
cd frontend
./run_full_analysis.sh basicmath_small_O3 bitcnts_O3 qsort_small_O3 \
                       qsort_large_O3 dijkstra_small_O3 patricia_O3
cd ..

# 2. Run saturation (e-graph generation)
cd Saturation
./run_saturation.sh basicmath_small_O3 bitcnts_O3 qsort_small_O3 \
                    qsort_large_O3 dijkstra_small_O3 patricia_O3
cd ..

# 3. Cluster analysis
python analyze_program_similarity.py \
    --k-values 1 2 3 6 \
    --export-multi-k multi_k_clustering.json

# 4. Build ASIPs
python build_cluster_asips.py \
    --clustering multi_k_clustering.json \
    --k-values 1 2 3 6
```

### Using with run_multi_scale_variants.sh

The single-program variant generation script can prepare inputs:

```bash
# Generate frontend + saturation for all 6 programs
./run_multi_scale_variants.sh --skip-saturation --no-clean

# Then run cluster ASIP building
python analyze_program_similarity.py --k-values 1 2 3 6
python build_cluster_asips.py --clustering multi_k_clustering.json
```

---

## Troubleshooting

### ILP Timeout for Large Clusters

If K=1 (all 6 programs) times out with default 900s:

```bash
# Increase timeout to 30 minutes
python build_cluster_asips.py \
    --clustering multi_k_clustering.json \
    --k-values 1 \
    --ilp-timeout 1800
```

### Missing Frontend Outputs

Error: `No basic blocks found for <program>`

```bash
# Run frontend analysis for missing programs
cd frontend
./run_full_analysis.sh <program_name>
cd ..
```

### Missing Saturation Outputs

Error: `JSON directory not found`

```bash
# Run saturation for missing programs
cd Saturation
./run_saturation.sh <program_name>
cd ..
```

---

## Expected Results

### Typical Clustering (K=3)

Based on instruction usage patterns:

- **Cluster 0**: Arithmetic-heavy (basicmath, qsort)
  - Heavy use of: Add, Sub, Mul, Div
  - ISA: ~35 instructions

- **Cluster 1**: Bitwise-heavy (bitcnts, patricia)
  - Heavy use of: And, Or, Xor, Sll, Srl
  - ISA: ~30 instructions

- **Cluster 2**: Control-flow heavy (dijkstra)
  - Heavy use of: Beq, Bne, Blt, Bge
  - ISA: ~32 instructions

### Performance Gain

Typical improvement from K=1 to optimal K:
- **Area reduction**: 20-40% (fewer instructions = smaller datapath)
- **Latency reduction**: 10-25% (simpler ISA = shorter critical paths)
- **Combined (area×latency)**: 30-50% improvement

---

## Implementation Details

### E-graph Merging

Programs are merged at the JSON level with unique prefixes:
```
Program1, Block 0: prog1_0_enode_*, prog1_0_eclass_*
Program1, Block 1: prog1_1_enode_*, prog1_1_eclass_*
Program2, Block 0: prog2_0_enode_*, prog2_0_eclass_*
...
```

This prevents ID collisions while maintaining e-graph semantics.

### ILP Objective Function

```
Minimize: Σ(weight_i × Op_i) + scale × Σ(cost_j × Node_j)
```

Where:
- `Op_i`: Binary variable (1 if instruction type i is used)
- `weight_i`: Instruction cost (Mul=3000, Div=5000, Add=100)
- `scale`: User-defined scaling factor (0 to 10000)
- `Node_j`: Binary variable (1 if e-graph node j is selected)
- `cost_j`: Node complexity cost

### Best ASIP Selection

For cluster with programs P₁, P₂, ..., Pₙ:

```python
For each ASIP variant v:
    products = []
    for program p in cluster:
        area_p = synthesize(p, ASIP_v).area
        latency_p = synthesize(p, ASIP_v).latency
        products.append(area_p × latency_p)

    score_v = exp(mean(log(products)))  # Geometric mean

best_ASIP = argmin_v(score_v)
```

---

## Files Created

### Core Modules

1. **`analyze_program_similarity.py`**
   - K-means clustering based on instruction usage
   - Multi-K export functionality
   - Visualization (PCA, heatmaps)

2. **`Extractor/src/cluster_egraph_merger.py`**
   - Merges e-graphs from multiple programs
   - Handles prefix management
   - Standalone CLI tool

3. **`Extractor/src/ILP/cluster_ilp_solver.py`**
   - Multi-scale ILP optimization for clusters
   - Handles merged e-graphs
   - Generates multiple ASIP variants

4. **`build_cluster_asips.py`**
   - Main orchestrator
   - Coordinates ILP, variant generation, synthesis
   - Computes geometric means
   - Generates K vs. performance plots

---

## Next Steps

After obtaining optimal K:

1. **Extract ISA Definitions**
   ```bash
   # Best ASIP for cluster 0 at K=3
   cat output/cluster_asips/k3/cluster_0/best_asip.json
   ```

2. **Generate RTL**
   ```bash
   # Use DSL file to synthesize RTL
   cd PdatScorrWrapper/ScorrPdat
   ./synth_ibex_with_constraints.sh \
       ../../output/cluster_asips/k3/cluster_0/dsl_files/variant_5.dsl \
       --gates
   ```

3. **Verify Programs**
   ```bash
   # Test each program on its cluster's ASIP
   cd benchmark
   ./run_and_verify_clean.sh <program>_variant_5.s
   ```

---

## Theory: Why Cluster-Based Optimization?

### Problem

Traditional approaches:
- **General-purpose ISA** (K=1): Large area, supports all instructions
- **Per-program ISA** (K=N): Minimal per-program, but N separate processors

### Solution

Cluster-based specialization (K=2-4):
- Groups similar programs
- Each cluster gets optimized ISA
- Balances specialization vs. hardware diversity

### Benefits

1. **Area Efficiency**: Smaller ISAs → smaller datapaths
2. **Latency Improvement**: Fewer instructions → simpler decode/execute
3. **Scalability**: K clusters instead of N programs
4. **Flexibility**: Can tune K based on area budget

---

## Citation

If you use this pipeline in research, please cite:

```bibtex
@misc{cluster_asip_optimizer,
  title={Cluster-Based Application-Specific ISA Processor Generation},
  author={E-graph ISA Compiler Codesign Project},
  year={2025},
  note={Available at: github.com/...}
}
```

---

## Contact

For questions or issues, see project README or open an issue.
