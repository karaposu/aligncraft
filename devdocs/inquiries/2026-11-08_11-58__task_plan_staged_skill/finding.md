---
status: active
model: claude-fable-5-1
effort: unknown
---
# Finding: task-plan-staged skill

## Question

The user wants a new skill in the AlignCraft command pack, provisionally named `task-plan-staged`, for tasks too big to plan in one pass. Today they do this by hand: they prompt "create a stage plan," then run `task-impl` (the pack's orchestrator that takes one task folder through describe → plan → critique → implement → verify) on each part. The skill should produce a stage-by-stage plan that is technical but lightweight, where each stage is explained enough to be handed to `task-impl`, and that does not bloat with detail the implementation will produce anyway.

The deliverable is a skill definition file in the pack's idiom that itself specifies the staged-plan format and a "big enough to stage" test. It is planning-layer only, sits between `task-desc` (which writes a task's `desc.md`) and `task-impl`, carries a couple of fields per stage, and must not be bloated.

## Finding Summary

- **A new skill should exist.** It writes one file, `staged_plan.md`, with one short block per stage and nothing else. It never orchestrates anything.
- **A stage is an ordered deliverable with a gate**, built from one or more concepts, such that the next stage cannot be planned in detail until this one exists. A stage is not a concept and not a group of steps.
- **Stage only when later parts cannot be planned until earlier parts are established.** When unsure, do not stage. The skill must be able to answer "this does not need staging — run `task-plan`."
- **Each stage block has four required fields:** Stage N — name · Builds · Gate · Leaves established. Two optional: Concepts, Checkpoint. A block runs about 20 lines.
- **Builds** opens with one sentence on why this is its own stage, then says what to build as prose or 3–6 directional items. This is what the user meant by "steps that give direction."
- **Forbidden in the plan:** `task-plan`-style steps (numbered, with fields and hardness scores), status, and evidence of progress. These are exactly what turned the user's manual plan into 172KB with a 204-line stage header.
- **Status is never written into the plan.** It is derived from each stage's work folder. The plan carries only a folder index (which stage lives in which folder).
- **After confirmation the plan changes only by one-line tags** of one shape, `[<event> after stage N: reason]`, with six events: revised, deferred, merged, added, gate revised, actual.
- **Gates freeze at confirmation.** A `**Confirmed:** [date]` line must exist before any stage becomes a folder.
- **Each stage becomes an ordinary task folder.** Its `desc.md` is seeded mechanically from the block, and `task-impl` runs the normal chain on it.
- **Recommended, for the user to decide:** `task-impl` gains a small stage-runner pre-check so one invocation runs all stages in order. The fallback, which needs no change to `task-impl`, is that the human runs each stage by hand.
- **Two more decisions are the user's:** the skill's name (the current one implies a tie to `task-plan` the design denies), and confirmation that "steps" meant directional items rather than `task-plan` steps.

## Finding

### 1. Where this comes from

The user has done this once for real, in the masacan project's `devdocs/voice_update/` folder (September 2026). That run left two documents worth contrasting. The proposal's section 13 ("Delivery sequence and gates") described seven stages, each as a name, one to three paragraphs of direction, and a **Gate** — what must be true to call the stage done, often phrased as what does *not* count. Those seven blocks measure 9, 18, 15, 16, 24, 15 and 10 lines. The implementation plan that followed grew to 172KB. It held stages and steps and running state in one file, with steps numbered continuously across stages, and the stage that stayed live longest (Stage 5) accreted a 204-line header of status, probe findings, decisions and deferrals before its first step. A third file, `where_we_left.md`, held 33KB of hand-written cross-stage state.

The lesson the inquiry drew is that the plan did not bloat because stages were planned badly. It bloated because steps and state were allowed into the stage document. The skill's design problem is therefore **containment**: generate the light shape, and then make it structurally hard for the heavy material to get in.

One more piece of context. The book that this pack accompanies describes six alignment layers for AI-assisted work, from Workspace (Level 0) to Outcome (Level 5). Level 2, Action-Space, is the layer of approach and sequence. The pack has a command for every other layer and none for this one. A staged plan is a Level 2 artifact, so this skill fills the one gap in the chain.

### 2. What a stage is

A stage is an ordered deliverable with a gate, built from one or more concepts, such that planning the next stage in detail depends on this one existing. This grounds the term in a definition the pack already has: the `decompose` skill's **piece** is "expressed as a question with verification criteria," with interfaces and a dependency order. A stage is a decompose piece with a forced sequential dependency.

Two readings of the user's words were ruled out. "Stages are maybe concepts to build" cannot stand as the definition, because a concept cannot be completed and nothing can gate it. In the real run the stages were deliverables that *referenced* concepts from the proposal and were gated on observations. The user's "maybe" left room for this. And "combined with `task-impl` for each step" was reconciled with the practice, where the unit handed to `task-impl` was the stage (or a slice of one), not a step. The user also says "for each part I'm running task implement," which agrees.

### 3. When to stage

The test is the user's own sentence: stage when later parts cannot be planned until earlier parts are more concrete and established. The operational probe: try to write the first step of the last part. Does it depend on something only an earlier part will decide or reveal? If not, write one `task-plan`.

Size and weight are not the test. The masacan pipeline's weight axis (light or heavy) measures blast radius, observability, consumers and reversibility, and issue #180 was heavy yet correctly planned in one piece. Many known concepts plan fine in one pass. The trigger is that some part cannot be planned until an earlier part exists.

When the probe is unclear, one tiebreaker applies: would building on a wrong guess here be expensive to unwind? If not, do not stage. The default is to not stage, and the reason is asymmetric: under-staging has a net, because `critic-d` (the pack's plan critic) returns REORDER — TEST BEFORE BUILD when a plan builds on a premise before testing it, while over-staging has none and simply costs a full pipeline run per unnecessary stage.

The skill's input is a folder with a `desc.md`, or a path to one; it reads a traverse finding if one is present. A raw description runs `task-desc` first, the same rule `task-impl` uses.

### 4. How to cut

The cut uses the first part of `decompose`'s method and leaves the rest. Perceive coupling with the probe "if this part changes, must that part change?" and cut at the seams where coupling drops. A seam is a stage boundary only when what-is-established changes across it; pieces separated by a seam with no such change are parallel work and belong in separate tasks, not stages. Order by dependency. Check balance: one stage dramatically larger than the rest is split, trivial ones are merged. When the task changes a live system, the first stage records what exists before anything moves (the Stage 0 pattern from the real run, and the "instrument it" prerequisite shape in masacan's contributing guide). If the cut yields one stage, or stages with no sequential dependency, the task was not stageable and the skill exits to `task-plan`. `decompose`'s question tree and seven-dimension self-evaluation are not used.

### 5. The stage block

Required fields:

- **Stage N — name.**
- **Builds.** One sentence on why this is its own stage, then what to build, as prose or three to six directional items. These items are direction ("introduce the engine boundary," "separate lifecycle ownership"), not `task-plan` steps.
- **Gate.** What must be observably true, and what does not count as done. The real run's gates are the exemplar: "a blanket claim that the current system is regression-free is not an acceptable baseline." A gate that says "to be measured" has closed nothing.
- **Leaves established.** What the next stage may rely on. Kept separate from Gate because the gate is this stage's test while leaves-established is the next stage's contract; they have different consumers.

Optional fields: **Concepts** (which concepts the stage realises) and **Checkpoint** (a milestone grouping above stage, which the real run used as Realtime / Orders / Two-engine / Mobile).

Forbidden: `task-plan` steps (numbered, with Output, Safe-in-nature, Hardness fields); status; and evidence of progress. The user refused hardness at stage level in their own run ("re-score at `/task-plan`, not by editing the numbers here"). One distinction keeps the forbidden list honest: pointers that record what *was done* are forbidden, while pointers that ground what *exists* are Stage 0's content. The real Stage 0 block links to a dated verification record, and the rule must not reject the one example the shape is drawn from.

The user's exact words were "steps still give enough good direction about the what to build." The inquiry first forbade steps outright and then reversed on re-reading those words. The resolution is the Builds shape above: direction in list form is welcome; fielded steps are `task-plan`'s, per stage, later.

### 6. The artifact

`staged_plan.md`, in the task's folder, contains: frontmatter with `model` and `effort` (the same stamp `task-plan` and `critic-d` carry); the trigger verdict; a folder index; one block per stage; and, once the user has confirmed, a `**Confirmed:** [date]` line. Nothing else.

A block runs about 20 lines. The number comes from the measured envelope of the real blocks (9 to 24). Above about 25 lines a block is probably two stages, and the imbalance check should look at it. The cap is soft and the skill should say why it exists rather than enforce a count.

The §13 shape is drawn from one real instance. The staging *pattern* (plan, confirm, per-stage pipeline) is attested three times in the user's material; the block *shape* once. The skill presents the shape for confirmation rather than asserting it, and a cheap test exists before it is written: rewrite the seven real stages in the new schema and see whether each yields a Builds, a Gate and a Leaves-established, whether the 24-line stage splits, and whether Stage 0's evidence link survives the forbidden-list rule.

### 7. How the plan changes

Status lives in the stage folders, never in the plan. No folder means pending. A folder with no done-marker means live. A done-marker means done. The done-marker is tolerant: `task-impl`'s Verify passed, or a `pr-critic` gate says MERGES, or the user says so. A stage the user has deferred is marked by a tag on its block, since a missing folder cannot distinguish "not yet" from "set aside."

The plan carries a **folder index**, a table of Stage and Folder with one row per stage, written by whoever creates the folder. It records only what folders cannot show, namely their names. It has no status column and no dates, so it cannot disagree with the folders and cannot grow. This replaces an earlier idea of deriving everything from a declared folder-naming convention, which failed in two real cases: a human may name folders anything, and in masacan the work folders live on branches excluded from merges.

After confirmation, a block changes only by appending a one-line tag of a single shape, `[<event> after stage N: reason]`, with six events: **revised**, **deferred** (with "revisit when …"), **merged into stage M**, **added** (a stage discovered after confirmation), **gate revised**, and **actual** (what a done stage's Leaves-established turned out to be). Done blocks accept only `actual`. Everything that was learned in a stage stays in that stage's folder, in its plan, critic and traverse finding; the plan records only the consequence.

### 8. Confirmation

Nothing becomes a folder before the user has confirmed the plan. This is the gate the user's practice already has ("once it is confirmed each stage is separated in devdocs," in the book's Appendix 4). The staged plan has no critic of its own, so confirmation is its only quality gate, and dropping it was rejected. Before confirmation the plan is a draft and gates are editable. From confirmation, gates freeze and change only by a `gate revised` tag that keeps the original visible. If a later revision tags the *next* stage's block, that block needs confirming again before it runs; untouched blocks do not.

### 9. From a stage to `task-impl`

A stage block is a `desc.md` seed, and the mapping needs no judgement: Builds becomes the Problem Statement and User Value; Gate becomes the Success Criteria; the "does not count" clause becomes the Scope Boundaries; the stage's position becomes the Priority; and the previous stage's Leaves-established becomes the "what already exists" context. The `desc.md` is written directly from this mapping rather than by invoking `task-desc`, whose first step pauses to confirm a location. The resulting folder is one `task-impl` resolves exactly as it resolves any folder, and the stage runs whatever pipeline the surrounding workflow requires. The staged plan never shortcuts that pipeline; its own understanding is shallow by design.

### 10. Running the stages

Two designs survived, and the choice between them is the one process-level decision this inquiry leaves to the user.

**Recommended: `task-impl` runs the stages.** `task-impl` already begins with two pre-checks before its resume table (a parked task returns early; three rejected pull requests trigger decomposition). It gains a third: `staged_plan.md` present in the folder means the task is staged. The runner then finds the first non-done stage through the folder index, creates its folder, writes the index row and the seeded `desc.md`, and continues its own ordinary chain *in that folder*. This is re-targeting, not invoking `task-impl` inside `task-impl`. When the stage completes, it invokes `task-plan-staged` to revise later blocks. If the next block was tagged, it stops for confirmation of that block; otherwise the next stage starts. An abort inside a stage stops the whole run with the usual abort report, and re-running `task-impl` on the parent resumes at that stage. A plan without a `Confirmed:` line makes the runner report "awaiting confirmation" and stop.

This serves both of the user's goals with two components: the staging skill stays a pure generator (no bloat, nothing to orchestrate), and the runner removes the per-stage "now run stage 2" prompting (no re-prompting). The cost is one pre-check and one short section in `task-impl`, which is already 323 lines, and runs that may span many stages, which the user can interrupt at any checkpoint.

**Fallback: the human dispatches.** After confirmation the skill prints the first non-done stage's folder and the `task-impl` command. The human creates the folder, writes the index row, and runs it. This needs no change to `task-impl` and leaves the per-stage prompting in place.

The skill's Handoff section should read the same under either design, since both use the same index and the same seed mapping.

### 11. What the skill is not, and what to call it

It is not a mode of `task-plan`: stage blocks are not steps, and `task-plan`'s blocker gates operate on a task about to receive steps. It is not `roadmap`, whose primary output is each node's status and which describes itself as "a map, not a plan"; a staged plan keeps status out and is executed. It uses `decompose`'s perceive, detect, order and balance, and not the rest. It is not `task-impl`'s Decompose, which spawns prerequisite work reactively after three rejections; staging is proactive, before planning. It is not weight.

The name `task-plan-staged` implies the relationship with `task-plan` that the first of these denies. Alternatives are `stage-plan` and `task-stages`. The user decides, preferably before the installer scripts and Appendix 8 are edited.

### 12. Pack integration

Outside the skill file: an entry in the book's Appendix 8 (the slash-command reference), the skill added to the arrays in `install_claude.sh` and `install_codex.sh`, a local install under `~/.claude/skills/`, and a note in the book that Level 2 now has a command. None of this design rationale goes into the skill file itself, which must stay lean, standalone, free of self-description, and reference only `task-desc`, `task-plan` and `task-impl`.

## Next Actions

### MUST
- **What:** The user decides three things: whether `task-impl` becomes the stage runner or the human dispatches; the skill's name; and whether "steps" meant directional items inside Builds.
  **Who:** the user.
  **Gate:** before `skills/task-plan-staged.md` is written.
  **Why:** the handoff section, the filename and the Builds field each depend on one of these.
- **What:** Replay the seven real §13 stages in the proposed schema (four fields, ~20-line cap, Stage 0 evidence rule).
  **Who:** the AI, in this session or the next.
  **Gate:** before the schema section's one-line field guidance is final.
  **Why:** the shape rests on one instance; the replay tells the guidance what it must say and catches a misfit before it is prescribed.
- **What:** Write `skills/task-plan-staged.md` in the pack's idiom, in this section order: trigger and input → cut method → schema and artifact → resume (re-run) → handoff → what-this-is-not. Write the schema section first.
  **Who:** the AI.
  **Gate:** after the three decisions above.
  **Why:** this is the deliverable.

### COULD
- **What:** Add the stage-runner pre-check and section to `skills/task-impl.md`, with the six rules from section 10.
  **Who:** the AI.
  **Gate:** condition-bound: the user chooses the runner.
  **Why:** removes the per-stage re-prompting.
  **Depends-on:** MUST item "the user decides three things." This COULD is GATED — do not act until the decision resolves.
- **What:** Appendix 8 entry, installer arrays, local install, Level-2 note in the book.
  **Who:** the AI.
  **Gate:** after the skill file exists and the name is settled.
  **Why:** the pack lists what it ships.
  **Depends-on:** MUST item "the user decides three things" (the name). This COULD is GATED — do not act until the name resolves.

### DEFERRED
- **What:** Typed stage interfaces (Leaves-established as source, target, what flows).
  **Gate:** two or more stage-interface failures in real staged runs.
  **Why (if revived):** interface surprises like the SDK finding become visible at plan time.
- **What:** A per-stage rollback convention.
  **Gate:** a stage is actually unwound in practice.
  **Why (if revived):** reversibility is named where today it is assumed.
- **What:** Running `critic-d` on the staged plan itself, with gates as the premise inventory.
  **Gate:** a separate inquiry into whether `critic-d`'s input contract can key on stages instead of steps.
  **Why (if revived):** confirmation could become optional.
- **What:** `task-impl`'s Decompose invoking `task-plan-staged` on a parked task to shape its prerequisites.
  **Gate:** after the skill has run on at least three real tasks.
  **Why (if revived):** one mechanism for prerequisite-shaped work, two entry points.

## Reasoning

**Killed on structure.**
- *A `--staged` flag on `task-plan`.* `task-plan`'s blocker gates operate on a task about to receive steps; a stage block is not a step and has no blockers of its own until it is planned. Emitting stage blocks from inside `task-plan` mixes two layers in one command. The practice also kept the stage plan as a separate document.
- *Dispatching all stages at once.* Later stages are provisional by design; creating their folders before earlier stages land re-creates the whole-plan-must-adapt failure the user named.
- *A state file beside the plan.* This is `where_we_left.md` with a schema. The 33KB file shows where it goes.
- *Stage as a concept.* A concept cannot be completed, so nothing can gate it.
- *Weight as the trigger.* Issue #180 was heavy and correctly planned in one piece; weight measures blast radius, not plannability.
- *No plan document at all (the plan is the sequence of folders).* There is no up-front view to confirm, so a wrong cut costs as many pipeline runs as it has stages.
- *Dropping confirmation.* The staged plan is critiqued by nothing else; the user's practice has the gate.
- *A universal one-stage wrapper.* A one-stage plan is a `desc.md` with success criteria, which `desc.md` already has.
- *A `**Staged:**` pointer line in `desc.md`.* The presence of `staged_plan.md` already says it; a second signal can only disagree with the first. `task-impl` derives every other state from file presence.
- *"Stage blocks carry no steps," as first stated.* The user's words say the opposite. The corrected rule forbids `task-plan`'s fielded steps, not direction in list form.

**Refined by evidence or argument.**
- A status table in the plan became a folder index with status derived on read, because a written status column would duplicate what folders show and go stale under hand dispatch.
- A 15-line cap became about 20, because the real blocks measure 9 to 24 lines; the inquiry's first figure for them (8 to 16) was wrong and was corrected by measurement.
- "Costly to unwind" moved from a second condition in the trigger to a tiebreaker, because the user's trigger is dependency alone.
- Gates frozen "at plan time" became frozen "from confirmation," because before confirmation the plan is a draft.
- Five separate tag types became one grammar with six events, and the missing event (a stage added after confirmation) was found and included.

**Survived.**
- The generator-plus-runner split, because it serves both user goals with two components where a single skill had to trade them off, and every objection to it was a specification gap the design absorbed.
- Gates as refusals of false completion, because a gate must name an observation.
- The `actual` tag on a done block's contract, justified generally (a contract is tested by its consumer) though the inquiry's motivating example was misattributed and withdrawn.
- The two-part cut rule and the roadmap distinction, on the quoted text of both skills.

**Contradictions reconciled.** "Stages are maybe concepts" versus gated deliverables: the practice shows deliverables that reference concepts, and the user's "maybe" allows it. "For each step" versus the stage as dispatch unit: the user also says "for each part," and the practice dispatched stages. "Steps give direction" versus "don't bloat": the bloat came from fielded steps and state, not from directional items, so the two are compatible once Builds is allowed to be a short list.

## Open Questions

### Monitoring
- Whether the ~20-line cap and the staging trigger hold, observable after three real staged tasks have run under the skill.
- Whether the `added` event is used, or stages discovered mid-run are handled by revising existing blocks; observable over the same three runs.

### Blocked
- Whether `critic-d` can critique a staged plan, blocked on an inquiry into its input contract (stages in place of steps in the Premise Inventory).

### Refinement Triggers
- Two or more stage-interface failures re-open the typed-interface design.
- A stage actually unwound in practice re-opens per-stage rollback.
- If the user chooses hand dispatch now, the runner design re-opens when the per-stage prompting is named as a pain again.

## Source Input

<details>
<summary>Raw user input for this finding</summary>

```text
I would like to build something called task plan staged. Okay, it's another scale, but basically it is for big tasks where each where the idea is to first generate a kind of like a big plan, but from the concepts and general understandings and directions and how they should be, it's still not like just description, it's a technical but more lightweight technical thing, because it is something that just kind of because it has many moving parts, many different concepts are in it, or just it's just big, so you cannot really plan it fully without actually initial parts are more concrete and established, and then next part can be, you know, build on top of it, because maybe there will be something that will not wrong and it will fail, and the plan is just has to adapt fully, which is not good. And what we do is just actually is it is just it creates this um, this actually creates like a stage by stage plan, and this stage by stage plan, each stage is kind of explained enough. It kind of, you know, understands the task in terms of stages. And for each stage for each stage. It kind of creates some sub-steps some steps of this plan as well, so it's just the generic understanding of how something should be built. And like what stage one, step two, step three maybe, stage 2, stage 3, they also have this steps. And then this can be used to actually this can be combined with task-impl skill for each step ,
to run full traverse on this to understand it better. Because this is something actually I do manually, I just say it like create a stage plan and then for each part I'm running task implement skill, okay? And like so that stage plan part I don't wanna I don't want to every time prompting, and this skill can be useful and first I want you to understand what I'm trying to say better. Okay, and then focus on each stage, like you understand it's not really complicated, it's not really bloated, it's really kind of simple, like things to build, directions, and of course with technicality in it, it's not like so simple, it's not just like the concept, but yeah, like stages are maybe concepts to build, and steps still give enough good direction about the what to build, and maybe we can add some a couple of more fields per step or per stage. But I don't want to bloat it, and with unnecessary things, because most of it is dynamically like built, during the implementation phase. So I don't want to give unnecessary concrete like requirements and yeah,
```

</details>
