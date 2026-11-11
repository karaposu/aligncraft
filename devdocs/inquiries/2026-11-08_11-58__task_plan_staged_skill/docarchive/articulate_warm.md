# Articulate Warm — task-plan-staged skill

## User Input
`devdocs/inquiries/2026-11-08_11-58__task_plan_staged_skill/_branch.md` + `…/surfacing.md` + `…/articulate_simple.md`

## Consumed

**Constraints (cold MQ answers):** the cold MQ1/MQ3/MQ4 lists rule out wrong readings; Deconstruct's deliverable-shape — a skill file that specifies an output format plus a "big enough to stage" test — holds task-identity. **Information (surfaced material):** 42 trace rows across R1–R6; the load-bearing find is R5, a real staged-plan execution (`voice_update/`), plus R4's pipeline and weight definitions and R6's unstaged contrast case.

**Warm round:** 0 (first warm pass on the first surface).

---

## Item I1

### MQ2 — re-anchored (committed context-need)

The task bears on these project facets, now named:

1. **`task-impl`'s input contract** — a folder containing `desc.md`, a `desc.md` path, or a raw description (R1 item 1). A stage is dispatchable only once it has become a folder with a `desc.md`. This fixes the dispatch seam.
2. **`task-plan`'s per-step schema** — Proposed changes / Output / Safe in nature / Peripheral concepts / Hardness Lvl (R1 item 2). "A couple more fields per step or per stage" is relative to this; the *step* already has its fields, so the open design is the *stage's* fields.
3. **The folder layout practice already uses** — a parent folder for the staged plan (`devdocs/voice_update/`) and one work folder per stage (`devdocs/work/120-…`, `122-…`, …) each run through the full pipeline (R5 items 30, 37).
4. **"Run full traverse" is literal** — CONTRIBUTING §2 runs `/traverse` before `desc` for every feature; the voice_update proposal itself came from a traverse (R4 item 27, R5 item 29). Each stage, being feature-sized, gets the whole §4 chain including traverse.
5. **The lightweight stage shape exists and is proposal §13** — each stage = a name + 1–3 paragraphs of direction + a **Gate** phrased as what does *not* count as completion. No steps. ~15 lines per stage (R5 item 28). The 172KB impl plan (item 30) is the shape that accreted when steps for *all* stages were written up front; it is the bloat the request is reacting against.
6. **"Big enough to stage" is not the weight axis.** Weight (light/heavy: blast radius, observability, consumers, model contact, reversibility) is orthogonal — #180 was issue-heavy and unstaged (R4 item 24, R6 item 40). What actually forced staging in R5: stage N+1 could not be planned until stage N existed (Stage 5 rewritten against the SDK after Stages 0–4 landed; `meaning_gaps3` surveyed Stage 5 only as it approached — items 30, 32). The anchor for the test is **sequential dependency of understanding**.
7. **A stage is both a planning unit and an implementation unit** — each became its own issue + branch with its own desc / plan / critic, and was built (item 37). One stage ≈ one `task-impl` run's worth; a stage may further split into *slices* (#132).
8. **The staged plan is living, not write-once** — later stages are revised when earlier stages land ("Revision 3 rewrites Stage 5"; "Stages 6–8 … have not been reviewed by the four Stage 0–3 critics" — item 30); `where_we_left.md` is the hand-maintained cross-stage state (item 33).
9. **A stage is declared done by its gate, and in practice by the owner** — named checkpoints (Realtime, Orders, Two-engine, Mobile) were declared on dates (items 30, 33). `task-impl`'s Verify is a component; the stage gate is a level above it and may need a human.
10. **The cutting discipline exists** — `decompose` (coupling map → boundaries → pieces-as-questions → interfaces → dependency order; stopping criteria; failure modes incl. imbalanced decomposition) (R2 item 12). **The prerequisite shape exists** — CONTRIBUTING §4.5: "smaller and more certain than what it unblocks"; instrument / extract / build the ground / build the instrument; Stage 0 baseline-freeze is this shape (R4 item 25, R5 item 28). **The adjacent artifact exists** — `roadmap`, "a map, not a plan," nodes with a status triple and why-this-order (R1 item 6); its boundary with a staged plan must be drawn, not assumed.

### Material-change judgment → FIXPOINT

The committed context-need names no territory the first surface did not already cover. It sharpens *within* R5 (item 30's stage-header blocks, flagged F1) rather than moving to a different region. Same target, deeper — not a re-surface trigger. **Anchor settled at round 0; zero re-surfaces.** F1 remains the one depth-read downstream may want: *what sits between each stage title and its first step in the impl plan, Stages 1–8* — the stage-level field set the user converged on in practice.

### On-trigger re-runs

**MQ4 — boundary (re-run; context moved it).** identified-ambiguities-list (NOT-list), warm:
- *carried from cold:* not bloated; not a full detailed plan up front; not "just description"; not unnecessary concrete requirements; not complicated; not a plan that must adapt wholesale on one failure; not self-describing in the skill file.
- *new, from surfaced reality:*
  - NOT the weight axis — "big enough to stage" must not collapse into heavy/light (items 24, 40).
  - NOT the impl-plan shape — the skill does not emit steps for all stages up front; that is item 30, the thing being corrected.
  - NOT a replacement for `roadmap` — roadmap maps terrain with status; a staged plan sequences gated deliverables (item 6).
  - NOT a replacement for `decompose` — decompose is the cutting discipline; the staged plan consumes a cut or performs a light one (item 12).
  - NOT `task-impl`'s Decompose — that is reactive (after three rejections, spawn prerequisites); staging is proactive (item 1).
  - NOT a re-implementation of warm / triage / PR gates — CONTRIBUTING wraps those around the chain; the skill sits inside it (item 23).
  - NOT *completion* requirements — the §13 gates ARE concrete, and they are completion tests, not implementation prescriptions. The cold exclusion "unnecessary concrete requirements" is about the latter.

**MQ1 — verdict-axis (re-run; context moved it).** identified-ambiguities-list, warm:
- `generate-only` vs `generate → confirm → dispatch` — practice (APPENDIX4 §Alternative, item 14) inserts a **human confirmation** between the stage plan and any per-stage work; the cold pass had no confirm step.
- `new-standalone-skill` vs `orchestrator-above-task-impl` — practice weakens `mode-of-task-plan`: the stage plan was a separate document (the proposal) that `task-plan` was later run *against*, per stage.
- `one-shot generator` vs `re-runnable stage-advancer` — practice re-planned later stages after earlier ones landed; the skill may be something you run once per stage boundary, not once per task.

**MQ3 — intent-axis, WHAT (re-run; context moved it).** identified-ambiguities-list (action-endpoints), warm:
- *carried:* a staged-plan artifact exists; each stage is dispatched to `task-impl`; a plan that survives early-stage failure; the stage/step schema is defined.
- *new:* `per-stage work folders exist` (the dispatch target, item 37); `a cross-stage state record exists` (`where_we_left`, item 33 — the cold pass did not see this endpoint); `each stage carries a gate` (item 28); `later stages are marked provisional until earlier ones land` (item 30).

**MultiDepth — WHY-axis (re-run; context moved it).** identified-ambiguities-list, warm:
- *carried:* eliminate repeated prompting; contain failure blast radius; defer detail until grounded; give each stage full rigor; codify an existing habit.
- *new:* `keep-later-stages-revisable` — Stage 5 was rewritten against a discovered SDK; the motivation is to *not* lock later stages (item 30). `create-owner-decision-points` — gates and checkpoints were declared by the owner on dates; staging manufactures those moments (items 28, 33). `bound-planning-cost` — 103 files / 31,291 lines were read to plan the whole thing (item 35); staging could bound what must be read per stage.

**MQA (re-run; four ops moved).**
- **reconcile** — MQ1's `confirm` step, MQ3's `gate`, and WHY's `owner-decision-points` span one axis: **where the human sits in a staged plan** (before dispatch; at each gate; at checkpoints).
- **reconcile** — MQ4's "not roadmap" and MQ3's `cross-stage state record` span one axis: **how cross-stage state is represented** (roadmap's status triple vs `where_we_left`'s prose vs something new).
- **reconcile** — MQ1's `re-runnable stage-advancer`, MQ3's `later stages provisional`, and WHY's `keep-later-stages-revisable` span one axis: **living-ness** — the plan is revised at stage boundaries.
- cold reconciliations (orchestration-scope; failure-robustness) **carry**; orchestration-scope is now sharpened by the confirm step.
- ALIGNED otherwise.

### Conflict-detection

identified-conflicts-list — **two, both resolvable by re-anchoring; neither severe.**

1. **"Stages are maybe concepts to build"** (request) vs **stages are gated deliverables that *reference* concepts** (reality, item 28: Stage 0 baseline, Stage 1 engine boundary, Stage 2 ownership separation … each with a Gate; the *concepts* live in proposal §5–§9 and the stages cite them). Re-anchor: **a stage is an ordered deliverable with a gate, built from concepts** — the user's own "maybe" leaves room for this. Not adjudicated; Sensemaking settles what a stage *is*.
2. **"Combined with task-impl for each step"** (request) vs **the dispatch unit was the stage, not the step** (reality, item 37: Stage 7 = Steps 29–32 = one issue #156). Re-anchor: **the dispatch unit is the stage** (or a slice of one). The user also says "for each part I'm running task implement," which agrees.

Also noted, **not a conflict**: the request's "no bloat" is a reaction to the user's *own* prior artifact (the 172KB plan). The request partly corrects the practice it codifies — the skill should emit §13's shape, not item 30's.

**`content-conflict`: MED — resolvable.** No clarifying question required; the re-anchors above resolve both. Runner may proceed.

### Rephrase — refreshed considered articulations

Bounded by: deliverable shape (skill file + stage-plan format + "big enough" test); the re-anchored dimensions (orchestration-scope incl. confirm; packaging; living-ness; schema; cutting method; human-position); the warm NOT-list; surfaced vocabulary.

1. **§13-shaped generator, hand-dispatched.** `task-plan-staged` reads a big task's `desc.md` (and its traverse finding if present) and writes `staged_plan.md` in proposal §13's shape: each stage = name + direction + Gate. No steps. A "big enough" test — sequential dependency of understanding — gates whether it runs at all. The human confirms, creates per-stage work folders, runs `task-impl` on each.

2. **§13-shaped generator + per-stage folder dispatcher, one stage live at a time.** Same plan; after the user confirms, the skill creates `devdocs/work/<N>-<stage-slug>/` for stage 1 only, derives its `desc.md` from the stage's direction + gate, and runs `task-impl` on it. Re-run at each stage boundary: it reads what stage N produced, revises stages N+1… if needed, then dispatches N+1. Folds cold variants 2 and 3, which is what practice did by hand.

3. **Living stage plan with an explicit state file.** `staged_plan.md` (§13 shape) plus `_stage_state.md`: which stage is live, which gates are declared and by whom, what was deferred-on-blast-radius with its revisit trigger, which later stages need revising. The skill maintains the state file as much as it generates the plan — `where_we_left.md`, made a schema.

4. **A `--staged` flag on `task-plan` that emits stage headers instead of steps.** Runs Phase 0–1 (resolve desc, Huge Hard Blockers), then writes stage blocks (name / direction / gate) in place of steps; each block later becomes a normal `task-plan` run's input. Reuses the gate and frontmatter. Weakened by practice — the stage plan was a separate document, not a `task-plan` output.

5. **Schema-first and thin.** The skill text is mostly: the stage schema `{builds, why-its-own-stage, leaves-established-for-next, gate}`, the "big enough" test, and the dispatch seam (stage → `desc.md`). Steps are not in this document at all — they are `task-plan`'s, per stage, later.

6. **Decompose-lite + §13 + prerequisite marking.** The skill runs a light coupling-perception pass (decompose's perceive → detect boundaries → order by dependency) to find where the stages fall, writes them in §13's shape, and marks any stage that is a §4.5 prerequisite — "smaller and more certain than what it unblocks" — including Stage 0 baseline-freeze whenever the task touches a live system. Imbalanced decomposition (one stage is 80% of the work) is a named failure to check.

### Carried unchanged

- **Itemize:** count 1, item I1.
- **Deconstruct:** (deliverable: skill file that specifies an output format; kinds: markdown skill + staged-plan format + "big enough" test; bounds: planning layer only, between `task-desc` and `task-impl`, a couple of fields per stage, not a per-step spec).
- **MultiDepth literal:** as in `articulate_simple.md`.

---

## Self-assessment

LAYER 1: Mode 1 no · 2 no · 3 no · 4 no · 5 no (MQ2 committed with verdict/kinds/stance facets named) · 6 no · 7 no (MQ2's commitment is the sanctioned warm anchor; all other MQs remain 2-shape) · 8 no · 9 no. Warm-specific: false-positive-conflict no (both flagged items are request-wording vs practice-shape mismatches, re-anchored, not gaps) · crying-wolf no (one MED, no HIGH) · adjudicate-instead-of-identify no · ignore-the-trigger no (each re-run names the surfaced content that moved it).

**Loop:** round 0 · fixpoint · 0 re-surfaces · anchor settled · F1 carried as an optional depth-read for Sensemaking.

**Verdict: MED-FLAG** — `content-conflict: MED, resolvable` (two re-anchors; no question payload). Proceed.
