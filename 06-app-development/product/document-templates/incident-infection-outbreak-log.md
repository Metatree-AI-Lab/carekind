# 感染与疫情记录（Infection & outbreak log）

Owner: Lightman · Status: Draft template · Last reviewed: 18/10/2026
> careKind 自有模板。运营参考，不是法律意见；机构使用前须按自身政策和 CMS 调整。

> 来源标记：`🤖 AI 可起草` · `🗣️ 照录原话/数值` · `🧑 人工`。careKind 只记录**员工看到的症状和已采取的措施**；"疑似 X 感染""符合疫情定义""宣布 / 结束疫情"都是 IPC lead、GP 或公共卫生部门的判断，`🧑 人工`。

## 1. 用途与触发事件
- 用途：两层记录——①**个人症状与防护记录**（每位出现症状的住户或员工）；②**疫情 line list 与管理日志**（IPC lead 维护：病例名单、措施、通知、每日复核、结束）。
- 触发事件：PRD §14 **疼痛 / 皮肤 / 临床观察**、**病情变化 / 升级**（员工口述呕吐、腹泻、咳嗽、发热等症状）。careKind 可以提示"Is this relevant to your facility's infection log?"，由 RN 决定是否加入。

## 2. 责任
| 项 | 内容 |
|---|---|
| 谁起草 | 个人记录：PCW / EN / RN 口述症状和措施；line list：IPC lead 口述或录入 |
| 谁审核签署 | 个人记录：Shift RN；line list、宣布和结束疫情、对外通知：**IPC lead**（SQS 4.2.1(a) 指定的人）/ Care Manager |
| 风险 Tier | 个人症状记录：**Tier 2**（临床观察）；涉及病情变化或转院：**Tier 3**（PRD §6.5） |
| 时限 | 发现症状时记录，疫情期间每班更新、IPC lead 每日复核；向公共卫生部门通报的疾病和时限**按州**（⚠️ 本地无资料）；联邦疫情报告要求 ⚠️ 需核实（见第 3 节） |

## 3. 法律 / 标准依据
| 依据 | 本地文件 | 条款 / 页码 | 对模板的约束 |
|---|---|---|---|
| IPC 系统：指定 IPC lead；标准和传播防护；疫情时的额外措施；向住户、supporters、员工沟通感染风险；疫苗筛查 | `03-legal-compliance/references/law-library/strengthened-aged-care-quality-standards-nov-2025.pdf` | 4.2.1(a)–(k)，第 31 页 | line list 由 IPC lead 负责；沟通记录字段 |
| 临床照护中减少感染传播和并发症；抗菌药物管理 | 同上 | 5.2.1–5.2.2，第 34 页 | careKind 不涉及抗生素决定 |
| 变化或事件时通知 GP 和 supporters | 同上 | 5.4.4(d)，第 37 页 | 通知字段 |
| 应要求报告员工和住户疫苗接种统计（7 天内） | `03-legal-compliance/references/law-library/aged-care-rules-2025-vol1-compilation-2026-08-01.pdf` | r 166-10、166-15、166-25，印刷页 304–305 | 疫苗字段只照录"本人告知"的状态 |
| 感染 / 疫情文书与 AI 适合度 | `03-legal-compliance/references/paperwork-taxonomy.md`；`03-legal-compliance/references/paperwork-requirements-by-event.md` | §4.10；§10 | 不推断"疑似某感染" |
| ACSQHC Aged Care IPC Guide | 未下载 | — | ⚠️ 本地无资料，需补充 |
| 联邦 COVID-19 疫情 / 病例通报（My Aged Care provider portal） | 只有 by-event 文件里的官方链接 | `paperwork-requirements-by-event.md` §0.2、§10 | ⚠️ 新法下是否仍适用、时限需核实 |

**州差异提示**：须向公共卫生部门通报的疾病清单、通报方式和时限按州 Public Health 法律不同；员工疫苗和访客要求见 `03-legal-compliance/references/state-by-state-comparison.md` §3.9。⚠️ **各州公共卫生通报规则本地无资料，需律师 / IPC 顾问确认**，补齐前本模板的"通知公共卫生部门"一栏只能由 IPC lead 按州卫生部门指引填写。

## 4. 字段表
**A. 个人症状与防护记录**
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| I01 | Person | Resident / staff / visitor | 是 | 🤖 | 员工记录只记工作相关信息 |
| I02 | Symptoms observed / reported | 员工看到的、住户原话 | 是 | 🗣️ | 不写病名 |
| I03 | Onset date / time | | 是 | 🗣️ | |
| I04 | Observations | 照录数值 | 否 | 🗣️ | 不标异常 |
| I05 | Precautions started | 隔离在房、PPE、专用设备 | 是 | 🗣️ | 按 IPC lead / 机构程序 |
| I06 | Specimen collected | 类型、时间、谁采集、按谁的要求 | 否 | 🗣️ | |
| I07 | Result | | 否 | 🧑 人工 | 照录检验报告 |
| I08 | GP / NP notified · instructions | 指示逐字照录 | 条件 | 🗣️ | |
| I09 | Supporter notified | | 条件 | 🗣️ | |
| I10 | Staff exclusion / return | 员工停工和复工日期 | 条件 | 🧑 人工 | 按机构 IPC 政策 |
| I11 | RN confirmation | | 是 | 🧑 人工 | |

**B. 疫情 line list 与管理日志**
| # | Field | 说明 | 必填 | 来源 | 备注 |
|---|---|---|---|---|---|
| O01 | Outbreak reference · area | | 是 | 🧑 人工 | |
| O02 | Outbreak declared by · date/time · basis | | 是 | 🧑 人工 | IPC lead / 公共卫生部门 |
| O03 | Line list rows | 编号、人员、位置、首个症状、发病时间、检测、结果、状态 | 是 | 🤖 汇总 / 🧑 确认 | 只汇总已确认的个人记录 |
| O04 | Control measures in place | | 是 | 🧑 人工 | |
| O05 | External notifications | 公共卫生部门、联邦 portal、GP、药剂师 | 是 | 🧑 人工 | 按州 ⚠️ |
| O06 | Communication to residents / supporters / staff | | 是 | 🧑 人工 | SQS 4.2.1(h) |
| O07 | Daily review entries | | 是 | 🧑 人工 | |
| O08 | Outbreak declared over by · date | | 是 | 🧑 人工 | |

## 5. 空白模板
```text
A. INDIVIDUAL SYMPTOM & PRECAUTIONS RECORD             Linked outbreak ref: ______
Person: ______________ ☐ Resident (Room ____) ☐ Staff (role ____) ☐ Visitor
Symptoms (as observed / in their words): ___________________________________
Onset: __/__/____ __:__   Observations (as recorded): _______________________
Precautions started __:__: ________________________________________________
Specimen: ☐ No ☐ Yes — type ______ collected __/__/____ __:__ by ______ requested by ______
Result (from report): ____________________________________________________
GP/NP notified __:__ by ______  Instructions (verbatim): "____________________"
Supporter notified: ______ __:__     Staff exclusion: from __/__/____ return __/__/____ (IPC lead)
RN confirmed: ______________ __/__/____ __:__

B. OUTBREAK LINE LIST & MANAGEMENT LOG                    Outbreak ref: ______
Area: ______________  Declared by: ______________ __/__/____ __:__  Basis: ______
| # | Person | Res/Staff | Location | First symptom | Onset | Specimen | Result | Status |
|---|--------|-----------|----------|---------------|-------|----------|--------|--------|
Control measures: ________________________________________________________
External notifications (who / when / by / reference): ______________________
Communication to residents / supporters / staff: ___________________________
Daily review: __/__/____ by ______ — ____________________________________
Declared over by: ______________ __/__/____
```

## 6. 示例（虚构）
> 虚构机构 Wattle Grove Residential Care（虚构）Grevillea wing。新增虚构人物：Hannah Okafor RN（IPC lead，虚构）、Oliver Grant RN（16/10–18/10 期间的 night RN，虚构；18/10 晚班 night RN 为 Sofia Martins RN）、Mrs Lucia Romano（虚构，90 岁，Room G05）、Mr Arthur Pemberton（虚构，85 岁，Room G08）、Joseph Mensah（PCW，虚构）。Mrs Edna Hall（Wattle wing）和 Mr Tomasz Nowak（Banksia wing）不在 Grevillea wing，未列入 line list。

**原话 → AI 草稿对照（片段）**
| 片段 | 口述原话 | careKind 草稿 |
|---|---|---|
| S1（Oliver Grant RN, 17/10 00:20） | "Lucia in G05 vomited at ten last night and again just now, about half a cup each time. She says 'my tummy's not right.' Temp thirty-seven point four. I've kept her in her room, gown and gloves going in." | Mrs Lucia Romano vomited at 22:00 on 16/10/2026 and again at 00:15 on 17/10/2026, approx. half a cup each time. She said: "My tummy's not right." Temp 37.4 °C. Kept in her room; gown and gloves used on entry. |

> 草稿没有出现 "gastro"、"norovirus" 或"suspected infection"；"gastroenteritis outbreak" 只出现在 IPC lead 自己填写的 O02。

**填写后的记录（B. line list 摘要）**
```text
B. OUTBREAK LINE LIST & MANAGEMENT LOG                Outbreak ref: WG-OB-2026-03 (fictional)
Area: Grevillea wing
Declared by: Hannah Okafor RN, IPC lead (fictional) 17/10/2026 11:00
  Basis (Hannah's words): "Two residents and one staff member with vomiting or diarrhoea within
  24 hours in Grevillea — meets our facility outbreak definition for suspected gastroenteritis."
| # | Person                     | Res/Staff | Location | First symptom        | Onset            | Specimen          | Result   | Status |
|---|----------------------------|-----------|----------|----------------------|------------------|-------------------|----------|--------|
| 1 | Mrs Lucia Romano (fict.)   | Resident  | G05      | Vomiting             | 16/10/2026 22:00 | Faecal 17/10 09:30 | Pending | Transferred to hospital 18/10/2026 06:35 |
| 2 | Mr Arthur Pemberton (fict.)| Resident  | G08      | Diarrhoea x2         | 17/10/2026 07:30 | Faecal 17/10 10:00 | Pending | In room, precautions |
| 3 | Joseph Mensah (fict.)      | Staff PCW | Grevillea  | Vomiting             | 17/10/2026 13:00 | Not collected     | —        | Sent home 13:15; return date set by IPC lead |
Control measures (Hannah Okafor RN): affected residents cared for in their rooms; contact
  precautions; dedicated equipment; enhanced cleaning of Grevillea bathrooms twice daily; group
  activities in Grevillea paused; staff not to move between wings.
External notifications: Local public health unit by phone 17/10/2026 11:30 by Hannah Okafor RN —
  advice and reference recorded in facility IPC file. Commonwealth portal: [IPC lead to confirm
  whether required ⚠️]. Dr Amelia Brooks (GP, fictional) informed 17/10/2026 11:45.
Communication: Letter and phone calls to Grevillea supporters 17/10/2026 15:00 (Grace Liu, CM);
  visitor signage at Grevillea entry 17/10/2026 12:00; staff huddle 17/10/2026 14:00.
Daily review: 18/10/2026 10:00 by Hannah Okafor RN — "No new cases since 13:00 yesterday.
  Lucia transferred this morning; Arthur no diarrhoea overnight per night RN. Continue measures."
Declared over by: [open]
```

## 7. careKind 起草规则
- **可以从口述自动填**：I01–I06、I08、I09；B 部分的 line list 只能从**已确认**的个人记录汇总，汇总后由 IPC lead 确认。
- **缺失显示"请填写"**：发病时间、已采取的防护措施、检测是谁要求的、外部通知。
- **必须 RN / IPC lead / CM 确认或填写**：I07、I10、I11、O01、O02、O04–O08。
- **禁止生成**：病名或"疑似 X 感染"（除非 GP / IPC lead 原话）；"符合疫情定义"；是否需要隔离、检测、抗生素或预防用药；向哪个机构通报；员工何时复工；把病例数趋势写成"outbreak is worsening / improving"。
- 员工的症状记录只用于 IPC，不进入住户档案；careKind 不把员工健康信息用于其他目的（`03-legal-compliance/privacy-program.md`）。
