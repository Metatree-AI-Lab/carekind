# CLAUDE.md — 功能模块：fact-check

> 层级：功能模块 · 路径：`06-app-development/app/src/domain/fact-check/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
检查草稿和原话是否一致：标出新增内容、数值逐字比对。（PRD：docs/PRD.md §6.6、护栏 G2/G3）

## 在这里通常要做的事
- 实现或修改本模块
- 新增或修改关键函数时，同步更新下面的"关键函数"一节

## 本目录特有的规则（在根目录规则之外）
- 有任何数值不一致时，草稿不能进入"可确认"状态
- 宁可安全失败（不出草稿，让护士手动记录），也不能输出不确定的内容

## 关键文件
- （代码文件在技术栈确定后补充）

## 不要做
- 不要从 adapters/ 或 interfaces/ import
- 不要违反上面的不变量来"简化"实现

## 关键函数（大函数登记）
> 函数签名在技术栈确定后按实际代码更新；新增大函数（> 40 行或核心算法）必须登记在这里。

- `verify(transcript, draftOutput): VerifiedDraft` — 标出 AI 新增或改写的句子
- `checkNumbers(transcript, draft): NumberMismatch[]` — 体温、血糖、摄入量、药名、剂量必须完全一致（HAZ-004）
- `requireSourceMap(draft)` — 没有来源映射的句子不能显示为确认内容

## 测试与验收
- 事实一致性门槛见 evaluation-plan.md；数值一致性要求 100%

## 相关
- docs/PRD.md §6.6、护栏 G2/G3
- 06-app-development/clinical-safety/hazard-log.md
- ../CLAUDE.md（领域层）
