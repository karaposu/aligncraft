# Decomposition — task-plan-staged skill

## User Input
`devdocs/inquiries/2026-11-08_11-58__task_plan_staged_skill/_branch.md`

Whole being decomposed: the design of `task-plan-staged` as stabilised in `sensemaking.md` SV6 — a Level 2 (Action-Space) artifact generator that tests whether a task needs staging, cuts it into gated stages, emits a four-field-per-stage plan, stays at Level 2 by deriving status from folders and revising only by one-line tags, and hands stages to `task-impl` either by the human (A) or by itself one stage at a time (B).

Prerequisite check: Sensemaking has clarified the whole (SV6 is one paragraph). Proceeding.

---

## Step 1 — Coupling Topology

### Elements

| # | Element |
|---|---|
| E1 | The staging trigger — the test, the don't-stage default, the exit to `task-plan` |
| E2 | The cut — coupling-perception subset, dependency order, imbalance check, Stage 0 detection |
| E3 | The stage schema — 4 required, 2 optional, 4 forbidden fields |
| E4 | The gate form — observably true + "does not count as done" |
| E5 | The artifact — `staged_plan.md`: frontmatter, trigger verdict, stage blocks, nothing else; its location |
| E6 | The confirm gate — human confirmation before any stage becomes a folder |
| E7 | The dispatch seam — stage block → per-stage folder → seeded `desc.md` |
| E8 | Status derivation — pending / live / done / deferred from the per-stage folder |
| E9 | Revision mechanism — re-run reads a done stage's folder, revises later blocks with one-line tags |
| E10 | The dispatch decision — A (generate, hand-dispatch) vs B (dispatch one stage, re-runnable); one-live-stage rule |
| E11 | Resume logic — what the skill does when run on a task that already has a plan |
| E12 | Relationship boundaries — to `task-plan`, `roadmap`, `decompose`, `task-impl` Decompose, weight |
| E13 | The skill file's form — lean, standalone, no self-description, sibling references only |
| E14 | Naming — "task-plan-staged" implies a `task-plan` relationship the design denies |

### Coupling (change A → must B change?)

**Strong:**
- E3 ↔ E4 ↔ E5 ↔ E7 — the schema, the gate form, the serialised artifact, and the `desc.md` seeding move together. Change a field and the seed mapping changes; change the gate form and success-criteria/scope seeding changes. *One cluster: the stage block and what it becomes.*
- E8 ↔ E9 ↔ E11 — how status is derived decides when revisions fire decides what resume does. *One cluster: the re-run.*
- E6 ↔ E10 — the confirm gate's force (advisory vs blocking) depends on A vs B. *One cluster: the handoff process.*

**Moderate:**
- E1 ↔ E2 — the trigger's probe is a weak coupling-perception act; the cut is the authoritative one, and can override the trigger (a cut that yields one stage → don't stage after all).
- E2 ↔ E3 — the cut fills the schema; the schema's shape does not depend on the cut method. A contract, not entanglement.
- E10 ↔ E11 — under B, resume ends in a dispatch; under A, in a report.

**Weak:**
- E1 ↔ everything downstream — a boolean crosses.
- E12 ↔ E14 — naming follows the `task-plan` boundary; one line.
- E13 ↔ all — a constraint on how every piece is *written*, not a piece.

### Coupling map

```
  K1 Trigger        K2 Cut            K3 Stage block & seed        K4 Re-run             K5 Handoff
  [E1]  ──bool──►  [E2]  ──list──►   [E3 E4 E5 E7]  ──tags,path──► [E8 E9 E11] ──index──► [E6 E10]
         ◄degenerate┘                        │  └────────── seed mapping ──────────────────────►│
                                             └────────────── declared folder convention ───────►│
  K6 Boundaries & naming  [E12 E14]  ·  Global constraint: E13 (leanness) applies to every piece's text
```

---

## Step 2 — Boundaries (Top-Down)

Six pieces at the low-coupling valleys:

| Boundary | Crossing traffic | Assessment |
|---|---|---|
| K1 \| K2 | a verdict ("stage") forward; a degenerate signal back | single-point, clean |
| K2 \| K3 | an ordered list of stage candidates; the required-field contract back | moderate, contract-shaped |
| K3 \| K4 | the tag formats and artifact path; the declared folder convention | thin — string formats |
| K3 \| K5 | the seed mapping; the declared folder convention | thin |
| K4 \| K5 | the index of the next stage (B only) | single value |
| K6 \| all | phrasing constraints | diffuse, weak |

One diffuse region: E13 (leanness) touches everything. It is a **global constraint on the written file**, not a piece. Removed from K6; K6 keeps E12 + E14.

---

## Step 3 — Validate (Bottom-Up)

### Atoms

a1 trigger question · a2 don't-stage default · a3 exit to `task-plan` · a4 coupling probe · a5 dependency order · a6 imbalance check · a7 Stage 0 detection · a8 field name · a9 field Builds · a10 field Gate + form · a11 field Leaves established · a12 optional Concepts · a13 optional Checkpoint · a14 forbidden list · a15 frontmatter · a16 seed mapping · a17 status rules · a18 revision tag format · a19 deferral tag format · a20 resume table · a21 confirm gate · a22 A/B · a23 one-live-stage · a24 `Skill(task-impl)` call · a25 not-a-mode-of-task-plan · a26 not-roadmap · a27 decompose subset · a28 vs task-impl Decompose · a29 vs weight · a30 name

### Grouping

K1 = {a1, a2, a3} · K2 = {a4, a5, a6, a7} · K3 = {a8–a16, a18, a19} · K4 = {a17, a20} · K5 = {a21–a24} · K6 = {a25–a30}

All atoms land in the cluster Step 2 predicted. One deliberate split: a18/a19 (tag *formats*) sit in K3 as schema elements while their *firing* sits in K4 — a clean data contract, not a torn atom. No atom grouped with an independent one: K5's a24 exists only under B, which is K5's internal conditional, not a hidden boundary.

**Confidence: HIGH on all six.** Top-down and bottom-up agree.

**One discovery during validation** — a backward dependency K2 → K1 the top-down pass missed: the cut can refute the trigger. If coupling perception yields one stage, or stages with no sequential dependency, the task was not stageable and the skill must exit to `task-plan`. Recorded as an interface (Step 5).

---

## Step 4 — Question Tree

**Q1 — When should a task be staged rather than planned in one pass, what does the skill need as input, and how does it say no?**
- [ ] The trigger is stated in the user's language: *later parts cannot be planned until earlier parts are established*
- [ ] An operational probe is named: *try to write the first step of the last part — does it depend on something only an earlier part will decide or reveal?*
- [ ] The default when unsure is **do not stage**, with the reason: `critic-d`'s REORDER catches under-staging; nothing catches over-staging
- [ ] The exit is explicit: *this does not need staging — run `task-plan`*
- [ ] Weight (light/heavy) is named as **not** the test
- [ ] Input contract: a folder with `desc.md` or a `desc.md` path; a traverse finding is read if present; a raw description runs `task-desc` first

**Q2 — How does the skill find the stage boundaries and their order, and how does it know the cut is sound?**
- [ ] Coupling-perception probe stated: *if this part changes, must that part change?*
- [ ] Cut at the low-coupling seams; keep tightly coupled work in one stage
- [ ] Dependency order produced; a stage's position is justified by what it needs from before
- [ ] Imbalance check: one stage dramatically larger than the rest → split it, or merge the trivial ones
- [ ] Stage 0 rule: when the task changes a live system, the first stage records what exists before anything moves
- [ ] Degenerate exit: the cut yields one stage, or stages with no sequential dependency → not stageable → exit to `task-plan`
- [ ] The subset of `decompose` used is named (perceive, detect, order, balance); the question tree and 7-dimension evaluation are not

**Q3 — What exactly does a stage block contain, what is forbidden, and how does a block become a `desc.md`?**
- [ ] Four required fields with one-line guidance each: **Stage N — name** · **Builds** (1–3 paragraphs of direction) · **Gate** · **Leaves established**
- [ ] Gate form: what must be *observably* true, and what does **not** count as done
- [ ] Two optional fields: **Concepts** (which concepts this stage realises) · **Checkpoint** (milestone grouping)
- [ ] Four forbidden fields, each with its reason: status, evidence pointers (state — derived); hardness, steps (Level 3 — `task-plan`'s, per stage)
- [ ] Frontmatter `model` / `effort`
- [ ] Revision tag `[revised after stage N: reason]` and deferral tag `[deferred: reason · revisit when …]` — the only way a block changes after confirmation
- [ ] The artifact declares the per-stage folder convention it expects (so status can be derived under A or B)
- [ ] Seed mapping, block → `desc.md`: Builds → problem statement + user value; Gate → success criteria; "does not count" → scope boundaries; stage order → priority; the **previous** stage's Leaves-established → the new `desc.md`'s "what already exists" context
- [ ] Artifact name and location: `staged_plan.md` in the task's folder
- [ ] The §13-derived shape is presented to the user for confirmation, not asserted (single-instance evidence)

**Q4 — When the skill is run again on a task that already has a staged plan, how does it know where things stand and what may change?**
- [ ] Status table: no folder → pending · folder present, no done-marker → live · done-marker present → done · deferral tag on the block → deferred
- [ ] Done-marker is tolerant: `task-impl`'s Verify passed, or a `pr-critic` Gate MERGES, or the user says so
- [ ] What to read from a done stage's folder: its plan, critic, traverse finding, implementation record — the learnings live there, not in the staged plan
- [ ] Revision rule: done blocks never change; later blocks may; every change is one tag
- [ ] Resume table: no plan → generate · plan unconfirmed → wait · stage N done → revise N+1… then (B) hand off N+1 or (A) report · all done → report complete
- [ ] The staged plan is the only file this skill writes on a re-run (plus, under B, the next stage's folder)

**Q5 — After the plan is confirmed, how does a stage reach `task-impl`, and does the skill do it or the human?**
- [ ] Confirm mechanism: a `**Confirmed:** [date]` line in the plan, or the user says so; absent → no folder is created
- [ ] Option A: the skill stops after the plan; the human creates each stage's folder and runs `task-impl`
- [ ] Option B: the skill creates the first non-done stage's folder, writes its `desc.md` from the seed mapping directly (not via `task-desc`, avoiding its location pause), and invokes `Skill(task-impl)`
- [ ] One-live-stage rule under B: never a second folder while one stage is live
- [ ] The A/B choice is left to the user with the trade named: A adds no orchestration; B removes the "now run stage 2" prompting but makes the skill an orchestrator

**Q6 — What is this skill not, where does it sit, and what should it be called?**
- [ ] It is the pack's Level 2 (Action-Space) artifact — approach and sequence — the one alignment layer with no command today
- [ ] Not a mode of `task-plan`: stage blocks are not steps, and `task-plan`'s blocker gates operate on a task about to receive steps
- [ ] Not `roadmap`: a delivery sequence with gates, not a terrain map with status triples
- [ ] Uses `decompose`'s perceive / detect / order / balance; not its question tree or 7-dimension evaluation
- [ ] Not `task-impl`'s Decompose: proactive before planning, not reactive after three rejections
- [ ] Not weight: orthogonal; #180 was heavy and planned as one piece
- [ ] Naming: "task-plan-staged" is flagged — it implies the relationship this piece denies; alternatives offered (`stage-plan`, `task-stages`); the user decides

**Global constraint (not a piece):** the skill file is lean, standalone, carries no self-description or design rationale, and references only `task-desc`, `task-plan`, `task-impl`.

Every piece is expressible as a purposeful question. No arbitrary cuts.

---

## Step 5 — Interface Map

| From → To | What flows | Kind | Direction |
|---|---|---|---|
| Q1 → Q2 | the verdict "stage" | decision | one-way |
| Q2 → Q1 | the degenerate signal "≤1 stage or no dependency → don't stage" | decision | one-way, feedback |
| Q3 → Q2 | the required-field contract the cut must fill | contract | one-way |
| Q2 → Q3 | ordered stage candidates: (what it builds, why this seam, what it depends on, is-Stage-0) | data | one-way |
| Q3 → Q4 | tag formats; artifact path; declared folder convention | contract | one-way |
| Q3 → Q5 | the seed mapping; declared folder convention | contract | one-way |
| Q4 → Q5 | index of the next stage to hand off (B only) | data | one-way |
| Q6 → all | what the skill is not; its layer | constraint | one-way, weak |

### Assumptions-not-data check

Four hidden couplings found and made explicit:

1. **Q4 assumed a detectable folder.** Under A the human creates folders and may name them anything, so status derivation would fail. Fix: the artifact *declares* the folder convention (Q3), and both Q4 and Q5 read it from there. This also breaks the Q4↔Q5 cycle that would otherwise exist (Q4 needs Q5's convention; Q5 needs Q4's index).
2. **Q4 assumed "done" is visible.** In masacan, work folders live on branches excluded from merges; a done stage's folder may not be on the current branch. Fix: the done-marker is tolerant — Verify passed, or `pr-critic` MERGES, or the user says so.
3. **Q5 (B) assumed `task-impl` runs cleanly from a folder.** It does — but `task-desc` Step 0 pauses for location confirmation on a raw description. Fix: B writes `desc.md` directly from the seed mapping; it does not invoke `task-desc`.
4. **Q2 assumed the task is already understood.** `decompose`'s prerequisite. Fix: Q1 requires a `desc.md` (and reads a traverse finding if present); a raw description runs `task-desc` first — the same rule `task-impl` uses.

One further assumption surfaced and added to Q3: the *next* stage's `desc.md` needs the *previous* stage's Leaves-established as its "what already exists" context; the seed mapping carries it.

---

## Step 6 — Dependency Order

```
Q3  (schema + artifact — the contract everyone else fills or reads)
 ├─► Q1  (front door; needs only Q2's degenerate-signal name)      ┐ parallel
 └─► Q6  (boundaries; uses the schema for the "not a mode" argument) ┘
Q1 + Q3 ─► Q2  (the cut fills the schema, runs on the verdict)
Q3 ─► Q4  (reads tags, path, convention)
Q3 + Q4 ─► Q5  (reads seed mapping, consumes next-stage index)
```

**Sequence:** Q3 → {Q1 ∥ Q6} → Q2 → Q4 → Q5. No circular dependency after the convention moved into Q3.

As a skill-file structure: Q1 is the opening and input resolution; Q2 the method; Q3 the schema and output format; Q4 Resume; Q5 Handoff; Q6 a short closing "what this is not" plus the naming note.

---

## Step 7 — Self-Evaluation (full, 7 dimensions)

| Dimension | Result | Note |
|---|---|---|
| **Independence** | PASS | each question answerable alone given its declared interfaces |
| **Completeness** | PASS | every SV6 element lands in a piece; two were added during evaluation — input resolution (Q1) and the Level-2 statement (Q6) |
| **Reassembly** | PASS | Q1 → Q2 → Q3 → Q5 → Q4, bounded by Q6, fully specifies the skill. Determination-mechanism check: "big enough?" has its probe (Q1); "is stage N done?" has its marker (Q4); "which stage next?" (Q4); "is the plan confirmed?" was **missing** and is now Q5's first criterion |
| **Tractability** | PASS | each piece is one skill-file section, writable in a single pass |
| **Interface clarity** | PASS | all flows explicit after the four assumption fixes; the Q4↔Q5 cycle dissolved |
| **Balance** | PASS, noted | Q3 is the largest (~40% of the text); it is also the product. Not an 80% piece |
| **Confidence** | HIGH | top-down and bottom-up agree on all six; one deliberate split at a data contract |

**Stopping:** every piece is tractable and directly verifiable. No recursive decomposition.

**Failure-mode check:** premature decomposition — no, SV6 preceded; wrong boundaries — no, interfaces are thin; hidden coupling — four found and surfaced in Step 5; missing pieces — two found in Step 7 and added; over-decomposition — six pieces for a skill with six concerns, each non-trivial; ignoring dependencies — ordered in Step 6; imbalance — Q3 heaviest at ~40%, acceptable and noted.
