# 护理文书 AI 化的 Best Practice（综合结论）

Owner: Lightman · Status: Research draft · Last reviewed: 18/10/2026

> 综合 18/10/2026 多 agent 调研的结论，给产品、临床治理和销售用。每条都指向原始分析文件；原始文件里有条款号和来源编号。
> 运营参考，不是法律意见。用户证据 n = 0（`10-feedback/` 为空），效率类结论都是假设，需试点验证。

## 来源文件
| 简称 | 文件 |
|---|---|
| EVT | `03-legal-compliance/references/paperwork-requirements-by-event.md`（16 个触发事件的必需文书、时限、条款） |
| STATE | `03-legal-compliance/references/state-by-state-comparison.md`（隐私、保存期、泄露通报、监控设备法 §3.10、州 ICT §3.11） |
| CLIN | `03-legal-compliance/references/state-clinical-practice-rules.md`（约束性措施同意、给药权限、coroner、VAD） |
| COMP | `01-strategy/competitive-research/how-competitors-solve-it.md`（五条路径、共识、空白、竞品的坑） |
| FLOW | `06-app-development/research/care-documentation-process-flows.md` + `-5-8.md`（8 个流程 as-is / to-be、人工确认门 H1–H12、PRD 缺口） |
| TPL | `06-app-development/product/document-templates/`（careKind 自有文书模板） |

---

## 1. 十二条 best practice

### A. 记录内容
1. **只写说过的，数值逐字照录。** 药名、剂量、体温、血糖、摄入量识别不确定时让人确认，不推算、不补全。行业已在怀疑"AI 记录空洞"，Commission 会退回答不出追问的 AI 文件（COMP §11 #5、#9）。
2. **把"事实草稿"和"判断字段"分开。** 是否 reportable、P1/P2、是否属于约束性措施、是否 expected death、是否升级，都由人填，AI 只整理事实、显示"请填写"（FLOW §9 #3；EVT §5、§14；Rules r 164-25(1)(b)(g)(k)）。
3. **一个事实只说一次，生成多份一致的文书。** 跌倒、用药事件、约束性措施、死亡都要在 progress note、chart、IMS、SIRS、家属沟通、交接里重复写（EVT §17；FLOW §9 #1）。公开竞品最多做到"一段话填一张表"，这是最清楚的空白（COMP §10 #2）。
4. **拒绝照护也要记录清楚。** 拒绝服务导致的事件不是 reportable incident（r 16-10(2)），但必须有清楚的拒绝记录，这是自动起草的高价值点（EVT §19 #5）。

### B. 审核与责任
5. **按风险分级审核，敏感事件由 RN 逐条确认，不能一键全过。** 所有公开竞品都是作者自审或单级签署（COMP §10 #1）。Tier 3 草稿要**实时**推给 shift RN，不等班末，因为 r 165A-20 要求"as soon as possible"上报，SIRS 和报警 24 小时都从知悉起算（FLOW §11 #1）。
6. **Tier 3 内容不能被随手删除。** 丢弃只能由 RN 做并写原因，被丢弃的片段保留在审计日志中（FLOW §11 #4）。
7. **证据级审计链：** 原话 ↔ 句子 ↔ 编辑人 ↔ 确认时间，AI 改写高亮。以此回应 TGA 对 scribe 的审查和机构的临床治理（COMP §12）。
8. **careKind 的提示不替代员工按机构程序口头上报。** SIRS"知悉时间"有法律后果，计时起点由 CM 手动填写，careKind 只保留"口述时间""RN 首次查看时间"作审计证据；⚠️ 需律师确认（FLOW §11 #2）。

### C. 合规时限与跨班次
9. **时限提示以本地法规原文为准，并显示完整链条：** 员工尽快上报 → 报警 24 小时（r 164-40(2)）→ P1 24 小时 + 5 天补充 → P2 30 天 → final report 84 天（r 165A-45）（EVT §19 #2）。竞品 Heidi 的 SIRS 文章就有时限前后不一的错误（COMP §11 #6）。
10. **跨班次待办要随交接移交：** post-fall 观察、PRN 效果复查、紧急约束后通知 RPSDM、P1 5 天补充、事后 care plan 复核（FLOW §9 #2）。只做"该时间点没有记录"的文书提示，不判断是否需要观察（🟡，需 TGA 边界审查）。

### D. 隐私、录音与州差异
11. **录音只留护士本人。** 护士录自己的口述可以；录到护士不在场参与的对话时，8 个辖区都需要相关人员同意。NSW、WA、SA、TAS、ACT 一般要求全体参与方同意；VIC、NT、QLD、SA 还限制传播录音，上传给 vendor 是否算"传播"需律师意见（STATE §3.10）。默认丢弃非护士语音、不保存原始音频，上线前拿 NSW、VIC、QLD 的律师书面意见并完成 PIA（STATE §4.11）。住户或家属可以退出，退出后照常手动记录（COMP §11 #3）。
12. **把透明度当卖点，州差异做成配置：**
    - 主动公开模型、子处理方和存储区域，数据留在澳洲（COMP §11 #2；WA 把健康信息列为必须境内托管，见 STATE）。
    - 保存期、健康记录法（VIC HRA 无小企业豁免；ACT 把 careKind 直接视为 record keeper）、泄露通报、约束性措施同意和 coroner 规则按机构所在州配置（STATE §1、§4；CLIN）。
    - 临床记录保存 7 年（Rules 154-1000(1)(d)）。careKind 不是主存储，草稿和审计链的保留期在 DPA 里约定（EVT §19 #1）。

---

## 2. 不要做（来自竞品的坑和 TGA 边界）
- 不做诊断、风险评分、治疗或用药建议、按数值报警、自动判定或自动上报 SIRS（rules/03 §4）。TGA 2026-10 审查 12 个 scribe，8 个可能构成医疗器械，免责声明不能豁免（COMP §11 #1）。
- 不生成给药记录、不做用药核对，用药以 eNRMC / 用药系统为准（FLOW §11 #12，建议写成护栏）。
- 不按内容自动告警，误报会摧毁信任（COMP §11 #8）。
- 不在产品里写死"care plan 12 个月复核"，这条只适用于居家类服务（r 148-80(5)，EVT §19 #3）。
- 不把"写得流畅"当目标，空洞记录在审计中会适得其反（COMP §11 #5）。

## 3. 落到产品上
| Best practice | 对应 PRD（docs/prds/） | 对应模板（TPL） |
|---|---|---|
| 1–4 | 2026-10-18-event-to-multi-document-drafting | daily-progress-note、incident-report-ims、incident-post-fall-record 等 |
| 5–8 | 2026-10-18-tiered-review-and-audit-trail | 所有模板的"🧑 人工"字段 |
| 9–10 | 2026-10-18-isbar-handover-and-care-coverage；SIRS 提示 PRD（待写） | incident-sirs-assessment-prep、daily-shift-handover-isbar |
| 11 | 2026-10-04-shift-capture-and-resident-records | — |
| 12 | 2026-10-18-record-export-and-cms-integration；机构管理 PRD（待写） | — |
| 多语言 CALD 护工（COMP §10 #6） | 2026-10-18-multilingual-dictation-and-person-centred-language | — |
| 结果可见、Demo 必备 | 2026-10-18-demo-workspace-and-synthetic-data | 各模板的"示例（虚构）" |

## 4. 仍需人来决定
- 主 PRD 的 17 条修订建议（FLOW §11），尤其 Tier 3 实时推送、新增"跨班次待办"实体、§14 补用药事件 / 死亡 / 转院、新增"不写给药记录"的护栏（改护栏需 ADR）。
- 律师意见：监控设备法的录音和传播、SIRS 知悉时间、careKind 在 ACT / VIC 健康记录法下的直接义务。
- 首个 CMS 集成对象（需 ADR）。
