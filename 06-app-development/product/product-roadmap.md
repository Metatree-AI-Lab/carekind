# 产品路线图 (Product Roadmap)

Owner: Lightman (PO) · Status: Draft — 客户发现后调整 · Last reviewed: 18/10/2026

> **18/10/2026 最新（Lightman）：第一阶段只完成 Super Admin**（加上它需要的 API、共享包和设计系统组件），Super Admin 能在本地运行即第一阶段结束。机构管理端移到第二阶段，护士端、Demo、网站在其后。第一阶段退出标准：Super Admin 能登录，能新建和查看多院 Provider、代建 Facility / Unit、邀请首个 Owner、管理功能开关、查看审计；虚构的 Wattle Grove Care Group 种子数据可用；本地可运行。下面两段是之前的版本，保留作记录。
>
> **18/10/2026 再次调整（Lightman）：第一阶段只做管理端**——Super Admin、机构管理端，以及它们需要的 API、共享包、设计系统组件和管理端 Demo 数据。**护士端（下面的 1b）和 Demo / 网站（1c）移到第二阶段**，表格保留原编号便于对照。第一阶段退出标准：Super Admin 能为一家多院公司完成上线配置；机构管理端能管理员工、住户和流程；跨租户隔离测试全部通过；虚构 Demo 公司可完整演示。
>
> 18/10/2026 按 Lightman 的决定重排：**MVP 先做管理端（Super Admin、机构管理端），再做护士端**；所有界面以设计系统为设计参考（`06-app-development/design/DESIGN.md`、`COMPONENTS.md`、`design-system/tokens.json`）。repo 结构和技术栈见 `06-app-development/engineering/adr/0005-polyrepo-and-mvp-tech-stack.md`。

## Now：MVP 第一阶段（2026 Q4 – 2027 Q1）

### 1a. 管理端先行
| 顺序 | 交付 | repo | PRD |
|---|---|---|---|
| 0 | 地基：多租户、鉴权、数据模型、只追加审计；共享类型、zod 校验、API 客户端、设计 token | carekind-api、carekind-shared | ADR-0005；技术 ADR-0001 / 0002（Lin） |
| 0 | 设计系统补齐管理端组件（见下"设计前置"），React 组件库（DS-5）放进 carekind-shared | carekind-shared | `docs/prds/2026-10-11-carekind-design-system.md` |
| 1 | **Super Admin**：新建 Provider / 养老院、首个 Owner、州规则包（先做 VIC、NSW）、模板库、配置上下限、功能开关、支持访问、运营监控 | carekind-super-admin | `docs/prds/2026-10-18-super-admin-multi-facility-console.md` |
| 2 | **机构管理端**：多院多地点、员工和住户管理（分步导入、转院）、流程管理（🟢 项）、Owner 看板、审计、支持访问审批 | carekind-provider-portal | `docs/prds/2026-10-18-provider-portal-facility-admin.md` |

**设计前置**（管理端开始做之前，先在 `COMPONENTS.md` 补规格，再实现）：
- DS-2 第二批：可搜索下拉 Combobox、日期 / 时间选择、侧边抽屉 Drawer。
- 管理端新模式：桌面应用框架与侧边导航、带筛选 / 排序 / 批量操作的数据表、分步流程 Stepper（名单导入）、差异对比视图（导入差异、配置版本）、审计日志视图、危险操作确认（输入名称确认）。

### 1b. 护士端
| 顺序 | 交付 | repo | PRD |
|---|---|---|---|
| 3 | 按住说话（ElevenLabs）→ 归属住户 → 起草 progress note、ISBAR、跌倒后记录、跌倒 IMS 草稿、家属沟通 → RN 分级审核（Tier 3 实时推送）→ 跨班次待办、覆盖视图 → 导出 | carekind-nurse-web、carekind-api | shift-capture（按住说话部分）、event-to-multi-document-drafting、tiered-review-and-audit-trail、isbar-handover-and-care-coverage、record-export-and-cms-integration（MVP 部分） |

AI 起草、原文并排、改写高亮、逐条确认等界面属于设计系统 **DS-4（R3）**，护士端开始前要完成并经 Lin 评审。

### 1c. 体验与宣传（可与 1b 并行）
| 顺序 | 交付 | repo | PRD |
|---|---|---|---|
| 4 | Demo：复用 nurse-web 和 provider-portal 代码，加载虚构数据 Wattle Grove Care Group（3 家院） | carekind-nurse-web、carekind-provider-portal | `docs/prds/2026-10-18-demo-workspace-and-synthetic-data.md` |
| 4 | Marketing website：纯 HTML、只做英文，Demo 入口和 Book a pilot | carekind-website | `docs/prds/2026-10-18-marketing-website.md` |

**第一阶段退出标准**（来自主 PRD §8、§11）：试点期间 0 起住户错配进入正式记录；达到试点前与机构书面约定的指标；至少 1 家机构付费转化意向。

## Next（试点期，2027 Q1–Q2）
- 两级审核的完整机构自定义、流程管理的 🟡 提示项（需 TGA 边界审查）
- 更多文书：ABC 行为记录、food & fluid、约束性措施提示
- 多语言口述（`docs/prds/2026-10-18-multilingual-dictation-and-person-centred-language.md`；每种语言单独评测）
- 首个 CMS 直连（待 ADR）
- SSO（Entra ID / Google）

## Later
- Mobile App（React Native，`carekind-nurse-mobile`）+ 整班后台录音、设备端声纹过滤（需各州监控设备法律师意见）
- Care plan 变化汇总（🟡）
- Support at Home 场景（居家照护，离线优先）
- 更多集成、多机构报表
