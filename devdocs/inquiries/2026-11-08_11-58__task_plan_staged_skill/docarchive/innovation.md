# Innovation — task-plan-staged skill

## User Input
`devdocs/inquiries/2026-11-08_11-58__task_plan_staged_skill/_branch.md`

Inputs consumed: `_branch.md`, `sensemaking.md` (SV6 + 7 ambiguity resolutions), `decomposition.md` (pieces Q1–Q6, interfaces, hidden couplings), `surfacing.md`, `articulate_warm.md`.

---

## Phase 1 — Seed

**Seed (Gap + Codify-habit):** a lightweight stage-plan skill for big tasks should exist and doesn't; the manual practice exists and bloated to 172KB because steps and state were allowed into the stage document.

**Direction (user's valuation):** simplicity; no bloat; each stage runnable by `task-impl`; stop re-typing the prompt.

**Methodology-mode consideration.**
- *Inherited mode:* Standard default, in **Production-task mode** — the seed is the decomposition's piece-list Q1–Q6; mechanisms run per piece.
- *Alternative considered:* Contrarian-rethink (Framer-weighted). What would follow: a candidate space dominated by "should this be a skill at all" — fold it into `task-impl`'s Decompose; document the §13 shape and write nothing; use `roadmap`.
- *Decision:* **default.** The user's ask is to build; Sensemaking SV6 adjudicated the layer and killed the main structural alternative (`task-plan --staged`) on structural grounds; the contrarian direction is carried inside the run by the mandatory contrarian variant per mechanism and by the Inherited Frame Audit, rather than by Framer-weighting the whole run.

**Meta-decision-piece classification.** All six pieces are meta-decision: Q1 commits an evaluation criterion (iv); Q2 a framing-semantic (ii: "cut at coupling seams"); Q3 framing + evaluation + **intervention-shape** (v: ADD-CONTENT, a new artifact); Q4 framing + **intervention-shape** (v: DO-NOTHING to state); Q5 evaluation + **intervention-shape** (v: ADD orchestration vs DO-NOTHING); Q6 relationship-labels (i). Q3, Q4, Q5 therefore require Inversion on the intervention-shape axis.

---

## Phase 2 — Generate

### 1. Lens Shifting (Framer)
Current frame: a big task gets a human-confirmed stage plan, then executes stage by stage.
- **Generic.** Under conditions of *uncertainty without size* — a small task touching an unknown vendor — the same structure applies as a two-stage plan: probe, then build. Staging is about uncertainty, not bigness; "big" in the request is incidental.
- **Focused.** Under the conditions this pack now has, `critic-d` returns REORDER when a plan builds on a premise before testing it. A staged plan is what REORDER *would produce if asked before planning* — "test before build" generalised to "establish before plan." The trigger can be phrased as REORDER's own question.
- **Contrarian.** Under conditions of cheap rollback and strong CI, staging is unnecessary: plan it all, build it all, let Verify catch it, re-plan. The 172KB plan shipped. Staging is a cost paid for *irreversibility*; where everything is reversible, don't stage.

### 2. Combination (Generator)
- **Generic.** staged plan + `meaning-gaps` at each stage boundary → before revising stage N+1, survey it with stage N's outputs in context; the gaps found *are* the revision. (The practice did this: `meaning_gaps3` surveyed Stage 5 as it approached.)
- **Focused.** stage Gate + `critic-d`'s Premise Inventory → every Gate is a premise for all later stages, so the staged plan's gate list *is* its premise inventory, with "first dependent step = stage N+1" built in. The plan is self-inventorying.
- **Contrarian.** staged plan + `task-impl` Decompose → the same operation at two times. Decompose (reactive, after three rejections) spawns prerequisite tasks; staging (proactive) spawns stages. One mechanism, two entry points — Decompose should *call* the staging skill on the parked task instead of hand-classifying gaps.

### 3. Inversion (Framer) — depth-checked; piece-level at Q2–Q6; intervention-shape axis at Q3/Q4/Q5
Core belief: *the staged plan is written up front, then stages execute.*
- **Generic — depth-iterated.** L1: stages are discovered as you go, each block written when the previous completes. L2: the plan is a log, not a document — append-only, written with hindsight. L3 (system): **there is no staged plan; there is a sequence of `task-impl` runs whose `desc.md` files each reference the prior run's Leaves-established.** Existence-axis: zero plan documents. Identity-axis: the plan *is* the folder sequence.
- **Focused — Q3, intervention-shape.** Q3 commits **ADD-CONTENT** (new file `staged_plan.md`). Reversed → **REORGANIZE-WITHOUT-ADDING**: no new file; stage blocks go into the big task's existing `desc.md` as `## Stages`. What follows: no new filename; `task-impl`'s Resume sees a Stages section and knows the task is staged; L2 lives inside L1.
- **Contrarian — Q4, intervention-shape.** Q4 commits **DO-NOTHING** to state (derive from folders). Reversed → **ADD-CONTENT**: a minimal state record, one line per stage. What follows: derivation's two hidden couplings (folder naming under A; branch-excluded folders) disappear; "done" is written, not inferred.
- **Q5, intervention-shape.** Q5 leaves **ADD orchestration** (B) vs **DO-NOTHING** (A) open. Reversed → **REPAIR `task-impl`**: the orchestrator already exists. `task-impl`'s Resume gains one row — *task is staged and stage N is done → create stage N+1's folder, seed its `desc.md`, continue* — and the staging skill never orchestrates. What follows: the generator stays pure; the existing orchestrator grows one row; the A/B question dissolves.
- **Q2, content.** *Cut where coupling drops* reversed → *cut where confidence drops*; depth-iterated → **cut where what-is-established changes** — the Leaves-established edge is the boundary, coupling perception is how you find it.
- **Q6, content.** *Not roadmap* reversed → the staged plan **is a roadmap** with a stricter node schema: `roadmap`'s `produces` is Leaves-established, its `why this order` is the dependency edge, its `depends on` is the interface. Sensemaking never considered a roadmap mode, only a task-plan mode.

### 4. Constraint Manipulation (Framer) — both directions
- **ADD (generic).** *A stage block fits in ~15 lines.* What becomes possible: the plan is one screen; bloat is structurally impossible; Builds is forced to be direction, not detail. §13's own stages run 8–16 lines.
- **REMOVE (focused).** Drop *confirm before dispatch*. What becomes possible: fully autonomous staged execution, matching the user's auto-implement choice for `task-impl`.
- **ADD (contrarian).** *Every stage is independently shippable.* What becomes possible: stages are releases; Stage 0 is a tagged baseline. What it costs: foundations that ship nothing visible (Stage 1 "extract without changing behaviour") would fail the constraint. The weaker form — independently *verifiable* — is what Gate already means.
- **REMOVE (second).** Drop *one live stage at a time*. What becomes possible: parallel stages where the cut found no dependency. But stages exist *because* they depend; pieces with no dependency are separate tasks, not stages.

### 5. Absence Recognition (Generator) — both levels, bidirectional
- **Patch (generic).** The cut's *why this seam* (Q2 output) does not survive into the block (Q3 schema). The justification for a boundary is lost at the handoff.
- **Patch (focused).** Q4 has no rule for a done stage whose **Leaves-established turned out false** (Stage 4 → 5 assumed a wire protocol the SDK made moot). "Done blocks never change" leaves a wrong contract in place.
- **Redesign — what's missing.** Designed from scratch, the boundary between stages would be a typed **interface** (source, target, what flows) as `decompose` has, not a prose line. The SDK failure sat exactly at an under-specified stage interface.
- **Redesign — already present in other form.** The project *already tracks* stage state: GitHub parent issues with `Blocked by: #NN`, the `open to implement` label, child issues per stage (CONTRIBUTING §4.5). The staged plan's state exists natively as an issue tree.
- **Contrarian.** There is no way to **un-stage** — merge two stages back when the cut was too fine. Tags exist for revise and defer; none for merge.

### 6. Domain Transfer (Generator) — one native source mandatory
- **Native: database migrations.** Numbered, ordered, each leaves a consistent schema, later ones depend on earlier having run, a `schema_migrations` table records which ran, each has `down`. Stage = migration; Gate = post-migration consistency check; Leaves-established = the schema state; the migrations table = a one-line-per-stage status record; `down` = a rollback the stage schema lacks.
- **Generic: clinical trial phases.** Phase 0 (micro-dose: is it safe to even try) → I → II → III, each with a **pre-registered endpoint**; Phase III's protocol is written only after Phase II's data exists. Stage 0 is Phase 0. Endpoints are fixed *before* the phase runs, so they cannot become rationalisations — Gates should be written at plan time and frozen once the stage starts.
- **Contrarian: improvisational theatre.** "Yes, and" — no plan, each scene accepts the previous and adds. The L3 inversion is improv with memory. Improv's rules (don't block, don't negate) transfer as: never contradict a done stage's Leaves-established; never re-decide a done stage's Gate.

### 7. Extrapolation (Generator)
Trend: this session added containment and provenance to every skill (model/effort stamps, `DEPRECATED_`, Known Blockers, REORDER, Decompose); each skill grew a "what it is not."
- **Generic.** In a year every task runs the chain with staging decided by a trigger and most tasks are one stage — the stage block becomes the universal wrapper, N=1 for small tasks; no separate skill.
- **Focused.** Rejection history already drives Decompose at task level. Since each stage *is* a task folder, "three rejections → Decompose" applies per stage with nothing added.
- **Contrarian.** As models improve, "can't plan later parts until earlier exist" weakens — a stronger model plans them from the description. Staging is a workaround for current model limits.

---

## Inherited Frame Audit

**Seed-level central assumption:** *a new skill, `task-plan-staged`, should exist.* Challenged by: Inversion L3 (no plan document), Inversion-Q5 (`task-impl` grows a row instead), Extrapolation-generic (universal wrapper, not a skill), Lens-contrarian (don't stage where reversible). ✓

**Piece-level:**
- Q1 (criterion) — challenged by Lens-contrarian, Lens-focused, Extrapolation-contrarian ✓
- Q2 (cut at coupling) — challenged by Inversion-Q2 (cut at knowledge boundaries) and two foreign cutting principles (migrations: consistency boundaries; trials: evidence boundaries) ✓
- Q3 (ADD-CONTENT) — challenged on the intervention-shape axis by Inversion-Q3 (REORGANIZE) ✓
- Q4 (DO-NOTHING) — challenged on the intervention-shape axis by Inversion-Q4 (ADD-CONTENT), migrations table, issue-tree absence ✓
- Q5 (ADD vs DO-NOTHING) — challenged on the intervention-shape axis by Inversion-Q5 (REPAIR `task-impl`) and Constraint-REMOVE-confirm ✓
- Q6 (relationship labels) — challenged by Inversion-Q6 (roadmap) and Extrapolation-generic ✓

Audit does not fire. Proceed to Test.

---

## Phase 3 — Test

Sixteen candidates carried to the five tests; the rest were restatements. Artifact-grounding applied where a claim touches project state.

**T1 — Inversion L3: no `staged_plan.md`; the plan is the folder sequence.**
Novelty ✓. Scrutiny: strongest objection — the user confirms the plan *before* stages run (APPENDIX4 "once confirmed"); a folder sequence has no up-front view, so a wrong cut cannot be caught before N pipeline runs; and the cut must then live in the model's head, unreviewable. Fails. Fertility: strong pressure toward a plan that is nearly an index of folders-to-be. **KILL. Seed extracted:** the plan should be as close to a folder index as a confirmable document can be.

**T2 — Inversion-Q3: stages inside `desc.md`, no new file.**
Novelty ✓. Scrutiny: mixing L1 and L2 in one file is the pattern that bloated the impl plan (L2+L3+state); a 9-stage section roughly doubles a `desc.md`. Artifact-grounding: #180's `desc.md` is ~10KB. Survives weakly. Fertility: a one-line marker in `desc.md` — `**Staged:** staged_plan.md` — lets `task-impl`'s Resume know without moving the blocks. **REFINE → the pointer.** ACTIONABLE (Q3/Q4).

**T3 — Inversion-Q4: a minimal state record instead of pure derivation.**
Novelty: the migrations-table pattern. Scrutiny: Sensemaking killed "a state file" because `where_we_left` bloated — but it bloated because it was *prose*; a fixed-schema table, one line per stage, cannot accrete. Derivation's two hidden couplings (Decomposition §5) are real and a table removes them. Two sources of truth? No — the table is written by whoever creates a folder; it is an index, not a copy. Mechanism independence: Inversion-Q4 + Domain (migrations) + Absence (issue tree) — three mechanisms; shared-input check: they share Decomposition's "derivation is fragile," so partially spurious, but migrations and the issue tree are external groundings. **REFINE → a bounded stage table inside `staged_plan.md` itself** — `| Stage | Folder | Status | Since |` — no separate file, no prose, cannot grow past one line per stage. ACTIONABLE. **RE-TEST TRIGGER** on Sensemaking Ambiguity 3 ("no state file; status derived"): refined, not reversed — no separate file stands; "derived only" does not.

**T4 — Inversion-Q5: `task-impl` runs staged tasks; the staging skill never orchestrates.**
Novelty ✓ — dissolves the A/B decision. Scrutiny: `task-impl` is 323 lines and the user demands leanness — but this is one Resume row plus a ~15-line section. It couples `task-impl` to a sibling's format — it already reads `critic.md`'s verdict and `task-plan`'s Blockers by design. Who revises later stages? Not `task-impl`; at stage completion it invokes the staging skill the way it invokes `task-plan`, then continues. Fertility: high — the generator stays pure (A), the orchestrator stays the orchestrator, and "no re-prompting" is met because `task-impl` runs the whole staged task end to end. Actionability ✓. Mechanism independence: Inversion-Q5 + Combination-contrarian (Decompose and staging are one mechanism in `task-impl`) + Lens-focused (REORDER's twin lives in the `critic-d`/`task-impl` world) — three mechanisms, and the shared ground ("`task-impl` is the orchestrator") is an established fact, not an upstream assumption. **SURVIVE — ACTIONABLE.** **RE-TEST TRIGGER** on Sensemaking Ambiguity 2 (A/B open): resolved — *the skill is A; the system is B.*

**T5 — Lens-contrarian: add reversibility to the trigger.**
Scrutiny: in the SDK case Stage 5 was rewritten *before* it was built — cheap; the expensive case is building on the wrong assumption. So what matters is the cost of unwinding later-stage work. **REFINE Q1:** stage when later parts cannot be planned until earlier are established **and** building on a wrong assumption would be expensive to unwind. Strengthens "default don't stage." ACTIONABLE.

**T6 — Lens-focused: phrase the trigger as REORDER's question.**
Scrutiny: writing the one-shot plan to find out defeats the purpose — but you don't run `critic-d`, you ask its question: *is there a premise whose test would land after dependent build?* Same probe as "write step 1 of the last part," now anchored to an existing mechanism. **REFINE Q1 wording.** ACTIONABLE.

**T7 — Constraint-ADD: ~15-line soft cap per block.**
Scrutiny: Stage 5 needed more — but its §13 block was 14 lines; the 130 were state and discoveries that now live elsewhere. Evidence sets the number. **REFINE Q3:** about the length of a §13 block, ~15 lines; a stage needing more is probably two stages (feeds Q2's imbalance check). ACTIONABLE.

**T8 — Constraint-REMOVE: drop confirm.**
Scrutiny: the staged plan has no critic. `task-impl` auto-implements a plan `critic-d` already attacked; the staged plan is attacked by nothing but the user's eye. A wrong cut costs N pipeline runs. Fails. **KILL. Seed extracted → RESEARCH FRONTIER:** should `critic-d` run on the staged plan itself (its gates as a premise inventory), making confirm optional?

**T9 — Domain (trials): Gates pre-registered — written at plan time, frozen once the stage starts.**
Scrutiny: a gate may be wrong — fix by annotation `[gate revised: reason]`, original visible; the same instinct as `DEPRECATED_`. Independence: also FP4 (disclosure ≠ closure) from Sensemaking — external domain + internal principle. **SURVIVE — ACTIONABLE Q3 rule.**

**T10 — Absence: the cut's "why this seam" is lost at Q2→Q3.**
Scrutiny: a new field is bloat; folding it into Builds' first sentence loses nothing if made a convention. **REFINE Q3:** *Builds opens with why this is its own stage.* Not a field. ACTIONABLE.

**T11 — Absence: a done stage's Leaves-established turns out false.**
Scrutiny: none — it happened (Stage 4→5). **SURVIVE — ACTIONABLE Q4 rule:** a done block accepts exactly one edit, `[actual: …]` on Leaves-established.

**T12 — Absence-contrarian: a merge tag.**
**SURVIVE — ACTIONABLE Q3:** tag set gains `[merged into stage N: reason]`.

**T13 — Inversion-Q2: cut where what-is-established changes.**
Scrutiny: coupling is observable, confidence is a feeling — but "what is established" is observable (it is the Leaves-established edge), and it explains Stage 0 (it establishes the baseline facts). Coupling perception remains the *method* for finding those points. **REFINE Q2 wording.** ACTIONABLE.

**T14 — Inversion-Q6: a roadmap mode.**
Scrutiny: `roadmap`'s identity is status triples in the node (state in the plan — excluded here), vague end states, node expansion into L3 sub-nodes, "a map not a plan." A staged plan has a fixed end and is executed. The field overlap is real (~60%: produces ≈ Leaves-established, why-this-order ≈ dependency). **REFINE Q6:** state the relationship — a staged plan is a roadmap whose end is a fixed task, whose nodes carry gates instead of status, and which is executed rather than navigated. Not a mode. ACTIONABLE.

**T15 — Extrapolation-generic: universal wrapper, N=1.**
Scrutiny: a 1-stage plan is a `desc.md` with a gate — which `desc.md` already has (success criteria). Nothing to add. **KILL. Seed extracted:** `desc.md`'s success criteria *are* a one-stage gate; the staged plan is what you write when success criteria cannot be stated for the whole at once — a clean line for Q1's exit.

**T16 — Combination-generic: re-run = `meaning-gaps` on stage N+1.**
Scrutiny: under T4 each stage runs its own pipeline, which (for features, per CONTRIBUTING §2) already includes traverse and gap-finding. Redundant as a separate mechanism. **DEFERRED → folded into T4** as a clarification: the staging skill's re-run revises blocks from what each stage's own pipeline found; it does not run gap-finding itself.

**Not carried to test (restatements or already covered):** Lens-generic (uncertainty-not-size — absorbed by T5/T6), Combination-focused (gate list = premise inventory — absorbed by T8's frontier), Constraint-ADD-contrarian (shippable — self-rejected for verifiable), Constraint-REMOVE-second (parallel stages — confirms Q2: independent pieces are separate tasks), Absence-redesign typed interface (DEFERRED: heavier than the user wants; revival trigger — two or more stage-interface failures in practice), Absence-redesign issue tree (grounds T3), Domain-improv (grounds T1's kill and T9), Extrapolation-focused (confirms nothing to add), Extrapolation-contrarian (fails: the SDK fact was world-uncertainty, not model limitation — trigger robust).

---

## Assembly Check

Survivors together produce an architecture no single mechanism proposed:

> **The staging skill is a pure generator. `task-impl` is the stage runner.**
> `task-plan-staged` writes `staged_plan.md` — a bounded stage table plus §13-shaped blocks under a ~15-line cap, gates frozen at plan time — and a one-line `**Staged:**` pointer in `desc.md`. `task-impl` reads the pointer, finds the first non-done stage in the table, creates its folder, seeds its `desc.md`, runs the normal chain, and on completion invokes the staging skill to revise later blocks before continuing. The user's two goals are served by two components: no bloat by the generator, no re-prompting by the runner.

This is emergent: Sensemaking left A/B open as one skill's choice; the assembly splits the goals across two skills, which is not a position any single candidate occupied.

**Axis coverage.** Six orthogonal axes, each with variants in the candidate set: artifact shape (file / section / none), state location (none / derived / table / file / issue tree), orchestration (skill / `task-impl` / human), trigger (size / dependency / reversibility / REORDER), cutting principle (coupling / confidence / knowledge boundary / consistency / evidence), gate semantics (editable / frozen-annotated). No single-axis set.

**Per-row mechanism trace** (Production-task): every piece Q1–Q6 received mechanism work and appears in the test log — see telemetry below.

---

## Dispositions

| Candidate | Disposition |
|---|---|
| T4 `task-impl` runs stages; skill generates only | **ACTIONABLE** — resolves the open Process decision |
| T3 bounded stage table inside the plan | **ACTIONABLE** — refines Sensemaking Ambiguity 3 |
| T2 `**Staged:**` pointer in `desc.md` | ACTIONABLE |
| T5 + T6 trigger: dependency **and** reversibility; REORDER's question | ACTIONABLE |
| T7 ~15-line soft cap per block | ACTIONABLE |
| T9 gates frozen at plan time, annotated after | ACTIONABLE |
| T10 Builds opens with why-its-own-stage | ACTIONABLE |
| T11 `[actual: …]` — the one edit a done block accepts | ACTIONABLE |
| T12 `[merged into stage N: reason]` tag | ACTIONABLE |
| T13 cut where what-is-established changes | ACTIONABLE (wording) |
| T14 roadmap relationship stated precisely | ACTIONABLE (Q6 wording) |
| T16 re-run reads each stage's pipeline output | DEFERRED → folded into T4 |
| typed stage interfaces | DEFERRED — revival: ≥2 stage-interface failures in practice |
| rollback / `down` per stage | DEFERRED — revival: a stage is actually unwound in practice |
| `critic-d` on the staged plan itself (gates = premise inventory) | RESEARCH FRONTIER |
| T1 no plan document | KILL — seed: plan ≈ folder index |
| T8 drop confirm | KILL — seed → the frontier above |
| T15 universal wrapper N=1 | KILL — seed: success criteria are a 1-stage gate |

**RE-TEST TRIGGERS for Critique:** T4 against Sensemaking Ambiguity 2; T3 against Sensemaking Ambiguity 3.

---

## Mechanism Coverage (Telemetry)

- Generators applied: **4 / 4** (Combination, Absence Recognition — both levels, bidirectional; Domain Transfer — native + two foreign; Extrapolation)
- Framers applied: **3 / 3** (Lens Shifting; Constraint Manipulation — ADD ×2, REMOVE ×2; Inversion — depth-iterated to L3, multi-axis, piece-level at Q2–Q6)
- Convergence: **YES** — 3 mechanisms on "`task-impl` is the runner" (Inversion-Q5, Combination-contrarian, Lens-focused); 3 on "bounded state record" (Inversion-Q4, Domain-migrations, Absence-issue-tree)
- Survivors tested: **16 / 16** carried; 11 ACTIONABLE, 3 DEFERRED, 1 FRONTIER, 3 KILL with seeds
- Methodology mode: inherited Standard/Production-task; alternative Contrarian-rethink considered; decision default (reason recorded in Phase 1)

**Per-piece log:**
- Q1: [Lens:content ×3, Extrapolation:content] — meta-decision (iv) — Inversion compliance: **satisfied** (Lens-contrarian inverts the criterion)
- Q2: [Inversion:content, Constraint-REMOVE, Domain ×2] — meta-decision (ii) — **satisfied**
- Q3: [Inversion:**intervention-shape** (ADD-CONTENT → REORGANIZE), Constraint-ADD, Absence ×2, Domain] — (v) — **satisfied**, axis aligned
- Q4: [Inversion:**intervention-shape** (DO-NOTHING → ADD-CONTENT), Domain, Absence ×2] — (v) — **satisfied**, axis aligned
- Q5: [Inversion:**intervention-shape** (ADD → REPAIR `task-impl`), Constraint-REMOVE, Combination] — (v) — **satisfied**, axis aligned
- Q6: [Inversion:content, Extrapolation] — meta-decision (i) — **satisfied**

- Failure modes observed: **none.** Contrarian variants generated per mechanism; the two most uncomfortable candidates (T1 kill the artifact, T8 drop confirm) were tested with care and killed on structure, not comfort; survivors include a frame-dissolving result (T4), so this is not survival bias toward the incremental.

**Overall: PROCEED.**
