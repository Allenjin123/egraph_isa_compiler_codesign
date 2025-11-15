#!/usr/bin/env python3
"""测试孤儿节点检测逻辑"""

import sys
import os
from collections import defaultdict

# 添加路径
script_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(script_dir)
frontend_dir = os.path.join(project_root, "frontend")
sys.path.insert(0, frontend_dir)

from util import parse_instruction, analyze_instruction

def simulate_orphan_detection(test_instructions):
    """模拟孤儿节点检测逻辑
    
    Args:
        test_instructions: List of tuples (instruction_string, eclass_id)
    
    Returns:
        List of orphan eclass_ids
    """
    orphans = []
    live_defs = {}  # reg_name -> eclass_id
    
    print("\n" + "="*80)
    print("开始分析指令序列")
    print("="*80)
    
    for idx, (inst_line, eclass_id) in enumerate(test_instructions, 1):
        print(f"\n[指令 {idx}] {inst_line:40s} ; {eclass_id}")
        print("-" * 80)
        
        # 解析指令
        mnemonic, operands = parse_instruction(inst_line)
        if not mnemonic:
            print("  ⚠️  无法解析指令，跳过")
            continue
        
        print(f"  解析结果: {mnemonic} {operands}")
        
        # 分析 USE 和 DEF
        use_regs, def_regs = analyze_instruction(mnemonic, operands)
        print(f"  USE寄存器: {use_regs if use_regs else '(无)'}")
        print(f"  DEF寄存器: {def_regs if def_regs else '(无)'}")
        
        # 处理 USE（清除定义）
        if use_regs:
            for reg in use_regs:
                if reg in live_defs:
                    print(f"  ✓ {reg} 被使用 → 移除定义 {live_defs[reg]}")
                    live_defs.pop(reg)
                else:
                    print(f"  ℹ️  {reg} 被使用（但之前无定义）")
        
        # 处理 DEF
        if def_regs:
            for reg in def_regs:
                if reg in live_defs:
                    old_eclass = live_defs[reg]
                    print(f"  ⚠️  {reg} 被重新定义 → 旧定义 {old_eclass} 标记为孤儿")
                    orphans.append(old_eclass)
                else:
                    print(f"  ✓ {reg} 新定义")
                live_defs[reg] = eclass_id
        else:
            # 无定义的指令（store, branch 等）
            print(f"  🔴 无返回值指令 → {eclass_id} 标记为孤儿")
            orphans.append(eclass_id)
        
        print(f"  当前 live_defs: {live_defs if live_defs else '(空)'}")
    
    # 处理剩余未使用的定义
    print("\n" + "="*80)
    print("处理块尾未使用的定义")
    print("="*80)
    if live_defs:
        for reg, eclass_id in live_defs.items():
            print(f"  🔴 {reg} 未被使用 → {eclass_id} 标记为孤儿")
            orphans.append(eclass_id)
    else:
        print("  (无剩余定义)")
    
    return orphans


def test_case_1():
    """测试用例1：您提供的汇编序列"""
    print("\n" + "🧪 " * 40)
    print("测试用例 1: 寄存器覆盖和未使用定义")
    print("🧪 " * 40)
    
    instructions = [
        ("addi sp,sp,-32", "eclass_0"),
        ("sw ra,28(sp)", "eclass_1"),
        ("addi a0,zero,0", "eclass_2"),
        ("addi a0,zero,1", "eclass_3"),
        ("auipc ra,%pcrel_hi(benchmark_body.isra.0)", "eclass_4"),
        ("jalr ra,ra,%pcrel_lo(.Lpcrel_11)", "eclass_5"),
    ]
    
    orphans = simulate_orphan_detection(instructions)
    
    print("\n" + "="*80)
    print("🎯 最终孤儿节点:")
    print("="*80)
    for orphan in orphans:
        print(f"  - {orphan}")
    
    expected = ["eclass_1", "eclass_2", "eclass_3", "eclass_5"]
    print(f"\n预期孤儿: {expected}")
    print(f"实际孤儿: {orphans}")
    
    if orphans == expected:
        print("✅ 测试通过！")
        return True
    else:
        print("❌ 测试失败！")
        return False


def test_case_2():
    """测试用例2：简单的寄存器使用链"""
    print("\n" + "🧪 " * 40)
    print("测试用例 2: 寄存器使用链")
    print("🧪 " * 40)
    
    instructions = [
        ("addi a0,zero,10", "eclass_10"),
        ("addi a1,a0,5", "eclass_11"),
        ("add a2,a0,a1", "eclass_12"),
        ("sw a2,0(sp)", "eclass_13"),
    ]
    
    orphans = simulate_orphan_detection(instructions)
    
    print("\n" + "="*80)
    print("🎯 最终孤儿节点:")
    print("="*80)
    for orphan in orphans:
        print(f"  - {orphan}")
    
    # eclass_13 是 store（无返回值）
    # 所有寄存器都被使用了，所以没有未使用的定义孤儿
    expected = ["eclass_13"]
    print(f"\n预期孤儿: {expected}")
    print(f"实际孤儿: {orphans}")
    
    if orphans == expected:
        print("✅ 测试通过！")
        return True
    else:
        print("❌ 测试失败！")
        return False


def test_case_3():
    """测试用例3：分支指令"""
    print("\n" + "🧪 " * 40)
    print("测试用例 3: 分支指令")
    print("🧪 " * 40)
    
    instructions = [
        ("addi a0,zero,5", "eclass_20"),
        ("addi a1,zero,10", "eclass_21"),
        ("blt a0,a1,.L1", "eclass_22"),
        ("addi a2,zero,1", "eclass_23"),
    ]
    
    orphans = simulate_orphan_detection(instructions)
    
    print("\n" + "="*80)
    print("🎯 最终孤儿节点:")
    print("="*80)
    for orphan in orphans:
        print(f"  - {orphan}")
    
    # eclass_22 是 branch（无返回值）
    # eclass_23 的 a2 未被使用
    expected = ["eclass_22", "eclass_23"]
    print(f"\n预期孤儿: {expected}")
    print(f"实际孤儿: {orphans}")
    
    if orphans == expected:
        print("✅ 测试通过！")
        return True
    else:
        print("❌ 测试失败！")
        return False


def test_case_4():
    """测试用例4：Load 和复杂寻址"""
    print("\n" + "🧪 " * 40)
    print("测试用例 4: Load 和复杂寻址")
    print("🧪 " * 40)
    
    instructions = [
        ("lui a5,%hi(g_qCount)", "eclass_30"),
        ("lw a0,%lo(g_qCount)(a5)", "eclass_31"),
        ("addi a0,a0,1", "eclass_32"),
        ("sw a0,%lo(g_qCount)(a5)", "eclass_33"),
    ]
    
    orphans = simulate_orphan_detection(instructions)
    
    print("\n" + "="*80)
    print("🎯 最终孤儿节点:")
    print("="*80)
    for orphan in orphans:
        print(f"  - {orphan}")
    
    # eclass_33 是 store（无返回值）
    # eclass_31 的 a0 在 eclass_32 中被使用（addi a0,a0,1），所以不是孤儿
    # eclass_32 的 a0 在 eclass_33 中被使用（sw a0,...），所以不是孤儿
    expected = ["eclass_33"]
    print(f"\n预期孤儿: {expected}")
    print(f"实际孤儿: {orphans}")
    
    if orphans == expected:
        print("✅ 测试通过！")
        return True
    else:
        print("❌ 测试失败！")
        return False


def test_case_5():
    """测试用例5：连续覆盖"""
    print("\n" + "🧪 " * 40)
    print("测试用例 5: 连续覆盖同一寄存器")
    print("🧪 " * 40)
    
    instructions = [
        ("addi a0,zero,1", "eclass_40"),
        ("addi a0,zero,2", "eclass_41"),
        ("addi a0,zero,3", "eclass_42"),
        ("addi a1,a0,0", "eclass_43"),
    ]
    
    orphans = simulate_orphan_detection(instructions)
    
    print("\n" + "="*80)
    print("🎯 最终孤儿节点:")
    print("="*80)
    for orphan in orphans:
        print(f"  - {orphan}")
    
    # eclass_40 被 eclass_41 覆盖 → 孤儿
    # eclass_41 被 eclass_42 覆盖 → 孤儿
    # eclass_42 被 eclass_43 使用 → 不是孤儿
    # eclass_43 的 a1 未被使用 → 孤儿
    expected = ["eclass_40", "eclass_41", "eclass_43"]
    print(f"\n预期孤儿: {expected}")
    print(f"实际孤儿: {orphans}")
    
    if orphans == expected:
        print("✅ 测试通过！")
        return True
    else:
        print("❌ 测试失败！")
        return False


def main():
    print("\n" + "=" * 80)
    print(" " * 20 + "孤儿节点检测逻辑测试套件")
    print("=" * 80)
    
    test_results = []
    
    # 运行所有测试
    test_results.append(("测试用例 1: 寄存器覆盖和未使用定义", test_case_1()))
    test_results.append(("测试用例 2: 寄存器使用链", test_case_2()))
    test_results.append(("测试用例 3: 分支指令", test_case_3()))
    test_results.append(("测试用例 4: Load 和复杂寻址", test_case_4()))
    test_results.append(("测试用例 5: 连续覆盖同一寄存器", test_case_5()))
    
    # 汇总结果
    print("\n" + "=" * 80)
    print(" " * 30 + "测试结果汇总")
    print("=" * 80)
    
    passed = sum(1 for _, result in test_results if result)
    total = len(test_results)
    
    for test_name, result in test_results:
        status = "✅ 通过" if result else "❌ 失败"
        print(f"{status} - {test_name}")
    
    print(f"\n总计: {passed}/{total} 测试通过")
    
    if passed == total:
        print("\n🎉 所有测试通过！逻辑正确！")
    else:
        print(f"\n⚠️  有 {total - passed} 个测试失败，请检查逻辑。")
    
    return passed == total


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
