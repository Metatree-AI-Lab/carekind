# CLAUDE.md — 功能模块：tiering

> 层级：功能模块 · 路径：`06-app-development/app/src/domain/tiering/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
风险分级（Tier 1 常规 / Tier 2 临床观察 / Tier 3 敏感事件）和"谁可以确认"。（PRD：docs/PRD.md §6.5）

## 在这里通常要做的事
- 实现或修改本模块
- 新增或修改关键函数时，同步更新下面的"关键函数"一节

## 本目录特有的规则（在根目录规则之外）
- 分级用于审核路由，**不是临床判断**；代码、注释、界面文字都不能写成"检测风险"
- 默认值来自 PRD §6.5，机构可以配置，但不能把 Tier 3 配置成 PCW 可确认

## 关键文件
- （代码文件在技术栈确定后补充）

## 不要做
- 不要从 adapters/ 或 interfaces/ import
- 不要违反上面的不变量来"简化"实现

## 关键函数（大函数登记）
> 函数签名在技术栈确定后按实际代码更新；新增大函数（> 40 行或核心算法）必须登记在这里。

- `classifyTier(category, policy): Tier`
- `canConfirm(staff, draft, policy): boolean` — Tier 3 只有 RN；Tier 2 默认 RN（EN 视机构政策）；Tier 1 视机构是否允许 PCW
- `canBatchConfirm(draft): boolean` — Tier 2/3 和含数值字段的草稿一律 false（护栏 G5）

## 测试与验收
- 每个分级 × 每个角色 × 机构配置的组合都要有测试

## 相关
- docs/PRD.md §6.5
- 06-app-development/clinical-safety/hazard-log.md
- ../CLAUDE.md（领域层）
