# RISC-V 汇编 SSA 处理工具链

这个目录包含一套完整的工具，用于将 RISC-V 汇编 dump 文件处理成 SSA（静态单赋值）形式，并进行各种编译器级别的分析。

---

## 📋 目录

1. [快速开始](#快速开始)
2. [工具列表](#工具列表)
3. [完整工作流程](#完整工作流程)
4. [详细使用说明](#详细使用说明)
5. [输出目录结构](#输出目录结构)
6. [故障排除](#故障排除)

---

## 🚀 快速开始

### 最简单的使用方式（推荐）

```bash
cd /path/to/SSA

# 处理单个 dump 文件（一键完成解析、分割、清理）
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump

# 查看处理结果
python analyze_blocks.py outputs/multiply.riscv

# 转换为 SSA 形式
python convert_to_ssa.py outputs/multiply.riscv -v
```

### 完整分析流程（推荐）

```bash
# 1. 处理 dump 文件
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump

# 2. ⭐ 一键完成所有分析（CFG + DEF/USE + Liveness）
python analyze_all.py outputs/multiply.riscv/sections/ -v

# 3. 查看某个函数的分析结果
python view_liveness.py outputs/multiply.riscv/sections/main/ --all

# 4. 转换为 SSA
python convert_to_ssa.py outputs/multiply.riscv/ -v
```

### 完整分析流程（分步执行）

如果需要分步控制，可以单独运行各个工具：

```bash
# 1. 处理 dump 文件
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump

# 2. 构建控制流图
python build_cfg.py outputs/multiply.riscv/sections/ -v

# 3. 分析 DEF/USE 关系
python analyze_defuse.py outputs/multiply.riscv/sections/ -v

# 4. 活跃性分析
python analyze_liveness.py outputs/multiply.riscv/sections/ -v

# 5. 查看某个函数的分析结果
python view_liveness.py outputs/multiply.riscv/sections/main/ --all

# 6. 转换为 SSA
python convert_to_ssa.py outputs/multiply.riscv/ -v
```

---

## 📚 工具列表

### 🔧 基础处理工具

| 文件 | 功能 | 使用场景 |
|------|------|----------|
| `process_dump.py` | **主处理工具**，一键完成解析、分割、清理 | ⭐ 推荐首选，最常用 |
| `parse_sections.py` | 从 dump 文件提取函数（section） | 单独使用场景少见 |
| `split_basic_blocks.py` | 将函数分割成基本块 | 单独使用场景少见 |
| `strip_prefixes.py` | 清理汇编指令（去地址、机器码等） | 单独使用场景少见 |
| `analyze_blocks.py` | 统计基本块信息（大小、数量等） | 查看处理结果统计 |

### 📊 高级分析工具

| 文件 | 功能 | 依赖 | 输出文件 |
|------|------|------|----------|
| `analyze_all.py` | **⭐ 一键分析工具**（自动运行 CFG + DEF/USE + Liveness） | 基本块 | 三个 .json 文件 |
| `build_cfg.py` | 构建控制流图（CFG） | 基本块 | `cfg.json` |
| `analyze_defuse.py` | 分析寄存器 DEF/USE 关系 | 基本块 | `defuse.json` |
| `analyze_liveness.py` | 活跃性分析（寄存器生命期） | CFG + DEF/USE | `liveness.json` |
| `view_liveness.py` | 查看活跃性分析结果 | `liveness.json` | - |
| `visualize_cfg.py` | 可视化控制流图 | `cfg.json` | - |

### 🔄 SSA 转换工具

| 文件 | 功能 | 说明 |
|------|------|------|
| `convert_to_ssa.py` | 转换为 SSA 形式 | 为每个寄存器赋值添加版本号 |

### 📦 工具库

| 文件 | 功能 |
|------|------|
| `util.py` | 共享的工具函数和常量（分支指令集等） |

---

## 🔄 完整工作流程

### 流程图

```
RISC-V 可执行文件
     |
     | objdump -d
     ↓
.dump 文件 (汇编 dump)
     |
     | process_dump.py (一键处理)
     ↓
基本块文件 (.txt)
     |
     ├─→ build_cfg.py ────→ cfg.json
     |
     ├─→ analyze_defuse.py ─→ defuse.json
     |                              |
     |                              ↓
     └─→ (cfg.json + defuse.json) ─→ analyze_liveness.py ─→ liveness.json
                                                |
                                                ↓
                                          view_liveness.py
                                          visualize_cfg.py
     
基本块文件 (.txt)
     |
     | convert_to_ssa.py
     ↓
SSA 文件 (.ssa)
```

---

## 📖 详细使用说明

### 1️⃣ 主处理工具：`process_dump.py`

这是**最常用的工具**，自动完成：解析 dump → 分割基本块 → 清理指令。

#### 基本用法

```bash
# 处理单个文件
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump

# 指定输出目录
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump -o my_output

# 详细输出模式
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump -v

# 批量处理整个目录的所有 dump 文件
python process_dump.py --batch ../benchmark/i_inputs/

# 查看已处理的基本块列表
python process_dump.py --list outputs/multiply.riscv --max-display 20
```

#### 输出

```
============================================================
Processing: multiply.riscv.dump
Output directory: outputs/multiply.riscv
============================================================
✓ Created 15 section folders
✓ Created 42 basic blocks total
✓ Cleaned 42 basic block files

============================================================
Processing Complete!
  Sections: 15
  Basic Blocks: 42
  Output: outputs/multiply.riscv
============================================================
```

---

### 2️⃣ 统计工具：`analyze_blocks.py`

查看基本块的统计信息。

```bash
# 分析基本块统计
python analyze_blocks.py outputs/multiply.riscv

# 导出基本块列表到文件
python analyze_blocks.py outputs/multiply.riscv --export block_list.txt
```

**输出示例：**
```
======================================================================
BASIC BLOCKS ANALYSIS REPORT
======================================================================

OVERALL STATISTICS:
  Total sections: 15
  Total basic blocks: 42
  Total instructions: 328
  Average block size: 7.81 instructions

======================================================================
SECTION BREAKDOWN (Top 10 by instruction count):
======================================================================
Section                        Blocks    Instructions      Avg Size
----------------------------------------------------------------------
multiply                           12              89         7.42
main                                8              56         7.00
...
```

---

### 3️⃣ ⭐ 一键分析工具：`analyze_all.py`（推荐）

**这是最方便的分析工具**，自动完成 CFG、DEF/USE、Liveness 三步分析。

```bash
# 分析单个 section
python analyze_all.py outputs/multiply.riscv/sections/main/ -v

# 批量分析所有 sections（自动跳过已分析的）
python analyze_all.py outputs/multiply.riscv/sections/

# 强制重新分析（即使已存在分析文件）
python analyze_all.py outputs/multiply.riscv/sections/ --force

# 详细输出模式
python analyze_all.py outputs/multiply.riscv/sections/ -v
```

**输出示例（批量分析）：**
```
============================================================
批量分析: outputs/multiply.riscv/sections
============================================================

找到 37 个 sections

分析: __divsi3... ✓
分析: __moddi3... ✓
分析: main... ✓
...

============================================================
分析完成
============================================================
✓ 成功: 37
```

**生成文件：** 每个 section 目录下会生成 `cfg.json`、`defuse.json`、`liveness.json`

**优点：**
- ✅ 一个命令完成三步分析
- ✅ 自动管理依赖关系
- ✅ 智能跳过已分析的 sections（节省时间）
- ✅ 批量处理所有 sections

---

### 4️⃣ 控制流图：`build_cfg.py`

构建控制流图，分析基本块之间的跳转关系。

```bash
# 为单个 section 构建 CFG
python build_cfg.py outputs/multiply.riscv/sections/main/ -v

# 为所有 sections 构建 CFG
python build_cfg.py outputs/multiply.riscv/sections/ -v

# 可视化 CFG
python visualize_cfg.py outputs/multiply.riscv/sections/main/cfg.json --graph

# 查看所有基本块详情
python visualize_cfg.py outputs/multiply.riscv/sections/main/cfg.json --blocks

# 查找两个块之间的路径
python visualize_cfg.py outputs/multiply.riscv/sections/main/cfg.json --path 0 5
```

**生成文件：** 每个 section 目录下会生成 `cfg.json`

---

### 5️⃣ DEF/USE 分析：`analyze_defuse.py`

分析每个基本块中寄存器的定义（写入）和使用（读取）关系。

```bash
# 分析单个 section
python analyze_defuse.py outputs/multiply.riscv/sections/main/ -v

# 分析所有 sections
python analyze_defuse.py outputs/multiply.riscv/sections/ -v
```

**生成文件：** 每个 section 目录下会生成 `defuse.json`

**输出格式：**
```json
{
  "0": {
    "GEN": ["a0", "a1"],
    "KILL": ["sp", "ra"],
    "USE_all": ["a0", "a1", "sp"],
    "DEF_all": ["sp", "ra", "s0"]
  }
}
```

---

### 6️⃣ 活跃性分析：`analyze_liveness.py`

基于 CFG 和 DEF/USE 信息，计算每个基本块入口和出口处的活跃寄存器。

```bash
# 分析单个 section（需要先运行 build_cfg.py 和 analyze_defuse.py）
python analyze_liveness.py outputs/multiply.riscv/sections/main/ -v

# 分析所有 sections
python analyze_liveness.py outputs/multiply.riscv/sections/ -v

# 查看分析结果（摘要）
python view_liveness.py outputs/multiply.riscv/sections/main/

# 查看特定块的详细信息
python view_liveness.py outputs/multiply.riscv/sections/main/ --block 0

# 查看所有块
python view_liveness.py outputs/multiply.riscv/sections/main/ --all --max 10

# 查找高寄存器压力的块（LIVE_OUT >= 12）
python view_liveness.py outputs/multiply.riscv/sections/main/ --pressure 12
```

**生成文件：** 每个 section 目录下会生成 `liveness.json`

**输出示例：**
```
======================================================================
活跃性分析摘要
======================================================================

基本块数量: 12
入口块: ['0']
出口块: ['11']

寄存器压力统计:
  平均 LIVE_IN:    4.2 个寄存器
  平均 LIVE_OUT:   3.8 个寄存器
  平均空闲:       25.5 个寄存器

  最大 LIVE_IN:  8 个寄存器
  最大 LIVE_OUT: 7 个寄存器
  最小空闲:      22 个寄存器
```

---

### 7️⃣ SSA 转换：`convert_to_ssa.py`

将基本块转换为 SSA 形式，为每个寄存器赋值添加唯一的版本号。

```bash
# 转换单个基本块文件
python convert_to_ssa.py outputs/multiply.riscv/sections/main/basic_blocks/0.txt

# 转换整个 section
python convert_to_ssa.py outputs/multiply.riscv/sections/main/ -v

# 转换整个程序
python convert_to_ssa.py outputs/multiply.riscv/ -v

# 转换所有程序到新目录
python convert_to_ssa.py outputs/ -o outputs_ssa

# 运行测试示例
python convert_to_ssa.py --test
```

**转换示例：**

```
原始 (basic_blocks/0.txt):
addi sp, sp, -16
sw ra, 12(sp)
lw a5, 0(a0)
addi a5, a5, 1
sw a5, 0(a0)

SSA 形式 (basic_blocks_ssa/0.txt):
addi sp_1, sp_0, -16
sw ra_0, 12(sp_1)
lw a5_0, 0(a0_0)
addi a5_1, a5_0, 1
sw a5_1, 0(a0_0)
```

---

## 📁 输出目录结构

处理后的输出目录结构如下：

```
outputs/
└── multiply.riscv/
    └── sections/
        ├── main/
        │   ├── section.txt          # 原始函数汇编
        │   ├── cfg.json            # 控制流图
        │   ├── defuse.json         # DEF/USE 信息
        │   ├── liveness.json       # 活跃性信息
        │   ├── basic_blocks/       # 原始基本块目录
        │   │   ├── 0.txt           # 基本块 0（清理后）
        │   │   ├── 1.txt           # 基本块 1
        │   │   └── ...
        │   └── basic_blocks_ssa/   # SSA 基本块目录
        │       ├── 0.txt           # 基本块 0（SSA 形式）
        │       ├── 1.txt           # 基本块 1（SSA 形式）
        │       └── ...
        ├── multiply/
        │   ├── section.txt
        │   ├── cfg.json
        │   ├── defuse.json
        │   ├── liveness.json
        │   ├── basic_blocks/
        │   │   └── ...
        │   └── basic_blocks_ssa/
        │       └── ...
        └── ...
```

**重要说明：**
- `basic_blocks/` 包含原始的、清理过的汇编代码
- `basic_blocks_ssa/` 包含转换后的 SSA 形式代码
- SSA 文件保持 `.txt` 扩展名（不是 `.ssa`）
- 两个目录的文件名一一对应（如 `0.txt` 对应 `0.txt`）

---

## 🎯 常见使用场景

### 场景 1：快速处理并查看统计信息

```bash
# 1. 处理 dump 文件
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump

# 2. 查看统计
python analyze_blocks.py outputs/multiply.riscv
```

---

### 场景 2：完整的编译器分析流程（推荐）

```bash
# 1. 基础处理
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump -v

# 2. ⭐ 一键完成所有分析
python analyze_all.py outputs/multiply.riscv/sections/ -v

# 3. 查看 main 函数的分析结果
python view_liveness.py outputs/multiply.riscv/sections/main/ --all
python visualize_cfg.py outputs/multiply.riscv/sections/main/cfg.json --graph
```

### 场景 2b：完整的编译器分析流程（分步执行）

```bash
# 1. 基础处理
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump -v

# 2. 构建控制流图
python build_cfg.py outputs/multiply.riscv/sections/ -v

# 3. DEF/USE 分析
python analyze_defuse.py outputs/multiply.riscv/sections/ -v

# 4. 活跃性分析
python analyze_liveness.py outputs/multiply.riscv/sections/ -v

# 5. 查看 main 函数的分析结果
python view_liveness.py outputs/multiply.riscv/sections/main/ --all
python visualize_cfg.py outputs/multiply.riscv/sections/main/cfg.json --graph
```

---

### 场景 3：SSA 转换用于后续优化

```bash
# 1. 处理 dump 文件
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump

# 2. 转换为 SSA 形式
python convert_to_ssa.py outputs/multiply.riscv/ -v

# 现在可以对 .ssa 文件进行进一步的优化和分析
```

---

### 场景 4：批量处理多个程序（推荐）

```bash
# 1. 批量处理所有 dump 文件
python process_dump.py --batch ../benchmark/i_inputs/ -v

# 2. ⭐ 批量分析（一键完成 CFG + DEF/USE + Liveness）
for dir in outputs/*/sections/; do
    python analyze_all.py "$dir"
done

# 3. 批量 SSA 转换
python convert_to_ssa.py outputs/ -o outputs_ssa
```

### 场景 4b：批量处理多个程序（分步执行）

```bash
# 1. 批量处理所有 dump 文件
python process_dump.py --batch ../benchmark/i_inputs/ -v

# 2. 批量构建 CFG（对每个程序）
for dir in outputs/*/sections/; do
    python build_cfg.py "$dir" -v
done

# 3. 批量 DEF/USE 分析
for dir in outputs/*/sections/; do
    python analyze_defuse.py "$dir" -v
done

# 4. 批量活跃性分析
for dir in outputs/*/sections/; do
    python analyze_liveness.py "$dir" -v
done

# 5. 批量 SSA 转换
python convert_to_ssa.py outputs/ -o outputs_ssa
```

---

## 🛠 生成测试用的 dump 文件

如果您有 RISC-V 可执行文件，可以这样生成 dump 文件：

```bash
# 使用 RISC-V objdump 工具
riscv32-unknown-elf-objdump -d program.riscv > program.riscv.dump

# 或者使用 riscv64
riscv64-unknown-elf-objdump -d program.riscv > program.riscv.dump
```

**Dump 文件格式示例：**
```
000100b4 <exit>:
   100b4:	1141                	c.addi	sp,-16
   100b6:	4581                	c.li	a1,0
   100b8:	c422                	c.swsp	s0,8(sp)
   100ba:	c606                	c.swsp	ra,12(sp)
```

---

## ❓ 故障排除

### 问题 1：找不到模块

**错误：** `ModuleNotFoundError: No module named 'util'`

**解决：**
```bash
# 确保在 SSA 目录下运行
cd /home/yjrcs/Egglog_DSL/egraph_isa_compiler_codesign/SSA

# 或者设置 PYTHONPATH
export PYTHONPATH=/home/yjrcs/Egglog_DSL/egraph_isa_compiler_codesign/SSA:$PYTHONPATH
```

---

### 问题 2：CFG 或 DEF/USE 文件不存在

**错误：** `FileNotFoundError: CFG 文件不存在`

**解决：** 按顺序运行依赖的工具

```bash
# 活跃性分析依赖 CFG 和 DEF/USE，必须先运行：
python build_cfg.py outputs/multiply.riscv/sections/ -v
python analyze_defuse.py outputs/multiply.riscv/sections/ -v
# 然后才能运行：
python analyze_liveness.py outputs/multiply.riscv/sections/ -v
```

---

### 问题 3：没有生成基本块

**错误：** `basic_blocks directory not found`

**原因：** 旧版本可能直接将基本块放在 section 目录下

**解决：**
```bash
# 重新运行 process_dump.py
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump -v
```

---

### 问题 4：指令格式不识别

**原因：** 某些特殊的 RISC-V 指令可能未被识别

**解决：**
1. 检查 `util.py` 中的 `BRANCH_INSTRUCTIONS` 集合
2. 如需添加新指令，在 `util.py` 中添加：
```python
BRANCH_INSTRUCTIONS = {
    'jal', 'jalr', 'beq', 'bne', ...,
    'your_new_instruction',  # 添加这里
}
```

---

### 问题 5：查看详细错误信息

所有工具都支持 `-v` 或 `--verbose` 参数：

```bash
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump -v
python build_cfg.py outputs/multiply.riscv/sections/ -v
python analyze_defuse.py outputs/multiply.riscv/sections/ -v
python analyze_liveness.py outputs/multiply.riscv/sections/ -v
python convert_to_ssa.py outputs/multiply.riscv/ -v
```

---

## 📊 性能参考

在标准硬件上的典型处理时间：

| 程序规模 | 指令数 | process_dump | CFG + DEF/USE | 活跃性分析 | SSA 转换 |
|---------|--------|--------------|---------------|-----------|---------|
| 小型    | <1000  | <1 秒        | <1 秒         | <1 秒     | <1 秒   |
| 中型    | 1K-10K | 1-5 秒       | 1-3 秒        | 1-5 秒    | 1-3 秒  |
| 大型    | >10K   | 5-20 秒      | 3-10 秒       | 5-15 秒   | 3-10 秒 |

---

## 📝 工具依赖关系图

```
process_dump.py (独立)
    ↓
基本块文件
    ↓
    ├─→ analyze_blocks.py (独立，仅统计)
    |
    ├─→ build_cfg.py (独立)
    |       ↓
    |   cfg.json
    |       ↓
    |   visualize_cfg.py
    |
    ├─→ analyze_defuse.py (独立)
    |       ↓
    |   defuse.json
    |
    └─→ (cfg.json + defuse.json) ──→ analyze_liveness.py
                                          ↓
                                      liveness.json
                                          ↓
                                      view_liveness.py
```

**SSA 转换独立于上述所有分析工具：**
```
基本块文件 → convert_to_ssa.py → .ssa 文件
```

---

## 🔧 高级技巧

### 技巧 1：查看特定函数的 CFG

```bash
# 1. 处理 dump 文件
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump

# 2. 查看有哪些函数（section）
ls outputs/multiply.riscv/sections/

# 3. 为特定函数构建 CFG
python build_cfg.py outputs/multiply.riscv/sections/multiply/ -v

# 4. 可视化
python visualize_cfg.py outputs/multiply.riscv/sections/multiply/cfg.json --graph --blocks
```

---

### 技巧 2：只分析大的基本块

```bash
# 1. 先统计
python analyze_blocks.py outputs/multiply.riscv --export blocks.txt

# 2. 查看最大的块
grep "instructions" blocks.txt | sort -t: -k2 -n | tail -10

# 3. 手动分析特定的大块
# 根据输出找到路径，例如 outputs/multiply.riscv/sections/main/basic_blocks/5.txt
cat outputs/multiply.riscv/sections/main/basic_blocks/5.txt
```

---

### 技巧 3：比较 SSA 前后的差异

```bash
# 原始基本块
cat outputs/multiply.riscv/sections/main/basic_blocks/0.txt

# SSA 形式
cat outputs/multiply.riscv/sections/main/basic_blocks_ssa/0.txt

# 使用 diff 比较
diff -y outputs/multiply.riscv/sections/main/basic_blocks/0.txt \
        outputs/multiply.riscv/sections/main/basic_blocks_ssa/0.txt
```

---

## 📚 相关文档

- [RISC-V 指令集手册](https://riscv.org/technical/specifications/)
- [SSA 形式介绍](https://en.wikipedia.org/wiki/Static_single_assignment_form)
- [控制流图（CFG）](https://en.wikipedia.org/wiki/Control-flow_graph)
- [活跃变量分析](https://en.wikipedia.org/wiki/Live_variable_analysis)

---

## 🧪 快速测试

我们提供了一个测试脚本，一键运行所有工具：

```bash
cd /home/yjrcs/Egglog_DSL/egraph_isa_compiler_codesign/SSA

# 运行完整测试
./test_all_tools.sh
```

**测试脚本会自动：**
1. 处理 `multiply.riscv.dump`
2. 进行基本块统计分析
3. 使用 `analyze_all.py` 一键完成所有分析
4. 查看活跃性分析结果
5. 可视化 CFG
6. 进行 SSA 转换
7. 对比转换前后的差异

---

## 🎓 完整示例：从头到尾

下面是一个完整的示例，展示如何从 dump 文件开始，完成所有分析：

```bash
# ========================================
# 步骤 0：进入工作目录
# ========================================
cd /home/yjrcs/Egglog_DSL/egraph_isa_compiler_codesign/SSA

# ========================================
# 步骤 1：基础处理（一键完成）
# ========================================
echo "=== 步骤 1：处理 dump 文件 ==="
python process_dump.py ../benchmark/i_inputs/multiply.riscv.dump -v

# ========================================
# 步骤 2：查看基本统计
# ========================================
echo ""
echo "=== 步骤 2：查看统计信息 ==="
python analyze_blocks.py outputs/multiply.riscv

# ========================================
# 步骤 3：⭐ 一键分析（推荐）
# ========================================
echo ""
echo "=== 步骤 3：一键分析 (CFG + DEF/USE + Liveness) ==="
python analyze_all.py outputs/multiply.riscv/sections/ -v

# ========================================
# 步骤 4：查看分析结果
# ========================================
echo ""
echo "=== 步骤 4：查看 main 函数的分析结果 ==="
python view_liveness.py outputs/multiply.riscv/sections/main/ --all --max 5

echo ""
echo "=== 查看 multiply 函数的 CFG ==="
python visualize_cfg.py outputs/multiply.riscv/sections/multiply/cfg.json --graph

# ========================================
# 步骤 5：SSA 转换
# ========================================
echo ""
echo "=== 步骤 5：转换为 SSA 形式 ==="
python convert_to_ssa.py outputs/multiply.riscv/ -v

# ========================================
# 步骤 6：比较 SSA 前后的差异
# ========================================
echo ""
echo "=== 步骤 6：比较 SSA 转换前后 ==="
echo "原始基本块："
cat outputs/multiply.riscv/sections/main/basic_blocks/0.txt | head -5
echo ""
echo "SSA 形式："
cat outputs/multiply.riscv/sections/main/basic_blocks_ssa/0.txt | head -5

echo ""
echo "=== 完成！所有分析结果保存在 outputs/multiply.riscv/ ==="
```

**将上述内容保存为 `run_full_analysis.sh`，然后运行：**

```bash
chmod +x run_full_analysis.sh
./run_full_analysis.sh
```

**或者直接使用我们提供的测试脚本：**

```bash
./test_all_tools.sh
```

---

## 💡 提示和最佳实践

1. **总是先运行 `process_dump.py`**  
   这是最基础的步骤，后续所有工具都依赖它的输出。

2. **按顺序运行分析工具**  
   - CFG 和 DEF/USE 可以并行
   - 活跃性分析必须在 CFG 和 DEF/USE 之后

3. **使用 `-v` 查看详细输出**  
   遇到问题时，详细输出能帮助快速定位。

4. **批量处理时注意磁盘空间**  
   大型程序的处理结果可能占用较多空间。

5. **SSA 转换是独立的**  
   可以单独运行，不依赖 CFG 等分析工具。

---

## 📞 联系与贡献

如有问题或建议，请在项目仓库提 Issue。

---

**最后更新：** 2025-10-22  
**维护者：** egraph_isa_compiler_codesign 项目组
