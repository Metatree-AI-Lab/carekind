# CLAUDE.md — 功能模块：drafting

> 层级：功能模块 · 路径：`06-app-development/app/src/domain/drafting/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
一个事件生成多份文书草稿（"说一次，处处归档"）。（PRD：docs/PRD.md §6.6、§14）

## 在这里通常要做的事
- 实现或修改本模块
- 新增或修改关键函数时，同步更新下面的"关键函数"一节

## 本目录特有的规则（在根目录规则之外）
- 只用原话里的事实（护栏 G2）；没有说过的字段显示"请填写"
- ISBAR 的 A 和 R、care plan 的"策略"栏只用原话
- 每句话都要附来源映射（句子 → 片段 ID）
- 不要原样复制 references/paperwork-templates 里非商业许可的模板

## 关键文件
- （代码文件在技术栈确定后补充）

## 不要做
- 不要从 adapters/ 或 interfaces/ import
- 不要违反上面的不变量来"简化"实现

## 关键函数（大函数登记）
> 函数签名在技术栈确定后按实际代码更新；新增大函数（> 40 行或核心算法）必须登记在这里。

- `mapEventToDocuments(event): DocumentType[]` — 按 PRD §14 的映射表
- `DraftGenerator.generate(event, template): Promise<Draft>` — 调用 LlmProvider 接口，再交给 fact-check 校验
- `DocumentTemplate` 注册表 — 每种文书一个实现（开闭原则），新增文书类型不修改现有代码

## 测试与验收
- 每次提示词或模型变更跑全量 AI 评测（evaluation-plan.md）

## 相关
- docs/PRD.md §6.6、§14
- 06-app-development/clinical-safety/hazard-log.md
- ../CLAUDE.md（领域层）
