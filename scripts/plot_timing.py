import json

import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
import numpy as np
import seaborn as sns
from matplotlib.font_manager import FontProperties
from matplotlib.patches import Patch

plt.rcParams['font.family'] = 'sans-serif'

BOLD_FP = FontProperties(size=22, family='sans-serif')
NORM_FP = FontProperties(size=20, family='sans-serif')

NAME_MAPPING = {
    'basicmath_small_O3': 'basicmath',
    'bitcnts_O3': 'bitcnts',
    'dijkstra_small_O3': 'dijkstra',
    'matmult-int': 'matmult-int',
    'qsort_large_O3': 'qsort-num',
    'qsort_small_O3': 'qsort-str',
    'sha_O3': 'sha',
    'patricia_O3': 'patricia',
    'picojpeg_test': 'picojpeg',
    'rijndael_Oz': 'rijndael',
    'libhuffbench': 'huffbench',
    'combined': 'combined',
    'libedn': 'edn',
    'libnsichneu': 'nsichneu',
    'libslre': 'slre',
    'libstatemate': 'statemate',
    'libud': 'ud',
    'libwikisort': 'wikisort',
    'md5': 'md5sum',
}

with open("timing.json") as f:
    data = json.load(f)

programs = data["programs"]

# Sort alphabetically by program name (same order as parse_instruction_counts.py)
items = sorted(programs.items(), key=lambda x: x[0])
names = [k for k, _ in items]
insn  = [v["insn_count"]            for _, v in items]
sat   = [v["saturation_ms"]       / 1000 for _, v in items]
ext   = [v["extraction_ms_average"] / 1000 for _, v in items]
scorr = [v["scorr_ms_average"]    / 1000 for _, v in items]
total = [s + e + c for s, e, c in zip(sat, ext, scorr)]

# Shorten labels via name mapping
short = [NAME_MAPPING.get(n, n) for n in names]

n = len(names)
x = np.arange(n)

sns.set_palette("Set2")
cat_colors = sns.color_palette("Set2", 3)

# Y_MAX: clip outlier bars, label them with actual value
# Find a reasonable max: second-largest total * 1.15
sorted_totals = sorted(total)
# Y_MAX = sorted_totals[-2] * 1.3 if len(sorted_totals) > 1 else max(total) * 1.1
Y_MAX = 130


fig, ax = plt.subplots(figsize=(10, 4))

# Stacked bar: saturation + extraction + pruner
bar_w = 0.6
ax.bar(x, sat, width=bar_w, edgecolor='black', linewidth=0.4, alpha=1,
       color=cat_colors[0])
ax.bar(x, ext, width=bar_w, edgecolor='black', linewidth=0.4, alpha=1,
       color=cat_colors[1], bottom=sat)
bottom_scorr = [s + e for s, e in zip(sat, ext)]
ax.bar(x, scorr, width=bar_w, edgecolor='black', linewidth=0.4, alpha=1,
       color=cat_colors[2], bottom=bottom_scorr)

# Label bars that exceed Y_MAX with actual value
for i, tot in enumerate(total):
    if tot > Y_MAX:
        ax.text(x[i], Y_MAX - 3, f'{tot:.0f}s',
                ha='center', va='top', fontsize=10,
                bbox=dict(facecolor='white', alpha=0.7,
                          edgecolor='none', pad=2),fontweight='bold')

ax.set_xlim(-0.6, n - 0.4)
ax.set_ylim(0, Y_MAX)

# Configure axes
ax.set_ylabel('Tool Runtime (s)', fontsize=16, fontproperties=BOLD_FP)
ax.set_xticks(x)
ax.set_xticklabels([])
ax.set_xticks([], minor=True)
XLABEL_X_OFFSET = -0.1
for i, label in enumerate(short):
    ax.text(x[i] + XLABEL_X_OFFSET, -0.12, label,
            transform=ax.get_xaxis_transform(),
            rotation=40, ha='right', va='top', fontsize=14,
            rotation_mode='anchor')
ax.tick_params(axis='x', which='major', length=4, direction='out',
               bottom=True, top=False, pad=5)
ax.tick_params(axis='x', which='minor', length=0)
ax.tick_params(axis='y', labelsize=12)
ax.yaxis.set_major_formatter(ticker.FuncFormatter(lambda v, _: f"{int(v)}"))
ax.grid(axis='y', alpha=0.3, linestyle='--')

# Instruction counts below axis, above the labels
insn_label_fp = FontProperties(weight='bold', size=9)
insn_y_pts = -9

ax.annotate('# Instr',
            xy=(x[0], 0), xycoords=('data', 'axes fraction'),
            xytext=(-26, insn_y_pts), textcoords='offset points',
            ha='right', va='top', color='#2B547E',
            fontproperties=insn_label_fp, annotation_clip=False)

for i, ins in enumerate(insn):
    ax.annotate(f'{ins}',
                xy=(x[i], 0), xycoords=('data', 'axes fraction'),
                xytext=(0, insn_y_pts), textcoords='offset points',
                ha='center', va='top', color='#2B547E',
                fontproperties=insn_label_fp, annotation_clip=False)

# Legend: upper right inside figure
legend_handles = [
    Patch(facecolor=cat_colors[0], edgecolor='black', linewidth=0.6,
          label='Saturation'),
    Patch(facecolor=cat_colors[1], edgecolor='black', linewidth=0.6,
          label='Extraction'),
    Patch(facecolor=cat_colors[2], edgecolor='black', linewidth=0.6,
          label='Pruner'),
]
ax.legend(handles=legend_handles, loc='lower center', bbox_to_anchor=(0.5, 1.04),
          ncol=3, frameon=True, framealpha=0.9, fontsize=14,
          columnspacing=1.0, handletextpad=0.4, borderpad=0.3, borderaxespad=0.0)

plt.tight_layout()
out = "timing_plot.pdf"
plt.savefig(out, dpi=300, bbox_inches="tight")
print(f"Saved: {out}")
plt.close()
