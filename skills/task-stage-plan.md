# /task-stage-plan — Stage Plan for Tasks Too Big to Plan at Once

Write a stage-by-stage plan for a task whose later parts cannot be planned until
its earlier parts exist. Each stage is a gated deliverable, light enough to read
in one screen, and becomes its own task folder for `/task-impl`. This skill writes
plans; it does not run anything.

## Additional Input/Instructions

$ARGUMENTS

## Instructions

### Phase 0: Resolve the task

- A folder containing `desc.md` → use it
- A path to a `desc.md` → use its folder
- A raw description → run `task-desc` to create one, then use that folder

Read `desc.md`. If the folder holds a traverse finding or other inquiry output,
read that too. If the folder already holds `staged_plan.md`, skip to **Re-run**.

### Phase 1: Does this task need stages?

Stage only when **later parts cannot be planned until earlier parts are
established.** Probe it: try to write the first step of the *last* part. Does it
depend on something only an earlier part will decide or reveal? If not, this
task does not need stages.

- Size is not the test. Many known moving parts plan fine in one pass.
- Weight (light / heavy) is not the test. Heavy tasks are often one plan.
- When the probe is unclear, ask: would building on a wrong guess here be
  expensive to unwind? If not, do not stage.

**Default when unsure: do not stage.** An under-staged plan is caught later by
`critic-d`'s REORDER verdict; an over-staged task just pays a full pipeline run
per unnecessary stage.

If staging does not apply, stop and say:

> This task does not need stages — run `/task-plan` on it.

### Phase 2: Find the stages

Understand the whole task before cutting it. The cut is shallow by design: it
finds *what* is built in what order, never *how*. Depth is each stage's own
`task-plan`, later, when it is grounded.

1. **Perceive coupling.** For each pair of parts: if this changes, must that
   change? Tightly coupled work stays in one stage.
2. **Cut at seams where what-is-established changes.** A seam is a stage
   boundary only when the next part relies on something this part leaves
   behind. Parts with no such dependency are parallel work — separate tasks, not
   stages.
3. **Order by dependency.** Each stage's position is justified by what it needs
   from before.
4. **Stage 0.** When the task changes a live system, the first stage records
   what exists before anything moves: current behaviour, versions, what passes,
   what is already broken.
5. **Check balance.** One stage dramatically larger than the rest → split it.
   Trivial stages → merge them.
6. **Degenerate exit.** One stage, or stages with no sequential dependency →
   the task was not stageable. Say so and point at `/task-plan`.

If the cut itself is stopped by a decision only the user can make, stop and
ask. Do not write stages around it.

### Phase 3: Write `staged_plan.md`

In the task's folder. The file contains the sections below and nothing else.

```yaml
---
model: [model id from session context; "unknown" if not derivable]
effort: [effort setting from session context; "unknown" if not derivable]
---
```

Write `unknown` rather than omitting a field or guessing.

Then, in order:

**Staged — run `/task-impl` on the stage folders below, not on this folder.**

**Staged because:** one sentence — which later part could not be planned until
which earlier part exists.

**Confirmed:** written only in Phase 4. Absent until then.

#### Folder index

| Stage | Folder |
|-------|--------|
| 0 | — |
| 1 | — |

One row per stage. The Folder cell is filled when the stage's folder is
created (Handoff). Nothing else goes in this table — no status, no dates.
Status is read from the folders, never written here.

#### Stage blocks

One block per stage, about 20 lines. If a block runs past 25, first check
whether the excess is *how* (move it out — it belongs to that stage's
`task-plan`); if what remains still describes two deliverables, split the stage.

```
### Stage N — [name]

**Builds.** [One sentence: why this is its own stage.] Then what to build, as
prose or 3–6 directional items:
- …
- …

**Gate.** What must be observably true for this stage to be done. Where it
sharpens the test, add what does *not* count as done.

**Leaves established.** What the next stage may rely on from this one.
```

Optional, when they earn their place:

- **Concepts.** Which concepts from the task description this stage realises.
- **Checkpoint.** A milestone name grouping this stage with neighbours.

Never in a block:

- `task-plan` steps — numbered, with Output / Safe-in-nature / Hardness. Those
  are written per stage by `/task-plan`, when the stage is grounded.
- Status, progress, or evidence of work done. Status lives in the stage folders.
- Hardness scores. Scored at `/task-plan`, per stage.

Pointers that *ground what exists* (a baseline record, a measured state) are
Stage 0's content and are allowed. Pointers that *report what was done* are not.

Gates name an observation. "Works well" and "to be measured" are not gates.

### Phase 4: Confirm

Print the plan and ask the user to confirm it. Until they do, the plan is a
draft: anything in it may be edited, and no stage folder is created.

On confirmation, add directly under the frontmatter:

**Confirmed:** [date]

From this line on, gates are frozen and blocks change only by tags (Re-run).
Then do **Handoff** for Stage 0 (or the first stage).

---

## Handoff — a stage becomes a task folder

Only for the first stage whose status is *pending* (see Re-run), and only when
the plan carries a `**Confirmed:**` line. Never a second folder while a stage is
live.

1. Create the folder. Default: `stages/sN_<slug>/` inside the task's folder.
   Write its path into the Folder index.
2. Write its `desc.md` directly from the block — do not call `task-desc`:

   | From the block | To `desc.md` |
   |---|---|
   | Builds | Problem Statement · User Value Proposition |
   | Gate | Success Criteria |
   | Gate's "does not count" | Scope Boundaries |
   | Stage position | Priority Level |
   | Previous stage's Leaves established | a "What already exists" paragraph under Problem Statement |

3. Print:

   ```
   Stage N ready — <folder>
   Run: /task-impl <folder>
   ```

The stage then runs whatever pipeline the surrounding workflow requires. This
skill does not shortcut it and does not run it.

---

## Re-run — the skill on a task that already has `staged_plan.md`

Run it again whenever a stage finishes. It re-plans nothing that is built; it
firms up what comes next from what the finished stage actually produced.

**Status, read from the folders — never from the plan:**

| Folder state | Status |
|---|---|
| no folder | pending |
| folder, no done-marker | live |
| a `pr-critic*.md` whose Gate says MERGES, or `desc.md` carries `**Done:** [date]` | done |
| the block carries a `deferred` tag | deferred |

If the user says a stage is done and nothing in its folder shows it, write
`**Done:** [date]` at the top of that stage's `desc.md`, then proceed.

**For the most recently done stage N:**

1. Read its folder: its plan, `critic.md`, any `pr-critic*.md`, any traverse
   finding. What was learned lives there and stays there.
2. If what it left behind differs from its block's Leaves established, record it:
   `[actual after stage N: what it turned out to be]`. This is the only edit a
   done block ever takes.
3. Revise stage N+1 against what now exists. Touch later blocks only if stage N's
   outcome reaches them.
4. Every change is one tag line at the top of the changed block, same shape:

   ```
   [revised after stage N: reason]
   [deferred after stage N: reason · revisit when …]
   [merged into stage M after stage N: reason]
   [added after stage N: reason]            ← a new block, inserted in order
   [gate revised after stage N: was "…" · reason]
   ```

   Rewrite the block's text as needed; the tag records that it changed and why.
   No prose history, no status lines.
5. If stage N+1's block carries a tag from this run, print the block and ask the
   user to confirm it before Handoff. An untouched block needs no re-confirmation.
6. Handoff for the next pending stage. If none remain, print `All stages done.`

The plan is the only file this skill writes on a re-run, plus the next stage's
folder and `desc.md`.

---

## What this skill is not

- Not a mode of `task-plan`. Stage blocks are not steps; each stage gets its own
  `task-plan` later.
- Not `roadmap`. A staged plan is executed in order and keeps status out of the
  document.
- Not `decompose`. It uses coupling perception, boundaries, order and balance
  only.
- Not `task-impl`'s Decompose, which spawns prerequisites after three rejections.
  Staging happens before planning, by choice.
- Not weight. A heavy task is usually one plan.
