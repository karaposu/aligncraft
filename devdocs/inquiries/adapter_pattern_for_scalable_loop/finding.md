---
status: active
---
# Finding: Adapter Pattern for Scalable Loop

## Question

The inquiry (from `_branch.md`) asked how to design the **adapter pattern** — the mechanism by which discipline specs auto-attach as configurations to the SIC loop (the Sensemaking → Innovation → Critique pipeline run by `/MVL`, our minimum-viable-loop runner) — so that it works for both **human-driven use today** AND **scales to autonomous multi-headed loops** that can branch, self-rerun, and self-improve, without introducing bottlenecks that block either the present or the future.

The goal was a concrete architecture that:

1. Makes adapters work NOW (implementable today, not a research project),
2. Doesn't block loop automation (the system can eventually run SIC passes without a human typing each command),
3. Supports multi-headed branching (one loop producing multiple paths, each path looped independently),
4. Identifies all bottlenecks the two pre-existing proposals (Option A: auto-detect adapter in MVL; Option B: named entry-point commands like `/MVL-wayfinding`) would create for these goals.

The user wanted to walk away with a clear architectural direction and know what to build first.

## Finding Summary

- **The adapter is a file: `_adapter.md` in the inquiry folder.** Three sections — S guidance (prose), I guidance (prose), C traps (checklist). Sourced by copying from a central template; freely customizable per inquiry. This pattern is **level-agnostic** — the same file works whether a human, the system, or an autonomous agent wrote it. What changes across autonomy levels is who writes it, not how it works.

- **Both pre-existing proposals are superseded.** Option A (auto-detect adapter from question content inside MVL) reintroduces the classification problem we already solved by retiring CONFIGURE. Option B (named entry-point commands like `/MVL-wayfinding`) doesn't compose — every adapter combination needs its own command, leading to command proliferation. The file-based adapter has neither problem.

- **The "adapter is the loop's DNA."** This was the assembly insight: the same file carries configuration (S/I/C guidance), eventually quality gates (telemetry thresholds), and inheritance into sub-branches. The five things we thought we were building (adapter, telemetry, dispatch, branching, autonomy) are really one continuously-growing file plus one continuously-growing command — not five separate sub-systems.

- **Merge is not a new mechanism — merge IS a SIC pass with a synthesis adapter.** When multi-headed branching produces N branch results that need to be combined, the merge step is itself a SIC run: S reads the branch answers, I generates synthesis candidates, C evaluates coherence against the parent question. The system uses its only primitive for the new operation rather than inventing a parallel one.

- **Build incrementally — one file, one command, additive over time.** Build 1 ships the three-section adapter plus an ABORT-able `_state.md` status field. Build 1.5 adds a telemetry-thresholds section to the same file. Builds 2–5 add behavior to the same MVL command. No build redesigns prior work.

- **The Build 1 / Build 1.5 split is load-bearing.** Innovation initially proposed shipping telemetry thresholds together with the adapter (one collapsed Build 1+2). Critique caught that thresholds need calibration data from real use — which doesn't exist before Build 1 has run. So thresholds wait until ~10 inquiries have run with adapters; same file, additive section, no migration.

- **Add the ABORT signal now.** A single `## Status` field in `_state.md` (`ACTIVE | ABORT | COMPLETE`) costs nothing today and is non-negotiable for autonomous loops later. Ship it in Build 1.

## Finding

### 1. The three orthogonal dimensions

The structural breakthrough in Sensemaking was recognizing that the question — which appeared to be "how should the adapter work?" — actually contained three independent design dimensions that had been collapsed into one:

| Dimension | What it is | Today's state |
|---|---|---|
| **Adapter** | How discipline specs configure each S/I/C slot | Designed-but-not-shipped; this finding settles it |
| **Automation** | How the loop decides "what to run next" without human typing | Open; partially addressed by quality-gate telemetry |
| **Multi-heading** | How one loop branches into multiple independently-looped paths | Folder-based design exists; never wired into MVL |

These dimensions can be designed and shipped **independently**. Options A and B both treat them as one problem (the adapter), which is why they each create blockers in the other two dimensions. Treating the three as separate problems unlocks an incremental path where each piece is independently useful.

### 2. The adapter as a file

The adapter mechanism is a markdown file named `_adapter.md` placed in the inquiry folder alongside `_branch.md` (the question) and `_state.md` (progress). It has exactly three sections:

```markdown
# Adapter: [type]

## S — Input Guidance
[prose — what to read, how to structure input for sensemaking]

## I — Generation Guidance
[prose — what kind of outputs to generate beyond the obvious]

## C — Evaluation Traps
- [ ] [specific trap 1]
- [ ] [specific trap 2]
- [ ] ...
```

The format is deliberately mixed: prose for S and I (where guidance is open-ended and benefits from natural language), checklist for C (where traps are discrete, accumulable, and benefit from explicit machine-readable structure that R can append to over time).

The adapter contains only the **delta** from default SIC behavior, not the full discipline spec. The discipline commands themselves remain unchanged. This keeps adapter files small and keeps the adapter system orthogonal to the discipline system.

### 3. Two-tier storage

```
thinking_disciplines/adapters/    ← Central templates (reusable sources)
  default.md
  wayfinding.md
  comprehension.md
  exploration.md
  decomposition.md

devdocs/inquiries/<name>/         ← Per-inquiry runtime
  _branch.md                       (the question)
  _adapter.md                      (copied from a template, customizable)
  _state.md                        (progress, iteration, history, status)
  sensemaking.md / innovation.md / critique.md
  branch_a/                        ← Sub-branch (Build 4)
    _branch.md / _adapter.md / _state.md / ...
```

Templates live in one central place so they can be reused, evolved, and (eventually) updated by the system itself. Each inquiry gets a **copy** of the chosen template at creation time, so subsequent edits to the inquiry's adapter don't perturb the template, and edits to the template don't perturb in-flight inquiries.

### 4. The unified incremental architecture

The architecture grows along **one file** (`_adapter.md`) and **one command** (`/MVL`). No build redesigns prior work; every build adds a section or a behavior:

```
Build 1   _adapter.md (3 sections) + _state.md status field + MVL reads/injects
Build 1.5 _adapter.md adds Telemetry Thresholds section
Build 2   MVL reads thresholds, flags quality issues
Build 3   MVL auto-dispatches (invokes commands directly instead of telling the human)
Build 4   Branch folders + synthesis adapter template + merge-as-SIC
Build 5   /loop wiring + MVL autonomous + self-abort via telemetry
```

This is the assembly insight in operational form: what looked like five separate sub-systems is one continuously-growing file and one continuously-growing command, with each build unlocking the next.

### 5. Build 1 (the NOW build)

**`_adapter.md` format:** as in §2 above.

**`_state.md` addition:**
```markdown
## Status
ACTIVE
```

`Status` takes one of `ACTIVE | ABORT | COMPLETE`. The dispatcher checks it at every iteration boundary; if `ABORT`, MVL halts. This is one field, one check, zero new infrastructure — but it is the safety primitive the autonomous loop will eventually need, and it costs nothing today.

**MVL changes:**

- **On NEW:** prompt the user to select an adapter template (or use `default.md`), copy the chosen template to `inquiry_folder/_adapter.md`.
- **On RESUME:** read `_adapter.md` and inject the `S` section into the sensemaking prompt, the `I` section into the innovate prompt, and the `C` section into the critique prompt. Adapter content becomes additional context the discipline command sees alongside its normal input.
- **On RESUME:** check the `Status` field in `_state.md`. If `ABORT`, halt with a brief summary; do not start the next discipline.

**Central templates:** ship at minimum `default.md`. Add `wayfinding.md`, `comprehension.md`, `exploration.md`, `decomposition.md` as the corresponding workflows mature.

### 6. Build 1.5 — telemetry thresholds (after ~10 runs)

Once enough inquiries have run with adapters to know what realistic discipline-output quality looks like, add a fourth section to the same `_adapter.md`:

```markdown
## Telemetry Thresholds
- S: perspective_count >= 3
- I: mechanisms_applied >= 2, convergence = YES
- C: adversarial_strength = STRONG
```

MVL reads the thresholds after each discipline step and **flags (warns, does not block)** when below threshold. The shift from "warn" to "block" is a separate, later decision — the warn phase is what generates the data needed to decide whether thresholds should ever block.

The reason this is Build 1.5 and not Build 1 is calibration: deciding what "perspective_count ≥ 3" or "convergence = YES" should mean operationally requires having seen real discipline outputs from real inquiries. Inventing thresholds before that data exists either blocks good work (too strict) or passes garbage (too lenient). Same file, additive section, no migration cost — so deferring is cheap.

### 7. Builds 2–5 (sketch only — not in this iteration's scope)

- **Build 2 — quality flags surfaced:** MVL surfaces threshold warnings to the user without blocking iteration. Generates the data needed to decide whether thresholds should eventually gate.
- **Build 3 — auto-dispatch:** MVL invokes discipline commands directly instead of telling the human "now run /sense-making." Decision logic is derivable from `_state.md` alone (no human judgment required between iterations). Human is still in the loop at iteration boundaries.
- **Build 4 — multi-heading + merge:** branches are sub-folders with their own `_branch.md`, `_adapter.md`, `_state.md`. Each branch is independently runnable from its own folder contents. Merge happens via a SIC pass that uses a **synthesis adapter** — S reads the branch answers (1–2 page summaries, not full outputs), I generates resolution strategies, C evaluates coherence against the parent question.
- **Build 5 — autonomous loop:** `/loop` (Claude Code's recurring-task primitive) repeatedly invokes MVL on an inquiry folder. Self-abort triggers when telemetry drops below threshold for N consecutive runs. Human reviews at checkpoints, not between every step.

These outline the trajectory only; this finding does not commit to their detailed designs.

### 8. Why this supersedes Options A and B

|  | Option A (auto-detect in MVL) | Option B (named entry-point commands) | Adapter-as-file (this finding) |
|---|---|---|---|
| **Classification** | Yes — MVL must decide which adapter | No | No |
| **Composability** | N/A | No — every combination is a new command | Yes |
| **Automation-compatible** | Fragile — auto-detection drifts | Yes | Yes |
| **Multi-heading support** | Unclear — per-branch detection? | Awkward — recursive command names | Natural — each branch has its own `_adapter.md` |
| **Maintenance surface** | Detection logic inside MVL | N commands × M variants | N templates, decoupled from MVL |

Option A reintroduces the classification problem that retiring CONFIGURE was meant to solve — once MVL is making per-question judgments about which adapter to apply, we are back in the same opaque-decision territory. Option B avoids classification but creates command proliferation: every (adapter, mode) combination needs its own command, and there is no clean composition story when adapters need to be combined or refined per inquiry.

The file approach has neither problem because the adapter is **data sitting in the inquiry folder** — selected once at creation, customizable freely, readable by humans, parseable by machines, and orthogonal to whichever command happens to be reading it.

## Next Actions

### MUST

- **What:** Create the central template directory `thinking_disciplines/adapters/` and ship `default.md` (the three-section adapter format with prose S/I guidance and a checklist C-trap section).
  **Who:** Whoever maintains `thinking_disciplines/`.
  **Gate:** Before Build 1 of MVL ships.
  **Why:** Without at least one template, Build 1's "copy template at NEW" behavior has nothing to copy.

- **What:** Update the `/MVL` command (`commands/MVL.md`) to (a) prompt for adapter selection on NEW and copy the template to `_adapter.md`, (b) read `_adapter.md` on RESUME and inject the three sections into the corresponding discipline prompts, (c) check `Status` in `_state.md` and halt on `ABORT`.
  **Who:** `commands/MVL.md`.
  **Gate:** After the central template ships (depends on it).
  **Why:** This is the visible behavior change. Without it, `_adapter.md` is unread inert text.

- **What:** Add the `## Status` field (with values `ACTIVE | ABORT | COMPLETE`) to the inquiry `_state.md` template, and have `/MVL` honor `ABORT` as a halt condition.
  **Who:** Inquiry-folder scaffolding + `commands/MVL.md`.
  **Gate:** Same shipping window as Build 1.
  **Why:** Costs essentially nothing today, and is the safety primitive Build 5 will require. Adding it later means retrofitting state files; adding it now means it is just there.

### COULD

- **What:** Ship `wayfinding.md`, `comprehension.md`, `exploration.md`, and `decomposition.md` adapter templates alongside `default.md`.
  **Who:** Whoever maintains `thinking_disciplines/`.
  **Gate:** When the corresponding workflows have stable enough patterns to capture as guidance.
  **Why:** Useful templates accelerate Build 1's value, but `default.md` is sufficient to make the system work.

- **What:** Add the Telemetry Thresholds section to `_adapter.md` and have MVL surface warnings (Build 1.5).
  **Who:** Adapter templates + `commands/MVL.md`.
  **Gate:** After ~10 inquiries have run end-to-end with Build 1, so thresholds can be calibrated against real discipline output.
  **Why:** The point of Build 1.5 is calibration, not addition. Calibration requires the data Build 1 produces.

### DEFERRED

- **What:** Auto-dispatch (Build 3) — MVL invokes discipline commands directly rather than telling the human to type them.
  **Gate:** After Build 2 (telemetry-flag surfacing) has produced enough warning/non-warning history that we trust the dispatch logic to make sensible per-iteration decisions.
  **Why (if revived):** Removes the largest remaining human-in-the-loop bottleneck for Level 2 autonomy. Premature today because the dispatch decision needs telemetry signal to be principled.

- **What:** Multi-heading + merge-as-SIC + synthesis adapter template (Build 4).
  **Gate:** After auto-dispatch (Build 3) is stable, and after at least one inquiry has produced a branch-shaped result that motivates the merge mechanism in practice.
  **Why (if revived):** Unlocks the multi-headed loop. Held until the simpler linear case is robust, since branching multiplies the state-management surface.

- **What:** Autonomous `/loop` wiring with self-abort (Build 5).
  **Gate:** After Build 4 ships and we have telemetry good enough to define a "drop below threshold for N consecutive runs" abort rule that does not fire on legitimate iterations.
  **Why (if revived):** The endpoint of graduated autonomy. Abort signal already in place from Build 1, so this is wiring, not new safety design.

- **What:** Adapter inheritance for child branches (default: inherit parent; override: replace sections; extend: add to parent's traps).
  **Gate:** When Build 4 ships and per-branch adapter copy-paste becomes friction.
  **Why (if revived):** Reduces friction in multi-heading without requiring it from day one.

- **What:** Adapter-evolution loop ("Baldwin Effect" — periodically run SIC on adapter usage data to extract patterns and update central templates).
  **Gate:** After ≥50 inquiries have run with adapters, producing enough usage history to extract meaningful patterns.
  **Why (if revived):** Templates evolve through use rather than top-down design. Speculative until usage data exists; cheap to add later because it operates on already-stored adapter files.

- **What:** Protocol-script adapters — adapters with embedded control flow (`IF` / `THEN` / `BRANCH` / `TERMINATE`).
  **Gate:** After static adapters (the format in §2) have run long enough that their expressive limits are observable.
  **Why (if revived):** More expressive than static prose, but adds parsing complexity. Defer until the simpler form proves insufficient.

## Reasoning

### Killed

- **Option A — auto-detect adapter inside MVL** (proposed pre-inquiry).
  **Prosecution:** Auto-detection from question content is exactly the classification machinery we removed when we retired CONFIGURE. It puts an opaque per-question judgment back inside MVL, with no auditable reason for why a particular adapter was selected. It also drifts: as the question evolves through iterations, the auto-detected adapter may stop fitting, and there is no clean repair path that doesn't reintroduce more classification logic.
  **Why killed:** Reintroduces the architectural problem CONFIGURE-removal was meant to solve. The file-based alternative achieves the same "right adapter for this inquiry" outcome by making selection an explicit, auditable, single-step user action.

- **Option B — named entry-point commands** (e.g., `/MVL-wayfinding`, `/MVL-comprehension`).
  **Prosecution:** Doesn't compose. Every (adapter, autonomy-level, branching-mode) combination needs its own command. Combinatorial command surface grows with the product of feature dimensions, not their sum. Multi-heading is awkward (recursive command names per branch), and there is no story for inquiry-specific adapter customization without forking yet another command.
  **Why killed:** Linear command growth at best; combinatorial at worst. The file-based alternative keeps one command (`/MVL`) and lets the inquiry-folder data carry the variation.

- **Merging adapter and state into a single `_config.md`** (Innovation 2a).
  **Prosecution:** Conflates static configuration (adapter — set once, rarely changes) with dynamic state (status, progress, history — changes every iteration). The two have different write patterns, different consumers, and different reasons to change. Bundling them couples them.
  **Why killed:** Separation of concerns wins clearly. `_adapter.md` and `_state.md` stay separate.

- **No adapter files / discipline-command variants** (Innovation 4c — `/sense-making-steer`, `/innovate-steer`, etc.).
  **Prosecution:** This is Option B's command-proliferation problem repeated at the discipline level. Forks every discipline command into N variants, with no clean way to add a new variant without writing another command file.
  **Why killed:** Same structural defect as Option B, applied to a different layer.

- **Start with autonomy and build safety nets backwards** (Innovation 3c).
  **Prosecution:** Failures from an autonomous loop without telemetry are uninformative — you cannot tell whether a bad output is the loop failing, the adapter failing, the dispatch failing, or the question being malformed. Telemetry has to come first because telemetry is what makes failures legible. Build sequence order is correct.
  **Why killed:** Empirical-failures-as-design-input is appealing in principle but unworkable without instrumentation to read the failures.

### Refined (survived in modified form)

- **Telemetry-in-adapter with checklist format** (Innovation 2b + 4a → Critique REFINE).
  **What was proposed:** Ship the adapter and its telemetry-threshold section together, collapsing Build 1+2 into one.
  **Critique caught:** This frontloads an uncalibratable decision — thresholds need data from real adapter use (Sensemaking I15), which doesn't exist before Build 1 has run. The collapse produces false efficiency: it bundles two features so that you cannot ship the first until you have also designed the second.
  **Refined to:** Split into Build 1 (adapter, no thresholds) + Build 1.5 (add the Thresholds section after ~10 runs). Same file, additive section, no migration. The collapse vision (one file carrying both configuration and gates) is preserved; the timing is fixed.
  **Note from Reflection:** This was the run's most valuable Critique correction — exactly the kind of overreach catch C is for.

- **Merge as SIC with synthesis adapter** (Innovation 6c → Critique SURVIVE with caveat).
  **What was proposed:** Branch results are merged via a SIC pass with a synthesis-shaped adapter (S reads branch answers, I generates synthesis, C evaluates coherence).
  **Critique noted:** S could face context-window pressure if it had to read full branch outputs. Conflict detection across branches is a different cognitive operation than normal sensemaking.
  **Refined to:** Pass branch **answers** (1–2 pages each), not full discipline outputs; conflict detection rides on the existing accommodation trigger; defer the synthesis-adapter template design to Build 4 when it is actually needed.
  **Why this is load-bearing:** The system uses its only primitive (SIC) for a new operation rather than inventing a parallel mechanism. This is the principle that closes the multi-heading gap without adding a separate merge subsystem.

- **Abort signal** (Innovation 5c → Critique SURVIVE clean).
  **Survived because:** One status field in `_state.md`, one check in MVL. Zero cost today, non-negotiable later. Defense was overwhelming on first pass.
  **Refinement:** scoped to `## Status: ACTIVE | ABORT | COMPLETE`, owned by `_state.md`, checked at every iteration boundary in MVL.

### Held in REFINE (not in this iteration's MUST)

- **Adapter inheritance for child branches** (Innovation 5a). Needed for Build 4; semantics for "extend vs. replace" still need design. Listed in DEFERRED.
- **Protocol-script adapters with control flow** (Innovation 1b). Most fertile of the lens-shifting ideas, but parsing and design overhead are real. Defer until static adapters prove insufficient. Listed in DEFERRED.
- **Baldwin Effect on adapters** (Innovation 7a). Sound principle, but operates on usage data we will not have until Build 1 has run for a long time. Listed in DEFERRED.

## Open Questions

### Monitoring

- **Does the adapter system reduce the rate at which inquiries hit "wrong slot content" failure modes?** Observable after ~10 inquiries have run end-to-end with Build 1 — compare against the Build-0 baseline.

- **Do users typically pick a non-default adapter, or does `default.md` cover most cases?** Observable from the distribution of `_adapter.md` template-of-origin across the first 20 inquiries. If `default.md` is used near-universally, the cost of building specialized templates is hard to justify.

### Refinement Triggers

- **After ~10 inquiries have run with Build 1,** revisit the threshold values for Build 1.5. The numbers proposed in §6 (`perspective_count ≥ 3`, etc.) are placeholders awaiting calibration.

- **If discipline outputs reveal a recurring failure mode not caught by current C-trap checklists,** add the trap to the relevant adapter template and (separately) consider whether MVL should prompt R to propose new traps after notable runs.

### Blocked

- **S-triggered branching** — when Sensemaking decomposes a question into orthogonal sub-dimensions (as it did in this very inquiry, identifying adapter / automation / multi-heading as three independent problems), should that decomposition automatically spawn one sub-branch per dimension? This is blocked on Build 4 (multi-heading machinery) and on having a sharper definition of when a decomposition is "branching-worthy" vs. "explore-in-one-pass-worthy." This question appeared in Sensemaking as Ambiguity 3 OPEN and resurfaced in Reflection — its repeat appearance is a signal it needs explicit treatment, not a signal that it's decided.

- **Innovation-assembly vs. Critique-assembly redundancy** — both Innovation and Critique now have an explicit assembly check. Reflection asked whether they catch different things (I-assembly: "what architecture emerges from components?" vs. C-assembly: "does the assembled architecture survive adversarial testing?"). Need ≥5 future runs with both checks active before that question can be answered empirically.

### Research Frontiers

- **Adapter authorship across autonomy levels.** This finding asserts the file is level-agnostic — same `_adapter.md` whether human, system, or autonomous agent wrote it. Untested at the system-writes and agent-writes levels because Build 3 and Build 5 don't exist yet. The claim is plausible-by-construction but not yet validated by use.

- **Question framing as an upstream gap.** Reflection observed that the human's biggest intervention was BEFORE the loop — expanding "adapter pattern" into "adapter + automation + multi-heading." Without that pre-expansion the answer would have been narrow. `/elaborate` exists for this kind of upstream framing but wasn't invoked. Whether to make `/elaborate` part of the standard pre-MVL workflow is a separate question this finding does not resolve.
