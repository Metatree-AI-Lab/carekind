Owner: Strategy · Status: Research draft · Last reviewed: 18/10/2026

# AccuNote

**威胁等级：中高**（18/10/2026 由"中"上调，理由见文末更新）

| 字段 | 内容 | 来源 |
|---|---|---|
| 公司 | AccuNote（运营主体未在抓取页面标明，⚠️ 需核实） | S62, S63 |
| 总部/国家 | 澳大利亚（自称） | S62 |
| 产品 | 面向澳洲养老的 care notes 软件："Care Notes in 60 Seconds" | S62 |
| 目标用户 | 澳洲养老机构、NDIS 服务商；未区分 residential 和 home care | S62 |
| AI 功能 | 语音转文字 care documentation；progress note 生成和检查；"review prompts"帮助保持记录一致；发布按 Aged Care Quality Standards 写 progress notes 的指南类内容 | S62, S63 |
| 人工审核 | 未详细说明 | S62 |
| 集成方式 | 未说明 | — |
| 定价 | 提供 14 天免费试用；价格未在抓取页显示 | S63 |
| AU 数据驻留/隐私 | "All processing happens on Australian servers"；数据不用于 AI 训练，有合同保障（营销声明） | S62 |
| TGA/客户/融资 | 未公开 | — |

## 对 careKind 的威胁判断
**中。** 同属"澳洲养老 + 隐私驻留 + 语音笔记"定位，并在用 SEO 内容（标准合规指南）抢搜索流量。产品深度、客户情况和团队规模不明，需要试用核实。

## 2026-10-18 更新
- **集成表述（新）**：首页称 AccuNote "supports documentation workflows alongside platforms such as Telstra Health Clinical Manager"，FAQ 称"designed to work alongside major clinical systems like Telstra Health, AlayaCare, and Person Centred Software"，"Available integrations and setup depend on each provider's configuration"（S106）。**没有说明是 API 写回还是导出/复制**（⚠️ 需核实）。
- **功能**：模板、自由输入、语音；review prompts 提示遗漏；管理者治理看板和工作流视图（S106）。
- **审核**：员工保存前自查；页面声明工具"do not certify provider compliance"、"does not guarantee an assessment outcome"（S106）。
- **合规**：提到 7 条 Strengthened Quality Standards 已于 2025-11-01 生效；无字段级映射；SIRS 只在链接资源描述中出现（S106）。
- **数据驻留**：澳洲服务器（[声称]）。
- **自报数字**：每班节省 2–3 小时、文书时间最多降 80%（未经验证）。
- **威胁等级**：由**中**上调为**中高**（理由：公开把自己定位成澳洲三大 CMS 的"伴随层"，与 careKind 的 CMS 伙伴路径直接重叠；但集成深度未验证）。
