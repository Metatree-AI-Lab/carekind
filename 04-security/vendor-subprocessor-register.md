# 供应商与子处理方登记 (Vendor & Sub-processor Register)

Owner: Lin (Tech Lead) · Status: Draft · Last reviewed: 04/10/2026

> **子处理方** = 会接触客户个人信息的第三方，必须写进对客户的子处理方清单，变更需提前通知客户（按 DPA）。

## 子处理方（接触客户数据）
| 供应商 | 用途 | 数据类别 | 数据所在地 | DPA/条款 | 安全证明 | 状态 |
|---|---|---|---|---|---|---|
| {{TBD: 云平台 e.g. AWS / Azure / GCP}} | 托管、存储 | Restricted | Sydney / Melbourne 区域 | {{TBD}} | ISO 27001 / SOC 2 / IRAP | 待选型 |
| {{TBD: LLM 端点 e.g. Claude via AWS Bedrock（Sydney）}} | 记录生成 | Restricted | 澳洲区域，确认零数据保留 / 不用于训练 | {{TBD}} | {{TBD}} | 待选型 → ADR-0001 |
| {{TBD: 语音转写}} | 语音转文字 | Restricted | **必须确认在澳洲境内处理** | {{TBD}} | {{TBD}} | 待选型 |
| {{TBD: 错误监控}} | 错误日志 | 必须脱敏，不含健康信息 | {{TBD}} | {{TBD}} | {{TBD}} | 待选型 |

## 内部工具（不接触客户健康数据）
| 工具 | 用途 | 已批准使用 AI 吗 | 备注 |
|---|---|---|---|
| Google Workspace / M365 | 邮件文档 | — | MFA |
| 1Password / Bitwarden | 密码 | — | — |
| Xero / MYOB | 记账 | — | — |
| Claude / Claude Code | 写作、编码 | ✅ 仅非客户数据 | 禁止输入住户信息 |
| GitHub | 代码 | — | Secret scanning |
| CRM {{TBD}} | 销售 | — | — |

## 选型检查清单（新增子处理方前）
- [ ] 数据在澳洲境内存储和处理？
- [ ] 是否把我们的数据用于训练？能否关闭？数据保留期？
- [ ] 有 ISO 27001 / SOC 2 / IRAP？
- [ ] DPA 条款与泄露通知承诺？
- [ ] 更新 PIA 与对客户的子处理方清单
