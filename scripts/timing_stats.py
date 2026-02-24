import json
import statistics

with open("timing.json") as f:
    data = json.load(f)

programs = data["programs"]

sat_ms   = [v["saturation_ms"]  for v in programs.values()]
ext_ms   = [v["extraction_ms"]  for v in programs.values()]
total_ms = [s + e for s, e in zip(sat_ms, ext_ms)]

def stats(label, values):
    mn  = min(values)
    mx  = max(values)
    med = statistics.median(values)
    print(f"{label:12s}  min={mn:7.0f} ms  median={med:7.0f} ms  max={mx:7.0f} ms")

print(f"{'':12s}  {'min':>12}    {'median':>12}    {'max':>12}")
print("-" * 60)
stats("saturation",  sat_ms)
stats("extraction",  ext_ms)
stats("total",       total_ms)
