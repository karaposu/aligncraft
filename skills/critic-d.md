# /critic-d — Dynamic Critic (Three-Pass)

Generate a context-aware critic prompt tailored to a specific implementation plan,
save it for review, execute it, then select which mitigation to actually implement.
Unlike `/critic`, this doesn't use a generic checklist — it builds a custom one
based on your codebase and plan.

The three passes run automatically, one after another:

| Pass | What it does | Output |
|------|-------------|--------|
| **Phase 1** | Build a critic prompt tailored to this plan and codebase | `dynamic_critic_prompt.md` |
| **Phase 2** | Run it — produce the verdict and the risks, each with three mitigation proposals and empty selection boxes | `critic.md` |
| **Phase 3** | Judge the proposals against the selection principles — tick boxes, write notes | `critic.md` updated in place |

Phase 2.5 interrupts this: if the verdict is DO NOT IMPLEMENT, the run ends there
and Phase 3 never happens. Phase 2.6 handles REORDER — TEST BEFORE BUILD: the
experiment is specified, the plan is kept, and Phase 3 still runs.

## Additional Input/Instructions

$ARGUMENTS

## Instructions

### Step 0: Resolve Which Plan to Critique (if it is not stated clearly and explicitly)

unless it is not clearly stated do this :
Use your understanding of the already developed context or given Additional Input/Instructions (can be about codebase workspace, or past conversation regarding this topic etc) to interpret what is the relevant step by step plan path, 

If multiple plans are referred in past recent messages (check last 4,5 messages)  — present them as a numbered list and ask the user to confirm which one to critique. Do NOT proceed until the user confirms.

**If only one plan exists** — show the user which plan you found and ask for a quick confirmation before proceeding.


**Only after the user confirms**, continue to Phase 1.

But if plan is stated claerly you can skip this step. 

### Step 0.5: Read the Declared Blockers

Before analysing anything, read:
- The plan's `### Huge Hard Blockers` section, if it has one
- The sibling `desc.md`'s `## Known Blockers` section, if it has one

**Anything declared there is known as a blocker.** Do not re-derive it as a
finding. But known is not handled: a plan that names a premise and schedules its
test after the work that depends on it has disclosed the risk, not closed it.
Declared premises go into the Premise Inventory like any other.

- **If the plan declares an OPEN planning blocker** — do not return it as a
  finding. Confirm it, skip the risk analysis, and go straight to Phase 2.5
  (DO NOT IMPLEMENT). The plan already knows it cannot stand; your job is to run the
  procedure, not to re-derive the problem.
- **If a planning blocker is `OPEN — working assumption`** — first ask what kind
  of premise it is.
  - *Documentary* — about what code, a schema, or a spec says. Test it against the
    codebase and reachable documentation. Wrong → DO NOT IMPLEMENT. Confirmed →
    say so and continue; the plan stands on firmer ground than it claimed.
  - *Behavioural* — about what a model, a model version, a device, or a vendor
    service will do. Reading cannot confirm this. Do not mark it confirmed from
    documentation. It is a premise for the inventory, and only running the real
    component closes it.
- **Declared execution blockers** — carry them into `critic.md` unchanged, as
  preconditions. They are not risks. No severity rating, no mitigation tiers.


---

### Phase 1: Generate the Dynamic Critic Prompt




Okay your task in Phase 1 is to improve a prompt

We have a prompt for generating `critic.md` against an already created implementation plan. Since the critic drives how we revise and improve the plan, it is vital that it catches the right problems — the ones that actually matter.

Here prompt starts:
----
Now based on the implementation plan

I want you ultrathink and Identify ERRORs, compatibility ISSUES, RISKS and CONFLICTS with respect to whole codebase's work logic. Check if this implementation plan causes:
- Existing features that might break
- Performance implications
- API contract changes
- Database schema impacts
- Security considerations

Document:
- Potential conflicts or breaking changes or errors.
- API contract changes required
- Which existing features might be affected
- Database schema impacts
- Security considerations
- Required refactoring before implementation
- Performance implications (latency, memory, storage)
- Question architectural choices for future development,deployment, propose better alternatives to the plan's approach if they match the project's and feature's fundementals. 
- if any near future requirements are in your context regarding codebase, use them to show better alternative approaches too. But explicitylu state that they are better in the future context only. 
- Don't just patch the plan — question whether the plan's assumptions are correct.

Also check if plan is detailed enough, if any step's implementation is too high level compared to complexity of the relevant code section and concepts, mention that as a Medium risk. 

Rate each risk (severity) as: Low/Medium/High
For each Medium/High risk, suggest three levels of mitigation : 
    - a quick fix,
    - a robust fix 
    - a long-term fix. 
   for robust fix add a subfield called  "why this is robust:" and for long term fix  add a subfield called  "why this is long term effective:"

Each Item should have an impact field (possible effects of this Risk Item), a NoobEng field (for an engineer who reads code fine but does not know THIS system's dynamics), and a Risk field written as TWO paragraphs: paragraph 1 plain and self-contained for a reader who does not know this codebase, paragraph 2 precise with exact file paths, symbol names and trigger conditions.

Analyze how this feature will interact with the existing codebase:

1. Read all relevant module interfaces and implementations
2. Create critic.md in relevant devdocs folder (same folder as our step by step plan file )


----

But this prompt is too generic — it doesn't account for the specifics of the current task.
The critic prompt should be generated dynamically, informed by the concepts of existing codebase. It needs to ask the right questions for this particular implementation plan, not just a generic checklist.


Based on context you have of the codebase, task itself and step by step plan; generate an improved critic prompt tailored to the given codebase and feature itself

 - Make sure generated custom critic is still generic enough but also questions are towards correct and relevant concepts of the feature and the codease, otherwise next phase might miss undocumented details. We want custom critic to be custom tailored to the concepts of the codebase and the feature itself and not to implementation details.    

 - Make sure generated prompt includes output instructions "Create a `critic.md` file in the same directory as the implementation plan. And this output file has high level summary on top". 


 - Make sure generated prompt requires a **frontmatter block** as the very first thing in `critic.md`, recording what produced the critique:

   ```yaml
   ---
   model: [model id from session context, e.g., claude-opus-4-7[1m]; "unknown" if not derivable]
   effort: [effort setting from session context, e.g., max; "unknown" if not derivable]
   ---
   ```

   Read both from session context at write time. Write `unknown` rather than omitting the field or guessing. The verdict below is a judgement call, so what produced it is part of how much weight it carries.

 - Make sure generated prompt requires a **document-level verdict** immediately after the frontmatter, above the high level summary, chosen from exactly four:

   1. **IMPLEMENT AS WRITTEN** — no changes needed.
   2. **IMPLEMENT AFTER FOLDING THESE IN** — the usual case. The plan's shape survives; the findings below get absorbed into it.
   3. **REORDER — TEST BEFORE BUILD** — the plan's shape may survive, but it rests on a premise it has not tested, and it builds on that premise before testing it. Nothing is added to the plan; its sequence changes. The verdict names the experiment, its cost, the step it must precede, and which result converts this to verdict 4.
   4. **DO NOT IMPLEMENT — MEANING GAP** — the plan rests on a premise that is wrong or unestablished. Its steps would be rewritten, not adjusted. Folding fixes in produces a patched document resting on the same hole, and the patching is wasted effort because the steps change anyway. A labelled variant, **DO NOT IMPLEMENT — WRONG LAYER**, applies when the plan cites failures it does not address (see the Restart Check).

   The verdict is about the plan's **shape and sequence**, not the count or severity of findings. A plan can carry several High risks and still be verdict 2 if its premise holds. A plan with a single finding is verdict 4 if that finding is a premise. A plan with no findings at all is verdict 3 if its first untested premise is tested after the work that depends on it.

   Verdicts 1 and 2 judge the plan's *content*. Verdict 3 judges its *order*. Verdict 4 judges whether it should *exist*.

 - Make sure generated prompt requires a **falsifier line** directly under the verdict, on verdicts 1, 2 and 3:

   ```
   Falsifier: [the cheapest observation that would flip this verdict to DO NOT IMPLEMENT]
   Affordable now: yes | no — [cost: time, money, access]
   ```

   If the falsifier is affordable now and the verdict is 1 or 2, the verdict is wrong: it is REORDER, and the falsifier is the experiment. A pass that cannot name its falsifier has not been tested. On verdict 4 the line reads "—".

 - Make sure generated prompt requires a **Premise Inventory** section, placed immediately after the high level summary and before any risk item. Compute it first: it can set the verdict on its own.

   **What goes in.** Two signals; either is sufficient.
   - The plan's own hedging. Any premise the plan marks unproven — *hypothesis, experimental, to be measured at, accepted or refused at, not established, remains unqualified, assume, we expect*. The plan's honesty is the detector, not the exemption.
   - Any claim about how a stochastic component will behave — a model, a model version, a device, a vendor service. Unproven by nature until run, whether or not the plan hedges it.

   **Per premise:**
   - **Premise** — stated plainly
   - **First dependent step** — the first step whose cost is wasted if the premise is false
   - **Waste if false** — steps, days, spend, from that step to wherever the premise is tested
   - **Test scheduled at** — the step where the plan actually tests it, or "never"
   - **Cheapest earlier test** — an observation that would settle it before the first dependent step, with its cost. "None" must be argued, not asserted.
   - **Coverage** — what currently tests this premise. Flag as **non-covering** any test that supplies the behaviour rather than observing it: a scripted tool call, a fake provider returning the wanted output, a helper handing the system state the real component never produced. For a behavioural premise only the real component in the real composition covers it.

   **Rank by waste-if-false.** Never by how clearly the plan discloses the premise. An acknowledged premise with build-before-test ordering ranks above a hidden one with nothing depending on it.

   **Rule.** If any premise has a cheapest earlier test that is affordable now and is scheduled after its first dependent step, the verdict is REORDER, whatever the risk analysis finds. Rank decides which experiment goes first.

   If the inventory is empty, write "No unproven premises found" and say what was checked. An empty inventory on a plan that touches a model or a vendor is itself a finding.

 - Make sure generated prompt requires a **Restart Check** whenever the plan or its `desc.md` cites a prior failure, incident, or abandoned attempt as its reason for existing. One row per observed failure:

   | Observed failure | Established mechanism | Design element that addresses it |

   *Established* means shown, not "plausible contributor." An empty cell is a finding: "this plan does not address [failure]." If most rows have an empty cell, the verdict is **DO NOT IMPLEMENT — WRONG LAYER**: the plan rebuilds a layer the observed failures did not live in.

 - Make sure generated prompt requires an **Inherited Lessons** check whenever `desc.md` carries lessons, prior conclusions, or "assumptions not inherited." One row per lesson: the lesson, and the step in the plan's ordering that satisfies it. A lesson of the form "more X does not imply Y" is satisfied only if Y is tested before the bulk of X is built. Acknowledging a lesson in prose satisfies nothing; the sequence does or does not.

 - Make sure generated prompt includes:

 """
## Output Format

For each risk found, document these fields:

**Risk** — written as TWO paragraphs, in this order. This is the field readers hit
first, so it carries both registers itself rather than deferring the plain one to
a box further down.

  *Paragraph 1 — plain.* What goes wrong, for someone who has not read this plan
  and does not know this codebase's vocabulary. Self-contained. Every
  project-specific name — a module, class, config key, feature, table — is
  introduced with what it IS before it is used. Not "the resolver drops the
  trailing scope" but "the part that turns a login into a list of permissions
  drops the last permission on the list." State the consequence in terms someone
  would actually notice: what breaks, for whom, when. No file paths, no symbol
  names, no line numbers.

  *Paragraph 2 — precise.* The same risk stated technically: file paths, function
  and class names, config keys, the call path or data flow involved, and the exact
  conditions under which it fires. This is the paragraph the implementer and the
  AI work from.

  Both paragraphs describe the SAME risk at two resolutions. Paragraph 1 is not a
  summary of paragraph 2 — it is a genuine explanation of it. Test: could someone
  who has never opened this repository read paragraph 1 alone and understand what
  would go wrong and why it matters? If not, it has failed, and the usual cause is
  internally-referential shorthand — phrasing that works for whoever has been
  living with this codebase's vocabulary and fails for everyone else.

**Severity** — Low / Medium / High
**Category** — Breaking change / Import error / Circular import / Package discovery / Stale cache / Missing file / Phase ordering / (others as the codebase warrants)
**Impact** — possible effects if this risk materialises
**NoobEng** — for an engineer who reads code fine but does not know THIS system's dynamics. The middle register between the two Risk paragraphs: assumes engineering literacy, assumes no familiarity with this project.
**Affected areas** — which existing features, modules, or endpoints are affected
**Mitigation** (Medium/High only) — three proposals: quick fix, robust fix, long-term fix. Keep the existing "why this is robust:" and "why this is long term effective:" subfields.

  Under EACH of the three proposals — quick, robust and long-term alike — emit this scaffold, boxes unticked and both note sections empty. Do not fill them; a later pass does that.

      - [ ] selected   - [ ] elegant   - [ ] last_resort

      **Note**
      *Why chosen:* —
      *For future:* —


Dont use tabular format,  it should be sections with subsections and detailed enough. 
 """

  - Save the generated prompt** as `dynamic_critic_prompt.md` in the same directory as the `step_by_step_plan.md`.
 - Print the generated prompt** in the conversation so the user can read it.
 - Tell  the user: *" dynamic critic prompt is generated and saved. Now I am running it"*

 and switch to phase 2 below:




---

### Phase 2: Execute the Dynamic Critic Prompt

1. Execute the saved `dynamic_critic_prompt.md` against the implementation plan and codebase.
2. Write the results to `critic.md` in the same directory as the plan.

---

### Phase 2.5: If the Verdict is DO NOT IMPLEMENT — MEANING GAP

Do not fold the finding in. Do not write mitigation tiers for it — a wrong premise
cannot be mitigated, only replaced. Run this procedure:

**1. State the gap in `critic.md`.**

Plainly: what the missing or wrong premise is, and why the steps cannot survive it.
Name the specific steps that disappear, reorder, or change meaning once the premise
is corrected. The finding lives here in `critic.md` and is not copied elsewhere.

**2. Rename the plan to mark it dead.**

Take the plan file resolved in Step 0 and prefix its filename with `DEPRECATED_`,
leaving the directory and the rest of the name unchanged:

```
devdocs/scoped/<task>/step_by_step_impl_plan.md
  -> devdocs/scoped/<task>/DEPRECATED_step_by_step_impl_plan.md
```

Use whatever the actual resolved filename is. This is a rename on disk, not a
status field inside the file — a dead plan sitting under a live filename gets
implemented by accident. The prefix also sorts dead plans to the top of a folder
listing, where they cannot be missed.

If `DEPRECATED_<name>.md` already exists — a previous meaning gap on the same task
— insert a counter rather than overwriting it: `DEPRECATED_2_<name>.md`, then
`DEPRECATED_3_<name>.md`. Each dead plan is evidence of a distinct wrong premise
and the sequence is worth keeping.

**3. Record the blocker in `desc.md`.**

The misunderstanding lives in the description, not the plan. Add or update a
`## Known Blockers` section in the plan's sibling `desc.md`:

```markdown
## Known Blockers

### [short name] — OPEN
**What must be known:** [the question]
**Why it blocks planning:** [what gets rewritten once it is answered]
**Found by:** /critic-d on [plan filename], [date]
```

Edit only this section — leave the rest of `desc.md` intact. Recording it here is
what makes the next `/task-plan` run inherit the blocker instead of rediscovering
it.

**4. Do not re-plan now.**

Tell the user what must be answered, who can answer it, and that `/task-plan`
should be re-run from the corrected `desc.md` once the blocker is closed.

**Then stop.** Do not work the remaining findings up into full mitigation tiers —
with the premise in question they may not apply to the replacement plan, and
developing them is the wasted effort this verdict exists to prevent. List them
briefly under a "Deferred pending re-plan" heading so they are not lost.


---

---

### Phase 2.6: If the Verdict is REORDER — TEST BEFORE BUILD

The plan is not deprecated. Its premise may hold; what is wrong is the order.

**1. Name the experiment in `critic.md`**, directly under the falsifier line:

```
Experiment: [what to run — the real component, in the real composition]
Cost: [time, money, access]
Must precede: step [N] — [the first dependent step]
Disqualifying result: [the observation that converts this to DO NOT IMPLEMENT]
Passing result: [the observation that lets the plan proceed as critiqued]
```

The experiment runs the real thing. A scripted stand-in, a fake provider, or a
helper that supplies the behaviour does not close a behavioural premise and does
not satisfy this verdict.

**2. Do not rename the plan.** A REORDER plan is alive. Its steps are still the
steps once the experiment passes.

**3. Do not edit the plan.** Reordering is the orchestrator's job, or the human's.
The critic specifies; it does not restructure.

**4. Tell the user** what to run, what it costs, which step it must precede, and
which result kills the plan.

Then continue to Phase 3. The mitigations are already written; selecting among
them is cheap, and the plan needs them if the experiment passes.

---

### Phase 3: Select the Mitigation Tier

Runs automatically after Phase 2, for verdicts 1, 2 and 3 (REORDER). If the
verdict was DO NOT IMPLEMENT, Phase 2.5 already ended the run and there is nothing
to select.

Phase 3 **only ticks boxes and writes notes.** It does not rewrite risks, add or
remove proposals, or change severities. Phase 2 produced the options; Phase 3
judges them. Keeping the two separate stops the judging from quietly reshaping the
options to suit its own conclusion.

#### The metric: elegance = reach / extent

Two independent properties, not one.

**Reach** — what the fix actually closes:
- *quick* — closes nothing, hides the symptom
- *robust* — closes this instance, permanently
- *long-term* — closes the whole class, so the same bug cannot reappear in the
  next module doing a similar job

**Extent** — how much of the codebase has to move for it.

**Elegance is reach per unit of extent.** The first instinct is the fix that
stabilises things longer-term — but a long-term fix that is large is itself
destabilising, and a robust fix that closes the problem in three lines is worth
more than a class-wide mechanism that touches thirty files. Compare on the ratio,
never on the tier name.

#### Procedure, for every Medium and High risk

**1. Establish whether a class exists.**
Name the other instances explicitly — actual files or modules. If you cannot name
at least one genuine other instance, there is no class, long-term collapses into
robust, and robust is selected. This is the anti-over-engineering gate, and it is
falsifiable: a class you cannot enumerate does not exist.

**2. Test that the similarity is real.**
For the instances you named — would ONE mechanism serve all of them without
special-casing? If it needs per-case branches, they are not one class.
Generalising over things that merely look alike manufactures coupling: you would
be paying extent for fake reach. Fall back to robust.

**3. Compare elegance.**
Reach / extent for each surviving candidate. Higher wins.

**4. Size gate — only if long-term won.**
Does it touch files this plan was not going to touch, grow the plan substantially,
or force its steps to be reordered? If yes, do not fold it in. Select robust and
split the long-term fix out as one of:

- **Prerequisite work** — this plan waits for it.
- **Future improvement** — this plan ships robust now; the long-term fix is
  recorded for later.

The discriminator: **would the robust fix survive the later long-term fix, or be
thrown away?** Survives -> future improvement, ship robust now. Thrown away ->
prerequisite, because otherwise you are knowingly building something you will
delete.

**5. Blockers.**
A long-term fix can be blocked — access you do not have, effort that cannot be
spent now. This is the same execution blocker idea as in `/task-plan`: the work is
sound, you simply cannot do it yourself right now. When it applies, select robust
and record the situation in the boxes and notes below. Never silently pick robust
as though it won on merit.

**6. Delicacy.**
A delicate system — hard to test, wide blast radius, silent or expensive failure —
argues against big changes (you cannot verify them) AND against accumulating
patches (they compound). Resolution: take the smallest change that closes the
instance now, and route the class fix to prerequisite work, where it gets its own
plan, its own critic and its own tests instead of riding along inside someone
else's.

**On quick fixes:** never selected on the merits. Selected only when something
external forces it — a deadline, a blocking dependency — and the note must name
that pressure.

#### Ticking the boxes

Every proposal — quick, robust and long-term alike — carries the same three boxes.

| Box | Meaning |
|---|---|
| `selected` | this is the one to implement |
| `elegant` | best reach per unit of extent among the candidates |
| `last_resort` | being used, and it is not the pretty answer |

- `elegant` and `last_resort` are mutually exclusive.
- `last_resort` implies `selected` — nothing is a last resort unless you are
  actually taking it.
- `selected` is otherwise independent, which is what makes the combinations carry
  information:

| Boxes | What it records |
|---|---|
| `selected` + `elegant` | the good case — best ratio, taken |
| `selected` + `last_resort` | forced. Something better existed and could not be taken |
| `elegant`, not selected | the better answer, out of reach right now |
| nothing ticked | considered, rejected on the merits, not blocked |

Rows 2 and 3 appearing together on the same risk is the state that matters: *we
knowingly took the lesser fix, and here is the one we would rather have.* Never
select a lesser fix without leaving that pair visible.

#### Writing the notes

Every proposal has a Note field with two sections. Fill only the section that
applies; leave the other as `—`.

- **Why chosen** — on the selected proposal. Why this tier over the others, in one
  or two sentences, referencing the gates above.
- **For future** — on the proposal that was not taken but should be revisited.
  What would be better if it were built, and what has to change for it to become
  available. If a blocker drove the selection, name the blocker here.

#### What this gives the verdict

Verdict 2, *IMPLEMENT AFTER FOLDING THESE IN*, means fold in the `selected`
proposals. Without Phase 3 that instruction has no unambiguous referent — three
tiers are offered and none is marked.

## Output Format (for the generated critic.md)

**The document opens with a frontmatter block:**

```yaml
---
model: [model id from session context, e.g., claude-opus-4-7[1m]; "unknown" if not derivable]
effort: [effort setting from session context, e.g., max; "unknown" if not derivable]
---
```

Read both from session context at write time. Write `unknown` rather than omitting
the field or guessing — an unstamped file and a file where derivation failed must
stay distinguishable.

**Then the verdict:**

| Verdict | Meaning | What follows |
|---------|---------|--------------|
| **IMPLEMENT AS WRITTEN** | No changes needed | Findings, if any, are informational |
| **IMPLEMENT AFTER FOLDING THESE IN** | The usual case — the plan's shape survives | Risk items below get absorbed into the plan |
| **REORDER — TEST BEFORE BUILD** | The plan builds on a premise before testing it | The Phase 2.6 experiment runs first; the plan proceeds or dies on its result |
| **DO NOT IMPLEMENT — MEANING GAP** | The plan rests on a wrong or unestablished premise | The Phase 2.5 procedure — do not fold in |
| **DO NOT IMPLEMENT — WRONG LAYER** | The plan does not address the failures it cites | The Phase 2.5 procedure — do not fold in |

Directly under the verdict, the falsifier line: the cheapest observation that
would flip this to DO NOT IMPLEMENT, and whether it is affordable now.

Then the high level summary.

Then the **Premise Inventory**, before any risk item. Then the Restart Check and
the Inherited Lessons check, when they apply.

For each identified risk item, document:

| Field | Description |
|-------|-------------|
| **Risk** | Two paragraphs — see below. Plain first, precise second. |
| **Category** | Breaking change / Performance / Security / API contract / Schema / Compatibility...|
| **Severity** | Low / Medium / High |
| **Impact** | Possible effects if this risk materializes |
| **NoobEng** | For an engineer who reads code fine but does not know THIS system's dynamics |
| **Affected areas** | Which existing features, modules, or endpoints are affected |
| **Mitigation** (Medium/High only) | Three levels: quick fix, robust fix, long-term fix |

### The Risk field — two paragraphs

The Risk statement is the first thing anyone reads, so it carries both registers
itself instead of deferring the readable one to a field further down.

**Paragraph 1 — plain.** What goes wrong, for someone who has not read this plan
and does not know this codebase's vocabulary. Self-contained: every
project-specific name is introduced with what it IS before it is used. State the
consequence in terms someone would actually notice — what breaks, for whom, when.
No file paths, no symbol names, no line numbers.

**Paragraph 2 — precise.** The same risk stated technically: file paths, function
and class names, config keys, the call path or data flow involved, the exact
conditions under which it fires. This is what the implementer and the AI work
from.

Same risk, two resolutions. Paragraph 1 is an explanation of paragraph 2, not a
summary of it.

**Test for paragraph 1:** could someone who has never opened this repository read
it alone and understand what would go wrong and why it matters? If not, it has
failed. The usual cause is *internally-referential shorthand* — phrasing that
works for whoever has been living with this codebase's vocabulary and fails for
everyone else.


### Mitigation scaffold — emitted in Phase 2, filled in Phase 3

Phase 2 writes this structure under every Medium/High risk with the boxes unticked
and both note sections `—`. Phase 3 ticks and fills. A completed one looks like
this — note that it records not just the choice but the tension behind it:

```markdown
#### Mitigation — Quick
Swallow the error at the boundary so the request still returns 200.
- [ ] selected   - [ ] elegant   - [ ] last_resort

**Note**
*Why chosen:* —
*For future:* —

#### Mitigation — Robust
Validate the token at the call site instead of inside the shared helper.
**Why this is robust:** closes it where it actually happens — three lines, one file.
- [x] selected   - [ ] elegant   - [x] last_resort

**Note**
*Why chosen:* Taken because the long-term fix needs vendor dashboard access we do
not currently have.
*For future:* —

#### Mitigation — Long-term
One shared validation layer for all three packages that talk to this vendor.
**Why this is long term effective:** the same bug cannot reappear in the next
package doing this job.
- [ ] selected   - [x] elegant   - [ ] last_resort

**Note**
*Why chosen:* —
*For future:* The better fix — one mechanism covers all three packages. Blocked on
vendor dashboard access. Revisit when access is granted.
```


## Guidelines (Phases 2 and 3)

- Be specific. "This might cause performance issues" is useless. "Adding a full table scan in `getUsers()` on a table with 100k+ rows will degrade response time from ~50ms to ~2s" is useful.
- Only flag real risks. Don't pad the document with low-severity noise that obscures actual problems.
- Every Medium/High risk must have actionable mitigation — not just "be careful."
- Disclosure is not closure. A plan that names a premise and tests it late has recorded the risk, not handled it. Rank premises by what is wasted if they are false, never by how honestly the plan states them.

