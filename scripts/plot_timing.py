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
sat   = [v["saturation_ms"]       / 1000 for _, v in items]
ext   = [v["extraction_ms_average"] / 1000 for _, v in items]
scorr = [v["scorr_ms_average"]    / 1000 for _, v in items]
total = [s + e + c for s, e, c in zip(sat, ext, scorr)]

# Shorten labels
short = [n.replace("_small","_str").replace("_large","_num").replace("_O3","").replace("_Oz","").replace("_test","")  for n in names]

x = np.arange(len(names))
insn_arr = np.array(insn)
bar_width = (insn_arr.max() - insn_arr.min()) / len(insn_arr) * 0.6

sat_arr   = np.array(sat)
ext_arr   = np.array(ext)
scorr_arr = np.array(scorr)

fig, axes = plt.subplots(1, 1, figsize=(14, 5))
fig.suptitle("Timing vs Instruction Count", fontsize=14, fontweight="bold")

# ── Top: Stacked bar (saturation + extraction + scorr) ──────────────────────
ax1 = axes
ax1.bar(x, sat,   label="Saturation (s)",  color="#4C72B0", alpha=0.85)
ax1.bar(x, ext,   label="Extraction (s)",  color="#DD8452", alpha=0.85, bottom=sat)
bottom_scorr = [s + e for s, e in zip(sat, ext)]
ax1.bar(x, scorr, label="Pruner (s)",       color="#55A868", alpha=0.85, bottom=bottom_scorr)
ax1.set_xticks(x)
ax1.set_xticklabels(short, rotation=40, ha="right", fontsize=8)
ax1.set_ylabel("Time (s)")
ax1.set_title("")
ax1.legend()
ax1.yaxis.set_major_formatter(ticker.FuncFormatter(lambda v, _: f"{v:.1f}"))
ax1.grid(axis="y", linestyle="--", alpha=0.4)

# Annotate instruction count above each bar
for i, (ins, tot) in enumerate(zip(insn, total)):
    ax1.text(i, tot + 0.2, f"{ins}", ha="center", va="bottom", fontsize=6.5, color="#333")

# # ── Second: Scatter – insn_count vs time ────────────────────────────────────
# ax2 = axes[1]
# ax2.scatter(insn, sat,   label="Saturation",  color="#4C72B0", alpha=0.8, s=60)
# ax2.scatter(insn, ext,   label="Extraction",  color="#DD8452", alpha=0.8, s=60, marker="^")
# ax2.scatter(insn, scorr, label="Pruner",       color="#55A868", alpha=0.8, s=60, marker="s")
# ax2.scatter(insn, total, label="Total",       color="#8B5CF6", alpha=0.6, s=40, marker="D")
# ax2.set_xlabel("Instruction Count")
# ax2.set_ylabel("Time (s)")
# ax2.set_title("Saturation / Extraction / Pruner vs Instruction Count (scatter)")
# ax2.legend()
# ax2.yaxis.set_major_formatter(ticker.FuncFormatter(lambda v, _: f"{v:.1f}"))
# ax2.grid(linestyle="--", alpha=0.4)

# # ── Third: Narrow stacked bar with insn_count as x-axis, no labels ──────────
# ax3 = axes[2]
# narrow_width = bar_width * 0.2
# ax3.bar(insn_arr, sat_arr,   width=narrow_width, label="Saturation (s)", color="#4C72B0", alpha=0.85)
# ax3.bar(insn_arr, ext_arr,   width=narrow_width, label="Extraction (s)", color="#DD8452", alpha=0.85, bottom=sat_arr)
# ax3.bar(insn_arr, scorr_arr, width=narrow_width, label="Pruner (s)",      color="#55A868", alpha=0.85, bottom=sat_arr + ext_arr)
# ax3.set_xlabel("Instruction Count")
# ax3.set_ylabel("Time (s)")
# ax3.set_title("Saturation + Extraction + Pruner vs Instruction Count (narrow)")
# ax3.legend()
# ax3.yaxis.set_major_formatter(ticker.FuncFormatter(lambda v, _: f"{v:.1f}"))
# ax3.grid(axis="y", linestyle="--", alpha=0.4)

plt.tight_layout()
out = "timing_plot.png"
plt.savefig(out, dpi=150, bbox_inches="tight")
print(f"Saved: {out}")
plt.show()
