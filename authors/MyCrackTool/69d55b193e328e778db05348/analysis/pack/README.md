# 菜鸟翻身指南 / Newbie Village Guide

这里有三个关卡，一个比一个难。别想一步登天，慢慢来。

### 01 入门 (EasyMode)
- **难点**：无。
- **教学**：教你什么是字符串，怎么在二进制文件里搜东西。
- **目标**：找到那个叫 `kali` 的破烂。

### 02 进阶 (MidMode)
- **难点**：位运算。
- **教学**：教你代码不一定都是明文，有时候得算算。学会 XOR 0x42 是什么。
- **目标**：搜到 `kali` 之后，算出后面那段 `777`。

### 03 终极 (HardMode)
- **难点**：动态内存。
- **教学**：教你静态分析的局限。有些东西只在运行的时候存在。
- **目标**：上调试器，断点断在 `==` 比较的地方，直接去内存里把那个 `kali_secret_...` 给抓出来。

---

### for english beginner

1. **easy**: find text with `strings` tool.
2. **mid**: find text but use math XOR 0x42 for last part.
3. **hard**: no text in code. key is dynamic. use debugger to find in memory when run.

- 那个还在学英语的摸鱼程序员
