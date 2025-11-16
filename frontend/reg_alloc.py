import re
import heapq
from typing import Dict, Iterable, List, Optional, Set, Tuple

from util import INSTRUCTIONS_WITHOUT_RD, parse_instruction, is_register, SPECIAL_REGS

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
            elif is_register(u) and u not in SPECIAL_REGS:  # 排除特殊寄存器
                real_regs.add(u)
                if u not in real_uses:
                    real_uses[u] = []
                real_uses[u].append(idx)

        # 再处理 rd（def）
        if rd:
            if rd.startswith("op_"):
                def_line.setdefault(rd, idx)
                end_line.setdefault(rd, idx)
            elif is_register(rd) and rd not in SPECIAL_REGS:  # 排除特殊寄存器
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
            elif is_register(sym) and sym not in SPECIAL_REGS:  # 排除特殊寄存器
                # live_out 中的真实寄存器，视为在块尾有一次"虚拟使用"
                if sym not in real_uses:
                    real_uses[sym] = []
                real_uses[sym].append(block_end)

    # 仅对 SSA（op_*）做分配；真实寄存器只作为资源与固有 busy 段
    # 按活跃区间的起始点排序（线性扫描分配算法要求）
    ssa_intervals = sorted(
        ((name, def_line[name], end_line.get(name, def_line[name]))
         for name in def_line if name.startswith("op_")),
        key=lambda x: (x[1], x[2])  # 按 (start, end) 排序
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
            uses_before_first_def = [u for u in uses if u <= first_def]
            if uses_before_first_def:
                # 这些 use 来自块入口的 live-in（半开区间到最后 use 的下一行）
                real_busy[r].append((0, uses_before_first_def[-1] + 1))
            
            # 处理每个 def 及其后续 uses
            for i, d in enumerate(defs):
                # 找到这个 def 到下一个 def 之间的所有 uses
                next_def = defs[i + 1] if i + 1 < len(defs) else float('inf')
                uses_in_range = [u for u in uses if d < u < next_def]
                
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
        # 特殊优化：检测"最后使用后立即重定义"模式
        # 如果 SSA 区间是 [s, s+1]，且寄存器 r 在 line s 使用、line s+1 重定义
        # 则允许复用（因为 r 在 line s 读取后立即死亡，line s+1 重生）
        if e == s + 1:  # 短生命周期：只跨越两条指令
            uses_at_s = s in real_uses.get(r, [])
            defs_at_e = e in real_defs.get(r, [])
            if uses_at_s and defs_at_e:
                # 模式匹配：line s 使用，line e 重定义
                # 这种情况下，r 在 line s 读取后立即无效，可以复用
                return True
        
        for (rs, re) in real_busy[r]:
            if overlaps(rs, re, s, e):
                return False
        for (as_, ae) in assigned_on_real[r]:
            if overlaps(as_, ae, s, e):
                return False
        return True

    for name, s, e in ssa_intervals:
        # 调试：打印当前分配的变量及其活跃区间
        # print(f"Allocating {name}: [{s}, {e})")
        
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
        
        # 优先使用 t 开头的寄存器（临时寄存器），再使用 a 开头的寄存器（参数寄存器）
        for r in sorted(real_regs, key=lambda x: (0 if x.startswith('t') else 1, x)):
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



def test_mulh():
    code = [
        "lui op_20, 16",
        "addi op_20, op_20, -1",
        "and op_4, op_2, op_20",
        "srai op_5, op_2, 16",
        "and op_6, op_3, op_20",
        "srai op_7, op_3, 16",
        "mul op_8, op_4, op_6",
        "mul op_9, op_5, op_6",
        "srli op_10, op_8, 16",
        "add op_9, op_9, op_10",
        "and op_11, op_9, op_20",
        "srai op_12, op_9, 16",
        "mul op_13, op_4, op_7",
        "add op_11, op_11, op_13",
        "mul op_1, op_5, op_7",
        "add op_1, op_1, op_12",
        "srai op_13, op_11, 16",
        "add op_1, op_1, op_13",
    ]
    #mulh op_1 op2 op3
    live_out = ["op_1"]  # 假设最终结果 op_1 是 live-out
    mapping, m = allocate_compact_mapping(code, live_out)
    
    print("Mapping:", mapping)
    print(f"Max op_ index used: {m}")
    
    # 应用映射，生成分配后的代码
    result = []
    for line in code:
        mnem, ops = parse_instruction(line, op_reg="op_")
        if mnem:
            new_ops = [mapping.get(op.strip(), op.strip()) for op in ops]
            result.append(f"{mnem} {', '.join(new_ops)}")
        else:
            result.append(line)
    
    print("\nAllocated code:")
    for line in result:
        print(line)

def test_xor_s3_issue():
    """
    测试 XOR 实现是否会错误覆盖 s3
    原始 placeholder 代码：
        or	op_0,s3,a2
        or	op_3,s3,a2
        sub	op_2,op_3,a2
        sub	op_1,s3,op_2
        sub	a2,op_0,op_1
    这段代码实现了 xor a2, a2, s3
    问题：如果 op_3 被分配到 s3，会导致 s3 被覆盖
    """
    code = [
        "or op_0, s3, a2",
        "or op_3, s3, a2",
        "sub op_2, op_3, a2",
        "sub op_1, s3, op_2",
        "sub a2, op_0, op_1",
    ]
    
    # s3 在后续还会被使用（live_out），所以不应该被覆盖
    live_out = ["a2"]
    
    print("=" * 60)
    print("测试 XOR 实现（s3 覆盖问题）")
    print("=" * 60)
    print("\n输入代码（placeholder 形式）：")
    for i, line in enumerate(code, 1):
        print(f"  {i}: {line}")
    
    print(f"\nLive-out: {live_out}")
    print("\n运行寄存器分配...")
    
    mapping, m = allocate_compact_mapping(code, live_out)
    
    print("\n分配结果：")
    print(f"Mapping: {mapping}")
    print(f"Max op_ index used: {m}")
    
    # 应用映射，生成分配后的代码
    result = []
    for line in code:
        mnem, ops = parse_instruction(line, op_reg="op_")
        if mnem:
            new_ops = [mapping.get(op.strip(), op.strip()) for op in ops]
            result.append(f"{mnem} {', '.join(new_ops)}")
        else:
            result.append(line)
    
    print("\n分配后的代码：")
    for i, line in enumerate(result, 1):
        print(f"  {i}: {line}")
    
    # 检查是否有问题：op_3 是否被分配到 s3
    if mapping.get("op_3") == "s3":
        print("\n" + "=" * 60)
        print("❌ 问题发现：op_3 被分配到 s3，会导致 s3 被覆盖！")
        print("=" * 60)
        print("\n问题分析：")
        print("  在分配后的代码中，第2行 'or s3, s3, a2' 会覆盖 s3 的原始值")
        print("  但第4行 'sub op_1, s3, op_2' 需要用到 s3 的原始值")
        print("  这会导致计算结果错误！")
        return False
    else:
        print("\n" + "=" * 60)
        print("✓ 测试通过：op_3 没有被分配到 s3")
        print("=" * 60)
        if mapping.get("op_3"):
            print(f"  op_3 被分配到: {mapping.get('op_3')}")
        return True


def test_double_sub_pattern():
    """
    测试双减法模式的寄存器分配优化
    模式: sub op_0, x0, a0
          sub a0, a2, op_0
    
    这个模式计算 a0 = a2 + a0 (通过两次减法)
    优化后应该复用 a0:
          sub a0, x0, a0    # a0 = -a0
          sub a0, a2, a0    # a0 = a2 + a0
    """
    code = [
        "sub op_0, x0, a0",
        "sub a0, a2, op_0",
    ]
    
    live_out = ["a0"]
    
    print("=" * 60)
    print("测试双减法模式（a0 复用优化）")
    print("=" * 60)
    print("\n输入代码（placeholder 形式）：")
    for i, line in enumerate(code, 1):
        print(f"  {i}: {line}")
    
    print(f"\nLive-out: {live_out}")
    print("\n运行寄存器分配...")
    
    mapping, m = allocate_compact_mapping(code, live_out)
    
    print("\n分配结果：")
    print(f"Mapping: {mapping}")
    print(f"Max op_ index used: {m}")
    
    # 应用映射，生成分配后的代码
    result = []
    for line in code:
        mnem, ops = parse_instruction(line, op_reg="op_")
        if mnem:
            new_ops = [mapping.get(op.strip(), op.strip()) for op in ops]
            result.append(f"{mnem} {', '.join(new_ops)}")
        else:
            result.append(line)
    
    print("\n分配后的代码：")
    for i, line in enumerate(result, 1):
        print(f"  {i}: {line}")
    
    # 检查优化结果
    if mapping.get("op_0") == "a0":
        print("\n" + "=" * 60)
        print("✓ 优化成功：op_0 被分配到 a0，节省了临时寄存器！")
        print("=" * 60)
        print("\n优化说明：")
        print("  算法识别出 a0 在第1行读取后立即死亡，第2行重生")
        print("  因此可以安全地复用 a0 作为 op_0 的寄存器")
        print("  第1行 'sub a0, x0, a0' 计算 a0 = -a0")
        print("  第2行 'sub a0, a2, a0' 计算 a0 = a2 + a0")
        return True
    else:
        print("\n" + "=" * 60)
        print(f"❌ 未能优化：op_0 被分配到 {mapping.get('op_0')}")
        print("=" * 60)
        return False


def test_double_sub_in_loop():
    """
    测试在循环中的双减法模式（mul 函数真实场景）
    """
    code = [
        "sub op_0, x0, a0",      # line 0: a0 使用，op_0 定义
        "sub a2, x0, op_0",      # line 1: op_0 使用，a2 定义
        "addi a0, x0, 0",        # line 2: a0 定义
        "addi op_0, x0, 1",      # line 3: op_0 定义
        "and a3, a1, op_0",      # line 4: op_0 使用
        "beq a3, x0, .Mul_skip", # line 5
        "sub op_0, x0, a0",      # line 6: a0 使用，op_0 定义
        "sub a0, a2, op_0",      # line 7: op_0 使用，a0 定义
    ]
    
    live_out = ["a0", "a2"]
    
    print("=" * 60)
    print("测试循环中的双减法模式（mul 函数场景）")
    print("=" * 60)
    print("\n输入代码（placeholder 形式）：")
    for i, line in enumerate(code, 1):
        print(f"  {i}: {line}")
    
    print(f"\nLive-out: {live_out}")
    print("\n运行寄存器分配...")
    
    mapping, m = allocate_compact_mapping(code, live_out)
    
    print("\n分配结果：")
    print(f"Mapping: {mapping}")
    print(f"Max op_ index used: {m}")
    
    # 应用映射，生成分配后的代码
    result = []
    for line in code:
        mnem, ops = parse_instruction(line, op_reg="op_")
        if mnem:
            new_ops = [mapping.get(op.strip(), op.strip()) for op in ops]
            result.append(f"{mnem} {', '.join(new_ops)}")
        else:
            result.append(line)
    
    print("\n分配后的代码：")
    for i, line in enumerate(result, 1):
        print(f"  {i}: {line}")
    
    # 统计优化效果
    optimized_count = 0
    if mapping.get("op_0") in ["a0", "a2", "a3"]:
        optimized_count += 1
    
    print(f"\n使用的 op_ 数量: {m + 1 if m >= 0 else 0}")
    if m < 0:
        print("\n✓ 完全优化：所有临时变量都被分配到真实寄存器！")
    elif m == 0:
        print("\n✓ 部分优化：只需要1个 op_ 临时变量")


if __name__ == "__main__":
    test_mulh()
    print("\n" + "=" * 60 + "\n")
    test_xor_s3_issue()
    print("\n" + "=" * 60 + "\n")
    test_double_sub_pattern()
    print("\n" + "=" * 60 + "\n")
    test_double_sub_in_loop()