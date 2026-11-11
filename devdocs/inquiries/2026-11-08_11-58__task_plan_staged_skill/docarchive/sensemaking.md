# Sensemaking — task-plan-staged skill

## User Input
`devdocs/inquiries/2026-11-08_11-58__task_plan_staged_skill/_branch.md`

Inputs consumed: `_branch.md`, `articulate_simple.md`, `surfacing.md`, `articulate_warm.md`, and frontier flag F1 closed during this phase (the stage-header blocks of the real staged impl plan, Stages 1–8).

---

## SV1 — Baseline Understanding

The user wants a skill that generates a lightweight, stage-by-stage plan for a big task, where each stage is explained enough to be handed to `task-impl`, and that does not bloat with detail that implementation will produce anyway. They do this by hand today and want to stop re-typing the prompt.

---

## Phase 1 — Cognitive Anchor Extraction

### Constraints
- **C1** Not bloated. Said three times. The negative exemplar exists: the 172KB staged impl plan (`voice_update/step_by_step_impl_plan.md`).
- **C2** Not a full plan up front — later parts cannot be planned in detail until earlier parts exist.
- **C3** Technical but lightweight; "not just description."
- **C4** Each stage must be feedable to `task-impl`, whose input is a folder with a `desc.md`.
- **C5** Must not be confused with the weight axis (light/heavy).
- **C6** The skill file is lean, standalone, references only sibling skills (the user's repeated rule this session).
- **C7** Steps and their fields are `task-plan`'s, per stage, later. The user's own rule in practice: *"Hardness has not been re-scored… Re-score at `/task-plan`, not by editing the numbers here."*

### Key Insights
- **KI1 — State is what bloated, not the plan.** F1: the stage headers had no schema. Stages 3 and 4 are empty; Stage 5's header is ~130 lines of status, probe findings, owner decisions, deferrals, and hardness notes — accreted because Stage 5 was the live stage longest. The plan and its cross-stage state shared one document, and state grew without bound.
- **KI2 — The lightweight shape already exists.** Proposal §13: each stage is a name, 1–3 paragraphs of direction, and a **Gate**. ~15 lines. No steps. The skill's output is this shape; the skill's job is to keep it this shape.
- **KI3 — Gates were phrased as refusals of false completion.** "Introducing a new class without changing the actual route's dependency is not completion." "A blanket claim that the current system is regression-free is not an acceptable baseline." This is a distinctive, valuable form.
- **KI4 — Critique was per stage, never whole-plan.** `critic_s0..s3`; "Stages 1–8 are not reviewed by this verdict." The staged plan itself was never critiqued by `critic-d`. Its quality gate was the user's confirmation (APPENDIX4: "once it is confirmed").
- **KI5 — The staging trigger is dependency of planning, not size.** Stage 5 was rewritten after Stages 0–4 landed because the SDK was discovered; `meaning_gaps3` surveyed Stage 5 only as it approached. #180 was issue-heavy and planned as one piece. Heavy ≠ staged.
- **KI6 — The dispatch unit is the stage (or a slice).** Each became its own issue + branch and ran the full §4 pipeline. "Run full traverse" is literal: Stage 5's issue #136 "carried this step through a real `/traverse`."
- **KI7 — The plan was living, and living-ness was the bloat vector.** Revision 3 rewrote Stage 5; Stages 6–8 "have not been reviewed." Revisions happened *inside* the plan by rewriting headers and sections.
- **KI8 — Continuous step numbering coupled all stages.** "Step 25a already exists; its number is retained so existing references stay valid." A per-stage numbering has no such coupling.
- **KI9 — Stage 0 recurs.** A baseline-freeze stage that records what exists before anything changes — CONTRIBUTING §4.5's "instrument it / build the ground" prerequisite shape.
- **KI10 — Checkpoints group stages.** Realtime (S0–3), Orders (S4), Two-engine (S5–7), Mobile (S8). A level above stage, declared by the owner on a date.

### Structural Points
- **SP1** Chain position: `task-desc` → **`task-plan-staged`** → confirm → per stage: `task-desc` → `task-plan` → `critic-d` → `task-impl`. The staged plan is a **Level 2 (Action-Space)** artifact — approach and sequence — the one alignment layer the pack has no command for.
- **SP2** Practice used three documents: proposal (concepts + §13), impl plan (stages + steps + state), `where_we_left` (state). The skill should emit **one**: the §13-shaped plan. Steps go to `task-plan` per stage; state goes to the per-stage work folders.
- **SP3** A stage block in practice carried: name, direction, gate — plus, when alive: status, evidence pointer, gate-dependency, what-it-leaves-for-next, mid-stage decisions. The last structural item — what it leaves for the next — is the dependency edge between stages.
- **SP4** The dispatch seam is mechanical: direction → problem statement and value; gate → success criteria; the gate's "does not count" → scope boundaries. A stage block is a `desc.md` seed.
- **SP5** `decompose` is the cutting discipline (coupling → boundaries → pieces-as-questions → dependency order; failure modes incl. imbalance). Full decompose is heavier than this needs; the first two steps plus ordering and the imbalance check are the useful subset.
- **SP6** `roadmap` is the adjacent artifact: nodes with a status triple, why-this-order, vague end states, "a map, not a plan." Its node-status idea is useful; its purpose (exploratory terrain) is different from a delivery sequence.
- **SP7** `task-impl`'s Decompose is reactive (three rejections → spawn prerequisites). Staging is proactive. Both produce prerequisite-shaped work from opposite triggers.

### Foundational Principles
- **FP1** Defer detail until grounded (Fuzzy Architecture; "most of it is built dynamically").
- **FP2** Each stage is a stable intermediate form (Anchor pattern); the gate verifies it.
- **FP3** "The plan is a hypothesis and contact with the code refutes parts of it" (CONTRIBUTING §4).
- **FP4** Disclosure is not closure (this session's meaning-gaps work). A gate that says "to be measured" has not closed anything; a gate must name an observation.
- **FP5** Every field earns its place (the no-bloat rule applied to skill files this session).

### Meaning-Nodes
- **MN1 stage** — the central concept; what it *is* decides everything else.
- **MN2 gate** — a stage's completion test, phrased as what does not count.
- **MN3 the staging trigger** — when a task needs stages at all.
- **MN4 plan/state separation** — the structural lesson of the bloat.
- **MN5 the dispatch seam** — stage → `desc.md` → `task-impl`.

## SV2 — Anchor-Informed Understanding

This is not primarily a generator problem. The §13 shape exists; generating it is the easy half. The structural job is **keeping the artifact at Level 2** — resisting the absorption of steps (Level 3) and execution state that turned the manual version into 172KB. The skill must cut, order, gate, emit lightly, hand off per stage, and then *not grow*.

*Meta-inspection H4 (concept names):* stage, gate, checkpoint, slice, Stage 0 are the user's own vocabulary from practice — not coined here. "Sequential dependency of understanding" is mine; tested in Phase 3. *H5 (motivating examples):* the staging *pattern* has ≥3 instances (voice_update Sept 2026; APPENDIX4's Alternative paragraph, generic; `command_imp_plan.md`'s high/low two-tier). The §13 *shape* is from one instance. Carried to Phase 3.

---

## Phase 2 — Perspective Checking

### Technical / Logical
- The stage → `desc.md` mapping needs no judgement: direction gives the problem and value, gate gives success criteria, the "does not count" clause gives scope boundaries, order gives priority. → **A stage block is a `desc.md` seed; `task-desc` per stage can be seeded or skipped.**
- Per-stage step numbering (S2.3, S2.4) removes the cross-stage coupling KI8 names. → anchor.
- Articulation 4 (`task-plan --staged`) is structurally muddled: `task-plan`'s Gates 1–2 operate on a task that will get steps; a stage block is not a step and has no Huge Hard Blockers of its own until it is planned. Emitting stage blocks from inside `task-plan` mixes two layers in one command. → **articulation 4 killed on structural grounds.**
- The skill needs the big task's `desc.md` (and traverse finding if present) and runs before any stage's `task-plan`.

### Human / User
- The pain named is the *prompt* ("I don't want to every time prompting"), not the per-stage runs. Dispatch is implied ("combined with task-impl") but the emphasis is on the plan being simple. → **The user's pain is the stage-plan prompt; dispatch is secondary.**
- The confirm step is a human gate the user built into their own practice (APPENDIX4). → must survive.
- Reading burden: §13 shape × 5–9 stages ≈ 75–135 lines. Readable. The alternative was not.

### Strategic / Long-term
- With this skill the chain covers all six alignment layers for the first time; today Level 2 is missing. → anchor.
- Re-runnability: if the skill revises later stages after earlier ones land, it needs to know stage status. Options: status lines in the plan (the practice — bloated); a sibling state file; **derive from the per-stage work folders** — absent → pending; present, not merged → live; merged → done. The pack's idiom (`task-impl`'s Resume) derives state from files. → **Stage status is derivable; no state file.**
- Learnings that reshape later stages (the SDK finding) are content, not existence — but they live *in* the done stage's folder (its traverse finding, implementation record, critic). A re-run reads them there. The plan records only the *consequence*: a revised block with a one-line tag. → **Revisions are one-line tags, never accreted prose.**

### Risk / Failure
- Over-decomposition (stages that are steps with big names) or imbalance (one stage is 80% of the work). `decompose`'s failure modes apply. → **imbalance check required.**
- Aspirational gates ("works well"). FP4. → **a gate must name an observation; the "not done if…" form forces it.**
- State creeping back into the plan — the strongest risk, given history. → **no status field in the schema; status derived; revisions as tags.**
- Running on tasks that do not need staging adds a whole ceremony. → **the skill must be able to answer "this does not need staging — run `task-plan`."**
- Per-stage `task-desc` duplicating the block. → seed it from the block.
- "Stages are concepts" producing undeliverable stages. → the gate requirement forces deliverability.

### Resource / Feasibility
- Planning cost in practice: 103 files / 31,291 lines read. A staged plan still has to *understand* the whole task; it avoids *planning* the whole task. Deep reads are deferred to each stage's `task-plan`, when they are grounded.
- Skill size: `task-impl` is 323 lines with Decompose. This should be smaller.

### Ethical / Systemic
Not materially relevant. Noted, skipped.

### Definitional / Internal Consistency
- Does "stage" contradict an established definition? The pack has none. `decompose` has **piece**: "expressed as a question with verification criteria," with interfaces and a dependency order. That is nearly a stage — direction + gate + leaves-established. The difference: pieces may be parallel; stages are sequential by construction. → **A stage is a decompose piece with a forced sequential dependency.** This grounds MN1 in an existing, tested definition rather than a new coinage.
- Does the definition contradict itself? "Lightweight" and "enough direction to build" are in tension only if one document must carry both. Direction says *what*, gate says *when done*, neither says *how* — *how* is `task-plan`'s. Consistent.

### Definitional / Frame-exit Completeness
Gating fires: "stage" is used in this inquiry's own committed structures at ≥2 distinct values (planning unit; implementation unit; dispatch unit; decompose-piece-with-dependency).
- *Existence enumeration.* Project-wide, "stage" refers to: a §13 block (TYPE: plan); a `##` section with steps in the impl plan (TYPE: plan+state); an issue + branch (TYPE: execution); a member of a checkpoint group (LAYER: milestone); a slice-parent (LAYER: sub-unit). AGENT: the planner writes it, the owner declares its gate, `task-impl` executes it.
- *Role assessment.* The execution referent (issue + branch) is outside the skill's frame — the skill plans. Is coherence preserved if ignored? No: the dispatch seam depends on it. Re-locate, don't exclude: the skill's frame is plan-level; the execution-level stage belongs to `task-impl` via the per-stage folder; the folder is the seam. Coherent.
- *Verdict rigor.* "The skill does not execute." Counter: articulation 2 has it invoking `task-impl`. Structurally, dispatching ≠ executing — the skill would create a folder and invoke; `task-impl` executes. The boundary holds, but invoking makes the skill an orchestrator, which is the Process-layer decision the Layer Commitment reserved for the user. Kept open.
- *Residual.* "Checkpoint" is a level above stage that practice used. Load-bearing for the schema? No — a grouping. **Optional field.** Terminate.

### Phase / Calibration-State
The staging trigger is a judgement with no calibration data. Early-stage default? Weight's default is "when in doubt, heavy," because under-weighting is the expensive error. Here the asymmetry is reversed: **under-staging has a fallback** — `critic-d`'s REORDER verdict catches a plan whose later steps rest on premises earlier steps establish — while **over-staging has none**; it just costs a pipeline run per unnecessary stage. → **Default when unsure: do not stage.**

## SV3 — Multi-Perspective Understanding

Five shifts from SV2:
1. The skill is a **Level 2 artifact generator whose main structural task is to stay Level 2.**
2. **A stage is a decompose piece with forced sequential dependency** — a grounded definition, not a coinage.
3. **State is derivable from the per-stage folders; the plan changes only by one-line revision tags.** This is the mechanism that prevents the 130-line header.
4. **Articulation 4 is dead** on structural grounds.
5. **Default to not staging**; REORDER is the net for under-staging, nothing is the net for over-staging.

*Meta-inspection H1 (candidate set):* after shift 3, articulation 3 (living plan with a state file) collapses into articulation 2 (re-run reads folders). Articulations 5 (schema-first) and 6 (decompose-lite cut) are not alternatives to 1/2 — they are the *content method* for either. The live candidate set is therefore **{1: generate + confirm, hand-dispatch} vs {2: generate + confirm + dispatch one stage, re-runnable}**, with 5+6 as how either produces its content. *H3 (question framing):* the name "task-plan-staged" implies a relationship to `task-plan` that articulation 4's death weakens. Flag for the user; not adjudicated.

---

## Phase 3 — Ambiguity Collapse

#### Ambiguity 1: What is a stage?
**Strongest counter-interpretation:** A stage is a concept to build — the user's own words ("stages are maybe concepts to build").
**Why it fails (structural):** A concept cannot be completed; nothing can gate "the ownership boundary." Practice shows stages as ordered deliverables that *reference* concepts — Stage 2 "separate application behavior and lifecycle ownership" cites the ownership-boundary concept from proposal §5 and is gated by "failures in bookkeeping or teardown do not silently prevent required tool results." Two independent mechanisms demand deliverability: the gate (needs something to observe) and `decompose`'s piece-as-question (needs verification criteria). The user's "maybe" leaves room.
**Confidence:** HIGH.
**Resolution:** **A stage is an ordered deliverable with a gate, built from one or more concepts, such that planning the next stage in detail depends on this one existing.**
**Fixed:** stage = deliverable + gate + sequential dependency. **No longer allowed:** stage = concept; stage = step-group with no gate. **Depends on this:** the schema (Ambiguity 4); the trigger (Ambiguity 5). **Model change:** stages are a sequence, not a taxonomy.

#### Ambiguity 2: Does the skill dispatch to `task-impl`, or only generate?
**Strongest counter to "generate only":** hand-dispatch is itself repeated prompting ("now run `task-impl` on stage 2"); `task-impl` already orchestrates `task-plan`, so a stage-level orchestrator is idiomatic.
**Strongest counter to "dispatch":** the user's named pain is the stage-plan prompt, not the per-stage runs; dispatching all stages violates provisionality (later stages are revisable); dispatch adds a confirm gate the skill must honour.
**Structural test:** can the skill dispatch *one* stage without violating provisionality? Yes — dispatch the first non-done stage only, re-run at each boundary. Can "generate only" eliminate re-prompting? Only half of it.
**Confidence:** LOW — both options have structural merit. This is the Process-layer decision `_branch.md` reserved for the user.
**Resolution:** **Not adjudicated. Narrowed to two live options:** (A) generate → confirm → hand-dispatch; (B) generate → confirm → dispatch the first non-done stage, re-runnable at each stage boundary. **Eliminated:** dispatch-all.
**Fixed:** confirm precedes any dispatch; at most one stage live at a time. **Depends on this:** the skill's Resume logic; whether it is an orchestrator.

#### Ambiguity 3: Where does cross-stage state live?
**Strongest counter to "derive from folders":** the SDK discovery that rewrote Stage 5 is content, not folder-existence; deriving status works, deriving *what was learned* does not.
**Why it fails (structural):** two kinds of state. *Status* (pending / live / done) is derivable — folder absent, present-unmerged, merged. *Learnings* are not derivable from existence, but they already live inside the done stage's folder (its traverse finding, implementation record, critic). A re-run reads them there. The plan need only record the *consequence*: a revised stage block carrying a one-line tag.
**Clean-resolution check:** a done-then-rejected stage? Folder present, unmerged → "live." Correct — it is live again. A deferred stage (Stage 8)? Folder absent → "pending," but it is deferred by decision. → Deferral is a one-line tag on the block, `[deferred: reason · revisit when …]`, the same mechanism as revision. Holds.
**Confidence:** HIGH.
**Resolution:** **No state file. Status derives from the per-stage work folder. Learnings stay in that folder. The plan changes only by revising a stage block with a one-line tag: `[revised after stage N: reason]` or `[deferred: reason · revisit when …]`.**
**Fixed:** the schema has no status field. **No longer allowed:** prose status in the plan; a `where_we_left` inside the plan. **Depends on this:** Resume logic; per-stage folder convention.

#### Ambiguity 4: What are a stage's fields? ("a couple more fields")
**Candidates from practice:** name, direction, gate, leaves-for-next, checkpoint, depends-on, concepts referenced, status, evidence pointer, hardness.
**Strongest counter-interpretation:** "a couple *more*" means adding `task-plan`-style fields — hardness, safe-in-nature — at stage level.
**Why it fails (structural):** the user refused hardness at stage level in practice ("Re-score at `/task-plan`, not by editing the numbers here"); safe-in-nature is a property of a step touching existing behaviour, meaningless for a stage that has no steps yet. Both are Level 3. Status and evidence are state (Ambiguity 3).
**Confidence:** HIGH for the required four; MEDIUM for which optionals.
**Resolution:** **Required — name · Builds (direction, 1–3 paragraphs) · Gate (what must be observably true; what does not count as done) · Leaves established (what the next stage may rely on). Optional — Concepts (which concepts this stage realises) · Checkpoint (milestone grouping). Forbidden — status, evidence pointers, hardness, steps.**
"Leaves established" is kept separate from Gate on structural grounds: the gate is *this* stage's test; leaves-established is the *next* stage's contract. Different consumers.

#### Ambiguity 5: What is the "big enough to stage" test?
**Strongest counter-interpretation:** reuse weight (heavy).
**Why it fails (structural):** #180 was issue-heavy and correctly planned as one piece. Weight measures blast radius, observability, consumers, model contact, reversibility; none of those is "later parts cannot yet be planned."
**Second counter:** "many moving parts / many concepts" (the user's words) — a count.
**Why it fails:** many *known* concepts plan fine in one pass. The trigger is that some part cannot be planned until an earlier part exists.
**Load-bearing concept test (H4/H9):** "sequential dependency of understanding" is my coinage. The user's language: *"you cannot really plan it fully without actually initial parts are more concrete and established, and then next part can build on top of it."* Same mechanism; use their phrasing.
**Confidence:** HIGH that it is not weight; MEDIUM on the exact operational probe.
**Resolution:** **Stage when later parts cannot be planned until earlier parts are established.** Operational probe: *try to write the first step of the last part — does it depend on something only an earlier part will decide or reveal?* If no → one `task-plan`. **Default when unsure: do not stage** (REORDER catches under-staging; nothing catches over-staging).

#### Ambiguity 6: Does every stage run the full pipeline, traverse included?
**Strongest counter:** per-stage traverse is expensive; the staged plan already did the understanding.
**Why it fails (structural):** the staged plan's understanding is shallow *by design* — depth is deferred to each stage. CONTRIBUTING §2 runs traverse for every feature; Stage 5's issue ran "a real `/traverse`." The referent of "run full traverse on this" is ambiguous (this inquiry vs each stage) but both readings agree with practice.
**Confidence:** MEDIUM.
**Resolution:** **Each stage runs whatever pipeline its path requires; the staged plan never shortcuts it.** Whether that includes traverse is the surrounding workflow's rule, not this skill's.

#### Ambiguity 7 (specific-vs-pattern, H5): Is voice_update the whole pattern or one case?
**Strongest counter:** one deeply-read execution; §13's shape may be idiosyncratic.
**Why it partly fails:** the *pattern* — stage plan, confirm, per-stage pipeline — is attested in ≥3 instances (voice_update; APPENDIX4 generic; `command_imp_plan.md` two-tier). The *shape* (name + direction + gate) is single-instance.
**Confidence:** MEDIUM.
**Resolution:** **The pattern is confirmed. The §13 block shape is the best available evidence of the lightweight form and is proposed, with the four required fields, for the user's confirmation rather than asserted.**

## SV4 — Clarified Understanding

**Clear:** a stage is a gated deliverable with sequential dependency; four required fields, two optional, four forbidden; status derives from folders; the plan changes only by one-line tags; the trigger is "later parts cannot be planned until earlier parts are established," default don't stage; every stage runs its normal pipeline; the stage block seeds its `desc.md`; the artifact is Level 2.
**No longer viable:** stage = concept; `task-plan --staged`; dispatch-all; a state file or status prose in the plan; weight as the trigger; hardness / status / evidence at stage level.
**Open by design:** generate-only vs dispatch-one (Process layer, for Critique and the user); the name's implied tie to `task-plan`.

---

## Phase 4 — Degrees-of-Freedom Reduction

**Fixed:** the stage definition · the schema (4 + 2, with 4 forbidden) · the trigger and its default · no-state / no-steps in the plan · one-line revision and deferral tags · confirm before dispatch · at most one live stage · stage block → `desc.md` seed · Level 2 position · imbalance check · gates name an observation.
**Eliminated:** articulation 4 · dispatch-all · a state file · stage = concept · weight as trigger · Level-3 fields at stage level · continuous cross-stage step numbering.
**Viable:** articulation 1 (generate + confirm, hand-dispatch) · articulation 2 narrowed (generate + confirm + dispatch the first non-done stage, re-runnable) · articulations 5 + 6 as the content method for either.

## SV5 — Constrained Understanding

One skill, `task-plan-staged`. It (a) tests whether staging applies and says so if not; (b) cuts the task into ordered stages at low-coupling seams with a dependency order and an imbalance check; (c) emits `staged_plan.md` with four required fields per stage and nothing else; (d) is re-runnable: derives each stage's status from its folder, reads what a done stage produced, revises later blocks with one-line tags. The single open axis is (e): whether it also creates the first non-done stage's folder, seeds its `desc.md`, and invokes `task-impl`.

---

## Phase 5 — Conceptual Stabilization

**Accommodation check:** perspectives converged rather than destabilised. The Definitional perspective supplied the grounding (decompose piece + sequential dependency); Strategic supplied the state model; Risk supplied the guards; Calibration supplied the default. No model-misfit; no re-extraction needed.

## SV6 — Stabilized Model

**`task-plan-staged` is the pack's Level 2 (Action-Space) artifact generator, and its main structural job is to stay at Level 2.**

It takes a big task's description, applies the trigger — *can the later parts be planned before the earlier parts are established?* — and if not, says so and points at `task-plan`. If staging applies, it cuts the task at low-coupling seams into ordered stages, checks for imbalance, and emits `staged_plan.md`. Each stage carries exactly: **Stage N — name · Builds · Gate · Leaves established**, optionally **Concepts** and **Checkpoint**. No steps, no status, no hardness, no evidence pointers. The user confirms. Each stage then becomes a work folder whose `desc.md` is seeded from its block, and runs the normal pipeline through `task-impl`. The skill is re-run at stage boundaries: it derives status from the folders (pending / live / done), reads what the done stage produced, and revises later blocks with one-line tags — `[revised after stage N: reason]`, `[deferred: reason · revisit when …]`. Whether it also dispatches the first non-done stage is the one Process decision left for the user.

**How SV6 differs from SV1.** SV1 saw a generator for a lightweight plan. SV6 sees an artifact at a specific alignment layer whose design problem is *containment*: the manual practice bloated not because stages were planned badly but because steps and state were allowed into the stage document. The definition of stage (a decompose piece with forced sequential dependency), the derivable status model, the forbidden-fields list, and the don't-stage default are all mechanisms for that containment — none of which SV1 contained.

---

## Saturation Indicators (Telemetry)

- **Perspective saturation:** 7 perspectives applied (Technical, Human, Strategic, Risk, Resource, Definitional/Consistency, Frame-exit, Calibration; Ethical skipped with note). 7 produced new anchors; 5 produced surprises (the decompose-piece grounding; derivable status; the reversed calibration default; the user's pain being the prompt; articulation 3 collapsing into 2).
- **Ambiguity resolution ratio:** 7 identified; 5 resolved HIGH; 1 MEDIUM (trigger phrasing, §13 single-instance); 1 LOW and left OPEN by design (dispatch). Nothing silently dropped.
- **SV delta:** large — SV1 is a generator; SV6 is a layer-containment design with a grounded definition and a state model.
- **Anchor diversity:** all five anchor types; anchors from all seven perspectives.

## Failure-mode check

- *Status quo bias:* did not protect `task-plan`'s schema — excluded its fields at stage level on the user's own evidence.
- *Premature stabilization:* 5 of 7 perspectives produced surprises; the Definitional one restructured MN1.
- *Anchor dominance:* "no bloat" is strong. Removing it, the decompose-piece definition and the derivable-status model still stand on their own evidence. Not single-pillar.
- *Perspective blindness:* the uncomfortable perspective — "the user wants a prompt wrapper; this is over-engineering" — was checked under Human/User. Both the prompt pain and the bloat complaint are the user's; the containment mechanisms serve the second without adding ceremony to the first.
- *Clean resolution trap:* Ambiguity 3's "derive from folders" was tested against the rejected-stage and deferred-stage cases and held.
- *Self-reference blindness:* a planning discipline designing a planning skill. External grounding: the real voice_update artifacts, the user's recorded rule about hardness, CONTRIBUTING's weight definitions, the #180 contrast case.
