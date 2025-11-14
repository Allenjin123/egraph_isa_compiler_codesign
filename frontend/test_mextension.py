#!/usr/bin/env python3
"""测试 mextension.py 的 replace_callmul 函数"""

from mextension import replace_callmul


def test_case(name: str, input_asm: str, expected_keywords: list[str]):
    """测试一个用例"""
    print(f"\n{'='*60}")
    print(f"测试: {name}")
    print(f"{'='*60}")
    print(f"输入:\n{input_asm}")
    
    result = replace_callmul(input_asm)
    print(f"\n输出:\n{result}")
    
    # 检查关键字
    print(f"\n检查:")
    for keyword in expected_keywords:
        if keyword in result:
            print(f"  ✓ 包含: {keyword}")
        else:
            print(f"  ✗ 缺少: {keyword}")
    
    # 计算指令数量
    lines = [l.strip() for l in result.split('\n') if l.strip() and not l.strip().startswith('.L')]
    add_count = sum(1 for l in lines if l.startswith('add'))
    print(f"\n  add 指令数量: {add_count}")
    
    return result


# 测试用例
print("开始测试 mextension.py")

# 用例1: 两个参数都已经在正确位置
test_case(
    "callmul t0, a0, a1",
    "    callmul t0, a0, a1",
    ["auipc", "jalr", "add\tt0, a0, x0"]
)

# 用例2: 参数位置交换 (a1, a0)
test_case(
    "callmul t0, a1, a0",
    "    callmul t0, a1, a0",
    ["auipc", "jalr", "add\tt0, a0, x0"]
)

# 用例3: rs1=a0, rs2=other
test_case(
    "callmul t0, a0, t1",
    "    callmul t0, a0, t1",
    ["add\ta1, t1, x0", "auipc", "jalr"]
)

# 用例4: rs1=other, rs2=a0
test_case(
    "callmul t0, t1, a0",
    "    callmul t0, t1, a0",
    ["add\ta1, t1, x0", "auipc", "jalr"]
)

# 用例5: rs1=a1, rs2=other
test_case(
    "callmul t0, a1, t1",
    "    callmul t0, a1, t1",
    ["add\ta0, t1, x0", "auipc", "jalr"]
)

# 用例6: rs1=other, rs2=a1
test_case(
    "callmul t0, t1, a1",
    "    callmul t0, t1, a1",
    ["add\ta0, t1, x0", "auipc", "jalr"]
)

# 用例7: 两个都不是 a0/a1
test_case(
    "callmul t0, t1, t2",
    "    callmul t0, t1, t2",
    ["add\ta0, t1, x0", "add\ta1, t2, x0", "auipc", "jalr"]
)

# 用例8: rd=a0 (测试栈保存逻辑)
test_case(
    "callmul a0, t1, t2",
    "    callmul a0, t1, t2",
    ["add\ta0, t1, x0", "add\ta1, t2, x0", "sw\ta1"]
)

# 用例9: rd=a1 (测试栈保存逻辑)
test_case(
    "callmul a1, t1, t2",
    "    callmul a1, t1, t2",
    ["add\ta0, t1, x0", "add\ta1, t2, x0", "sw\ta0"]
)

# 用例10: 多行汇编
test_case(
    "多行汇编",
    """    addi t0, t0, 1
    callmul t1, a0, a1
    callmul t2, t3, t4
    nop""",
    ["addi t0, t0, 1", "nop"]
)

print("\n" + "="*60)
print("测试完成!")
print("="*60)
