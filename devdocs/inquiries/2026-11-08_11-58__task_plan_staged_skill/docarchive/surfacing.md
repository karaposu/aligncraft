# Surfacing — task-plan-staged skill

## User Input
`devdocs/inquiries/2026-11-08_11-58__task_plan_staged_skill/_branch.md`

## Reception

**Mode:** artifact · **Entry:** signal-first · **Territory:** explicit-bounded (sub-phase not fired)

**Purpose (bias source):** understand what `task-plan-staged` should be — a stage-by-stage, lightweight-technical plan skill for big tasks, each stage feedable to `task-impl`. Primary layer Structural (what a stage and a step are as units of the document, which few fields each carries, where the artifact lives); Meaning (what a stage *is*) as prerequisite; Process (generator-only vs dispatcher; write-once vs living) surfaced for the user, not defaulted. Five considered articulations in `_branch.md` span the openness.

**Territory, six regions:**
- **R1** — `skills/` in this repo (the live pack)
- **R2** — `archived_commands/` (orchestrator idiom; decompose)
- **R3** — `src/` (the book: planning-adjacent chapters and appendices)
- **R4** — masacan `CONTRIBUTING.md` (the user's actual pipeline)
- **R5** — masacan `devdocs/voice_update/` (a real staged-plan execution, Sept 2026)
- **R6** — masacan `devdocs/work/180-…/` (a real single-plan execution, for contrast) + `cognitive_harness/decompose`

Recency note: masacan files all carry mtime `2026-10-01` — a checkout stamp, not an edit stamp — so `source: filesystem` there is recorded but uninformative. This repo's `skills/` mtimes are real.

---

## Traversal Trace

| # | Region | Item | Tag | Conf | Recency | Note |
|---|---|---|---|---|---|---|
| 1 | R1 | `skills/task-impl.md` | core | HIGH | fs 2026-11-06 | the downstream consumer; its input contract (folder / desc.md / raw) defines what a stage must become to be dispatchable; Resume table, 3 gates, Decompose/Return |
| 2 | R1 | `skills/task-plan.md` | core | HIGH | fs 2026-11-06 | the sibling producing steps; per-step schema (Proposed changes / Output / Safe in nature / Peripheral concepts / Hardness Lvl) is the baseline "a couple more fields" is relative to; Huge Hard Blockers gate; stop-always |
| 3 | R1 | `skills/task-desc.md` | sub | HIGH | fs 2026-02-28 | produces `desc.md` — the thing a stage has to become for `task-impl` to accept it; Step 0 location-confirm pause |
| 4 | R1 | `skills/critic-d.md` | sub | HIGH | fs 2026-10-28 | per-stage scoping is what the real practice did (critic_s0..s3); Premise Inventory + REORDER verdict are stage-shaped concerns |
| 5 | R1 | `skills/meaning-gaps.md` | sub | HIGH | fs 2026-10-28 | real practice re-ran it per stage (meaning_gaps 1/2/3); routes + Known Blockers handoff |
| 6 | R1 | `skills/roadmap.md` | core | MEDIUM | fs 2026-04-27 | closest existing artifact to a staged plan: nodes with status triple (idea/design/impl), depends-on, produces, effort, why-this-order, node expansion; self-declared "a map, not a plan" — boundary with task-plan-staged is a live question |
| 7 | R1 | `skills/devdocs-foundation*.md` (5) | side | MEDIUM | fs 2026-04-02 | they *are* a staged pipeline (foundation → concepts → simplified → modules → architecture), each consuming the prior; exemplar of stage-chaining already in the pack |
| 8 | R1 | `skills/smart-debug.md` | side | LOW | fs 2026-04-02 | "divide into main stages" — the word only, debugging context |
| 9 | R1 | `skills/arch-devibe.md` | side | LOW | fs 2026-09-13 | historical-complexity lens; not about planning structure |
| 10 | R1 | `skills/elaborate.md`, `arch-*.md`, `dead-code-*.md`, `align*.md`, `overview-report.md`, `devdocs-archivist.md` (batch) | side | LOW | fs various | not about plan structure; batch-tagged after scan |
| 11 | R2 | `archived_commands/archive/MVL+.md` | sub | HIGH | fs 2026-09-10 | the orchestrator idiom (Skill→Read→HALT, `_state.md`, checkpoints, resume) that `task-impl` was modeled on; a stage-dispatcher would reuse it |
| 12 | R2 | `archived_commands/archive/decompose.md` | core | HIGH | fs 2026-09-10 | coupling perception → boundaries → pieces-as-questions → interfaces → dependency order → self-eval; stopping criteria (tractable / atomic / over-decomposed); failure modes (premature, wrong boundary, hidden coupling, imbalanced). This is the discipline for *cutting* a big task into stages |
| 13 | R2 | `archived_commands/archive/{inquiry,MVL,sense-making,innovate,td_critique,explore,wayfinding}.md`, `archived_commands/{navigation,reflect,comprehend}.md` (batch) | side | LOW | fs 2026-09-10 | loop runners and disciplines not about staging |
| 14 | R3 | `src/APPENDIX4_Adding_New_Feature.md` §Alternative (L222–241) | core | HIGH | fs 2026-05 | the documented manual practice: "stage by stage plan → once confirmed each stage separated in devdocs with desc.md / step_by_step_plan.md / critic.md" — confirms articulation 2 is what the user already does by hand |
| 15 | R3 | `src/command_imp_plan.md` | sub | MEDIUM | fs 2026-01 | the user's two-tier prompt: `high_level.md` (summary, bullet steps, current vs expected, edge cases) then `low_level.md` (snippets, what/why). Precedent for lightweight-first, detail-second |
| 16 | R3 | `src/chapter_8_fuzzy/fuzzy_architecture.md` | core | MEDIUM | fs 2026-01 | "start fuzzy, crystallize through implementation"; evolution points; "key decisions deferred"; lifecycle Fuzzy → Emerging → Solidifying → Stable. The philosophical ground for "most of it is built dynamically during implementation" |
| 17 | R3 | `src/chapter_9_anchor/the_anchor_pattern.md` | sub | MEDIUM | fs 2026-01 | Stable Intermediate Forms; verify old functionality between changes — a stage gate is an anchor |
| 18 | R3 | `src/chapter_2/01_alignment.md` | sub | MEDIUM | fs 2026-02 | six layers; a staged plan is a Level 2 (Action-Space) artifact — approach/strategy — the one layer the pack has no command for |
| 19 | R3 | `src/chapter_6_devdocs/03_scoped_folder.md`, `src/APPENDIX9_Devdocs_Folder_Convention.md` | sub | MEDIUM | fs 2026-02 | scoped-folder lifecycle, `feat_N` numbering, `future/`, one-enhancement-per-folder — where a stage folder would sit |
| 20 | R3 | `src/APPENDIX1_New_Project_Prompts.md` | sub | MEDIUM | fs 2026-05 | phases 0–14 with a per-module loop (7–12); "select one module, implement, probe, document, integrate" is stage-shaped |
| 21 | R3 | `src/chapter_0/01_terminology.md` (Progressive Fidelity) | side | LOW | fs 2026-01 | Lo-Fi → Mid-Fi → Hi-Fi; adjacent idea, not structural |
| 22 | R3 | `src/chapter_7_run_probes/`, `src/chapter_12_vibe_testing/`, `src/chapter_1/*`, `src/chapter_2/02_alignment_artifacts.md`, rest of `src/` (batch) | side | LOW | fs various | testing / philosophy; a stage gate references tests but structure is not here |
| 23 | R4 | CONTRIBUTING §4 pipeline table (W → T → traverse → desc → plan → critic → fold → implement → PR → gates) | core | HIGH | fs 2026-10-01* | the real chain a stage runs through; `task-impl` covers desc→verify; this adds warm / triage / PR gates around it |
| 24 | R4 | CONTRIBUTING §4.3–4.4 triage + weight (light/heavy; five tests; disjunction; "when you cannot decide, call it heavy") | core | HIGH | fs 2026-10-01* | the pack's existing "how big" axis — blast radius / observability / consumers / model contact / reversibility. **Orthogonal to staging**: a heavy task can be one plan (R6 #180 was issue-heavy and unstaged). The "big enough to stage" test must not collapse into weight |
| 25 | R4 | CONTRIBUTING §4.5 prerequisite ("when the fix is not the fix": instrument / extract / build the ground / build the instrument; "smaller and more certain than what it unblocks"; parent → Blocked-by, child issue) | core | HIGH | fs 2026-10-01* | an early stage is often a prerequisite in this sense; also the counterweight: "first we need to refactor is the oldest way to never ship" |
| 26 | R4 | CONTRIBUTING §7 merge gate + §7.4 re-plan | sub | MEDIUM | fs 2026-10-01* | per-stage PR gates in the real practice |
| 27 | R4 | CONTRIBUTING §1 (why), §2 (two paths), §5 (traverse) | side | LOW | fs 2026-10-01* | rationale; §2 says traverse runs before desc for features — bears on "run full traverse per stage" |
| 28 | R5 | `voice_update_propposal.md` §13 "Delivery sequence and gates" — Stage 0…6 as `###` subsections | core | HIGH | fs 2026-10-01* | **the lightweight stage-plan shape**: each stage = a name + 1–3 paragraphs of direction + a **Gate** (what must be true to call it done, frequently phrased as what does *not* count as completion). No steps, no fields, ~15 lines per stage |
| 29 | R5 | `voice_update_propposal.md` §1–12, 14–16 | sub | MEDIUM | fs 2026-10-01* | the concept-level body stages were derived from: purpose, options A–D considered, ownership boundary, shared contract, module shape, risks, "definition of first completed milestone" |
| 30 | R5 | `step_by_step_impl_plan.md` (172KB) | core | HIGH | fs 2026-10-01* | structure: task-plan's top sections → "Revision 2 fold — Stages 0–3" → High-Level Summary (34-row step table) → **Stage 0…8 as `##`, steps as `###` inside, numbered continuously 1–34 across stages** → Completion criteria. Stage header = title + status paragraph + evidence pointer. Also the **negative exemplar** — this is the bloat the user does not want the skill to emit; it accreted per stage over weeks |
| 31 | R5 | `critic_s0.md` … `critic_s3.md`, `dynamic_critic_prompt_s0..s2.md` | core | HIGH | fs 2026-10-01* | **one critic per stage**, scoped ("Stage 0 only, steps 1 and 2 … Stages 1–8 are not reviewed by this verdict"). `_sN` naming. Stages 4–8 were never critiqued as a whole — critique happens when a stage comes up |
| 32 | R5 | `meaning_gaps.md`, `meaning_gaps2.md`, `meaning_gaps3.md` | core | HIGH | fs 2026-10-01* | gap survey re-run as later stages approached ("third inventory surveys Stage 5 against the SDK's Live client"). Gaps for stage N+1 become visible after stage N |
| 33 | R5 | `where_we_left.md` (33KB) | core | HIGH | fs 2026-10-01* | the cross-stage state document: status line; what is complete; how stage N went; gates before the next step (checklist with ~~DONE~~ strikethroughs); decisions in front of the owner; carried-as-open; spend; deferred; later stages. The staged plan's `_state.md` — hand-maintained prose |
| 34 | R5 | `deferred_refactors.md` | sub | HIGH | fs 2026-10-01* | "declined on blast radius, not on merit"; revisit trigger; "so that neither has to be re-derived" — a stage-level deferral record |
| 35 | R5 | `planning_read_record.md` | sub | MEDIUM | fs 2026-10-01* | 103 files / 31,291 lines read to plan, with hashes — the warming record for a big plan; shows the planning cost |
| 36 | R5 | `stage5_physical_trial_*.md`, `stage7_known_limitations.md` | sub | MEDIUM | fs 2026-10-01* | per-stage evidence and owner-decision records; "deferred known limitations, not prerequisites" |
| 37 | R5 | per-stage GitHub issues (#120 S0, #122 S1, #123 S2, #125 S3, #129 S4, #132 / #136 S5 slices, #156 S7) | core | HIGH | none | each stage became its own issue + branch through the full §4 pipeline — the dispatcher pattern (articulation 2), executed by hand; a stage may split into *slices* (#132 "Stage 5's first slice") |
| 38 | R5 | `2026-09-12_merge_update.md`, `announced_checks.md`, `engine_guide.md`, `live_api_reference.md`, `live_startup_latency_*.md`, `microphone_diagnostics.md`, `transcriber_language_and_vocabulary.md`, `vital_tests/` (batch) | side | LOW | fs 2026-10-01* | domain evidence; shape not relevant |
| 39 | R6 | `work/180-…/plan.md` | sub | MEDIUM | fs 2026-10-01* | a real **unstaged** plan: 6 steps in task-plan's schema, revision history, `[revision 3: PR critic Risk 1, robust]` tags — what a plan looks like when the task is not big enough to stage |
| 40 | R6 | `work/180-…/triage.md` | sub | MEDIUM | fs 2026-10-01* | "Weight: issue-heavy" and **unstaged** — direct evidence that heavy ≠ staged |
| 41 | R6 | `cognitive_harness/decompose/SKILL.md` + `references/` | sub | MEDIUM | fs 2026-05 | the live decompose; assumed content-identical to item 12 (not re-read) |
| 42 | R6 | `~/.claude/skills/traverse/SKILL.md` | sub | MEDIUM | fs 2026-07 | the user's "run full traverse on this" may be literal; §2 of CONTRIBUTING runs traverse before desc for every feature, so per-stage traverse is plausible |

\* masacan mtime is a checkout stamp.

---

## State Summary

**Territory echo:** R1–R6 as above.
**Purpose echo:** as in Reception.

### Coverage map

| Region | Coverage | Aggregate relevance |
|---|---|---|
| R1 `skills/` | confirmed (all 25 files known; 6 read in full this session) | core |
| R2 `archived_commands/` | confirmed (all read earlier in session) | sub, with one core (decompose) |
| R3 `src/` | confirmed (all 59 files read earlier in session) | sub, with two core |
| R4 CONTRIBUTING | confirmed §1–§7 | core |
| R5 `voice_update/` | **scanned-but-shallow**: all 27 files enumerated; proposal §13 read in full; impl plan read as headings + High-Level Summary + Stage 0 header + Completion criteria; where_we_left read as headings + head + tail; critic_s0 head only; meaning_gaps 1–3 by stated scope only | core |
| R6 work/180 + decompose | confirmed for plan/triage shape; decompose live copy inferred | sub |

### Confirmed-absent

- No `task-plan-staged`, `staged`, or `stage` skill exists in `skills/`, `archived_commands/`, `~/.claude/skills/`, `~/.agents/skills/`, or `cognitive_harness/`.
- No stage-level schema exists anywhere in the pack. "Stage" appears in the book only in APPENDIX4's Alternative paragraph (item 14) and in smart-debug's unrelated sense.
- No command in the pack produces a Level 2 (Action-Space) artifact.
- The `_sN` per-stage naming convention is undocumented; it exists only in practice (item 31).
- No skill in the pack chains `task-impl` over multiple units; `task-impl` Decompose *spawns* folders but does not run them.

### Concept-names list

| name | type | provenance | gloss |
|---|---|---|---|
| stage | vocabulary | 28, 30 | a named delivery unit with a direction and a gate; holds steps |
| gate | vocabulary | 28 | a stage's completion test; in practice phrased as what does *not* count as done |
| Stage 0 / baseline freeze | coined | 28, 30 | a stage that records what exists before anything changes |
| checkpoint | vocabulary | 30, 33 | a named milestone spanning stages (Realtime, Orders, Two-engine, Mobile) |
| slice | vocabulary | 33, 37 | a sub-unit of a stage that becomes one issue |
| `_sN` suffix | structural-reference | 31 | per-stage artifact naming |
| continuous step numbering | structural-reference | 30 | steps 1–34 across stages, not reset per stage |
| where_we_left | structural-reference | 33 | hand-maintained cross-stage state prose |
| revision fold per stage-group | structural-reference | 30 | "Revision 2 fold — Stages 0–3" |
| weight (light / heavy) | vocabulary | 24, 40 | the pack's existing size axis; orthogonal to staging |
| prerequisite | vocabulary | 25 | "smaller and more certain than what it unblocks"; four shapes |
| deferred-on-blast-radius | coined | 34 | declined for now, not rejected; carries a revisit trigger |
| evolution point | vocabulary | 16 | a place the architecture will likely change later |
| stable intermediate form | vocabulary | 17 | a verified working state between changes |
| node status triple | structural-reference | 6 | roadmap's idea / design / impl per node |
| coupling map · pieces-as-questions · dependency order | vocabulary | 12 | decompose's outputs |
| Level 2 Action-Space artifact | vocabulary | 18 | the alignment layer the pack has no command for |
| high_level / low_level split | structural-reference | 15 | the user's older two-tier plan prompt |

### Recency distribution

| region | newest | oldest | no-mtime | total |
|---|---|---|---|---|
| R1 | 2026-11-06 | 2026-02-28 | 0 | 25 (10 trace rows) |
| R2 | 2026-09-10 | 2026-09-10 | 0 | 12 (3 rows) |
| R3 | 2026-05 | 2026-01 | 0 | 59 (9 rows) |
| R4 | 2026-10-01* | 2026-10-01* | 0 | 1 file (5 rows) |
| R5 | 2026-10-01* | 2026-10-01* | 1 (item 37) | 27 files (11 rows) |
| R6 | 2026-10-01* | 2026-05 | 0 | 4 (4 rows) |

Descriptive only; no tag was adjudicated from mtime.

### Frontier flags

- **F1** — `step_by_step_impl_plan.md` Stage 1–8 header blocks not read (only Stage 0's). If Sensemaking needs the stage-level field set the user converged on in practice, re-invoke with refined-sub-purpose *"what sits between each stage title and its first step."* Deliberately not read: 172KB, workspace-overload trigger approached.
- **F2** — `where_we_left.md` lines 25–525 not read; the "gates before step N" checklist shape is known from headings only.
- **F3** — `meaning_gaps{,2,3}.md` content not read; only existence and stated scope.
- **F4** — `critic_s1..s3` bodies not read; only `critic_s0` head.
- **F5** — `cognitive_harness/decompose/references/decompose.md` not re-read; assumed identical to archived.
- **F6** — the per-stage GitHub issues (#120 … #156) not read; the dispatch pattern is inferred from the impl plan's status paragraphs.

### Workspace-populated

`{populated: true, populated-at: 2026-11-09T11:14:12Z, extent: "R1–R4, R6 confirmed; R5 scanned-but-shallow with six frontier flags"}`

---

## Telemetry

- Mode: artifact · Entry: signal-first · Sub-phase fired: no
- Cycles: 6 (one per region) · Trace rows: 42 · Items enumerated: ~128 (batches expanded)
- Tags: core 14 · sub 17 · side 11 (rows; batches count once)
- Convergence: territory traversed at current resolution; uncertain items included (umbrella avoided — all tags resolved to a level); rejections only at HIGH confidence (side/LOW batches)
- Workspace-overload trigger: approached at R5; frontier flags F1–F6 emitted rather than silent sampling
- items_with_mtime: 41 rows · items_without_mtime: 1 row (item 37, a fact not a file)
- Failure modes checked: Missed-relevance (mitigated by F1–F6), Surfaced-irrelevance, Over-coverage, Territory-mis-binding (none), Workspace overload (flagged), Artifact under-specification (all rows carry identifiers), Workspace-artifact desync (capture-at-moment), Recency-Equates-Idleness (none), Recency-Bias-Filter (none)

**Self-assessment: FLAG** — output complete and consumable; six frontier flags on R5 for downstream to weigh. The most consequential (F1) is cheap to close if Sensemaking needs it.
