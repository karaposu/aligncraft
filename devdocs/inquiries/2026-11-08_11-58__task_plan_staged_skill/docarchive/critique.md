# Critique — task-plan-staged skill

## User Input
`devdocs/inquiries/2026-11-08_11-58__task_plan_staged_skill/_branch.md` + `sensemaking.md` + `decomposition.md` + `innovation.md`

Problem context: `sensemaking.md` (SV6, anchors, 7 ambiguities) and `decomposition.md` (Q1–Q6). Candidates: `innovation.md` (11 ACTIONABLE, 3 DEFERRED, 1 FRONTIER, 3 KILL, assembly). External anchors read for this pass: `skills/task-impl.md` (Resolve the folder, Resume, Decompose, Return, Rules), `skills/task-desc.md` (Step 0, Output Format), `skills/roadmap.md`, `skills/critic-d.md` (REORDER), `src/APPENDIX4_Adding_New_Feature.md:230`, masacan `voice_update_propposal.md` §13 and `step_by_step_impl_plan.md` (measured), `decompose/references/decompose.md:60`.

**Stakes.** A skill file is cheap to revise → low stakes, innocent until proven guilty. The exception is any candidate that edits `task-impl`, which every task runs → burden on the defense.

---

## Phase 0 — Dimensions

| # | Dimension | Weight | Extracted from | Success criterion (substance / anchor where load-bearing) |
|---|---|---|---|---|
| D1 | **Level-2 containment** | critical | SV6, KI1, MN4, C1 | *Substance:* replay the candidate against the real case — would it have prevented the Stage 5 header? *Anchor:* impl plan Stage 5 header measured at **204 lines** before its first step; §13 blocks measured at 9 / 18 / 15 / 16 / 24 / 15 / 10 lines |
| D2 | **Seam fidelity to `task-impl`** | critical | C4, SP4, MN5 | *Anchor:* `task-impl` resolves "a folder containing `desc.md` → use it" and starts from the Resume table; a stage must enter there unchanged |
| D3 | **User-anchor fidelity** | critical | Source Input | *Substance:* constraint-test against the literal phrases: "not bloated"; "steps still give enough good direction about the what to build"; "I don't want to every time prompting"; "most of it is dynamically built during implementation"; "a couple of more fields" |
| D4 | **Provisionality / failure containment** | high | MQA failure-robustness, FP3, KI5, KI7 | a wrong early assumption changes later blocks by tags, never by rewriting; done work is not re-decided |
| D5 | **Operational determinacy** | high | Decomposition §7 determination check | every runtime concept the candidate relies on (staged? confirmed? done? next?) names how it is determined |
| D6 | **Pack coherence + parsimony** | high | C6, FP5, SP1, Resource | project-specific risk axes: **duplicate-derivable-state** (the same fact both derived and recorded) and **orchestration-parsimony** (which skill orchestrates; `task-impl` is 323 lines) |
| D7 | **Grounding strength** | medium | Ambiguity 7 | *Anchor:* claims about shape or size cite the measured artifact, not a recollection of it |

**Validation.** Sensemaking's seven perspectives map: Technical → D2/D5; Human → D3; Strategic → D6; Risk → D1/D4; Resource → D6; Definitional → D1; Calibration → D3 (trigger). No perspective lacks a dimension. Axis-absence check: (i) upstream failure axes — bloat (D1), re-prompting (D3), wrong-assumption blast radius (D4) all present; (ii) "leanness" read at its broadest — the *system's* leanness, not only the new file's (D6 covers `task-impl` growth); (iii) no dimension's wording requires performing what it tests. "If a candidate passed all seven, would it solve the problem?" Yes — a contained, seam-exact, user-faithful, provisional, determinate, lean, grounded skill is the ask.

**Frame-premise test.** The candidate space rests on Sensemaking's commitments. Load-bearing premises and their what-if-wrong prosecutions, run independently of any candidate:

- **P1 — a new skill should exist.** If wrong: `task-impl` both detects bigness and stages. Evidence against the reversal: the user named the skill; APPENDIX4:230 records the practice as a distinct step ("we create stage by stage plan and once it is confirmed each stage is seperated in devdocs folder"); folding generation into a 323-line orchestrator fails D6. **Holds.**
- **P2 — stage blocks carry no steps.** If wrong: the user's literal words — *"for each stage it kind of creates some sub-steps… steps still give enough good direction about the what to build."* This premise **does not hold as stated.** The user wants directional items inside a stage. What the practice shows is that `task-plan`-style steps (numbered, with fields, 34 across stages) bloated; §13 Stage 0's Builds is itself a list of actions in prose ("Record… Map… Separate…"). Resolution carried into D3 prosecution of every schema candidate: **Builds may be a short directional list; forbidden are `task-plan` steps (numbered, fielded, hardness-scored), not direction in list form.**
- **P3 — status is derived, never written.** If wrong: a bounded record. Innovation T3 already attacks this; tested below with the duplicate-derivable-state axis.
- **P4 — confirm precedes any dispatch.** Anchor: APPENDIX4:230 "once it is confirmed." **Holds.**

One premise fell (P2). The dimension space was built after that fall, so the candidates are tested against the corrected frame.

---

## Phase 1 — Fitness Landscape

**Viable region.** Plan documents whose blocks stay within the measured §13 envelope, whose status is derived from the stage folders, whose runtime concepts are each determinate, that reach `task-impl` through an ordinary folder + `desc.md`, and that honour both user goals (no bloat, no re-prompting).

**Dead region.** Any candidate that (a) puts steps-with-fields or status prose in the plan (D1 fatal); (b) dispatches more than one stage at a time or dispatches before confirm (D4/P4 fatal); (c) relies on a runtime concept with no determination (D5 fatal); (d) records a fact the folders already show (D6 duplicate-derivable-state — fatal only if the two can disagree).

**Boundary region.** Trade-offs between D5 and D6 (a written record is determinate but may duplicate), between D1 and D3 (a cap contains but may cut legitimate direction), between D3's two goals (no re-prompting pulls toward orchestration; no bloat pulls away from it).

**Unexplored by any candidate.** (U1) Adding a stage after confirmation — the tag set covers revise / defer / merge, not insert. (U2) The skill's name (Q6 flag; user's call; no candidate). (U3) Checkpoint, the optional grouping field — unexamined by any mechanism. (U4) How the staged plan relates to a project's issue tracker (masacan's `Blocked by:` tree) — surrounding-workflow territory, outside a project-agnostic skill.

---

## Phase 2–3 — Adversarial Evaluation and Verdicts

### C1 — The assembly: staging skill generates; `task-impl` runs the stages (Innovation T4 + assembly)
Re-test trigger: Sensemaking Ambiguity 2 (A vs B).

**Prosecution.** *Stakes:* this edits `task-impl`. *Spec-gap probes:* (1) how does `task-impl` learn the task is staged? — a pointer line (C2) or a file. (2) How does it find the current stage's folder? — not specified unless a folder index exists. (3) What happens when a stage's chain Aborts on a blocker? — unspecified; halting is success for a task, but does the staged run resume at that stage or re-plan it? (4) Does "invoke `task-impl` on the stage" nest a skill inside itself? — unspecified; nesting is the kind of mechanism the user's leanness rule forbids. (5) After stage N completes and later blocks are revised, does the runner continue without the human seeing the revision? Sensemaking fixed "confirm precedes dispatch" for the plan; a revised next-stage block is a plan the user has not confirmed. *User-perspective:* the user's practice (APPENDIX4:230) is one confirm, then per-stage folders — nothing in the practice has the runner decide to proceed into a revised stage. *Failure case:* `/task-impl` run on the parent folder before confirm → today's Resume table sees `desc.md` only → starts `task-plan` on the whole big task — exactly the one-shot plan the staged plan exists to avoid.

**Defense.** The split serves both user goals with two components where Sensemaking's A/B forced one skill to carry both. The generator stays pure (A). `task-impl` already derives state from files, already Aborts, already Decomposes after three rejections — per stage, with nothing added. "Dispatch" is not a new skill invocation: the runner creates the stage folder, writes its `desc.md`, and *continues its own chain in that folder* — re-targeting, not nesting. The growth is one pre-check and one short section.

**Collision.** Every prosecution point is a specification gap the frame absorbs; none shows the frame cannot serve the purpose. The failure case (running on the parent before confirm) is decisive *for* a pre-check that fires before the Resume table. Point (5) needs one rule, and the practice supplies its spirit: re-confirmation is needed only when the next stage's block changed.

**Position:** boundary → viable after refinement. **Verdict: REFINE → the lead candidate.** Direction (D5, D6):
- The staged pre-check sits with the two existing pre-checks (PARKED, three rejections), before the Resume table.
- A **folder index** in the plan (see C3) tells the runner which stage is next and where it lives.
- Re-target, never nest: create the stage folder, write `desc.md` from the seed mapping, then run the ordinary chain *in that folder*.
- A stage's Abort stops the staged run with the same Abort report; re-running `task-impl` on the parent resumes at that stage.
- After a stage is done: invoke `task-plan-staged` to revise; if the **next** stage's block carries a new tag, stop and ask for confirmation of that block; otherwise continue.
- Plan present but no `**Confirmed:**` line → report "awaiting confirmation" and stop.
- **Process-layer note.** `_branch.md` reserved orchestration for the user. This verdict ranks the assembly first on the evidence; it does not decide for the user. CONCLUDE presents it as the recommendation with option A (generator only, hand-dispatch) as the fallback that needs no `task-impl` edit.

### C2 — `**Staged:**` pointer line in `desc.md` (T2)
**Prosecution.** D6 duplicate-derivable-state: the pointer says what the presence of `staged_plan.md` in the same folder already says. Two signals can disagree (pointer present, file deleted; file present, pointer forgotten under option A, where the human creates folders). `task-impl`'s own idiom derives everything from files ("plan exists, no `critic.md` → `critic-d`"). Innovation's size argument for keeping blocks out of `desc.md` cited a figure this pass could not verify; it is withdrawn (D7). **Defense.** It is one line; PARKED uses the same place. **Collision.** The defense shows the pointer is cheap, not that it is needed; the prosecution shows a second signal can only add disagreement. **Verdict: KILL** (D6). **Seed:** *`staged_plan.md` present in the folder → the task is staged.* File existence is the signal, as everywhere else in `task-impl`.

### C3 — Bounded stage table inside the plan (T3)
Re-test trigger: Sensemaking Ambiguity 3 (no state file; status derived).

**Prosecution.** D6 duplicate-derivable-state at full strength: a `Status` column records what the folder shows; a `Since` column is state; under option A a human must update it and will not, so the table goes stale and misleads any later runner. This is the `where_we_left` pattern in miniature. **Defense.** Derivation had two real hidden couplings (Decomposition §5: folder naming under A; folders on excluded branches), and a one-line-per-stage record is bounded by construction — it cannot become 204 lines. **Collision.** Both sides are right about different columns. The **folder name** is not derivable (it is a convention or a record); **status** is derivable from the folder and its done-markers; `deferred` and `merged` are already tags on the block. So the table should carry exactly what cannot be derived. **Verdict: REFINE.** Direction (D5, D6): a **folder index**, `| Stage | Folder |`, one row per stage, written by whoever creates the folder (the runner under the assembly; the human under A). No status column, no dates. Status is derived on read: no folder → pending; folder, no done-marker → live; done-marker → done; `[deferred]` tag → deferred. The tolerant done-marker from Decomposition stands. Ambiguity 3 is refined, not reversed: nothing *derivable* is written.

### C4 — Trigger: dependency AND costly-to-unwind, phrased as REORDER's question (T5 + T6)
**Prosecution.** *User-anchor:* the user's trigger is dependency alone — "you cannot really plan it fully without actually initial parts are more concrete and established." Adding a cost conjunct is the critic's invention and compounds two uncalibrated judgements. *Spec-gap:* "REORDER's question" presupposes a premise inventory, which exists only once a plan exists; before planning, the only operational form is the probe "write the first step of the last part." **Defense.** The cost clause gives "default don't stage" teeth: when the probe is unclear, a cheap-to-unwind guess means plan in one pass and let REORDER or Verify catch it. **Collision.** The user's phrasing is the test; cost is the tiebreaker, not a conjunct. The REORDER relation is a one-line note, not the probe. **Verdict: REFINE** (D3). Direction: trigger = the user's sentence + the probe; *when the probe is unclear:* "would building on a wrong guess here be expensive to unwind? If not, do not stage." One line relates it to REORDER as the net for under-staging.

### C5 — ~15-line soft cap per block (T7)
**Prosecution.** *External anchor (D7):* the §13 blocks measure 9, 18, 15, 16, 24, 15, 10 lines. Innovation stated "8–16"; that was wrong. A ~15 cap would cut two of the seven real blocks, including Stage 0, whose extra lines are the baseline evidence a Stage 0 exists to record. **Defense.** A cap is the one mechanism that makes bloat structurally visible; the number is tunable. **Collision.** The mechanism survives; the number was ungrounded. **Verdict: REFINE** (D7, D1). Direction: cap **~20 lines**, grounded in the measured envelope (max 24); above ~25, the block is probably two stages (feeds the imbalance check). Record the correction: Innovation's figure is superseded by measurement.

### C6 — Gates frozen at plan time, annotated after (T9)
**Prosecution.** *User-anchor:* "most of it is dynamically built during implementation" — does freezing anything conflict? *Failure case:* a gate names an observation that stage N discovers is impossible; freezing becomes theatre as everyone annotates. **Defense.** A gate is *what counts as done*, not how; FP4 (disclosure is not closure) and the `DEPRECATED_` idiom both keep the original visible when it changes. The §13 gates were written at proposal time and the practice used them unchanged. **Collision.** Holds, with one correction: before confirmation the plan is a draft and gates are editable; freezing begins at **confirmation**. A changed gate is a tag, and (per C1) a tag on the next stage triggers re-confirmation. **Verdict: SURVIVE** (D4 strong; D3 clear). Caveat: "frozen from confirmation," not "from plan time."

### C7 — Builds opens with why-this-is-its-own-stage (T10) — tested together with the fallen premise P2
**Prosecution.** A convention carried by a sentence is unenforced and forgotten; and if Builds becomes a directional list (P2), an opening rationale sentence is awkward. **Defense.** The revision run needs the seam's justification to know whether the cut still holds after stage N; it has no other home that is not a new field. **Collision.** Combine the two findings into one shape for Builds. **Verdict: REFINE** (D3, D1). Direction: **Builds** = one sentence saying why this is its own stage, then what to build as prose or **3–6 directional items** — the user's "steps that give direction" — never numbered steps with fields, hardness or outputs (those are `task-plan`'s, per stage). The forbidden list changes from "steps" to "`task-plan` steps."

### C8 — `[actual: …]` as the one edit a done block accepts (T11)
**Prosecution.** *D7:* Innovation's motivating case is misattributed — the SDK finding falsified Stage 5's *premise*, not Stage 4's *contract*. *D4:* an editable done block cracks "done blocks never change." **Defense.** The mechanism is justified in general: a contract is tested by its consumer, and a false contract left standing misleads every later stage; one tag, same idiom. **Collision.** Keep the mechanism, drop the example. **Verdict: SURVIVE** (D4) with a grounding caveat: single-case evidence is withdrawn; justified structurally.

### C9 — Tag vocabulary: merge tag (T12), plus unexplored U1 (insert)
**Prosecution.** With revise, defer, merge, actual, gate-revised the plan has five tag types and no insert — six once U1 is covered. A vocabulary of six is itself a thing to learn (D3 "not complicated"). **Defense.** Tags are the *only* way the plan changes after confirmation; a closed vocabulary is the containment mechanism, and each tag is one line that appears only when its event happens. **Collision.** Keep the events, unify the grammar. **Verdict: REFINE** (D3, D5). Direction: one grammar — `[<event> after stage N: reason]` with events **revised · deferred (revisit when …) · merged into stage M · added · gate revised · actual**. Six events, one shape. `added` closes U1.

### C10 — Cut where what-is-established changes (T13)
**Prosecution.** Wording only; "what is established" is abstract where `decompose`'s probe ("if this changes, must that change?") is concrete. **Defense.** It explains Stage 0 and ties the cut to Leaves-established — the field the next stage reads. **Collision.** Two-part rule. **Verdict: SURVIVE** (D1). The probe finds seams; a seam is a stage boundary only when what-is-established changes across it. Pieces with no such change are parallel work, not stages — separate tasks.

### C11 — Roadmap relationship stated (T14)
**Prosecution.** None of weight; the risk is misdescribing `roadmap`. **External anchor:** `skills/roadmap.md:72` "Status is tracked across three dimensions… `idea / design / impl`"; `:196` "This is a MAP, not a PLAN"; `:198` "Status is the primary output"; `:133–139` nodes carry Depends on / Produces / Why this order. **Defense.** The statement in T14 matches: a staged plan is executed, has a fixed end, and keeps status *out* of the document — the exact inverse of roadmap's primary output. **Verdict: SURVIVE** (D6). One line for Q6.

### C12 — Deferred candidates (T16 re-run via per-stage pipeline; typed stage interfaces; per-stage rollback)
Not re-evaluated; accumulator entries. T16 is absorbed into C1 (the staging skill's revision run reads what each stage's own pipeline produced). Typed interfaces and rollback keep their revival triggers.

### C13 — Research frontier: `critic-d` on the staged plan itself
Purpose ambiguous: `critic-d`'s Premise Inventory keys on "first dependent step," and a staged plan has stages, not steps; whether a stage can stand in is a question for a later inquiry. **Defer with direction:** the confirm step is the gate for now; if the user wants a critic on the stage plan, that is a separate inquiry about `critic-d`'s input contract, not this skill.

### Accumulator — kill record from Innovation (not re-evaluated)
T1 no plan document (killed: no up-front confirmable view; seed kept — plan ≈ folder index, now realised as C3's index). T8 drop confirm (killed; reinforced by APPENDIX4:230 "once it is confirmed"). T15 universal N=1 wrapper (killed; seed kept — `desc.md` success criteria are a one-stage gate).

---

## Phase 3.5 — Assembly Check

The survivors and refinements compose into one architecture; evaluated as a candidate:

> **`task-plan-staged`** reads a folder with `desc.md` (and a traverse finding if present), applies the user's trigger with the probe and the cost tiebreaker, exits to `task-plan` when staging does not apply, cuts at seams where what-is-established changes, checks balance, and writes **`staged_plan.md`**: frontmatter (model, effort), a trigger verdict, a **folder index** (`| Stage | Folder |`), and one block per stage — **Stage N — name · Builds** (why its own stage + what to build, prose or 3–6 directional items) **· Gate · Leaves established**, optional Concepts / Checkpoint, ~20 lines. The user confirms (`**Confirmed:** date`); gates freeze. **`task-impl`** gains one pre-check — `staged_plan.md` present → stage runner — that finds the first non-done stage via the index, creates its folder, writes the index row and a `desc.md` from the seed mapping, and runs its ordinary chain in that folder. On completion it invokes `task-plan-staged` to revise later blocks under the one tag grammar; a tag on the next block pauses for confirmation; otherwise the next stage starts. Abort stops the run; re-running resumes at that stage.

**Prosecution.** D6: `task-impl` grows by a pre-check and one section (~20–25 lines); the new skill is a second orchestrator-adjacent file. A single run may span many stages and hours. **Defense.** Growth is bounded and reuses every existing mechanism; the user chose auto-implement for `task-impl` and can interrupt at any checkpoint (Rule 9). The staging skill itself never orchestrates. **Collision.** No critical-dimension failure; D6 caveat recorded. **Verdict: SURVIVE** — ranked first, with the Process-layer note from C1.

---

## Phase 4 — Coverage, Convergence, Signal

**Coverage map.** All six Innovation axes evaluated: artifact shape (file ✓; section killed with pointer; none killed), state location (derived ✓ refined to index; table refined; file dead; issue tree out of scope), orchestration (`task-impl` ✓ lead; skill-orchestrates dead; human = fallback A), trigger (dependency ✓ + cost tiebreaker; REORDER as note; size/weight dead), cutting principle (coupling probe + established-change rule ✓), gate semantics (frozen-from-confirm ✓). Unexplored: U1 closed (`added`); U2 naming — user's decision, carried to CONCLUDE; U3 Checkpoint — optional, low-risk, unexamined; U4 issue-tracker mapping — surrounding workflow, outside the skill.

**Convergence.** One critique pass in this loop. Within the pass the landscape changed three times (pointer → file existence; status table → folder index; cap 15 → 20) and then stabilised: the assembly's refinements opened no new region. Clean SURVIVE exists (assembly; C6, C8, C10, C11). Remaining unexplored regions are either the user's to decide (U2) or outside scope (U4).

**Signal: TERMINATE** for the Structural layer, with the Process-layer recommendation handed to the user at CONCLUDE.

**Ranked survivors.**
1. The assembly (Phase 3.5) — generator + `task-impl` stage runner, with C1's six refinements.
2. Schema refinements that stand under either A or B: Builds shape (C7), ~20-line cap (C5), gates frozen from confirmation (C6), one tag grammar with six events (C9), `[actual]` (C8), folder index (C3), cut rule (C10), roadmap line (C11), trigger with tiebreaker (C4).
3. Fallback: option A (generator only, hand-dispatch) — needs no `task-impl` edit; loses the no-re-prompting goal for per-stage runs.

**Carried to CONCLUDE as the user's decisions:** (i) A vs the assembly (Process layer); (ii) the skill's name (`task-plan-staged` vs `stage-plan` / `task-stages`); (iii) confirmation that Builds-as-directional-list is what "steps give direction" meant.

---

## Convergence Telemetry

- **Dimension coverage:** 7/7 applied; every candidate faced its weakest dimension and defended its strongest.
- **Adversarial strength:** STRONG — one ACTIONABLE candidate killed (C2), five refined with direction, one inherited premise overturned (P2), two Innovation factual claims corrected by measurement (§13 block range; Stage 4→5 attribution).
- **Landscape stability:** CHANGED within the pass (three moves), then STABLE.
- **Clean SURVIVE exists:** yes — the assembly, plus C6 / C8 / C10 / C11.
- **Mechanism-independence status:** **validated.** External anchors cited: empirical (§13 block line counts; Stage 5 header 204 lines), canonical text (`task-impl` Resolve/Resume quoted; APPENDIX4:230 quoted; `roadmap.md:72,133–139,196–198`; `decompose.md:60`), user anchor (Source Input phrases applied as constraint tests).
- **Failure modes observed:** none. Rubber-stamping — no (kill + overturned premise). Nitpicking — no (C8 and C11 pass on severity; tag count judged non-critical). Self-reference — mitigated by the measured artifacts and quoted canon.
- **Output: PROCEED.**
