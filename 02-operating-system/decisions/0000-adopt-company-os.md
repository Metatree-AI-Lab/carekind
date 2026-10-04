# ADR-0000：采用 Markdown + Git 作为 Company OS

- 状态：Accepted · 日期：04/10/2026 · Approver：创始人

## 背景
需要一个单一事实来源管理公司知识；AI agent（Claude）需要能直接读写。

## 决定
用本 Git 仓库中的 Markdown 文件作为 Company OS。敏感信息（cap table、合同原件、凭证、员工个人档案）**不放**在本仓库，只放指向安全存储位置的链接。

## 影响
- ✅ 版本历史、可审查、AI 友好、零成本
- ⚠️ 非技术同事上手需要指导；可后续镜像到 Notion / Google Drive
- ⚠️ 如推送到 GitHub，仓库必须为 private
