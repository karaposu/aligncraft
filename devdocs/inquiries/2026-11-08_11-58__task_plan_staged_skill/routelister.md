# Routelister — task-plan-staged skill

## User Input
`devdocs/inquiries/2026-11-08_11-58__task_plan_staged_skill/`

**Territory:** this inquiry's artifacts — `_branch.md`, `articulate_simple.md`, `surfacing.md`, `articulate_warm.md`, `sensemaking.md`, `decomposition.md`, `innovation.md`, `critique.md` — plus the sources they point into that were in view this run (listed under Sources).
**Goal (received from `_branch.md § Goal`):** a skill definition file in the pack's idiom that itself specifies the staged-plan format and a "big enough to stage" test; planning layer only; sits between `task-desc` and `task-impl`; a couple of fields per stage; not bloated.
**Mode:** root / project-space (breadth). **Entry:** fresh (no `_route.md` existed).

## Map Header
- Identities: **22** · High-priority: **11** · Essential (`core`): **11** (supporting 6 · peripheral 5)

## Route Index

| # | Direction | engagement-type | Priority | Essentiality | ✓ |
|---|---|---|---|---|---|
| R1 | the staging trigger and its exit | DEVELOP | HIGH | core | |
| R2 | the cut method | DEVELOP | HIGH | core | |
| R3 | Stage 0 and the grounding-vs-status evidence distinction | REFINE | MED | supporting | |
| R4 | the stage block schema | DEVELOP | HIGH | core | |
| R5 | the gate form and its lifecycle | DEVELOP | HIGH | core | |
| R6 | the `staged_plan.md` artifact | DEVELOP | HIGH | core | |
| R7 | the folder index and status derivation | DEVELOP | HIGH | core | |
| R8 | the tag grammar | DEVELOP | MED | core | |
| R9 | the seed mapping, block → `desc.md` | DEVELOP | HIGH | core | |
| R10 | the re-run revision procedure | DEVELOP | HIGH | core | |
| R11 | the confirm gate | DEVELOP | HIGH | core | |
| R12 | the `task-impl` stage runner | DEVELOP | HIGH | supporting | |
| R13 | the hand-dispatch handoff | DEVELOP | MED | supporting | |
| R14 | the skill's name | REFINE | MED | supporting | |
| R15 | the boundaries statement | DEVELOP | LOW | supporting | |
| R16 | the skill file's section order and idiom | DEVELOP | HIGH | core | |
| R17 | schema replay against the real §13 stages | TEST | MED | supporting | |
| R18 | the Level-2 placement recorded in the pack | DEVELOP | LOW | peripheral | |
| R19 | `critic-d` on the staged plan itself | INVESTIGATE-FRONTIER | LOW | peripheral | |
| R20 | typed stage interfaces | PURSUE-SEED | LOW | peripheral | |
| R21 | per-stage rollback | PURSUE-SEED | LOW | peripheral | |
| R22 | Decompose reusing the staging skill | PURSUE-SEED | LOW | peripheral | |

## Routes

### R1 — the staging trigger and its exit
- Direction: the staging trigger and its exit
- Goal: the skill says when staging applies and says no cleanly
- engagement-type: DEVELOP
- Move: write the opening section — the user's sentence as the test, the probe ("write the first step of the last part — does it depend on something only an earlier part will decide or reveal?"), the cost tiebreaker for an unclear probe, the don't-stage default, the exit "this does not need staging — run `task-plan`", weight named as not the test, and the input contract (folder with `desc.md`; traverse finding read if present; raw description → `task-desc` first)
- Lands: a front door that refuses ceremony for tasks that do not need it
- Basis: [S5] — "you cannot really plan it fully without actually initial parts are more concrete and established" (defines the trigger in the user's words)
- Basis: [S3] § C4 — cost is "the tiebreaker, not a conjunct"; REORDER "a one-line note, not the probe" (corrects the Innovation form)
- WHY: without a sharp trigger the skill runs on everything and the goal's "not bloated" fails at the system level; the goal gains a skill that is cheap to have installed
- Priority: HIGH · Confidence: MED · Essentiality: core
- Guidance Mode: compact
  - "state the default's reason in one line: REORDER catches under-staging; nothing catches over-staging" (bc the reason is what makes the default stick)
  - Meaning-gaps:
    - no calibration data for the probe — [mid] — a wrong threshold either stages trivial tasks or misses real ones; one obvious phrasing, not deferable
    - the degenerate exit from the cut (≤1 stage) loops back here — [low] — one sentence; easily added later
- Depth-link: none

### R2 — the cut method
- Direction: the cut method
- Goal: stages found at real seams, ordered, balanced
- engagement-type: DEVELOP
- Move: write the method section — the coupling probe ("if this part changes, must that part change?"), the boundary rule (a seam is a stage boundary only when what-is-established changes across it; otherwise parallel work, a separate task), dependency order, the imbalance check, the Stage 0 rule, the degenerate exit, and the named `decompose` subset (perceive · detect · order · balance)
- Lands: an ordered list of stage candidates that fill the schema
- Basis: [S2] § Q2 (establishes the criteria list) · [S3] § C10 (adds the two-part boundary rule)
- WHY: the cut is where "a couple of fields per stage" either describes a real unit or a step with a big name; the goal gains stages that `task-impl` can actually run one at a time
- Priority: HIGH · Confidence: HIGH · Essentiality: core
- Guidance Mode: compact
  - "keep the question tree and 7-dimension evaluation out" (bc the full `decompose` is heavier than this needs — [S1] SP5)
- Depth-link: none

### R3 — Stage 0 and the grounding-vs-status evidence distinction
- Direction: Stage 0 and the grounding-vs-status evidence distinction
- Goal: a forbidden-fields rule that does not forbid what Stage 0 exists to record
- engagement-type: REFINE
- Move: sharpen "evidence pointers are forbidden" into: pointers that *record status* (what has been done) are forbidden; pointers that *ground a baseline* (what exists before anything moves) are Stage 0's content
- Lands: a rule that the real Stage 0 block passes
- Basis: [S6] § Stage 0 — "The [dated verification record](2026-09-12_merge_update.md#verification) has 1,320 passing suite cases…" (records that the lightweight shape's own Stage 0 carries an evidence link)
- Basis: [S1] § Ambiguity 4 — "Forbidden — status, evidence pointers, hardness, steps" (defines the rule being refined)
- WHY: as written the rule would reject the one real example the shape is drawn from; the goal gains a schema that survives contact with its own evidence
- Priority: MED · Confidence: MED · Essentiality: supporting
- Guidance Mode: compact
  - "phrase it as a test, not a list: does the pointer say what *is*, or what *was done*?" (bc a test travels to cases a list cannot)
- Depth-link: none

### R4 — the stage block schema
- Direction: the stage block schema
- Goal: four required fields, two optional, a forbidden list, with the Builds shape settled
- engagement-type: DEVELOP
- Move: write the schema — **Stage N — name · Builds · Gate · Leaves established**; Builds = one sentence on why this is its own stage, then what to build as prose or 3–6 directional items; optional **Concepts** · **Checkpoint**; forbidden: `task-plan` steps (numbered, fielded, hardness-scored), status, status-evidence
- Lands: the contract every other section fills or reads
- Basis: [S5] — "steps still give enough good direction about the what to build… maybe we can add some a couple of more fields per step or per stage" (establishes that direction-items belong inside a stage)
- Basis: [S3] § Phase 0 P2 — "This premise does not hold as stated" (corrects the earlier no-steps rule into no-`task-plan`-steps)
- WHY: the schema is the product — the goal is a format; without it there is no skill
- Priority: HIGH · Confidence: MED · Essentiality: core
- Guidance Mode: compact
  - "one line of guidance per field, no more" (bc the skill text must be as lean as the plan it emits — [S1] C6, FP5)
  - "present the shape as proposed, for confirmation" (bc it rests on one real instance — [S1] Ambiguity 7)
  - Meaning-gaps:
    - the §13 shape is single-instance; fit against other staged tasks unknown — [mid] — a wrong shape reworks every block; one obvious shape; not deferable
    - Checkpoint semantics (who declares, when) — [low] — optional field; stub safely
    - what Concepts points at when no proposal document exists — [low] — optional; stub safely
- Depth-link: none

### R5 — the gate form and its lifecycle
- Direction: the gate form and its lifecycle
- Goal: gates that name an observation and cannot be quietly rewritten
- engagement-type: DEVELOP
- Move: write the Gate rule — what must be observably true, and what does **not** count as done; editable while the plan is a draft; frozen from confirmation; changed afterwards only by a `gate revised` tag that keeps the original visible
- Lands: gates that are tests, not aspirations
- Basis: [S1] § KI3 — "Gates were phrased as refusals of false completion" (establishes the form from practice)
- Basis: [S3] § C6 — "freezing begins at confirmation" (corrects "frozen at plan time")
- WHY: FP4 — disclosure is not closure; the goal gains stages whose "done" is checkable by `task-impl`'s Verify and by the next stage
- Priority: HIGH · Confidence: HIGH · Essentiality: core
- Guidance Mode: compact
  - "quote one real gate as the exemplar" (bc the form is distinctive and easier shown than described — [S6] Stage 0: "a blanket claim that the current system is regression-free is not an acceptable baseline")
- Depth-link: none

### R6 — the `staged_plan.md` artifact
- Direction: the `staged_plan.md` artifact
- Goal: one file, bounded by construction
- engagement-type: DEVELOP
- Move: specify the output file — frontmatter `model` / `effort`; the trigger verdict; the folder index; one block per stage at ~20 lines (above ~25 → probably two stages); the `**Confirmed:**` line; location in the task's folder; nothing else
- Lands: a plan a reader can hold in one screen per stage
- Touches: `staged_plan.md` (the only file the skill writes on a first run) · frontmatter (same stamp pattern as `task-plan` and `critic-d`)
- Basis: [S6] — stage blocks measured 9 / 18 / 15 / 16 / 24 / 15 / 10 lines in this run (establishes the cap's envelope; supersedes Innovation's "8–16")
- WHY: the 204-line Stage 5 header is what the user does not want again; the goal gains an artifact whose shape makes bloat visible the moment it starts
- Priority: HIGH · Confidence: HIGH · Essentiality: core
- Guidance Mode: compact
  - "cap is soft and evidence-derived; say so" (bc a hard number invites gaming, a grounded one invites judgment)
  - Meaning-gaps:
    - where the `Confirmed:` line sits (frontmatter vs body) — [low] — either works; deferable
    - whether the trigger verdict is kept in the file after a "stage" answer — [low] — one line; deferable
- Depth-link: none

### R7 — the folder index and status derivation
- Direction: the folder index and status derivation
- Goal: a runner or a human can find the next stage without the plan recording state
- engagement-type: DEVELOP
- Move: specify the index `| Stage | Folder |` (one row per stage, written by whoever creates the folder) and the derivation on read — no folder → pending; folder, no done-marker → live; done-marker → done; `[deferred]` tag → deferred; done-marker tolerant (Verify passed, or `pr-critic` Gate MERGES, or the user says so)
- Lands: status that is always current because it is never written
- Basis: [S3] § C3 — "a folder index… No status column, no dates. Status is derived on read" (defines the refined form)
- Basis: [S2] § 5 — the two hidden couplings (folder naming under A; folders on excluded branches) (establishes why a bare convention was not enough)
- WHY: this is the containment mechanism against the `where_we_left` pattern; the goal gains a plan that stays Level 2 across a run of many stages
- Priority: HIGH · Confidence: MED · Essentiality: core
- Guidance Mode: compact
  - "the index carries only what folders cannot show" (bc anything derivable and written can disagree with its source)
  - Meaning-gaps:
    - done-marker when a human runs a stage outside `task-impl` (no Verify record) — [mid] — a wrong "done" starts the next stage early; the user-says-so fallback exists but must be stated
    - default folder name when the human creates it — [low] — the index row records whatever was used
- Depth-link: none

### R8 — the tag grammar
- Direction: the tag grammar
- Goal: a closed vocabulary that is the only way a confirmed plan changes
- engagement-type: DEVELOP
- Move: specify `[<event> after stage N: reason]` with six events — revised · deferred (revisit when …) · merged into stage M · added · gate revised · actual — and the rule that done blocks accept only `actual`
- Lands: every change to the plan is one line, dated by stage, with its reason
- Basis: [S3] § C9 — "one grammar… Six events, one shape. `added` closes U1" (defines the unified form)
- WHY: revisions-by-rewriting are how the manual plan grew; the goal gains a plan whose history is readable and whose size is bounded by events, not prose
- Priority: MED · Confidence: HIGH · Essentiality: core
- Guidance Mode: compact
  - "list the six events once, in the schema section, with one example tag" (bc a grammar is learned from one instance)
- Depth-link: none

### R9 — the seed mapping, block → `desc.md`
- Direction: the seed mapping, block → `desc.md`
- Goal: a stage becomes a `desc.md` with no judgment call
- engagement-type: DEVELOP
- Move: specify the mapping — Builds → Problem Statement + User Value; Gate → Success Criteria; "does not count" → Scope Boundaries; stage order → Priority; the previous stage's Leaves-established → the "what already exists" context — written directly, not via `task-desc` (whose Step 0 pauses for a location)
- Lands: a per-stage folder `task-impl` resolves exactly as it resolves any folder
- Touches: `desc.md` sections as `task-desc` names them (Problem Statement · User Value Proposition · Success Criteria · Scope Boundaries · Priority Level)
- Basis: [S7] § Resolve the folder — "A folder containing `desc.md` → use it" (establishes the seam's input)
- Basis: [S1] § SP4 — "The dispatch seam is mechanical" (establishes the mapping)
- WHY: the seam is the goal's own bound ("sits between `task-desc` and `task-impl`"); the goal gains stages that enter the normal chain unchanged
- Priority: HIGH · Confidence: HIGH · Essentiality: core
- Guidance Mode: compact
  - "name the five target sections exactly as `task-desc` does" (bc `task-impl` and `task-plan` read `desc.md` by those headings)
- Depth-link: none

### R10 — the re-run revision procedure
- Direction: the re-run revision procedure
- Goal: later blocks firm up from what earlier stages actually produced
- engagement-type: DEVELOP
- Move: write Resume for the skill — plan absent → generate; plan unconfirmed → wait; stage N done → read its folder (plan, critic, traverse finding, implementation record), revise later blocks by tags, report; all done → report complete; the plan is the only file written on a re-run
- Lands: a living plan whose only motion is tags
- Basis: [S2] § Q4 (establishes the resume table and what to read) · [S1] § KI7 — "living-ness was the bloat vector" (establishes the constraint)
- WHY: the user's failure-robustness ask — a wrong early assumption must not force the whole plan to adapt; the goal gains stages that are planned when they are grounded
- Priority: HIGH · Confidence: MED · Essentiality: core
- Guidance Mode: compact
  - "revise N+1 fully; later blocks only if a done stage's output touches them" (bc revising everything every time re-creates whole-plan adaptation)
  - Meaning-gaps:
    - how far ahead a revision reaches (N+1 only vs all later) — [mid] — too far re-plans unbuilt work; too near leaves stale blocks; two plausible rules; not deferable
    - which of a done folder's files are authoritative when they disagree — [low] — rare; state a precedence or defer
- Depth-link: none

### R11 — the confirm gate
- Direction: the confirm gate
- Goal: nothing becomes a folder before the user has seen the plan
- engagement-type: DEVELOP
- Move: specify `**Confirmed:** [date]` (or the user says so) as the precondition for any folder; before it, gates are editable and nothing dispatches; after it, a tag on the *next* stage's block re-opens confirmation for that block only
- Lands: the human gate the practice already has, made explicit and minimal
- Basis: [S8] — "we create stage by stage plan and once it is confirmed each stage is seperated in devdocs folder" (records the practice)
- Basis: [S3] § C1 — "if the next stage's block carries a new tag, stop and ask for confirmation of that block" (defines the re-confirm rule)
- WHY: the staged plan has no critic; confirmation is its only quality gate; the goal gains a plan that is never silently executed
- Priority: HIGH · Confidence: HIGH · Essentiality: core
- Guidance Mode: none
- Depth-link: none

### R12 — the `task-impl` stage runner
- Direction: the `task-impl` stage runner
- Goal: a staged task runs end to end from one invocation
- engagement-type: DEVELOP
- Move: add to `task-impl` a third pre-check — `staged_plan.md` present → stage runner — that finds the first non-done stage via the index, creates its folder, writes the index row and `desc.md` from the seed mapping, runs the ordinary chain *in that folder* (re-target, never nest), on completion invokes `task-plan-staged` to revise, pauses if the next block is tagged, otherwise continues; Abort stops the run; re-running resumes at that stage; plan unconfirmed → report and stop
- Lands: the per-stage re-prompting disappears; the staging skill stays a pure generator
- Touches: `skills/task-impl.md § Resume` (the two existing pre-checks: PARKED → Return; ≥3 REJECTED → Decompose) · a new short section beside Decompose and Return
- Basis: [S7] § Resume — "Two checks first, in this order. They decide whether the chain starts at all." (establishes where the pre-check belongs)
- Basis: [S3] § C1 — the six refinement directions (defines the runner's rules)
- WHY: the goal lands without it (option A); with it, the user's "I don't want to every time prompting" is met for the per-stage runs as well — a stronger landing, not a required one
- Priority: HIGH · Confidence: MED · Essentiality: supporting
- Guidance Mode: compact
  - "pre-check before the Resume table" (bc `desc.md`-only on the parent would otherwise start `task-plan` on the whole task)
  - "say 're-target' explicitly" (bc `Skill(task-impl)` inside `task-impl` is the mechanism the leanness rule forbids)
  - Meaning-gaps:
    - Abort inside a stage: resume at the stage vs re-plan it — [mid] — the two readings produce different Return behaviour; not deferable once the runner exists
    - a multi-stage run's length and interruptibility — [low] — Rule 9 already makes checkpoints informational; deferable
- Depth-link: none

### R13 — the hand-dispatch handoff
- Direction: the hand-dispatch handoff
- Goal: a staged task is runnable with no change to `task-impl`
- engagement-type: DEVELOP
- Move: write the Handoff section for the generator-only case — after confirmation the skill prints the first non-done stage's folder path and the `task-impl` command; the human creates the folder (or the skill offers to) and runs it; the index row is written when the folder is
- Lands: a complete skill under option A
- Basis: [S1] § Ambiguity 2 — "(A) generate → confirm → hand-dispatch" (defines the option)
- WHY: the goal's deliverable is the skill file; this is the smallest handoff that completes it, leaving the per-stage prompting in place
- Priority: MED · Confidence: HIGH · Essentiality: supporting
- Guidance Mode: compact
  - "write Handoff so that it reads the same whether a runner or a human performs it" (bc R12 and R13 share the index and the seed mapping)
- Depth-link: none

### R14 — the skill's name
- Direction: the skill's name
- Goal: a name that does not imply a relationship the design denies
- engagement-type: REFINE
- Move: settle `task-plan-staged` against alternatives (`stage-plan`, `task-stages`) in light of "not a mode of `task-plan`"
- Lands: a filename and an Appendix entry that match what the skill is
- Basis: [S2] § Q6 — "it implies the relationship this piece denies; alternatives offered" (records the flag)
- WHY: naming is the user's; the goal lands under any name — indirect, but a wrong name recurs in every invocation
- Priority: MED · Confidence: LOW · Essentiality: supporting
- Guidance Mode: compact
  - "decide before the installer arrays are edited" (bc renaming after install touches three files)
- Depth-link: none

### R15 — the boundaries statement
- Direction: the boundaries statement
- Goal: a short closing that prevents misuse
- engagement-type: DEVELOP
- Move: write "what this is not" — not a mode of `task-plan`; not `roadmap` (status is roadmap's primary output and is kept out of this plan); uses `decompose`'s perceive / detect / order / balance only; not `task-impl`'s Decompose (proactive vs reactive); not weight
- Lands: five lines
- Basis: [S3] § C11 — `roadmap.md:198` "Status is the primary output" (supports the roadmap line)
- WHY: indirect — the file works without it; it saves the next reader from running the wrong skill
- Priority: LOW · Confidence: HIGH · Essentiality: supporting
- Guidance Mode: compact
  - "one line each, no rationale" (bc design talk inside the skill file is on the NOT-list — [S5] via `_branch.md § Goal` MQ4)
- Depth-link: none

### R16 — the skill file's section order and idiom
- Direction: the skill file's section order and idiom
- Goal: `skills/task-plan-staged.md` written in the pack's idiom
- engagement-type: DEVELOP
- Move: assemble the sections in the dependency order — input + trigger (R1) → method (R2) → schema + artifact (R3–R8) → Resume (R10) → Handoff (R11, R13 or R12's counterpart) → what-this-is-not (R15) — standalone, no self-description, references only `task-desc`, `task-plan`, `task-impl`; model/effort stamp; smaller than `task-impl`
- Lands: the deliverable
- Touches: `skills/task-plan-staged.md` (new) · the model/effort frontmatter pattern as in `task-plan`
- Basis: [S2] § 6 — "As a skill-file structure: Q1 is the opening… Q6 a short closing" (defines the order)
- Basis: [S1] § C6 — "The skill file is lean, standalone, references only sibling skills" (defines the idiom)
- WHY: this is the goal
- Priority: HIGH · Confidence: HIGH · Essentiality: core
- Guidance Mode: compact
  - "write the schema section first and let the others reference it" (bc Q3 is the contract every other section fills — [S2] § 6)
- Depth-link: none

### R17 — schema replay against the real §13 stages
- Direction: schema replay against the real §13 stages
- Goal: evidence that the four fields and the ~20-line cap fit a real staged task
- engagement-type: TEST
- Move: rewrite the seven voice_update §13 stages in the new schema — does each yield a Builds, a Gate, a Leaves-established? does Stage 4 (24 lines) split? does Stage 0's evidence link survive R3's rule?
- Lands: the schema confirmed or corrected on the one instance it was drawn from
- Basis: [S6] (the test corpus; measured this run)
- WHY: the shape is single-instance evidence; the goal gains a format that has been fitted once before it is prescribed
- Priority: MED · Confidence: HIGH · Essentiality: supporting
- Guidance Mode: compact
  - "run it before writing the schema's guidance lines" (bc the replay tells you what the one-line guidance must say)
- Depth-link: none

### R18 — the Level-2 placement recorded in the pack
- Direction: the Level-2 placement recorded in the pack
- Goal: the pack's documentation knows it now has an Action-Space command
- engagement-type: DEVELOP
- Move: add the skill to the pack's surface — Appendix 8 entry, installer arrays (`install_claude.sh`, `install_codex.sh`), local install — and record in the book that Level 2 now has a command; keep this *out* of the skill file itself
- Lands: an installed, documented skill
- Touches: `src/APPENDIX8_Alignstack_Slash_Commands.md` · `install_claude.sh` · `install_codex.sh` · `~/.claude/skills/`
- Basis: [S9] item 18 — "a staged plan is a Level 2 (Action-Space) artifact… the one layer the pack has no command for" (establishes the placement)
- WHY: indirect — the skill works uninstalled from the repo; the goal's "in the pack's idiom" is only complete when the pack lists it
- Priority: LOW · Confidence: HIGH · Essentiality: peripheral
- Guidance Mode: none
- Depth-link: none

### R19 — `critic-d` on the staged plan itself
- Direction: `critic-d` on the staged plan itself
- Goal: a quality gate for the stage plan beyond the user's eye
- engagement-type: INVESTIGATE-FRONTIER
- Move: open the question whether `critic-d`'s Premise Inventory can key on stages instead of steps (each Gate as a premise; "first dependent step" → next stage)
- Lands: a yes/no on whether confirm can become optional
- Basis: [S4] § Dispositions — "RESEARCH FRONTIER" · [S3] § C13 — "a separate inquiry about `critic-d`'s input contract, not this skill" (records the deferral)
- WHY: indirect — the goal lands with confirmation as the gate; this is a later-phase strengthening
- Priority: LOW · Confidence: LOW · Essentiality: peripheral
- Guidance Mode: none
- Depth-link: none

### R20 — typed stage interfaces
- Direction: typed stage interfaces
- Goal: stage boundaries that carry a typed contract instead of a prose line
- engagement-type: PURSUE-SEED
- Move: take up the deferred seed — Leaves-established as (source, target, what flows), as `decompose`'s interface map has it
- Lands: a heavier schema with fewer interface surprises
- Basis: [S4] § Dispositions — "DEFERRED — revival: ≥2 stage-interface failures in practice" (records the seed and its trigger)
- WHY: indirect — heavier than the user wants now; worth it only if interface failures recur
- Priority: LOW · Confidence: LOW · Essentiality: peripheral
- Guidance Mode: none
- Depth-link: none

### R21 — per-stage rollback
- Direction: per-stage rollback
- Goal: a way to unwind a stage, as a migration has `down`
- engagement-type: PURSUE-SEED
- Move: take up the deferred seed — an optional field or convention for how a stage's work is reverted
- Lands: a schema that names reversibility
- Basis: [S4] § Phase 2 — Domain Transfer, database migrations (records the source analogy and the deferral)
- WHY: indirect — nothing in practice has yet been unwound; revive if a stage is
- Priority: LOW · Confidence: LOW · Essentiality: peripheral
- Guidance Mode: none
- Depth-link: none

### R22 — Decompose reusing the staging skill
- Direction: Decompose reusing the staging skill
- Goal: one mechanism for prerequisite-shaped work, two entry points
- engagement-type: PURSUE-SEED
- Move: take up the surfaced idea that `task-impl`'s Decompose, after three rejections, invokes `task-plan-staged` on the parked task to shape its prerequisites instead of classifying gaps by hand
- Lands: Decompose's step 2–4 replaced by a staged plan over the prerequisites
- Basis: [S4] § Phase 2 — Combination, contrarian — "Decompose should *call* the staging skill on the parked task" (records the idea; untested by critique)
- WHY: indirect — the goal is the staging skill, not Decompose; this is a later unification
- Priority: LOW · Confidence: LOW · Essentiality: peripheral
- Guidance Mode: none
- Depth-link: none

## Sources
- [S1] `sensemaking.md` (this folder) — constraints, KI1–KI10, SP1–SP7, FP1–FP5, Ambiguities 1–7, SV6
- [S2] `decomposition.md` (this folder) — Q1–Q6, § 5 interfaces, § 6 order
- [S3] `critique.md` (this folder) — Phase 0 frame-premise test, C1–C13
- [S4] `innovation.md` (this folder) — Phase 2 mechanisms, Dispositions
- [S5] `_branch.md § Source Input` (this folder) — the user's words, verbatim
- [S6] `/Users/ns/Desktop/projects/masacan-two-hosts/devdocs/voice_update/voice_update_propposal.md § 13` — the seven stage blocks; line counts measured in this run (as-of the checkout in that folder)
- [S7] `skills/task-impl.md § Resolve the folder` and `§ Resume` (this repo)
- [S8] `src/APPENDIX4_Adding_New_Feature.md:230` (this repo)
- [S9] `surfacing.md` (this folder) — item 18; Confirmed-absent

## Excluded
- **What each stage's pipeline contains (traverse or not)** — settled as the surrounding workflow's rule ([S1] Ambiguity 6); the skill hands over a folder and says nothing more. Engaging it adds nothing to the file.
- **The weight axis, REORDER-as-net, `[actual]`** — real concepts, but manifestations of R15, R1 and R8 respectively; listing them separately would be wrong-grain.
- **The measured corrections to Innovation's figures** — recorded in [S3]; history, not a direction.
- **The killed candidates** (no plan document; drop confirm; universal N=1 wrapper; `**Staged:**` pointer) — dead per [S3]/[S4]; their seeds already live in R7, R11, R1 and R12's pre-check.
- **Issue-tracker mapping of stages** (masacan's `Blocked by:` tree) — outside a project-agnostic skill; surrounding workflow ([S3] U4).
- **The user's three decisions** (A vs runner; name; Builds-as-list) — dispositions toward routes R12/R13, R14, R4, not concepts; routelisting does not decide them.
- **Concluding the inquiry, archiving, a follow-on Process inquiry** — control-flow, not concept-directions.

## Telemetry
- Mode: root / project-space · Entry: fresh
- Identities enumerated: 22 · teleological 19 (DEVELOP 15 · PURSUE-SEED 3 · INVESTIGATE-FRONTIER 1) · epistemic 3 (REFINE 2 · TEST 1)
- High-priority: 11 · Essentiality: core 11 · supporting 6 · peripheral 5
- Individuations: 22 · uncertain, included lean-to-split: R3 (split from R2 — a rule refinement with its own evidence), R7 (split from R6 — same file, separate logic), R13 (split from R12 — the two handoff paths), R16 (the integrating identity; kept because section order and idiom are a concern no other route owns) · stale: 0
- Convergence: a second sweep over the eight artifacts yielded no new identity · frontier flags: none
- Basis entries: pointer 31 (of which 7 carry quotations with the source in view) · excerpt 0 · paraphrase 0 · not recovered 0 · routes needing none: 0
- LAYER 1 checked: over-merge (R16 reviewed — no route hidden in it), under-coverage (U1–U4 from [S3] all placed: U1 in R8, U2 in R14, U3 in R4's gaps, U4 excluded), wrong-grain (three manifestations excluded), goal-loss (every WHY climbs to the skill file), type-misassignment (membership test applied; R3/R14 epistemic, R17 TEST), index-drift (fresh), basis-unrecoverable (none)
- LAYER 2 checked: selection-creep (R12 and R13 both listed, neither chosen; Essentiality attributive), process-coupling (control-flow items excluded), description-collapse (every record leads with Move), manifestation-dump (identities only)
- **Verdict: PROCEED**
