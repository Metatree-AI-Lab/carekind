# CLAUDE.md — 功能模块：consent

> 层级：功能模块 · 路径：`06-app-development/app/src/domain/consent/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
老人选择退出 AI 文书、护士声纹同意。（PRD：docs/PRD.md §7.8、§6 法律）

## 在这里通常要做的事
- 实现或修改本模块
- 新增或修改关键函数时，同步更新下面的"关键函数"一节

## 本目录特有的规则（在根目录规则之外）
- 声纹属于生物特征敏感信息：只用于本人语音过滤，不用于身份识别或考勤
- 同意记录要保存来源（本人 / 代表）和日期

## 关键文件
- （代码文件在技术栈确定后补充）

## 不要做
- 不要从 adapters/ 或 interfaces/ import
- 不要违反上面的不变量来"简化"实现

## 关键函数（大函数登记）
> 函数签名在技术栈确定后按实际代码更新；新增大函数（> 40 行或核心算法）必须登记在这里。

- `isOptedOut(residentId): boolean` — 退出的老人不起草，提示护士手动记录
- `shouldAutoPause(location, roster)` — 模式 B 下进入退出老人的房间自动暂停
- `recordVoiceprintConsent / revokeVoiceprintConsent(staff)` — 撤回或离职后立即删除声纹

## 测试与验收
- 退出状态对 drafting、shift-session 的影响都要有集成测试

## 相关
- docs/PRD.md §7.8、§6 法律
- 06-app-development/clinical-safety/hazard-log.md
- ../CLAUDE.md（领域层）
