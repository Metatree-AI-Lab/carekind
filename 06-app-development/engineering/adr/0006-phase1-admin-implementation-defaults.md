# ADR-0006：第一阶段（管理端）开发默认值

- 状态：**Proposed**——Lightman 18/10/2026 要求立即开发第一阶段管理端；技术 ADR-0001（技术栈）、ADR-0002（多租户隔离）还没写，本 ADR 先给出可以开工的默认值，**由 Lin 复核**，改动时直接修订本 ADR 并同步代码
- 日期：18/10/2026
- Driver：Lightman · Approver：Lin · Contributors：Claude（起草）
- 相关：[ADR-0005](0005-polyrepo-and-mvp-tech-stack.md)（已定：TypeScript、NestJS、React、S3、GitHub Actions、不做 MFA）

## 背景
第一阶段只做管理端：Super Admin（`carekind-super-admin`）、机构管理端（`carekind-provider-portal`），加上 API（`carekind-api`，meta 路径 `06-app-development/app`）和共享包（`carekind-shared`）。数据库、ORM、隔离方式、认证方式还没定，但不定就没法写代码。

## 决定（默认值）
| 项 | 默认值 | 理由 |
|---|---|---|
| API | NestJS 11 + **Fastify adapter**，Node.js ≥ 22 | ADR-0005 已定 NestJS；Fastify 底层更快 |
| 数据库 | PostgreSQL 16（托管，AWS Sydney） | 关系型数据、行级安全、审计 |
| ORM / 迁移 | Prisma | 类型安全，迁移可读 |
| 多租户 | 共享 schema，所有租户数据表都带 `providerId`；**Postgres RLS** 按请求设置的 `app.provider_id` 过滤；应用层 guard 再校验一次；Facility 范围在应用层按员工分配过滤 | 双重保护；跨租户测试是发布门槛（super admin PRD §4-B） |
| 审计 | `audit_event` 表只允许 INSERT（数据库权限禁止 UPDATE / DELETE）；记录"谁、何时、做了什么、对象 ID"，**不记录健康信息内容** | 两份管理端 PRD 的要求 |
| 认证 | 邮箱 + 密码（argon2id），短期 access token + 轮换 refresh token，放在 httpOnly、SameSite=Strict 的 cookie；Super Admin 与机构管理端用不同的 token audience；**不做 MFA**（ADR-0005） | 简单、够用；SSO 留到 Phase 2 |
| 校验 | zod schema 写在 `@carekind/shared`，API 和前端共用同一份 | `rules/02` §2.2 DRY |
| 前端 | React 19 + Vite + TypeScript + React Router + TanStack Query | ADR-0005 已定 React |
| 样式 | 只用设计系统：`tokens.css` + `components.css`（`ck-` 类）；React 组件放在 `@carekind/shared`（DS-5）；不引入 Tailwind 或其他 UI 库 | DESIGN.md 是唯一来源 |
| 共享包的引用 | 第一阶段用本地路径依赖 `"@carekind/shared": "file:../shared"`（meta repo 里各 submodule 是兄弟目录）；之后再发布到 GitHub Packages | 多 repo 下最简单的开工方式 |
| 测试 | Vitest（API、前端、共享包都用）；测试数据只用虚构的 Wattle Grove Care Group | 一套工具 |
| 格式与 lint | Prettier（`useTabs: true, tabWidth: 4`）、ESLint + typescript-eslint（`no-explicit-any: error`、`explicit-module-boundary-types`） | `rules/02` §1、§5 |
| 本地数据库 | 各 repo 提供 `docker-compose.yml` 启动 Postgres，开发者自己运行 | 不在 AI 会话里启动 |

## 本机验证的限制
按 owner 全局规则，**本机不运行全量 lint / type-check / test / build**。AI 开发时只运行自己新写的那几个测试文件；完整检查放到 GitHub Actions 云端，在 owner 明确要求部署时才触发。

## 后果
- 代码可以马上开工；Lin 复核后如改 ORM 或隔离方式，影响范围是 API repo 的数据层。
- 需要补：各 repo 的 GitHub Actions workflow（只在明确要求部署时运行）、`.env.example`、本地启动说明。

## 复盘时间
Lin 写正式 ADR-0001 / 0002 时，或第一阶段开发两周后，以先到者为准。
