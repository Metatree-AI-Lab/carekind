---
paths:
  - "docs/**"
---

# PRD 规范 (PRD Rules)

Owner: Lightman (PO) · Last reviewed: 04/10/2026
适用：`docs/PRD.md`（主 PRD）和 `docs/prds/` 下的所有功能 PRD

## 1. 位置与格式
- 主 PRD：`docs/PRD.md`；功能 PRD：`docs/prds/YYYY-MM-DD-<slug>.md`。
- 用 `prd-writer` skill 生成，模板是 `06-app-development/product/prd-template.md`。
- 功能 PRD 开头写 `Parent: docs/PRD.md`；和主 PRD 的护栏（§9）冲突时，以主 PRD 为准，要改护栏必须写 ADR。
- 流程图和状态图用 Mermaid。

## 2. 必须引用本地法律文件（硬性要求）
每份 PRD **必须**有一节 **"法律依据（本地参考文件）"**，满足以下要求：

1. **先跑 `legal-reference-check` skill**（或者手动按 [`legal-reference-map.md`](legal-reference-map.md) 查阅）。
2. 列出**实际打开查阅过**的本地文件路径；能确定条款或页码的写出来。
3. 每个引用都写清楚**它对这个功能有什么具体约束**，不能只罗列文件名。
4. 本地没有资料的主题写 `⚠️ 本地无资料，需律师确认`，并把它列入上线前的门槛。
5. **禁止**只凭记忆写法律结论；**禁止**引用本地资料库和官方来源里都找不到的条款。

格式：
```
## 法律依据（本地参考文件）
| 主题 | 本地文件 | 条款 / 页码 | 对本功能的约束 |
|---|---|---|---|
| TGA 边界 | 03-legal-compliance/references/law-library/tga-digital-scribes-summary.md | — | 只能整理原话，不能生成没说过的诊断 |
| ... | ... | ... | ... |

### 本地资料缺口
- ⚠️ 监控设备法（VIC）：本地无资料，需律师确认 → 上线门槛
```

## 3. 其他必填章节
| 章节 | 要求 |
|---|---|
| 问题与证据 | 证据要标来源和强度；没有访谈数据就写 `n = 0` |
| TGA boundary check | 跑 `tga-boundary-check`，写结论（🟢 / 🟡 / 🔴）和理由 |
| 隐私影响 | 新数据、存储位置、保留期、子处理方、是否需要更新 PIA 和隐私政策 |
| 临床危害 | 新危害标 `Proposed`，由临床顾问接受后才写入危害日志 |
| AI 评测 | 新增的评测场景和发布门槛 |
| 指标 | 每个指标写明测量方法 |
| 审批 | 产品（Lightman）、Tech Lead（Lin）、临床顾问；需要时加法律意见 |

## 4. 审核标准
PRD 没有"法律依据"一节，或者引用的文件不存在，**一律退回**。状态只能由人从 `Draft` 改为 `Approved`。
