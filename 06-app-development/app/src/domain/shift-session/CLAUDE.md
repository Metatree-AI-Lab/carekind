# CLAUDE.md — 功能模块：shift-session

> 层级：功能模块 · 路径：`06-app-development/app/src/domain/shift-session/` · 上级上下文：[`../CLAUDE.md`](../CLAUDE.md)（根目录规则见 `AGENTS.md`）
> 本文件给 AI 看；给人看的说明在同目录的 `README.md`。

## 这里是什么
班次会话状态机：Open → Recording ⇄ Paused → Closing → Closed。（PRD：docs/PRD.md §6.3、§7.1）

## 在这里通常要做的事
- 实现或修改本模块
- 新增或修改关键函数时，同步更新下面的"关键函数"一节

## 本目录特有的规则（在根目录规则之外）
- 状态转换只能按 PRD §6.3 的状态图走，非法转换抛出领域错误
- 关闭前必须处理完所有事件（护栏：不能遗漏）

## 关键文件
- （代码文件在技术栈确定后补充）

## 不要做
- 不要从 adapters/ 或 interfaces/ import
- 不要违反上面的不变量来"简化"实现

## 关键函数（大函数登记）
> 函数签名在技术栈确定后按实际代码更新；新增大函数（> 40 行或核心算法）必须登记在这里。

- `startShift(staff, unit): ShiftSession` — 加载本班老人名单，进入 Open
- `pauseRecording / resumeRecording` — 包括进入已退出老人房间时自动暂停（consent 模块提供判断）
- `closeShift(session): Result` — **待分配队列不为空时必须拒绝**；成功后触发交接生成和音频保留策略

## 测试与验收
- 状态机每一条合法和非法转换都要有测试

## 相关
- docs/PRD.md §6.3、§7.1
- 06-app-development/clinical-safety/hazard-log.md
- ../CLAUDE.md（领域层）
