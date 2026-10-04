# CLAUDE.md — 功能模块：attribution

> 层级：功能模块 · 路径：`06-app-development/app/src/domain/attribution/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
事件 → 老人归属。**最关键、风险最高的算法**（错配 = P1 临床安全事件，HAZ-009）。（PRD：docs/PRD.md §6.4）

## 在这里通常要做的事
- 实现或修改本模块
- 新增或修改关键函数时，同步更新下面的"关键函数"一节

## 本目录特有的规则（在根目录规则之外）
- **只在本班名单内匹配**，永远不匹配名单外的人（护栏 G4）
- 同名或近似名 → 强制人工（requiresConfirmation = true）
- 只有指代 → 继承前一事件的归属，但必须标记"请确认"
- 找不到候选 → residentId = null，进入待分配队列；**不能猜**
- 阈值等参数只在 `policy` 文件里定义一次（`ATTRIBUTION_POLICY`）

## 关键文件
- （代码文件在技术栈确定后补充）

## 不要做
- 不要从 adapters/ 或 interfaces/ import
- 不要违反上面的不变量来"简化"实现

## 关键函数（大函数登记）
> 函数签名在技术栈确定后按实际代码更新；新增大函数（> 40 行或核心算法）必须登记在这里。

- `attributeEvent(event, roster, previousEvent): Attribution` — 返回 `{ residentId | null, score, reason, requiresConfirmation }`
- `extractMentions(text): Mention[]` — 抽取全名、姓氏、偏好称呼、房间号、指代
- `scoreCandidates(mentions, roster): Candidate[]` — 名字 + 房间号 > 只有名字 > 只有房间号 > 指代

## 测试与验收
- 发布门槛：自动分配准确率 ≥ 99%
- 测试用例必须覆盖：同名、房间号口误、只有代词、一段话多位老人、名单外的名字

## 相关
- docs/PRD.md §6.4
- 06-app-development/clinical-safety/hazard-log.md
- ../CLAUDE.md（领域层）
