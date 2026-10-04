Owner: Strategy · Status: Research draft · Last reviewed: 04/10/2026

# Telstra Health（Clinical Manager / CareKeeper / 原 iCareHealth）

**威胁等级：中**

> **清单更正**：原候选清单把 "iCare Health" 单列。实际上 iCareHealth 的澳洲业务已于 **2014 年被 Telstra Health 全资收购**，现在是 Telstra Health 养老产品线的一部分（S15）。所以这里合并为一个档案。

| 字段 | 内容 | 来源 |
|---|---|---|
| 公司 | Telstra Health（Telstra 子公司） | S9 |
| 总部/国家 | 澳大利亚 | S9 |
| 产品 | Clinical Manager（临床管理）、CareKeeper（床旁移动记录）、Medication Management、MedPoint、MedMobile、Resident Manager、Message Manager、Care Insights（报表）。新平台 **Corus** 于 2026-05 发布 | S9, S11 |
| 目标用户 | Residential aged care 机构 | S9 |
| AI 功能（现状） | Care Insights 提供 20+ 张可视化临床报表（以报表为主，不是生成式 AI）。与 RMIT 合作的 NLP/ML 风险预测工具，基于护理记录预测跌倒、抑郁、死亡风险，获 2024 Research Australia 奖。GP 端另有 **Smart Scribe**（2025-03，集成 MedicalDirector，面向 GP，未提养老） | S9, S13, S14 |
| AI 功能（路线图） | Corus 由 Salesforce（agentic AI）、MuleSoft、Snowflake、Smile 构建。**养老解决方案预计 2028 年起上线 Corus**；同时会"逐步"在现有养老环境中加入 AI 摘要和更直观的工作流（没有给出具体时间） | S11, S12 |
| 集成方式 | 自有系统；与 PainChek、AusDi、Simple Foods 及 My Health Record 集成 | S9 |
| 定价 | 未公开 | — |
| 规模 | 80,000+ 张床位，220+ 家养老机构，21+ 年 | S9 |
| AU 数据驻留 | 养老产品页未明确（⚠️ 需核实）；Smart Scribe 只称依托 Telstra Health 的数据保护能力 | S14 |
| TGA | 未提及 | — |
| 养老客户 | 官网未点名 | — |

## 优势
- 覆盖 80,000+ 床位的装机量，并且已有自建 scribe（Smart Scribe），把它移植到养老的技术路径已经存在。
- 已有基于护理记录的 NLP 风险预测积累。

## 劣势
- Corus 养老版要到 2028 年，现有养老产品上的 AI 摘要没有时间表，存在 **2026 到 2028 年的窗口期**。
- 大型电信系企业，产品迭代慢（推断）。

## 对 careKind 的威胁判断
**中。** 短期内不太可能推出成熟的养老生成式文档功能，但只要宣布把 Smart Scribe 引入 Clinical Manager，就会显著改变竞争格局。另一方面，Telstra Health 客户在窗口期内是 careKind 的潜在目标，前提是有可行的写回或集成路径（⚠️ 需技术核实 Clinical Manager 是否开放 API）。
