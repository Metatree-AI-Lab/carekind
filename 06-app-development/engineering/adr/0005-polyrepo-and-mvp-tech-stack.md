# ADR-0005：多 repo 结构（meta repo + submodule）与 MVP 技术栈

- 状态：**Accepted**（Lightman 18/10/2026 在对话中决定）· 标"⏳"的项仍由 Lin 在技术 ADR-0001 / 0002 决定
- 日期：18/10/2026
- Driver：Lightman · Approver：Lightman / Lin（技术实现）· Contributors：Claude（起草）· Informed：Gary、Windston
- 相关：[ADR-0003](0003-phase1-delivery-web-and-super-admin.md)、[ADR-0004](0004-phase1-facility-admin-portal.md)（本 ADR 不取代它们，只补充 repo 结构和技术栈）

## 背景
第一阶段有多个独立前端（护士端、机构管理端、Super Admin、Demo、Marketing website），再加一个 API。目前只有一个 App submodule：`06-app-development/app` → `Metatree-AI-Lab/carekind-app`，里面基本是空的。Lightman 要求每个前端和 API 都是独立 repo，`carekind` 本身作为 meta repo，用 submodule 引用它们。

## 选项
| 选项 | 优点 | 缺点 |
|---|---|---|
| A. 单一 monorepo（apps/ + packages/） | 共享代码最方便；改一次所有端同步 | 权限和发布粒度粗；一个 repo 的 CI 越来越重 |
| **B. 多 repo + meta repo（submodule）+ 共享包 repo** | 每端独立发布、独立 CI、独立权限；meta repo 用 submodule 指针记录"哪些版本是一起的" | 共享代码要发布成包、按版本引用；跨 repo 改动要分几次提交 |
| C. 多 repo，共享代码各自复制 | 最简单 | 同一条规则写多份，违反 `rules/02` §2.2 DRY |

## 决定
采用 **B**。

### repo 结构
```
carekind（meta repo：Company OS + submodule 指针）
└─ 06-app-development/
    ├─ api/              → Metatree-AI-Lab/carekind-api             NestJS（由现有 carekind-app 重命名）
    ├─ nurse-web/        → Metatree-AI-Lab/carekind-nurse-web       React（也部署 Demo）
    ├─ provider-portal/  → Metatree-AI-Lab/carekind-provider-portal React（也部署 Demo）
    ├─ super-admin/      → Metatree-AI-Lab/carekind-super-admin     React
    ├─ website/          → Metatree-AI-Lab/carekind-website         纯 HTML + CSS，脚本用 TypeScript（tsc）
    └─ shared/           → Metatree-AI-Lab/carekind-shared          类型、zod 校验、API 客户端、设计 token、i18n
（路线图）nurse-mobile/  → Metatree-AI-Lab/carekind-nurse-mobile    React Native（第一阶段不做）
```
- **Demo 不单独建 repo**：用 nurse-web 和 provider-portal 的同一份代码，部署到独立的 demo 环境，加载虚构数据。
- **共享代码**：放在 `carekind-shared`，发布成私有 npm 包（GitHub Packages），各 repo 按版本号引用。业务规则（分级、权限、保留期、校验）只在这里定义一次。各前端的业务逻辑不写在页面组件里，录音抽象为 `AudioRecorder` 接口，方便以后 React Native 复用。
- **所有文档都放在 meta repo**（Lightman 18/10/2026）：PRD、ADR（包括技术 ADR）、架构、设计规范、文书模板、调研、发布说明、AI changelog。各代码 repo 只放代码、测试、CI 配置，加一份简短的 README.md 和 CLAUDE.md（说明本 repo 做什么、怎么本地运行，并链接回 meta repo 的 PRD 和规则），不另写 PRD 或 ADR。
- **meta repo** 继续放 Company OS 文档、PRD、ADR、共用工具（`.editorconfig`、`scripts/check-*.sh`，由 `scripts/sync-app-tooling.sh` 同步到各 repo）和 AI changelog。

### MVP 技术栈
| 部分 | 选择 | 状态 |
|---|---|---|
| 语言 | 全部 TypeScript | ✅ |
| 护士端 | Web App（React），不做 mobile app | ✅ |
| 机构管理端 | 独立 Web App（React） | ✅ |
| Super Admin | 独立 React app；不做 IP allowlist | ✅ |
| 登录 | **所有端都不做 MFA**（Super Admin、机构管理端、护士端；Lightman 18/10/2026 决定，见"后果"） | ✅ |
| Mobile | React Native，列入路线图，第一阶段不做 | ✅ |
| Marketing website | 纯 HTML + CSS，不用 Next.js；脚本用 TypeScript；只做英文 | ✅ |
| 后端 API | NestJS（建议底层用 Fastify adapter） | ✅ NestJS · ⏳ adapter |
| 语音转写 | ElevenLabs（数据在澳洲境内，Lightman 确认） | ✅ |
| 起草 LLM | 云厂商境内托管，零保留，锁定版本；客户端不直连 | 🟡 公司级 ADR-0001 |
| 对象存储 | S3：音频短期保留、到期自动删除；不用 CDN | ✅ |
| CI/CD | GitHub Actions 云端执行，每个 repo 各自的 workflow | ✅ |
| 前端构建 | Vite | ⏳ |
| 数据库 | PostgreSQL（托管） | ⏳ |
| 多租户隔离 | 行级安全或 schema 隔离 | ⏳ 技术 ADR-0002 |
| 认证 | 托管身份服务 | ⏳ |
| Tier 3 实时推送 | WebSocket 或 Web Push | ⏳ |
| 基础设施即代码 | CDK 或 Terraform | ⏳ |

## 后果
**正面**
- 各端独立发布、独立 CI、独立权限，出问题影响面小。
- meta repo 的 submodule 指针就是"这一组版本一起上线"的记录。

**负面 / 风险**
- 跨 repo 的改动（例如 API 字段变化）要按顺序做：先发布 shared，再改 api，再改前端，最后更新 meta repo 指针。需要在 `release-process.md` 写清楚。
- **产品里不做 MFA**：已从 super admin PRD、机构管理端 PRD、ADR-0003、ADR-0004 中删除相关要求。ASD Essential Eight 建议特权用户使用 MFA，机构安全尽调时也常问到，这一点作为已接受风险记录，尽调问卷里如实回答"不支持"（rules/01 §2：只写已经做到的）。公司内部系统（邮箱、云控制台、银行）的 MFA 不受本决定影响，仍按 `04-security/` 执行。
- ElevenLabs 要登记进 `04-security/vendor-subprocessor-register.md`，写明处理区域和保留条款。

**执行状态（18/10/2026）**
- ✅ `carekind-app` 已在 GitHub 重命名为 `carekind-api`，meta repo 的 `.gitmodules` URL 已指向新名字（路径暂时仍是 `06-app-development/app`）。
- ✅ 已新建私有 repo 并加入 submodule：`carekind-nurse-web`（Lightman 手动创建）、`carekind-provider-portal`、`carekind-super-admin`、`carekind-website`、`carekind-shared`（每个只有 GitHub 自动生成的 README）。
- ⛔ 路径 `06-app-development/app` → `06-app-development/api` 未改：移除旧 submodule 被会话权限拦下。
- meta repo 里的 submodule 变更已暂存，**未提交、未推送**。

**迁移步骤**（🧑 每一步都由人执行或确认）
1. 在 GitHub `Metatree-AI-Lab` 下新建私有 repo：carekind-nurse-web、carekind-provider-portal、carekind-super-admin、carekind-website、carekind-shared。
2. 把 `carekind-app` 重命名为 `carekind-api`，meta repo 里的 submodule 路径从 `06-app-development/app` 改到 `06-app-development/api`。
3. 在 meta repo 逐个 `git submodule add`，每个 repo 补 README.md、CLAUDE.md、AGENTS.md 软链接。
4. 更新 `scripts/setup.sh`（初始化全部 submodule、为每个 repo 启用 pre-commit）、`scripts/sync-app-tooling.sh`（同步到多个 repo）、`scripts/check-context-docs.sh`（排除规则）。
5. 更新根目录 `CLAUDE.md`、`AGENTS.md` 的 App submodule 说明，以及 `06-app-development/CLAUDE.md`、`architecture.md`。
6. 提交、推送前，先检查每个 repo 的 GitHub Actions 触发条件，确认不会意外触发 CI/CD。

## 复盘时间
第一个试点开始前，或第一次跨 repo 发布之后，以先到者为准。
