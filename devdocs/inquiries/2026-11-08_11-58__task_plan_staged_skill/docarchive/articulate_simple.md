# Articulate Simple — task-plan-staged skill

## User Input

```text
I would like to build something called task plan staged. Okay, it's another scale, but basically it is for big tasks where each where the idea is to first generate a kind of like a big plan, but from the concepts and general understandings and directions and how they should be, it's still not like just description, it's a technical but more lightweight technical thing, because it is something that just kind of because it has many moving parts, many different concepts are in it, or just it's just big, so you cannot really plan it fully without actually initial parts are more concrete and established, and then next part can be, you know, build on top of it, because maybe there will be something that will not wrong and it will fail, and the plan is just has to adapt fully, which is not good. And what we do is just actually is it is just it creates this um, this actually creates like a stage by stage plan, and this stage by stage plan, each stage is kind of explained enough. It kind of, you know, understands the task in terms of stages. And for each stage for each stage. It kind of creates some sub-steps some steps of this plan as well, so it's just the generic understanding of how something should be built. And like what stage one, step two, step three maybe, stage 2, stage 3, they also have this steps. And then this can be used to actually this can be combined with task-impl skill for each step ,
to run full traverse on this to understand it better. Because this is something actually I do manually, I just say it like create a stage plan and then for each part I'm running task implement skill, okay? And like so that stage plan part I don't wanna I don't want to every time prompting, and this skill can be useful and first I want you to understand what I'm trying to say better. Okay, and then focus on each stage, like you understand it's not really complicated, it's not really bloated, it's really kind of simple, like things to build, directions, and of course with technicality in it, it's not like so simple, it's not just like the concept, but yeah, like stages are maybe concepts to build, and steps still give enough good direction about the what to build, and maybe we can add some a couple of more fields per step or per stage. But I don't want to bloat it, and with unnecessary things, because most of it is dynamically like built, during the implementation phase. So I don't want to give unnecessary concrete like requirements and yeah,
```

## Substrate

**Warm.** The statement names `task-impl` and `traverse` directly, and the session carries the full task chain (`task-desc` → `meaning-gaps` → `task-plan` → `critic-d` → `task-impl`), `task-plan`'s per-step field vocabulary (Proposed changes / Output / Safe in nature / Peripheral concepts / Hardness Lvl), the Huge Hard Blockers gate, the fold mechanism, the `DEPRECATED_*` convention, model/effort stamping, `meaning-gaps` routes, and a repeatedly enforced no-bloat / no-self-description rule for skill files. Relevance is unambiguous; warm treatment applies.

---

## Itemize

**count:** 1

**items:**
- **I1** — Build a skill called `task-plan-staged` that, for a big task with many moving parts, generates a stage-by-stage plan (stages, each with steps) that is technical but lightweight, where each stage can be fed to `task-impl`, without bloat and without premature concrete requirements.

The clauses "first I want you to understand what I'm trying to say better … and then focus on each stage" are a sequencing instruction to this inquiry, not a separate deliverable. Keep-together holds.

---

## Item I1

### Stage 2 — Meta-questions

**MQ1 — verdict-axis.** *What is the user asking for?*
identified-ambiguities-list:
- `build-the-skill-file-now` vs `understand-and-design-first-then-build` vs `articulate-the-concept-only-this-pass` — the statement says "first I want you to understand," leaving open whether this invocation ends in a design, a file, or only an understanding.
- `new-standalone-skill` vs `a-staged-mode-of-task-plan` vs `a-stage-level-orchestrator-above-task-impl` — the packaging is unstated.
- `plan-generator-only` vs `plan-generator-plus-runner` — "can be combined with task-impl for each step" leaves open whether the skill invokes `task-impl` or only produces its input.

**MQ2 — context-need axis.** *What context does the response need that isn't in the statement?*
identified-ambiguities-list:
- **verdict:** what `task-impl` accepts as input today (a folder with `desc.md`, a `desc.md` path, or a raw description) — so whether a stage maps to a `desc.md`, a folder, or something new is a design question not a given; `task-plan`'s current per-step schema, since "a couple more fields" is relative to it; the folder convention a staged plan would live in; whether "run full traverse on this" means the `/traverse` skill literally or "understand it fully" loosely.
- **kinds:** an example of what the user's manual "create a stage plan" prompt produces today — the shape they already accept; the threshold for "big" — what makes a task staged rather than a normal `task-plan`.
- **stance:** whether a stage is a planning unit, an implementation unit, or both; whether the staged plan is write-once or a living document revised after each stage, given "most of it is dynamically built during implementation"; who decides a stage is "concrete and established" enough to plan the next — the human, the skill, or `task-impl`'s Verify.

**MQ3 — intent-axis (WHAT).** *What is the user trying to accomplish?*
identified-ambiguities-list (action-endpoints):
- `a-staged-plan-artifact-exists` — a file with stages → steps, produced on demand.
- `each-stage-is-dispatched-to-task-impl` — the endpoint is an orchestration, not a document.
- `a-plan-that-survives-early-stage-failure` — the endpoint is a plan with a specific robustness property: a failed stage N does not invalidate stages N+1…
- `the-stage/step-schema-is-defined` — the endpoint is the format itself ("maybe we can add a couple more fields").

**MQ4 — boundary-axis.** *What is the user explicitly excluding?*
identified-ambiguities-list (NOT-list):
- intrinsic — NOT bloated; NOT a full detailed plan up front ("you cannot really plan it fully"); NOT "just description"; NOT "unnecessary concrete requirements"; NOT complicated; NOT a plan that "has to adapt fully" when one part fails.
- extrinsic (session) — NOT self-describing or design-talking inside the skill file; NOT referencing `devdocs` conventions beyond the sibling skills it calls; NOT re-deriving what `task-impl` already does per step.

### MQA

**reconcile** on two joint axes:
- **orchestration-scope** — MQ1 `plan-generator-only vs plus-runner` and MQ3 `artifact-exists vs dispatched-to-task-impl` span the same axis: does the skill *produce input for* `task-impl` or *invoke* it.
- **failure-robustness** — MQ4 "NOT a plan that has to adapt fully" and MQ3 `survives-early-stage-failure` are one concern from the exclusion side and the endpoint side.

**ALIGNED** otherwise. MQ1's packaging axis (standalone / mode / orchestrator) and MQ3's schema endpoint are distinct and flow through unchanged.

### Stage 3 — Deconstruct

tuple = (
  **deliverable:** a skill definition file in the pack's idiom, which itself specifies an output format;
  **kinds:** one markdown skill file + the staged-plan document format it prescribes (stages → steps, small field set) + a "big enough to stage" test;
  **bounds:** planning layer only — produces a plan, never code; sits between `task-desc` and `task-impl` in the chain; lightweight — a couple of fields per stage or step, not a full per-step spec
)

Late-split check: the deliverable has two faces (the skill, the format it emits) but one artifact carries both. No split signal.

### Stage 3 — MultiDepth

**literal-statement:**
Build a skill called task-plan-staged, for big tasks with many moving parts, that first generates a stage-by-stage plan from concepts, general understandings, and directions — technical but lightweight, not just description — where each stage is explained enough and has steps, so that each stage can be combined with task-impl; the user does this manually today by prompting "create a stage plan" and running task-impl per part; the skill should not be bloated and should not give unnecessary concrete requirements, since most of it is built dynamically during implementation; maybe a couple more fields per step or per stage.

**purpose-motivation-ambiguities (WHY-axis):**
identified-ambiguities-list:
- `eliminate-repeated-prompting` — the same "create a stage plan" prompt is typed every time; make it a skill.
- `contain-failure-blast-radius` — one wrong early assumption currently forces the whole plan to adapt; staging limits what a failure invalidates.
- `defer-detail-until-grounded` — later parts cannot be planned concretely until earlier parts are real; staging postpones concreteness to when it is cheap.
- `give-each-stage-full-rigor` — a monolithic plan gets one critique; a staged plan gets the whole `task-impl` chain per stage.
- `codify-an-existing-habit` — the practice already works manually; the motivation is to make the pack contain what is actually done.

### Stage 4 — Considered Articulations

Bounded by: deliverable shape (skill file + plan format); the identified dimensions (orchestration-scope, packaging, schema, failure-robustness, living-vs-write-once); the NOT-list; warm substrate.

1. **Generator only, standalone.** `task-plan-staged` reads a big task's `desc.md` and writes `staged_plan.md`: N stages, each with a short technical direction and a few steps carrying a minimal field set. The human runs `task-impl` on each stage by hand. The skill never invokes anything.

2. **Generator plus dispatcher.** The same plan, but the skill also creates one task folder per stage — each with a `desc.md` derived from the stage — and runs `task-impl` on stage 1, then 2, in order. A stage-level orchestrator above `task-impl`, the way `task-impl` is a step-level orchestrator above `task-plan`.

3. **Living staged plan.** Later stages are deliberately sketched thinner than earlier ones. After each stage is implemented, the skill is re-run and firms up stage N+1 against what stage N actually produced. Robustness to early failure comes from never planning N+1 in detail before N is real.

4. **A staged mode of `task-plan`.** Not a new skill — `task-plan --staged`, reusing its Huge Hard Blockers gate and per-step vocabulary. A stage is a named group of steps with a one-line direction above it; the staged plan is a `step_by_step_impl_plan.md` with stage headers.

5. **Schema-first and thin.** The skill's center of gravity is the format: a stage carries {what it builds, why it is its own stage, what it must leave established for the next}; a step carries {direction, output} and nothing more. The skill text mostly defines that format and the test for "big enough to stage," and says little else.

---

## Self-assessment

LAYER 1 self-check, single pass: Mode 1 no · Mode 2 no (the "understand first" clause is sequencing, not a second item) · Mode 3 no · Mode 4 no · Mode 5 no · Mode 6 no · Mode 7 no · Mode 8 no · Mode 9 no. Zero fires. Friction: low — one brief Itemize deliberation.

**Verdict: HIGH-PROCEED**
