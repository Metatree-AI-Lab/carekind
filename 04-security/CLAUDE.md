# CLAUDE.md — 04 Security（怎么保护数据）

> 层级：部门 · 路径：`04-security/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
信息安全政策、数据分级与保留期、访问控制、供应商与子处理方登记。

## 在这里通常要做的事
- 回答安全尽调问卷（只写已做到的）
- 新增子处理方前做评估
- 更新数据保留期

## 本目录特有的规则（在根目录规则之外）
- 住户健康信息 = Restricted 级别
- 任何会接触客户数据的新供应商，先填 vendor-subprocessor-register.md 的选型清单
- 数据和 LLM 推理必须在澳洲境内（ADR-0001）

## 关键文件
- information-security-policy.md
- data-classification-and-retention.md
- access-control.md
- vendor-subprocessor-register.md

## 不要做
- 不要在任何文件里写真实密钥或凭证
- 不要把"计划中"的控制写成"已完成"

## 相关
- rules/02-code-rules.md §7
- 03-legal-compliance/privacy-program.md
