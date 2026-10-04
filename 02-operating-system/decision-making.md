# 决策机制 (Decision Making)

Owner: Lightman · Status: Active · Last reviewed: 04/10/2026

## 决策分类
| 类型 | 例子 | 谁决定 | 是否写 ADR |
|---|---|---|---|
| **单向门（不可逆）** | 股权、融资条款、选择云/LLM 供应商、进入 SaMD、雇第一个人、签大合同 | 创始人共同决定（{{TBD: 僵局规则}}） | ✅ 必须 |
| **双向门（可逆）** | 功能优先级、文案、工具选型、定价实验 | 该领域 Owner | 重要的写 |
| **临床安全相关** | AI 输出规则、发布门槛、🟡 TGA 边界功能 | 产品 Owner + 临床顾问（临床顾问有否决权） | ✅ 必须 |
| **隐私/安全例外** | 数据出境、新增子处理方、客户数据用于改进 | Privacy Officer + CTO | ✅ 必须 |

## DACI
重要决策写明：**D**river（推动者）· **A**pprover（唯一批准者）· **C**ontributors（提供意见）· **I**nformed（被告知者）

## 规则
1. 有 Owner 的事情，Owner 决定；没有 Owner 就先指定 Owner。
2. 意见不一时："disagree and commit"——记录分歧，执行决定，设定复盘时间。
3. 决策写下来：`02-operating-system/decisions/NNNN-title.md`（模板 `09-templates/adr-template.md`）。
