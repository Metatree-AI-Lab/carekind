# docs — 产品文档

Owner: Lightman (PO) · Last reviewed: 04/10/2026

所有做**运营、产品、开发**的人都以这里为参考。

| 文档 | 内容 |
|---|---|
| [PRD.md](PRD.md) | **主 PRD**：定位、市场判断、发展方向、亮点与突破、产品逻辑（数据模型、状态机、分配与分级规则）、全部 workflows、分期、护栏、指标 |
| [prds/](prds/) | 功能级 PRD（详细规格、法律与隐私影响、临床危害、评测） |
| └ [registry.md](prds/registry.md) | **PRD 登记表**：每个 PRD 的阶段、唯一 assignee、reviewer、卡点 |
| └ [2026-10-04-shift-capture-and-resident-records.md](prds/2026-10-04-shift-capture-and-resident-records.md) | 整班录音 + 按老人自动分配 + 老人档案 |
| └ [2026-10-11-adlc-prd-lifecycle.md](prds/2026-10-11-adlc-prd-lifecycle.md) | ADLC：PRD 生命周期、分配与状态管理 |

## 规则
- 新功能 PRD 用 `prd-writer` skill 生成，放在 `prds/YYYY-MM-DD-<slug>.md`，模板见 `06-app-development/product/prd-template.md`。
- 功能 PRD 和主 PRD 冲突时，以主 PRD 的**护栏（§9）**为准；要改护栏需要写 ADR。
- 每个 PRD 在 [registry](prds/registry.md) 登记，有且仅有一个 assignee；阶段和分配规则见 `rules/06-adlc-rules.md`，用 `prd-assign` / `prd-status` 操作。
- 图表使用 Mermaid（GitHub、VS Code 都能直接渲染）。
