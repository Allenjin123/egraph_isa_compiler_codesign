import json
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
import numpy as np

with open("timing.json") as f:
    data = json.load(f)

programs = data["programs"]

# Sort by insn_count
items = sorted(programs.items(), key=lambda x: x[1]["insn_count"])
names = [k for k, _ in items]
insn  = [v["insn_count"]     for _, v in items]
sat   = [v["saturation_ms"]  / 1000 for _, v in items]
ext   = [v["extraction_ms"]  / 1000 for _, v in items]
total = [s + e for s, e in zip(sat, ext)]

# Shorten labels
short = [n.replace("_small","").replace("_large","").replace("_O3","").replace("_Oz","") for n in names]

x = np.arange(len(names))
fig, axes = plt.subplots(2, 1, figsize=(14, 10))
fig.suptitle("Compilation Timing vs Instruction Count", fontsize=14, fontweight="bold")

# ── Top: Stacked bar (saturation + extraction) ──────────────────────────────
ax1 = axes[0]
bars_sat = ax1.bar(x, sat,   label="Saturation (s)",  color="#4C72B0", alpha=0.85)
bars_ext = ax1.bar(x, ext,   label="Extraction (s)",  color="#DD8452", alpha=0.85, bottom=sat)
ax1.set_xticks(x)
ax1.set_xticklabels(short, rotation=40, ha="right", fontsize=8)
ax1.set_ylabel("Time (s)")
ax1.set_title("Saturation + Extraction Time per Program")
ax1.legend()
ax1.yaxis.set_major_formatter(ticker.FuncFormatter(lambda v, _: f"{v:.1f}"))
ax1.grid(axis="y", linestyle="--", alpha=0.4)

# Annotate instruction count above each bar
for i, (ins, tot) in enumerate(zip(insn, total)):
    ax1.text(i, tot + 0.2, f"{ins}", ha="center", va="bottom", fontsize=6.5, color="#333")

# ── Bottom: Scatter – insn_count vs time ────────────────────────────────────
ax2 = axes[1]
ax2.scatter(insn, sat,   label="Saturation",  color="#4C72B0", alpha=0.8, s=60)
ax2.scatter(insn, ext,   label="Extraction",  color="#DD8452", alpha=0.8, s=60, marker="^")
ax2.scatter(insn, total, label="Total",       color="#55A868", alpha=0.6, s=40, marker="D")


ax2.set_xlabel("Instruction Count")
ax2.set_ylabel("Time (s)")
ax2.set_title("Time vs Instruction Count (scatter)")
ax2.legend()
ax2.yaxis.set_major_formatter(ticker.FuncFormatter(lambda v, _: f"{v:.1f}"))
ax2.grid(linestyle="--", alpha=0.4)

plt.tight_layout()
out = "timing_plot.png"
plt.savefig(out, dpi=150, bbox_inches="tight")
print(f"Saved: {out}")
plt.show()
