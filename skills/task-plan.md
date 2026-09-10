# /task-plan — Blocker-Gated Implementation Plan

Generate a step by step implementation plan for a given task desc. Huge hard blockers
are identified before any steps are written — an open planning blocker stops the plan.

## Additional Input/Instructions

$ARGUMENTS

## Instructions

### Phase 0: Resolve Which task desc to base the implemenation plan (if it is not stated clearly and explicitly)

unless it is not clearly stated do this :
Use your understanding of the already developed context or given Additional Input/Instructions (can be about codebase workspace, or past conversation regarding this topic etc) to interpret what is the relevant desc markdown file,
 
If multiple descs/tasks are referred in past recent messages (check last 4,5 messages)  — present them as a numbered list and ask the user to confirm which one to create the implement the plan . Do NOT proceed until the user confirms.

**If only one task/desc exists** — show the user which plan you found and ask for a quick confirmation before proceeding.







### Phase 1: Identify Huge Hard Blockers

Before writing any steps, determine what stands in the way. Run two gates, in order.

#### Gate 1 — Resolvability. Applied to everything.

**Can you resolve this yourself? If yes, resolve it. It is not a blocker.**

Not knowing something is never a huge hard blocker. Go and find out. You have at
least these routes, and you are expected to exhaust them before declaring
anything:

- **Read the code** — how a module works, what a config does, what a function returns
- **Read the documentation** — the library's, the framework's, the vendor's
- **Search the web** — an API you do not know, a version difference, an error
  message, a changelog, a known issue
- **Write a probe and run it** — when the answer is behavioural rather than
  documented. A small script that calls the real thing with real input and prints
  what comes back settles the question. "I am not sure how this behaves" is a
  reason to go run something, not a reason to stop.

A section full of unfinished homework labelled as blockers makes the section
meaningless.

A thing is a **huge hard blocker** only when every route above is exhausted and it
is still out of reach:
- It needs a decision only a human can make
- The information exists nowhere you can reach
- The action required is outside what you can do — an account you do not have, a
  system you cannot touch, a person who must act first

**Strong assumptions do not close a huge hard blocker.** If you reason "this framework
conventionally does X, so I'll assume X" — state the assumption, but the blocker
stays OPEN. A convention is not a confirmed premise. Only going and finding out
closes it.

#### Gate 2 — Separation. Applied to what survives Gate 1.

**Would knowing the answer rewrite the steps, or only change when they run?**

- Rewrites the steps → **planning blocker**
- Changes timing or conditions → **execution blocker**

**Planning blockers** are unanswered questions so fundamental that any plan
written before they are answered is guesswork. Not a missing detail — a missing
premise. The answer would reorder, replace, or delete steps rather than adjust
them. A plan written on top of one is actively misleading: it looks like a
decision has been made when it hasn't.

**Execution blockers** are things outside the plan that must happen before a step
can run. The plan is sound and complete; you just can't finish it alone. Someone
must be notified before a production system is touched. A branch must merge and
deploy. A person must log in.

#### Where blockers come from

1. **Inherited** — read `desc.md` for a `## Known Blockers` section. Anything
   recorded there was found earlier, often by `/critic-d`. Carry it forward and
   mark its source; do not rediscover it.
2. **Discovered while planning** — you work out the steps and hit something you
   cannot get past.
3. **Found in the ground truth** — the codebase, or the vendor/framework
   documentation the task depends on. A planned behaviour that the underlying
   system cannot produce is a planning blocker, not a risk.

#### If a planning blocker is OPEN — stop

Do not write the steps. Write the plan file with the top-level sections and the
Huge Hard Blockers section filled in, and put this immediately after the
frontmatter, as the document's first line of body text:

> **BLOCKED — no steps written.** Open planning blocker: [one line]. This document
> will be completed once the blocker below is closed.

then stop and report to the user:
- What must be known
- What it would change
- Who or what can close it

An open planning blocker means the steps cannot be written yet, not that they
should be written carefully. Stopping here is the correct outcome, not a failure.

Open **execution** blockers do not stop anything. Write the full plan and attach
each one to the step it gates.

---

### Phase 2: Write the Plan

Understand the given task desc in detail. Understand what it tries to achieve by not just code but also using project context, or any bug/fix context as well. 

First think and understand all the steps that need to be done. Once it is clear and in harmony. 

Start creating step_by_step_impl_plan.md in same folder in such way:


## Top-Level Structure

Start the file with a frontmatter block recording what produced it:

```yaml
---
model: [model id from session context, e.g., claude-opus-4-7[1m]; "unknown" if not derivable]
effort: [effort setting from session context, e.g., max; "unknown" if not derivable]
---
```

Read both from session context at write time. Write `unknown` rather than omitting
the field or guessing — an unstamped file and a file where derivation failed must
stay distinguishable.

Then these sections, before any steps:

### What is the task
One paragraph explaining WHAT we're trying to achieve and WHY.
Not the steps — the intent.

### Huge Hard Blockers

Only things that genuinely stop the work. If you can resolve it yourself — by
reading the code, reading the documentation, searching the web, or writing a probe
and running it — it is not a huge hard blocker and does not belong here.
See Phase 1, Gate 1.

What stands in the way, as established in Phase 1. Placed here, before the plan's
substance, so a reader knows whether this document can be trusted before
investing in it. Keep both subsections — write "None identified" rather than
deleting one, so an absence is never ambiguous.

#### Planning Blockers

Questions that must be answered before this plan is worth writing. Each one, if
answered, rewrites steps rather than adjusting them.

For each:
- **Question:** what must be known
- **Why the steps can't survive it:** what specifically gets rewritten, reordered,
  or deleted once it is answered
- **Status:** `OPEN` | `OPEN — working assumption: [assumption] (based on [what])`
  | `CLOSED — [confirmed answer] (confirmed by [how])`
- **Source:** inherited from `desc.md` | discovered during planning | found in
  code or vendor docs
- **Who can close it:** who or what can answer this

#### Execution Blockers

Things outside the plan that must happen before a step can run. The plan is
correct; it just cannot be finished alone.

For each:
- **What must happen:** the concrete precondition
- **Who:** the person, team, deploy, or external party that performs it
- **Blocks:** which step number cannot run until it is done
- **Status:** `OPEN` | `DONE`

Planning blockers bind to the document. Execution blockers bind to a step.

### How this implementation moves toward desired state
Explain how the series of changes transforms the current state
into the desired state. The bridge between the problem (desc.md)
and the solution (steps).
### High-Level Summary

A table with one row per step — step number, short description,
and expected output. The reader should understand the full shape
of the plan in 30 seconds.
| Step | Description | Expected Output |
|------|-------------|-----------------|
| 1    | ...         | ...             |
---

## Per-Step Structure

Each step has:

### Proposed changes

Freestyle explanation of what this step does. Can be long or
short depending on complexity. Include file paths and code
snippets where helpful.

### Output

What concretely exists after this step that didn't before.
A new file, a changed column, a wired connection. Specific
and verifiable.

### Safe in nature
True or False. True means this step cannot break existing
functionality. False means it touches existing behavior and
requires care.

### Peripheral concepts
What other concepts in the codebase this change touches.
Listed inline, not one per line.
Example: async_sessionmaker, Storage facade, tool closures, session lifecycle


### Hardness Lvl
1 to 5. Sets expectations for complexity and review attention.


Create step_by_step_impl_plan.md in relevant devdocs folder (same folder as our desc files, probably under devdocs/scoped but it can be in other folders too )