# 06 App Development 📱

Owner: Lin (Tech Lead) · Last reviewed: 04/10/2026

```
product/           产品原则、产品路线图、PRD 模板（PRD 本身放在根目录 docs/）
clinical-safety/   临床安全案例、危害日志、评测方案
engineering/       架构、技术栈、开发规范、发布流程
  └─ adr/          技术架构决策记录
design/            UX 原则、设计系统、无障碍
research/          用户研究：访谈脚本与记录（去标识化）
app/               App 源码：git submodule → Metatree-AI-Lab/carekind-app
```

## 每个功能从想法到上线
0. 先读主 PRD：`docs/PRD.md`
1. 用 `product/prd-template.md` 在 `docs/prds/` 写 PRD（含 **TGA boundary check** + **隐私影响** + **临床危害**）
2. 临床顾问评审 → 更新 `clinical-safety/hazard-log.md`
3. 设计 → `design/ux-principles.md`
4. 开发 → `engineering/engineering-standards.md`
5. 评测通过发布门槛 → `clinical-safety/evaluation-plan.md`
6. 发布 → `engineering/release-process.md`
