# Branch: task_plan_staged_skill

## Source Input
The user's raw request, preserved verbatim. Also lives in `articulate_simple.md`'s `## User Input`; both copies are authoritative for transcription audit.

```text
I would like to build something called task plan staged. Okay, it's another scale, but basically it is for big tasks where each where the idea is to first generate a kind of like a big plan, but from the concepts and general understandings and directions and how they should be, it's still not like just description, it's a technical but more lightweight technical thing, because it is something that just kind of because it has many moving parts, many different concepts are in it, or just it's just big, so you cannot really plan it fully without actually initial parts are more concrete and established, and then next part can be, you know, build on top of it, because maybe there will be something that will not wrong and it will fail, and the plan is just has to adapt fully, which is not good. And what we do is just actually is it is just it creates this um, this actually creates like a stage by stage plan, and this stage by stage plan, each stage is kind of explained enough. It kind of, you know, understands the task in terms of stages. And for each stage for each stage. It kind of creates some sub-steps some steps of this plan as well, so it's just the generic understanding of how something should be built. And like what stage one, step two, step three maybe, stage 2, stage 3, they also have this steps. And then this can be used to actually this can be combined with task-impl skill for each step ,
to run full traverse on this to understand it better. Because this is something actually I do manually, I just say it like create a stage plan and then for each part I'm running task implement skill, okay? And like so that stage plan part I don't wanna I don't want to every time prompting, and this skill can be useful and first I want you to understand what I'm trying to say better. Okay, and then focus on each stage, like you understand it's not really complicated, it's not really bloated, it's really kind of simple, like things to build, directions, and of course with technicality in it, it's not like so simple, it's not just like the concept, but yeah, like stages are maybe concepts to build, and steps still give enough good direction about the what to build, and maybe we can add some a couple of more fields per step or per stage. But I don't want to bloat it, and with unnecessary things, because most of it is dynamically like built, during the implementation phase. So I don't want to give unnecessary concrete like requirements and yeah,
```

## Articulation Reference

- **File:** `devdocs/inquiries/2026-11-08_11-58__task_plan_staged_skill/articulate_simple.md`
- **Itemize count:** 1
- **Per-item identifiers:** I1
- **Verdict:** HIGH-PROCEED
- **Flagged conditions:** none

## Question

**I1 — literal statement.** Build a skill called task-plan-staged, for big tasks with many moving parts, that first generates a stage-by-stage plan from concepts, general understandings, and directions — technical but lightweight, not just description — where each stage is explained enough and has steps, so that each stage can be combined with task-impl; the user does this manually today by prompting "create a stage plan" and running task-impl per part; the skill should not be bloated and should not give unnecessary concrete requirements, since most of it is built dynamically during implementation; maybe a couple more fields per step or per stage.

**What kind of ask this carries (MQ1, preserved as ambiguities):**
- `build-the-skill-file-now` vs `understand-and-design-first-then-build` vs `articulate-the-concept-only-this-pass`
- `new-standalone-skill` vs `a-staged-mode-of-task-plan` vs `a-stage-level-orchestrator-above-task-impl`
- `plan-generator-only` vs `plan-generator-plus-runner`

**What action-endpoints are plausible (MQ3, preserved as ambiguities):**
- `a-staged-plan-artifact-exists` — a file with stages → steps, produced on demand
- `each-stage-is-dispatched-to-task-impl` — the endpoint is an orchestration, not a document
- `a-plan-that-survives-early-stage-failure` — a failed stage N does not invalidate N+1…
- `the-stage/step-schema-is-defined` — the endpoint is the format itself

**MQA joint axes (reconciled):** *orchestration-scope* — does the skill produce input for `task-impl` or invoke it (spans MQ1's generator-vs-runner and MQ3's artifact-vs-dispatch). *failure-robustness* — the plan must not have to adapt wholesale when one part fails (spans MQ4's exclusion and MQ3's survives-failure endpoint). Packaging and schema axes flow through unreconciled.

## Goal

**Deliverable shape (Deconstruct):** deliverable = a skill definition file in the pack's idiom which itself specifies an output format; kinds = one markdown skill file + the staged-plan document format it prescribes (stages → steps, small field set) + a "big enough to stage" test; bounds = planning layer only, never code; sits between `task-desc` and `task-impl` in the chain; a couple of fields per stage or step, not a full per-step spec.

**Motivations a good answer might serve (WHY-axis, preserved as ambiguities):**
- `eliminate-repeated-prompting` — the same "create a stage plan" prompt is typed every time
- `contain-failure-blast-radius` — one wrong early assumption currently forces the whole plan to adapt
- `defer-detail-until-grounded` — later parts cannot be planned concretely until earlier parts are real
- `give-each-stage-full-rigor` — a monolithic plan gets one critique; a staged plan gets the full `task-impl` chain per stage
- `codify-an-existing-habit` — the practice already works manually; make the pack contain it

**Context downstream needs that the input does not carry (MQ2):**
- *verdict:* what `task-impl` accepts as input today (folder / `desc.md` / raw description), so whether a stage maps to a `desc.md`, a folder, or something new is a design question; `task-plan`'s current per-step schema, since "a couple more fields" is relative to it; which folder a staged plan lives in; whether "run full traverse" means the `/traverse` skill literally or "understand fully" loosely.
- *kinds:* the shape of what the user's manual "create a stage plan" prompt produces today; the threshold for "big."
- *stance:* whether a stage is a planning unit, an implementation unit, or both; write-once vs living document; who decides a stage is "concrete and established" enough to plan the next.

**What would explicitly fail (MQ4 NOT-list):**
- intrinsic — bloated; a full detailed plan up front; "just description"; unnecessary concrete requirements; complicated; a plan that has to adapt fully when one part fails.
- extrinsic — self-description or design-talk inside the skill file; references to `devdocs` conventions beyond the sibling skills it calls; re-deriving what `task-impl` already does per step.

## Considered Articulations

**Item I1:**
1. **Generator only, standalone.** `task-plan-staged` reads a big task's `desc.md` and writes `staged_plan.md`: N stages, each with a short technical direction and a few steps carrying a minimal field set. The human runs `task-impl` on each stage by hand. The skill never invokes anything.
2. **Generator plus dispatcher.** The same plan, but the skill also creates one task folder per stage — each with a `desc.md` derived from the stage — and runs `task-impl` on stage 1, then 2, in order. A stage-level orchestrator above `task-impl`, the way `task-impl` is a step-level orchestrator above `task-plan`.
3. **Living staged plan.** Later stages are deliberately sketched thinner than earlier ones. After each stage is implemented, the skill is re-run and firms up stage N+1 against what stage N actually produced. Robustness to early failure comes from never planning N+1 in detail before N is real.
4. **A staged mode of `task-plan`.** Not a new skill — `task-plan --staged`, reusing its Huge Hard Blockers gate and per-step vocabulary. A stage is a named group of steps with a one-line direction above it; the staged plan is a `step_by_step_impl_plan.md` with stage headers.
5. **Schema-first and thin.** The skill's center of gravity is the format: a stage carries {what it builds, why it is its own stage, what it must leave established for the next}; a step carries {direction, output} and nothing more. The skill text mostly defines that format and the test for "big enough to stage," and says little else.

## Scope Check

IN scope (Deconstruct bounds): a skill file and the plan format it emits; the planning layer; the seam to `task-impl`. OUT of scope (MQ4): code generation; a full upfront plan; per-step detail that `task-impl`'s own chain will produce.

**Question covers goal.** Every goal element (file, format, "big" test, seam to `task-impl`) is addressed by the question's ask; every exclusion is honoured by the question's own wording.

**Specific-vs-pattern:** the input cites no specific examples; the inquiry addresses the general pattern.

## Layer Commitment

Required: the inquiry is defining a discipline artifact, and one considered articulation (4) would restructure an existing one (`task-plan`).

**Primary layer: Structural** — what the staged plan *looks like*: what a stage is as a unit of the document, what a step is, which few fields each carries, how stages relate, and where the artifact lives. This is where the user's own emphasis sits ("stages are concepts to build, steps give direction, a couple more fields, don't bloat it").

Other layers considered, and how this run treats them:
- **Meaning** (what a stage *is* as a cognitive unit — a concept to build, a dependency boundary, a failure containment boundary) — not out of scope but subordinate: Structural work cannot fix the fields without answering it, so Sensemaking will settle it as a prerequisite rather than as this run's deliverable.
- **Process** (whether the skill only generates the plan or also dispatches each stage to `task-impl`; write-once vs living) — the largest open alternative, carried as considered articulations 1 / 2 / 3 through the pipeline. This run surfaces it for the user to decide; it does not silently default. If Critique finds the process question dominates the structural one, the next inquiry is `Process: should task-plan-staged orchestrate task-impl?` and this one hands off to it.

Sequential plan: Meaning (as prerequisite, inside Sensemaking) → Structural (this run's deliverable) → Process (decided by the user from this run's surfaced alternatives, or a follow-on inquiry).
