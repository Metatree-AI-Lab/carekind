Owner: Strategy · Status: Research draft · Last reviewed: 04/10/2026

# 养老机构自建 AI（Regis RegiCare Assist / Uniting Buddy）

**威胁等级：中到高**（"自建替代采购"的风险）

这一类不是卖软件的公司，但它们说明了两点：大型养老机构自己用 Microsoft 技术栈搭 AI 文档工具，已经在澳洲落地；这类项目会直接减少大客户对 careKind 的需求。

## A. Regis Aged Care：RegiCare Assist

| 字段 | 内容 | 来源 |
|---|---|---|
| 机构 | Regis Aged Care（约 70 到 72 家养老院） | S68, S69 |
| 技术伙伴 | Microsoft Copilot Studio + Microsoft Foundry；集成商 Cognizant | S69 |
| 时间线 | 2025-02 披露在 1 家院做 POC（120 名居民，数周）；**2025-09 正式上线**；Microsoft 于 2026-05 发文介绍 | S68, S69 |
| AI 做什么 | **不是起草笔记，而是汇总笔记**：把 progress notes 和交接资料按临床问题归类（即时关注事项、趋势、疼痛、感染迹象、排便、躁动、给药、拒绝护理等）；把 68 页的 24 小时报告压缩成 3 页；用点选式的预审 prompt；正在开发基于 30 天数据的跌倒预测 | S68, S69 |
| 效果（自报） | 每位 RN 每班节省 2 到 4 小时阅读笔记时间；即时关注事项识别准确率约 80%；多数类别优于原生 Microsoft Copilot | S68 |
| 规模 | 约 150 名员工在用，覆盖 72 家院 | S69 |
| 人工审核 | "support you, not replace your clinical judgment"，RN 仍需审阅完整笔记 | S68, S69 |
| 集成 | 目前需要**手动上传报告**；路线图中有与现有 care management 系统集成 | S69 |
| 痛点 | 成本可持续性是扩展的难点 | S68 |

## B. Uniting NSW.ACT：Buddy

| 字段 | 内容 | 来源 |
|---|---|---|
| 机构 | Uniting NSW.ACT（每年服务约 148,000 名客户） | S70 |
| 技术伙伴 | Engage Squared、Microsoft Tech for Social Impact；与另外 5 家大型养老机构合作 | S70 |
| AI 做什么 | **多语言**语音转 progress notes、自动翻译（Hindi、Nepali、Indonesian、Mandarin、Cantonese）、实时政策指引 | S70 |
| 规模/效果（自报） | 1,200+ 名居家及社区护理人员在用；写一条记录从 15 分钟降到 2 分钟以内；支持工作者每天约节省 30 分钟 | S70 |
| 奖项 | 2026 Australian Not-for-profit Technology Awards "Best use of AI for community impact" | S70 |
| 商业化 | 未见对外销售迹象 | S70 |

## 对 careKind 的启示
1. **需求已被验证**：Regis 解决的是 RN 读笔记的负担（下游），Buddy 解决的是 CALD 护工写笔记的负担（上游）。careKind 起草加 RN 审核的组合正好位于两者之间，可以同时覆盖。
2. **多语言是刚需**：Buddy 选的 5 种语言反映了澳洲养老护工的语言构成，careKind 应优先支持。
3. **"自建与采购"论证**：Regis 自己承认成本难以持续，而且需要手动上传；careKind 可以主打"开箱即用、与 CMS 集成、持续合规更新"。
4. **威胁**：Uniting 与另外 5 家大型机构合作，如果 Buddy 被行业联盟共享或商业化，会成为强力竞品。
