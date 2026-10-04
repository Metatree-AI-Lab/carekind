# 公司规范 (Company Rules)

Owner: Lightman · Last reviewed: 04/10/2026 · 适用：所有员工、承包商、顾问、AI agent

## 1. 三条铁律（任何情况都不能违反）
1. **护士是记录的作者。** 任何产品、流程、演示都不能让 AI 草稿绕过人工确认进入正式记录。
2. **健康信息是最高敏感级数据。** 只在批准的系统里、在工作需要时访问；默认存在澳洲境内、最小化、加密。
3. **不确定的合规问题先问，再做。** 法律相关内容先查 `03-legal-compliance/`，查不到或不确定就升级给 Lightman，必要时问律师。

## 2. 价值观的具体做法
| 价值观 | 必须做到 |
|---|---|
| Kind by default | 内部沟通和文档里也不用贬低老人、护理员、客户的说法；用 "older people"、"residents" |
| Nurse is the author | 产品和营销都不说"全自动"；界面上让"确认"成为有意识的动作 |
| Safe before fast | 任何人发现可能造成临床伤害或隐私泄露的问题，都可以叫停发布 |
| Show the evidence | 对内对外的数字都要能说明来源和测量方法；不确定就写"未验证" |
| Small team, high ownership | 每件事都有唯一 Owner；Owner 没有指定就先指定 |

## 3. 保密与数据
- **必须**：住户和客户数据只存在批准的生产系统里。
- **禁止**：把住户信息截图、下载到个人设备、用私人邮箱或聊天工具发送。
- **禁止**：把客户数据或住户信息粘贴进任何未批准的 AI 工具，包括 ChatGPT、个人版 Claude 等。已批准的工具列表见 `04-security/vendor-subprocessor-register.md`。
- **必须**：发现疑似数据泄露、设备丢失、误发邮件时，**1 小时内**通知 Lightman，然后走 `incident-response` workflow。
- 本仓库只放 Internal 级别的信息。cap table、合同原件、员工个人档案、凭证**禁止**放进本仓库。

## 4. 文档
- **写下来优先**：决策、流程、客户洞察都写进本仓库对应目录，不能只存在聊天记录或脑子里。
- 每个文档开头保留 `Owner` 和 `Last reviewed`，修改后更新日期。
- 重大决策写 ADR（`09-templates/adr-template.md`）。
- **原始用户反馈只能人工录入 `10-feedback/`，原话照录**；AI 只能读，不能写。
- 不确定的事实标 `⚠️ 需核实`，未知信息用 `{{TBD}}` 占位，**禁止编造**。

### 4.1 分层上下文文档（CLAUDE.md + README.md）
**每一层目录都必须有两份文档**，帮助人和 AI 理解这一层：
| 层级 | 例子 |
|---|---|
| 根目录 | `/`（`AGENTS.md` 是共用规则，`CLAUDE.md` 引入它） |
| 部门 | `00-company/` … `12-skills/`、`docs/`、`rules/`、`scripts/` |
| 子部门 / 功能区 | `05-hr-teams/teams/engineering/`、`07-marketing-ops/sales/`、`06-app-development/app/src/domain/` |
| 代码仓库 | `06-app-development/app/` |
| 功能模块 | `06-app-development/app/src/domain/attribution/` 等 |

- `README.md` 给人看：用途、内容、怎么用。
- `CLAUDE.md` 给 AI 看：这里是什么、常做的事、**本目录特有的规则**、关键文件、不要做什么；功能模块还要有"关键函数（大函数登记）"和"测试与验收"。控制在约 60 行，不重复根目录规则。
- `AGENTS.md` 是指向同目录 `CLAUDE.md` 的软链接，让 Codex 读到同一份内容（根目录除外）。
- **大函数**（超过 40 行或核心算法）必须登记在所属功能模块 `CLAUDE.md` 的"关键函数"一节：签名、做什么、不变量。
- 新建目录时用 `09-templates/claude-md-template.md` 和 `readme-template.md`；内容变化时同步更新这两份文档。
- `scripts/check-context-docs.sh` 检查是否齐全，pre-commit 会运行它。不需要文档的目录（下载资料、原始反馈的子目录、运行记录、单个 skill 等）在脚本里排除。

## 5. 沟通
- 默认异步、文字沟通；会议必须有结论和 Owner。
- 核心协作时间以外不期待即时回复（right to disconnect），生产 P1 on-call 除外。
- 内部文档用中文，法律术语保留英文；对外内容用澳式英语（DD/MM/YYYY、AUD）。
- 不同意可以直接说；决定做出后执行（disagree and commit），并约好复盘时间。

## 6. 使用 AI 工具工作
- 可以用 AI 写作、编码、做调研，但**提交的内容由人负责**：AI 生成的代码要经过审查，AI 写的文档要核对事实。
- AI agent（Claude Code、Codex）在本仓库工作时遵守 `AGENTS.md` 和本目录的全部规范。
- AI 产出的法律或合规内容一律标注"运营参考，不是法律意见"。

## 7. 诚信与行为
遵守 `05-hr-teams/policies/code-of-conduct.md`：利益冲突要披露，不行贿受贿，零容忍骚扰和歧视，在 aged care 现场遵守机构政策。
