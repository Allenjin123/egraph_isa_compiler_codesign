We thank the reviewers for their valuable feedback. We have restructured the paper and added experiments following reviewer suggestions. New and revised content in the manuscript appears in non-black text. We first address common concerns, then reviewer-specific ones.

**Energy (A,D,E,F):**
We added direct energy evaluation (Section V-B). Under SKY130, geometric-mean energy reduction is 4% over PDAG (14.3% over baseline); under PPDK (leakage-dominated), 6% (22.8% over baseline). Savings stem from pruning hardware units and frequency upscaling from a simplified critical path. Energy gains are more modest than area/power because rewriting increases cycle counts—consistent with Reviewer E's efficiency proxy observation. Combining instruction reduction with instruction fusion would address both sides; we leave this to future work.

**Tool Running Times (B,C,D,F):**
Rule discovery is a one-time per-ISA cost. Added runtime evaluation (Section V-E, Figure 11): saturation 0.5–17 s, extraction 0.3–75 s (median 2.3 s), pruning 5–36 s (median 11 s), giving **19.8 s median end-to-end per variant**. Global saturation times out after 1 h; PDAG pruning under RV32I after 5 h. Full Pareto exploration (27 λ values) finishes within **44 min** with parallelization.

**Neurosymbolic Rule Discovery (A,B,C,F):**
Section IV-A restructured with complete rewrite rule table. Pipeline: (1) RV32IM simulator/validator on Greenthumb's semantics library, (2) four search algorithms—three from Greenthumb (symbolic, stochastic, enumerative) plus an **LLM-based counterexample-guided loop**. Greenthumb handles simple instructions within minutes; the LLM discovers complex rewrites (e.g., Karatsuba-style `mulh` decompositions). **51 rules** covering 26 instructions; **26 discovered by the LLM**.

**Experimental Comparisons (C,D,F):**
Area reduction under **1.2× latency constraint** and **unconstrained** (Table III): 5.9%/5.8% geomean (SKY130/PPDK) at 1.2×, reaching 17.0%/12.4% unconstrained. Pareto frontiers for all eight MiBench benchmarks (Figure 9): some workloads achieve both smaller area *and* shorter latency (up to 29% area, 0.79× latency); latency-sensitive ones achieve 8–15% area reduction at <1.1× overhead.

**Generalizability (B,E,F):**
Retargeting requires: (1) ISA semantics model, (2) rewrite rules in egglog, (3) synthesizable baseline core, (4) hardware cost model—core engine unchanged. We demonstrate on the **5-stage Rocket core**: **24.6% area reduction** unconstrained (16.1% over PDAG), **13.0%** under ≤1.2× latency (3.2% over PDAG, 1.07× overhead). Smaller gains than Ibex due to deeper pipeline, but consistent improvement confirms generalizability.

**Code Size (A,E):**
Under 32-bit encoding, rewritten programs are 2.27× larger. However, fewer distinct instruction types make them amenable to compressed encoding: entropy-coded programs average **0.60× original size**. Uniform encoding (⌈log₂N⌉ bits) achieves near-optimal compression with random-access decoding. Code size can be further optimized as a cost model objective.

**Ibex Configuration (A,C):**
Added to Section V: **Small** config (2-stage, no branch prediction), RV32IM. Area/power are **logic-only** (excluding caches/SRAM). Latency via **cycle-accurate RTL simulation**. Tool versions listed.

**Verification→Validation (C,D):**
Renamed to "End-to-End Validation." Testing-based: rewritten programs executed on cycle-accurate RTL and compared against baselines. All 22 benchmarks produce identical results. We retain this section in Methodology (rather than Evaluation) because it describes the validation *infrastructure* that is integral to the framework's design, not a standalone experiment.

**Instruction trends (A):** Updated Figure 8 shows reduction by category: Mul/Div fully eliminated, arithmetic −33.3%, branch −31.9%, memory −8.1%.

**ADP comparison (D):** Constrained Pareto-optimal variants improve the area-delay product over PDAG—confirmed in Section V-C.

**Ruler/Enumo (B):** Comparison added (Section IV-A). Greenthumb chosen for its register/memory/flag semantics and bespoke-ISA extensibility (e.g., GA144); Ruler/Enumo target high-level algebraic domains; Sail/ILA lack search algorithms. æSIP's three stages (rule discovery, equality saturation, hardware pruning) are independently replaceable—e.g., substituting Enumo's search or Sail's ISA modeling for Greenthumb requires no changes to the downstream stages.

**Timing constraints (C):** Orthogonal to rewriting—depend on user-provided memory subsystem assumptions, not on which instructions are retained. Clarified in Section IV-C.

**"Attempt" in IV-E (C):** Rewriting always succeeds (every subset is Turing-complete). "Attempt" refers to whether the latency overhead is acceptable; if not, re-run with k+1 ASIP variants. Clarified in text.

**Minor issues (C):** Figure 1 now referenced in the introduction. `x0` in Figure 2 is the standard RISC-V zero register name (hardwired to 0), not a typo. num-chip=10 corrected to num-chip=22. NRE figure updated for colorblind accessibility. Table decimal alignment fixed.

**Novelty/ablation (D):** Novelty is the **systematic codesign** of program rewriting with μArch-aware pruning via unified cost model. Figure 9 Pareto curves ablate ISA-level-only vs. μArch-aware constraints. Quantitative ablation (geomean area reduction over PDAG):

|  | ISA-only | ISA+μArch | μArch contribution |
|--|----------|-----------|-------------------|
| **1.2× constraint, SKY130** | −3.8% | −5.6% | +1.8% |
| **1.2× constraint, PPDK** | −4.6% | −5.8% | +1.3% |
| **Unconstrained, SKY130** | −16.4% | −17.0% | +0.7% |
| **Unconstrained, PPDK** | −11.9% | −12.4% | +0.5% |

μArch-aware constraints add 0.5–1.8% area reduction on top of ISA-only optimization. The contribution is proportionally larger under the 1.2× latency constraint, where complex instructions are retained and barrel-shifter/memory-subsystem simplifications provide additional savings beyond ISA-level pruning.

**"Drop-in replacement" vs. narrowing arithmetic units (D):**
Thank you for catching this overclaim. We introduce two data-level constraints: **operand width** (requires dynamic profiling, sacrifices generality) and **immediate value** (statically derivable, preserves drop-in guarantee). In this work, we restrict to **immediate value constraints only**. Corrected in the revision.

**Karatsuba (D):** Fully automatic—LLM-discovered and SMT-verified; clarified in Section IV-A.

**RISP and equality saturation undefined (D):** Both terms are now defined in the introduction (Figure 1 caption and surrounding text).

**Static power (E):** Added full energy evaluation with dynamic power via Innovus activity-factor analysis; see Energy above.

**Pipeline depth (E):** Rocket core (5-stage) confirms benefits are not artifacts of Ibex's shallow pipeline; see Generalizability above.

**Figure 6 (F):** Redesigned around a **concrete running example** with two basic blocks, showing orphan e-class handling, rewrite alternatives, and ILP-selected outputs.

**Divide-and-conquer speedup (F):** The speedup comes from both effects: restricting saturation to basic-block scope avoids the combinatorial blow-up of cross-block rule interactions, *and* enables parallelism across blocks. The runtime evaluation (Figure 11) confirms this — local saturation completes in seconds while global saturation times out after 1 hour at comparable e-graph size.

**Figure 8 sizing (F):** Revised to reduce vertical space.

**Section IV-C detail (F):** Restructured. Static analysis extracts opcode/immediate usage → automated SVA generation → *k*-step induction + `scorr` resubstitution + error-injection pruning via `dsec`. Our contributions in this stage are the **automated constraint derivation pipeline** and the **error-injection-based gate pruning**; `scorr` and `dsec` are existing ABC engines that we invoke.

**Section IV-E (F):** Rewritten to eliminate redundancy. Now focuses on ISA *convergence*, ILP-based clustering with chip count *k*, and post-tapeout extensibility.

**λ values and measurement (F):** 27 values (small λ biases toward area): 0,0.0001,0.0002,0.0005,0.001,0.0015,0.002,0.003,0.005,0.007,0.01,0.015,0.02,0.03,0.05,0.07,0.1,0.15,0.2,0.3,0.4,0.5,0.6,0.7,0.85,0.9,1. Values/scripts included in open-source release. Spike for rapid exploration, RTL simulation for final evaluation (>0.98 Pearson correlation).

**Tool versions (F):**
Added to Section V. Code will be open-sourced upon publication.
