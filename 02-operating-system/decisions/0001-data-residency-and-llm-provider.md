# ADR-0001：数据驻留与 LLM / 语音供应商

- 状态：**Proposed** · Driver：CTO · Approver：创始人 · Consulted：Privacy Officer、律师

## 背景
住户健康信息是 sensitive information。APP 8 下数据出境须对境外接收方负责；aged care provider 采购普遍要求澳洲境内数据。LLM 和语音转写都会处理原始健康信息。

## 选项
| 选项 | 境内处理 | 备注 |
|---|---|---|
| A. 云厂商托管模型（如 AWS Bedrock Sydney 上的 Claude；Azure OpenAI Australia East） | ✅（需逐个确认模型在澳洲区域可用） | 企业条款、不用于训练、可配合 IRAP 环境 |
| B. 直接调用模型厂商 API | ⚠️ 需确认数据处理地区 | 可能涉及出境 |
| C. 自托管开源模型（境内 GPU） | ✅ | 运维成本高、质量需评测 |
语音转写同理：需确认供应商在澳洲区域处理音频。

## 倾向决定
选项 A 作为默认；锁定模型版本；开启零数据保留 / 不训练；所有调用经我们自己的境内后端，客户端不直连模型。⚠️ 选型时实测确认区域可用性与条款。

## 后果
写入子处理方登记、隐私政策、DPA。
