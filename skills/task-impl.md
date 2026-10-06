name: task-impl
description: Takes a task description, plans it, critiques it, folds the selected mitigations into the plan, implements it, and runs the tests. Halts on blockers.

# /task-impl

Run the chain on a task: `task-desc` → `task-plan` → `critic-d` → fold → implement → verify.
Each step is delegated to the skill that owns it. Uses `critic-d`, not `critic`.

## Additional Input/Instructions

$ARGUMENTS

---

## Resolve the folder

- A folder containing `desc.md` → use it
- A path to a `desc.md` → use its folder
- A raw description → run `task-desc` to create one, then use that folder

Print:

```
task-impl: <folder>
Task: [one sentence]
```

Then begin immediately — proceed to Delegation below. Do not wait for user input.

## Resume

Two checks first, in this order. They decide whether the chain starts at all.

1. `desc.md` carries a `**PARKED**` block → **Return** (below). Nothing else runs.
2. Count the `pr-critic*.md` files in the folder whose Gate line says REJECTED
   (`pr-critic_r1.md`, `pr-critic_r2.md`, `pr-critic.md` …). Three or more →
   **Decompose** (below). Nothing else runs.

Otherwise, if artifacts already exist, start from:

| Folder state | Start at |
|---|---|
| no `desc.md` | `task-desc` |
| `desc.md` only | `task-plan` |
| plan exists, no `critic.md` | `critic-d` |
| `critic.md` says REORDER, no `Result:` line under the experiment | Experiment |
| `critic.md` exists, plan has no `**Critic folded:**` line | Fold |
| plan has `**Critic folded:**` | Implement |

## Delegation

| Step | Writes |
|---|---|
| `task-desc` | `desc.md` |
| `task-plan` | `step_by_step_impl_plan.md` |
| `critic-d` | `critic.md` |

Fold, Implement and Verify are done directly. For every other step:

1. Invoke `Skill(skill: "<name>", args: "<folder>")`. If the Skill tool fails,
   `Read` the command file and execute it. If that also fails, halt and tell the
   user to run `/<command> <folder>` manually. Never execute a step from memory.
2. Execute the loaded spec **at full depth**. Do not abbreviate it because it is
   running inside an orchestrator.
3. Run this skill's gate for that step.
4. Print the checkpoint.
5. **Continue immediately** to the next step.

Run every step in order without pausing — do not wait for user input between them.
**The three gates below are the only things that stop this run.** Nothing else is
a reason to pause, ask, or hand back.

Between steps, print:

```
── [previous step] complete. [1-3 facts]
   → [next step]
```

---

## Gate: after `task-plan`

Read the plan's `### Huge Hard Blockers` section.

- A planning blocker with status `OPEN` → **abort**
- `OPEN — working assumption` → continue
- Execution blockers → continue; they gate individual steps and are handled at Implement

Not aborting → **continue immediately to `critic-d`.**

## Gate: after `critic-d`

Read the verdict at the top of `critic.md`.

- **IMPLEMENT AS WRITTEN** → skip Fold, go to Summary
- **IMPLEMENT AFTER FOLDING THESE IN** → Fold
- **REORDER — TEST BEFORE BUILD** → run the Experiment (below), then act on its result
- **DO NOT IMPLEMENT** (MEANING GAP or WRONG LAYER) → run the cycle below

`critic-d` has already renamed the plan to `DEPRECATED_*` and written the blocker
into `desc.md`. Count the `DEPRECATED_*` plan files — that is how many cycles have
been spent.

- Fewer than 2 → ask the user the single question that would close the gap. If
  they answer: update `desc.md` and **immediately return to `task-plan`** — resume
  the run, do not wait for further input.
- 2 or more, or the user does not answer → **abort**

## Experiment

`critic-d` wrote an experiment block under the verdict: what to run, its cost, the
step it must precede, a disqualifying result, a passing result.

1. Run it **before any plan step**. Not before step N — before step 1. It runs the
   real component in the real composition; a stand-in that supplies the behaviour
   does not count.
2. Compare what happened to the two named results. The critic already defined
   pass and fail; this is a comparison, not a judgement.
3. Record it under the experiment block in `critic.md`:

   ```
   Result: PASS | FAIL — [what was observed], [date]
   ```

4. **PASS** → the premise held. Continue exactly as IMPLEMENT AFTER FOLDING THESE
   IN: Fold → Summary → Implement → Verify.
5. **FAIL** → the premise is false. This is a meaning gap with the answer already
   in hand, so there is no question to ask. Rename the plan `DEPRECATED_*`, write
   the result into `desc.md` under `## Known Blockers` as **CLOSED** with the
   observation, and **abort**. It counts against the cycle cap of 2.

## Gate: before each step at Implement

- Step gated by an `OPEN` execution blocker → stop there. Report which steps
  completed, which step is gated, and who must do what. Not an abort.
- Otherwise → implement it

---

## Fold

Take every proposal marked `selected` in `critic.md` and merge it into the plan.

A mitigation can:
- change what a step does
- add a step
- reorder steps
- add to a step's **Peripheral concepts**
- raise a step's **Hardness Lvl**
- flip a step's **Safe in nature** from True to False — re-check this on every step you touch

Mark each edited step inline:

```
[folded: Risk 2, robust]
```

Add under the plan's title:

```
**Critic folded:** [date] — N mitigations (M steps changed, K added)
```

Proposals marked `last_resort` fold in normally.

Do not re-critique the folded plan.

When the fold is written → **continue immediately to Summary.**

---

## Summary

Print this, then **go straight to Implement**. It is a display, not an approval
gate — do not wait for a response to it.

```
Plan: 7 steps, 2 not safe-in-nature (4, 6)
Verdict: IMPLEMENT AFTER FOLDING THESE IN
Risks: 2 High, 3 Medium, 1 Low
Selected: 4 robust, 1 long-term
  ⚠ Risk 2 took robust as last_resort — long-term blocked on vendor access
Folded into steps: 3, 4, 6 (new step 5 inserted)
Execution blockers: step 6 needs prod access (OPEN)

Implementing now.
```

## Implement

Work the folded plan step by step, in order.

If a step is wrong or impossible as written, stop and say so. Do not substitute a
different approach.

When the last step is done → **continue immediately to Verify.**

## Verify

Run the tests relevant to what changed, then the full suite. Report what passes
and what breaks.

Do not fix failures in this run, unless they are small and not architectural.
Those, fix. Small means a local correction: a wrong name, a typo, a missing
import, a broken reference, a call site the change forgot to update. Not
architectural means the fix changes no design decision in the plan. If a fix
would deserve its own step in the plan, it is not small.

After fixing, re-run what failed. List every fix in the report, so nothing is
repaired silently.

Never make a failing test pass by changing what it expects, unless the plan
itself changes that behaviour.

Anything larger or architectural: report it and stop.

---

## Decompose

Three rejections of the same task mean the revisions are not converging. Each
plan was patched around something rather than fixed, and each came back bigger.
A fourth plan is the wrong move. The right one is to ask what the plan is
standing on.

1. **Run `meaning-gaps` on the whole history**, not only `desc.md`: every plan
   including `DEPRECATED_*`, every `critic*.md`, every `pr-critic*.md`, every
   `merge-check*.md`. The history is the evidence — what kept getting flagged,
   what kept growing, what every revision touched. The question being answered
   is: *what made this so hard?*

2. **Classify each gap** with action BLOCKS or CLOSE FIRST. `meaning-gaps` lists
   and routes; what to do about each is decided here:
   - **An architecture decision** — someone must choose. Put it to the user.
   - **An understanding gap** — nothing exists to read or run. Hand the traverse
     question to `/traverse`.
   - **Prerequisite work** — something must be built before this task can stand
     on it. It becomes its own task.

3. **Park the original.** Add this to its `desc.md`, directly after the
   frontmatter:

   > **PARKED** — [date]. Rejected 3 times; revisions were growing, not
   > converging. Underlying: [the unsettled premise, one line].
   > Waiting on: [spawned folders / decisions / traverse questions].
   > When these are done, re-plan from scratch. Do not resume from the last plan.

4. **Spawn each prerequisite** as its own task folder beside the original, by
   running `task-desc` for it — do not hand-write the `desc.md`. Each says what
   must be built, why, and which parked task it unblocks. Most vital first; the
   gap's rank sets the order.

5. **Report and stop.** Do not implement anything. Do not write a fourth plan.

   ```
   ⏸ PARKED — [task]
   Rejected 3 times. Revisions were growing, not converging.
   Underlying: [the unsettled premise]

   Spawned, in order:
     1. [folder] — [what it builds]
     2. [folder] — [what it builds]
   Decisions needed: [list, or none]
   Traverse: [question, or none]

   Start with 1. Re-run /task-impl on [task] when all are done.
   ```

Only `pr-critic` rejections count. A failed `merge-check` means the code did
not match the plan — an implementation slip, not a sign the premise is wrong.

## Return

`task-impl` run on a task whose `desc.md` carries `**PARKED**`:

1. Read the Waiting-on list. For each spawned folder: its plan carries
   `**Critic folded:**` and its Verify passed. For each decision: `desc.md`
   records the answer. For each traverse question: its output exists.
2. Anything still open, or unclear → report what is waiting and stop. If the
   evidence is ambiguous, ask the user whether the prerequisites are done; this
   is a question only they can answer.
3. All done → remove the PARKED block, rename the current plan `DEPRECATED_*`
   — it was the one built around the hole — and start from `task-plan`.
   **From scratch.** The prerequisites changed what the task stands on.

---

## Abort

Print this and stop:

```
⛔ ABORTED — blocker

Blocker: [what is not known — or, after a failed experiment, what was tested and found false]
Recorded in: <folder>/critic.md, <folder>/desc.md
Plan: DEPRECATED_[filename] — written, not implemented

Implementing now would build on an assumption already known to be
unreliable. What gets built would look finished and be wrong.

To close it: [what must be known, and who can answer]

Re-run /task-impl on this folder once it is resolved.
```

---

## Rules

1. Use `critic-d`, not `critic`.
2. Never execute a delegated step from memory.
3. Fold only what is marked `selected`.
4. The meaning-gap cycle caps at 2. A plan that dies on a failed experiment counts.
5. Do not re-critique after folding.
6. Do not improvise past the plan.
7. Halt on blockers. Never implement past one.
8. Stop for nothing but the three gates. Decompose and Return decide whether the
   chain starts; once it starts, every step hands straight to the next one.
9. The user can interrupt at any time. Checkpoints and the Summary are printed for
   visibility — they are informational, not gates. Never wait on one.
10. Three rejections means Decompose, never a fourth plan.
