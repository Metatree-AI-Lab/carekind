# 架构概览 (Architecture)

Owner: Lin (Tech Lead) · Status: Draft — 待 ADR 确认 · Last reviewed: 04/10/2026

```
[护士 App (iOS/Android/Web PWA)]
      │  音频 / 文本（TLS）
      ▼
[careKind API — 澳洲区域]──► [语音转写（境内）]
      │                    └► [LLM（境内端点，零保留）]
      │                    └► [事实一致性检查]
      ▼
[草稿存储（加密，短期）] ──► 护士审核确认 ──► [集成层] ──► 客户临床系统 / 导出
      │
[审计日志] [管理后台] [评测流水线]
```

## 关键设计约束
- 多租户强隔离（每个 provider）；所有数据访问带 tenant 上下文
- 客户端不直连模型供应商
- 音频与草稿有自动过期删除
- 日志与错误监控不含健康信息（脱敏）
- 可替换的模型适配层（便于切换和回归评测）

## 技术栈
{{TBD — 写入 adr/0001-tech-stack.md}}
