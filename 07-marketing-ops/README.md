# 07 Marketing & Operations 📣

Owner: Lightman（Growth）· Status: Active · Last reviewed: 18/10/2026

```
brand/              品牌定位、语气、视觉
marketing/          ICP 与画像、内容与渠道、官网、营销合规
blog/               独立私有博客仓库（git submodule）
sales/              销售流程、采购尽调包
customer-success/   试点手册、上线、支持
operations/         内部运营：工具栈、供应商、行政日历
```

| 文件 | 内容 |
|---|---|
| [blog/README.md](blog/README.md) | 独立博客仓库 `Metatree-AI-Lab/carekind-blog`（submodule） |
| [brand/brand-guide.md](brand/brand-guide.md) | 定位、信息层级、语气、视觉 |
| [marketing/icp-and-personas.md](marketing/icp-and-personas.md) | 目标客户与画像、访谈问题 |
| [marketing/marketing-plan.md](marketing/marketing-plan.md) | 渠道、内容、活动 |
| [marketing/marketing-compliance.md](marketing/marketing-compliance.md) | 营销合规（ACL、Spam Act、TGA 预期用途、案例使用） |
| [sales/sales-process.md](sales/sales-process.md) | 销售阶段与采购尽调 |
| [customer-success/pilot-playbook.md](customer-success/pilot-playbook.md) | 试点手册 |
| [customer-success/support.md](customer-success/support.md) | 支持与 SLA |
| [operations/operations-handbook.md](operations/operations-handbook.md) | 内部运营 |

## Blog 独立仓库

仓库：[Metatree-AI-Lab/carekind-blog](https://github.com/Metatree-AI-Lab/carekind-blog)（private）。路径：`07-marketing-ops/blog/`。

首次 clone Company OS 时使用 `git clone --recurse-submodules`；已有 checkout 使用 `git submodule update --init 07-marketing-ops/blog`。博客内容在独立仓库维护；经授权提交并推送后，再在 Company OS 更新 submodule 指针。提交、推送和部署分别授权。

当前已建立独立仓库及每日新闻写作规范，尚未建立网站或发布流程。每天 Brisbane 时间 08:00 的 Codex 自动任务将文章保存为本地 Markdown 草稿，不自动推送或发布。
