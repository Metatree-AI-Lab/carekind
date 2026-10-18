Owner: Strategy · Status: Research draft · Last reviewed: 18/10/2026

# The Access Group（Access Smart Notes）：英国参照

**威胁等级：低**（未见澳洲可用；英国养老 AI 笔记的成熟样板）

| 字段 | 内容 | 来源 |
|---|---|---|
| 公司 | The Access Group | S72 |
| 总部/国家 | 英国 | S72 |
| 产品 | Access Smart Notes，原生接入 Access Care Planning | S72 |
| 目标用户 | 英国护理机构（单体或集团）；2025-08 起也在 4 家 NHS trust 推广 | S72, S73 |
| AI 功能 | 床旁实时语音口述笔记和评估；AI 改善笔记质量、一致性和准确性；可定制表单模板；支持离线；审计追踪；口述识别多种口音 | S72 |
| 人工审核 | "review your notes, edit and approve" | S72 |
| 定价 | 按护工或床位计年费，提供价格匹配；具体价格未公开 | S72 |
| 澳洲可用性 | 官网未提及 | S72 |

## 对 careKind 的启示
- "按床位计年费"是养老 AI 笔记的一种可参考定价模型。
- 英国 CMS 厂商（Access、PCS、Nourish、Birdie）都在把 AI 做进平台，可以预期澳洲 CMS 厂商会跟进（PCS 同时在英国和澳洲经营，S16）。

## 2026-10-18 更新
- **技术与输出**（S107）：Azure Speech-to-Text 转写 + 私有 GPT-4o 实例结构化；做的是 **voice-to-form**——把对话填进表单字段（文本、段落、勾选、下拉、单选、数字、日期、时间、表格等；不支持照片、条码、body map、签名）。
- **审核**：用户核对后提交；**每个字段可回放对应音频片段核对准确性**（S107）——这是公开资料里最接近"证据级可追溯"的设计。面向 healthcare assistant 的指南称"未经你批准不会保存"，录音前要确认客户同意（S108，搜索摘要 ⚠️）。
- **定价**：帮助中心写的是**按音频处理小时计费的可选附加项**（S107），与 2026-10-04 档案中"按护工或床位计年费"（S72）不同，⚠️ 需核实是否两种并存。
- 数据区域只写"GDPR-compliant environments"；本次**未发现澳洲上线**。
- **威胁等级**：维持**低**（参照）。
