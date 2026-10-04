# CLAUDE.md — 功能模块：segmentation

> 层级：功能模块 · 路径：`06-app-development/app/src/domain/segmentation/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
把连续的转写片段切成事件，每个事件只关于一位老人。（PRD：docs/PRD.md §4.3、§6.2）

## 在这里通常要做的事
- 实现或修改本模块
- 新增或修改关键函数时，同步更新下面的"关键函数"一节

## 本目录特有的规则（在根目录规则之外）
- 所有片段都必须归入某个事件或"未生成草稿的片段"列表，不能静默丢弃（HAZ-011）
- 保留记录时间（录音时间戳）和事件时间（口述中说出的时间）两个字段（HAZ-012）

## 关键文件
- （代码文件在技术栈确定后补充）

## 不要做
- 不要从 adapters/ 或 interfaces/ import
- 不要违反上面的不变量来"简化"实现

## 关键函数（大函数登记）
> 函数签名在技术栈确定后按实际代码更新；新增大函数（> 40 行或核心算法）必须登记在这里。

- `segmentTranscript(segments, markers): Event[]` — 结合停顿、快捷标记、话题变化切分
- `splitMultiResident(event): Event[]` — 一段话提到多位老人时强制拆分（HAZ-010）

## 测试与验收
- 用合成的整班录音评测切分 F1 和遗漏率（≤ 2%）

## 相关
- docs/PRD.md §4.3、§6.2
- 06-app-development/clinical-safety/hazard-log.md
- ../CLAUDE.md（领域层）
