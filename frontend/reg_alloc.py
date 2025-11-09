import re
import heapq
from typing import Dict, Iterable, List, Optional, Set, Tuple

from util import INSTRUCTIONS_WITHOUT_RD, parse_instruction, is_register

def allocate_compact_mapping(
    lines: List[str], live_out: Optional[Iterable[str]] = None
) -> Tuple[Dict[str, str], int]:
    """
    仅生成映射与最小 m：
      - 输入：SSA 的 op_* 与真实寄存器混用的基本块
      - 输出：(mapping, m)
         mapping: 原 op_* -> (真实寄存器 或 新 op_k)
         m: 目标空间里出现的最大 k（使得目标只用到 op_0..m）
    规则：
      1) 优先把每个 SSA 名分配到某个“全程可用”的真实寄存器；
      2) 否则分配到最小可用的 op_k（线扫复用、压缩 m）。
    """

    # ---------- 1) 收集活跃区间 ----------
    def_line: Dict[str, int] = {}
    end_line: Dict[str, int] = {}
    real_regs: Set[str] = set()
    
    # 对于真实寄存器，记录所有 def 和 use 的位置
    real_defs: Dict[str, List[int]] = {}  # 每个真实寄存器的所有定义点
    real_uses: Dict[str, List[int]] = {}  # 每个真实寄存器的所有使用点

    for idx, line in enumerate(lines):
        mnem, ops = parse_instruction(line, op_reg="op_")
        if not mnem:
            continue
        mnem_l = mnem.lower()
        ops = [o.strip() for o in ops]
        has_rd = (mnem_l not in INSTRUCTIONS_WITHOUT_RD) and len(ops) > 0
        rd = ops[0] if has_rd else None
        uses = ops[1:] if has_rd else ops

        # 先处理 uses（在 def 之前，因为同一条指令可能先读后写）
        for u in uses:
            if u.startswith("op_"):
                def_line.setdefault(u, 0)
                end_line[u] = idx
            elif is_register(u):
                real_regs.add(u)
                if u not in real_uses:
                    real_uses[u] = []
                real_uses[u].append(idx)

        # 再处理 rd（def）
        if rd:
            if rd.startswith("op_"):
                def_line.setdefault(rd, idx)
                end_line.setdefault(rd, idx)
            elif is_register(rd):
                real_regs.add(rd)
                if rd not in real_defs:
                    real_defs[rd] = []
                real_defs[rd].append(idx)

    if live_out:
        block_end = len(lines)
        for sym in live_out:
            if not sym:
                continue
            if sym.startswith("op_"):
                def_line.setdefault(sym, 0)
                end_line[sym] = block_end
            elif is_register(sym):
                # live_out 中的真实寄存器，视为在块尾有一次"虚拟使用"
                if sym not in real_uses:
                    real_uses[sym] = []
                real_uses[sym].append(block_end)

    # 仅对 SSA（op_*）做分配；真实寄存器只作为资源与固有 busy 段
    ssa_intervals = sorted(
        ((name, def_line[name], end_line.get(name, def_line[name]))
         for name in def_line if name.startswith("op_")),
        key=lambda x: x[1]
    )

    # 真实寄存器的"固有"占用区间（由代码中真实寄存器的使用/定义推得）
    # 对每个真实寄存器构建 def-use 区间链
    real_busy: Dict[str, List[Tuple[int, int]]] = {
        r: [] for r in real_regs
    }
    
    for r in real_regs:
        defs = sorted(real_defs.get(r, []))
        uses = sorted(real_uses.get(r, []))
        
        if not defs and not uses:
            # 既没有定义也没有使用（不应该出现，因为能进入 real_regs 说明至少有一个）
            continue
        elif not defs:
            # 只有使用，没有定义 → 从块入口到最后使用的下一行（半开区间）
            real_busy[r].append((0, uses[-1] + 1))
        elif not uses:
            # 只有定义，没有使用 → 每个定义点本身（半开区间 [d, d+1)）
            for d in defs:
                real_busy[r].append((d, d + 1))
        else:
            # 既有定义也有使用
            # 找出每个 def 对应的 use 范围
            # 策略：按时间顺序，每个 def 管理到下个 def 之前的所有 use
            
            # 先处理第一个 def 之前的 uses（如果有）
            first_def = defs[0]
            uses_before_first_def = [u for u in uses if u < first_def]
            if uses_before_first_def:
                # 这些 use 来自块入口的 live-in（半开区间到最后 use 的下一行）
                real_busy[r].append((0, uses_before_first_def[-1] + 1))
            
            # 处理每个 def 及其后续 uses
            for i, d in enumerate(defs):
                # 找到这个 def 到下一个 def 之间的所有 uses
                next_def = defs[i + 1] if i + 1 < len(defs) else float('inf')
                uses_in_range = [u for u in uses if d <= u < next_def]
                
                if uses_in_range:
                    # 从 def 点到该范围内最后一个 use 的下一行（半开区间）
                    real_busy[r].append((d, uses_in_range[-1] + 1))
                else:
                    # 没有后续 use，单点区间 [d, d+1)
                    real_busy[r].append((d, d + 1))
    
    # 合并每个真实寄存器的重叠区间
    for r in real_regs:
        real_busy[r].sort()
        # 合并重叠区间
        merged = []
        for start, end in real_busy[r]:
            if merged and start <= merged[-1][1]:
                # 重叠或相邻，合并
                merged[-1] = (merged[-1][0], max(merged[-1][1], end))
            else:
                merged.append((start, end))
        real_busy[r] = merged

    # ---------- 2) 分配：先尝试真实寄存器，再用最小可用 op_k ----------
    mapping: Dict[str, str] = {}

    # 每个真实寄存器上我们自己新分配的 SSA 占用段
    assigned_on_real: Dict[str, List[Tuple[int, int]]] = {r: [] for r in real_regs}

        # op_k 槽的动态分配（线扫复用）：最小可用编号优先
    free_ids: List[int] = []   # 小根堆
    next_id = 0                # 下一个新建的 op_k 编号
    # 为了做 op_k 的线扫复用，我们需要在时间轴释放它们
    # 用"事件表"：当某 SSA 在 time=end 结束时，释放其占用的资源
    end_events: Dict[int, List[Tuple[str, Optional[int]]]] = {}  # time -> [(kind, id)]
    # where kind == 'op' -> id 为 op_k；kind == 'real' 表示无需释放编号，但记录即可
    # 我们会边走边触发释放（按 SSA start 升序扫描）
    
    # 用最小堆维护所有未处理的释放时间点，避免稀疏事件时的无效步进
    release_times: List[int] = []  # 小根堆，存储所有释放事件的时间点

    # 简单区间重叠判断
    def overlaps(s1: int, e1: int, s2: int, e2: int) -> bool:
        return not (e1 <= s2 or e2 <= s1)

    # 判断某真实寄存器是否能容纳 [s,e)（不与固有 busy 段/已分配段重叠）
    def real_can_hold(r: str, s: int, e: int) -> bool:
        for (rs, re) in real_busy[r]:
            if overlaps(rs, re, s, e):
                return False
        for (as_, ae) in assigned_on_real[r]:
            if overlaps(as_, ae, s, e):
                return False
        return True

    for name, s, e in ssa_intervals:
        # 触发所有 <= s 的释放事件（使用堆优化）
        while release_times and release_times[0] <= s:
            t = heapq.heappop(release_times)
            if t in end_events:
                for kind, kid in end_events[t]:
                    if kind == "op" and kid is not None:
                        heapq.heappush(free_ids, kid)
                del end_events[t]

        # 1) 尝试真实寄存器（选择"未来最晚变忙"的，以最大化后续可用性）
        chosen_real = None
        best_next_busy = -1  # 记录最优寄存器的下一个 busy 开始时间
        
        for r in sorted(real_regs):  # 排序保证稳定性
            if real_can_hold(r, s, e):
                # 找到该寄存器在当前分配之后的下一个 busy 开始时间
                next_busy_start = float('inf')
                
                # 检查固有 busy 段
                for (rs, re) in real_busy[r]:
                    if rs >= e:  # 在当前分配结束之后
                        next_busy_start = min(next_busy_start, rs)
                
                # 检查已分配段
                for (as_, ae) in assigned_on_real[r]:
                    if as_ >= e:  # 在当前分配结束之后
                        next_busy_start = min(next_busy_start, as_)
                
                # 选择"未来最晚变忙"的寄存器（贪心策略）
                if next_busy_start > best_next_busy:
                    best_next_busy = next_busy_start
                    chosen_real = r

        if chosen_real is not None:
            mapping[name] = chosen_real
            assigned_on_real[chosen_real].append((s, e))
            if e not in end_events:
                heapq.heappush(release_times, e)
            end_events.setdefault(e, []).append(("real", None))
        else:
            # 2) 分配最小可用 op_k
            if free_ids:
                kid = heapq.heappop(free_ids)
            else:
                kid = next_id
                next_id += 1
            mapping[name] = f"op_{kid}"
            if e not in end_events:
                heapq.heappush(release_times, e)
            end_events.setdefault(e, []).append(("op", kid))

    # 触发剩余释放（为了得到最终 m）
    while release_times:
        t = heapq.heappop(release_times)
        if t in end_events:
            for kind, kid in end_events[t]:
                if kind == "op" and kid is not None:
                    heapq.heappush(free_ids, kid)
            del end_events[t]

    m = max(-1, next_id - 1)  # 若一个 op_k 都没用过，m = -1；否则是最大编号
    return mapping, m
