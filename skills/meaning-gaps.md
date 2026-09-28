name: meaning-gaps
description: Survey a description and its surrounding context for meaning gaps — unresolved questions that something downstream depends on, whose magnitude cannot be known until they are closed. Produces a triaged list: each gap with the route that sizes it (search internal/external, test intermediate/output, traverse, decide), what happens if it goes unsized, and a risk level. Enumerates and triages; does not resolve. Use before planning, when a description is about to become a plan, or on any work whose premises have not been checked.

# /meaning-gaps

Survey a description — and the context around it — for the questions that have not
been answered and that something downstream depends on. Produce a triaged list of
those gaps, each tagged with the route that would size it.

This runs **before** planning. A meaning gap found in a description costs one
question; the same gap found after a plan exists costs the plan. It does not become
more visible as it becomes more expensive.

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

1. Read the input. It can be a `desc.md`, a folder containing one, a file path, or a
   raw description. Consume all of it.

2. **Read the surrounding context, not just the description.** A meaning gap is
   rarely inside the text — it is in what the text assumes about everything around
   it. Read the code, the prior decisions, the related documents, the vendor
   surface the work touches. Surveying only the description finds only its typos.

3. Establish the goal the description is being checked against. Default: *could this
   become an implementation plan?* If the input names a different goal, use that.

4. Execute the process below.

5. Save to `meaning_gaps.md` in the same folder as the input.

6. Write gaps with action `BLOCKS` — and only those — into the sibling `desc.md`
   under `## Known Blockers`. That section is what `/task-plan` inherits, so it must
   stay high-signal. Everything else stays in `meaning_gaps.md`.

---

---- NOW SOLID INSTRUCTIONS START ----

## Execute

### Step 1 — Survey

Go through the description and its context and collect every candidate — anything
unresolved that something downstream would rest on. Collect broadly here; filtering
happens in Step 2.

### Step 2 — Test each candidate against the three properties

A candidate is a meaning gap only if **all three** hold:

1. **Load-bearing** — something downstream rests on it, and the answer would change
   the *shape* of that work, not its details. If the answer only changes a value, a
   threshold, or an ordering, it is a missing detail. Drop it.
2. **Location visible, size unknown** — you can point at it, but you cannot know
   how big the answer is until it is closed.
3. **Magnitude not already known** — if you can predict the size of the answer, it
   is not a gap. Two cases that fail here specifically:
   - *The user knows and simply hasn't said* → a communication gap. Ask.
   - *It is written down somewhere obvious* → unfinished homework. Go read it.

   One case that looks like it fails here but does not: a premise the plan
   acknowledges and schedules for later is still a gap, because acknowledgement
   schedules the test but does not close it.

Everything dropped at this step goes in **Considered and not listed**, one line each
with the reason. A survey that lists everything uncertain is worthless; the
exclusions are how you show the filter ran.

### Step 3 — Assign route(s)

The route is **what act would size the gap**. Assign every route that applies — a
gap can need more than one, and the combination is itself information.

| Route | The answer… | Sizing it means |
|---|---|---|
| **Search · internal** | already decided, here | find the prior decision, convention, or existing behaviour in this project |
| **Search · external** | already true, outside | fetch the doc, spec, standard, changelog, or vendor answer |
| **Test · intermediate** | observable mid-flow | run it and read the data at each stage |
| **Test · output** | observable at the endpoint | run it and read the result |
| **Traverse** | does not exist yet | construct it by reasoning across all constraints at once |
| **Decide** | does not exist and cannot be derived | a person with authority chooses |

**Search · internal is usually already covered** — by now the project material is
often in context. It may still apply when context is partial. It fails *loudly*:
you know whether you read a file.

**Search · external is the one that bites.** It is never in context unless someone
fetches it, and it fails *silently* — for external questions there is a strong prior
from training data that presents as knowledge, fluent and specific and
indistinguishable from having checked. Recall impersonates verification. Treat any
external gap as OPEN until someone actually fetched something.

**Test · intermediate sizes; Test · output confirms.** An output test returns a
boolean — the assumption held or it didn't. An intermediate test returns shape:
which stage diverged, what the data looked like there, how far the divergence
reaches. Magnitude is what a meaning gap withholds, so intermediate is usually the
informative one. A gap sized only by output tests is often sized "small" for the
wrong reason.

**Traverse** is for questions nothing can surface — no document, no system. They
must be worked out by holding many constraints at once. This is where magnitude is
most likely to be large, because a question nobody wrote down and no system can
demonstrate is usually one that was never worked out.

**Decide** is for questions that are not knowledge-shaped at all. No search, test,
or reasoning closes "should this support multi-tenancy" — someone chooses. Traverse
can *size* a decision gap by laying out what each branch costs, but it cannot close
it, so `Traverse + Decide` is a common and correct pair. Filing a decision gap as
Traverse alone burns a long session that ends by handing the question back anyway.

**Not a meaning gap:** needing an account, a credential, or a permission. That has
known shape — it is an execution blocker, and belongs in the plan's Huge Hard
Blockers, not here.

### Step 4 — Assign risk

Risk is **what it costs to leave the gap open** — High / Medium / Low. It is not a
claim about the size of the answer. You do not know the size; that is the point.

Ask: if planning proceeds and the assumption turns out wrong, what has to be redone?

### Step 5 — Derive the action

Route is the cost to close. Risk is the cost to leave open. The action is the pair:

| | Search or Test (cheap) | Traverse or Decide (expensive) |
|---|---|---|
| **High risk** | CLOSE FIRST | **BLOCKS** |
| **Medium risk** | CLOSE FIRST | CLOSE FIRST |
| **Low risk** | DEFER | DEFER |

- **BLOCKS** — planning must not start. High consequence, and no cheap way to size it.
- **CLOSE FIRST** — size it before planning. Worth the cost.
- **DEFER** — record it and move on.

### Step 6 — Set the verdict

- **CLEAR** — no gap has action BLOCKS or CLOSE FIRST. Planning can proceed.
- **CLOSE FIRST** — gaps to close, none blocking. Planning proceeds after they close.
- **BLOCKED** — one or more gaps have action BLOCKS. Planning must not start.

### Step 7 — Close what can be closed honestly

Only **Search · internal** gaps may be closed during this pass, and only when the
answer is verifiably in context — you can point at the file. Record the answer and
move them to *Closed during this pass*.

Everything else stays OPEN. Closing an external gap from recall, or a traverse gap
from a plausible-sounding paragraph, reproduces the exact failure this skill exists
to prevent.

---

## Output Format

Save as `meaning_gaps.md`:

````markdown
---
model: [model id from session context, e.g., claude-opus-4-7[1m]; "unknown" if not derivable]
effort: [effort setting from session context, e.g., max; "unknown" if not derivable]
---
# Meaning Gaps — [subject]

## Goal
[What this was checked against. Default: could this become an implementation plan?]

## Verdict
**[CLEAR | CLOSE FIRST | BLOCKED]** — [one line: how many gaps, what the consequence is]

## Triage

| # | Gap | Route | Risk | Action |
|---|-----|-------|------|--------|
| G1 | [one line] | Traverse + Decide | High | **BLOCKS** |
| G2 | [one line] | Search · external | High | CLOSE FIRST |
| G3 | [one line] | Test · intermediate | Medium | CLOSE FIRST |
| G4 | [one line] | Search · internal | Low | DEFER |

## Gaps

### G1 — [short name]

**What it is:** the unresolved question, stated plainly, understandable to someone
who has not read the description.

**Why it's load-bearing:** what downstream rests on it, and what specifically would
be reshaped — not adjusted — depending on the answer.

**Route:** [route(s)]

**Closing action:** the concrete next act, shaped by the route:
- Search · internal → which file or document to read
- Search · external → what to fetch, and from where
- Test · intermediate → what to run, and what to log at which stage
- Test · output → what to run, and what result to check
- Traverse → the question to hand to `/traverse`, stated in full
- Decide → the question to put to a person, with the options if they are known

**If it goes unsized:** the concrete consequence of planning over it. Not "there may
be issues" — name what breaks and how far it reaches.

**Risk:** High | Medium | Low
**Action:** BLOCKS | CLOSE FIRST | DEFER
**Status:** OPEN

### G2 — ...

## Closed during this pass

Gaps resolved from context, with the answer and where it came from.

- **[name]** — [the answer]. Source: [file].

## Considered and not listed

One line each, with the reason it failed the three-property test.

- [candidate] — missing detail; the answer changes a value, not the shape.
- [candidate] — communication gap; the user knows this, it just was not stated.
- [candidate] — homework; written in [file].

## Handoff

Gaps with action BLOCKS, as written into `desc.md` under `## Known Blockers`.
If none: "None — nothing blocks planning."
````

---

## Failure Modes

**1. Gap inflation.** Everything uncertain gets listed. The survey becomes noise and
gets ignored. *Guard:* the three-property test in Step 2, and the Considered and not
listed section — if it is empty, the filter did not run.

**2. Silent external closure.** An external gap is closed from training recall
rather than a fetch. This is the discipline failing at its own core purpose.
*Guard:* only Search · internal may close during the pass, and only with a file to
point at.

**3. Magnitude guessing.** Asserting a gap is small without sizing it. *Guard:* risk
is consequence-if-unsized, never a claim about the answer's size. If you knew the
size, it would not be a gap.

**4. Route misassignment.** A decision filed as Traverse burns a session and ends by
handing the question back. A traverse filed as Search sends someone looking for
something nobody ever wrote. *Guard:* Step 3's organizing question — does the answer
exist, and where does it live?

**5. Description-only scanning.** Reading the description and nothing around it.
Meaning gaps live in what the text assumes about its surroundings, so this finds
almost nothing and reports CLEAR. *Guard:* Step 1 requires reading the context.

---

## Reference — what a meaning gap is

> **A meaning gap is an unresolved question that something downstream depends
> on, whose magnitude cannot be known until it is closed — where the answer
> may change the shape of the work rather than its details, and where leaving it
> open produces a confident-looking artifact that has quietly assumed an answer.**

**It is load-bearing.** Resolve it one way versus another and the next artifact is
structurally different. If the answer only changes a value, it is a missing detail.

**Its location is visible; its size is not.** You can point at the unresolved
regions — that is what makes this a discipline rather than luck. What cannot be
known in advance is how big the answer turns out to be.

**Its magnitude gets assumed rather than measured.** A plan cannot be written
without implicitly committing to a size. Writing steps over an open gap assumes the
answer is small enough not to disturb them. That assumption is never stated, so it
is never checked. The danger is not a hidden gap — it is a visible gap that got
silently sized.

### Why it matters

The cost of a meaning gap scales with how far downstream it is found, and its
visibility scales inversely. At the description it costs one question; at the plan
it costs the plan; after shipping it costs everything built on top since. But it
becomes *less* obvious as it becomes more expensive, because more structure
accumulates above it and all of that structure is internally coherent.

Ordinary review cannot catch it. Review asks whether the work is correct *given* its
premises; a meaning gap is a defect *in* the premises, so the work passes — it
genuinely is internally consistent. Care offers no protection: a meticulous artifact
built on a wrong premise is worse than a sloppy one, because it is more convincing.

This is domain-agnostic. A research programme resting on an unverified assumption
about what the data contains; a business plan resting on an unexamined assumption
about who the customer is; a legal argument resting on an assumption about which
jurisdiction governs. Same structure: load-bearing, unsized, filled in rather than
resolved.

### What this skill produces

Not "things you did not know you did not know" — that would be unfalsifiable. It
produces **the regions where the work is unsized, and how to size each one.** Known
unknowns of unknown magnitude, which is a checkable claim.
