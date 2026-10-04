# 开发规范 (Engineering Standards)

Owner: Lin (Tech Lead) · Status: Draft · Last reviewed: 04/10/2026

- 所有代码经 PR + 至少 1 人审查（早期单人时：自审清单 + AI 代码审查）
- `main` 分支受保护；CI 必须通过（测试、lint、类型检查、依赖漏洞扫描、secret scanning）
- **生产数据永不进入开发/测试环境**；测试用合成数据
- 密钥只放密钥管理服务
- 涉及 tenant 隔离、权限、AI 输出处理的代码必须有测试
- 提示词与模型配置纳入版本控制，变更走评测流程
- 日志：禁止记录音频内容、转写文本、住户姓名
- 依赖：新增依赖需检查许可证与维护状态
- 技术决策写 ADR：`adr/NNNN-title.md`
