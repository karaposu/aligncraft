---
status: active
---
# Finding: Alignment in SIC Loop

## Question

The inquiry (from `_branch.md`) asked whether the recurring "narrow question → narrow answer" problem in our SIC loop (the Sensemaking → Innovation → Critique pipeline run by `/MVL`, our minimum-viable-loop runner) is actually a **Task Alignment** failure — specifically Layer 2 of our six-layer alignment framework (L0 Workspace, L1 Task/intent, L2 Task/scope, L3 Action-Space, L4 Action-Set, L5 Coherence, L6 Outcome). And if so, whether the loop should explicitly check alignment across all six layers via a **pre-SIC alignment adjustment step** that:

1. Checks the input against all six layers,
2. Adjusts the task definition where layers are uncertain, and
3. Asks the user to confirm before Sensemaking begins.

The goal was to determine: (1) whether the scope problem maps to the alignment layers; (2) whether all six should be checked, not just scope; (3) where the alignment check should live (pre-SIC, inside Critique, or both); (4) whether the pre-SIC adjustment with user confirmation is the right design; and (5) how this integrates with features already in the system (briefing, adapters, the SIC build sequence).

## Finding Summary

- **The scope problem IS a Task Alignment problem (Layer 2).** "Narrow question → narrow answer" is the same failure mode as Layer 2 misalignment in our six-layer framework — the question doesn't cover the goal it's meant to serve. The mapping is structural, not analogical.

- **The SIC loop already IS the alignment chain — we just hadn't recognized it.** Each existing piece (briefing, scope check, adapter, S→I→C, Critique, iteration check) maps one-to-one onto a layer (L0–L6). Nothing new needs to be designed; the layers are already there, just unnamed.

- **Pre-SIC = L0–L3 (foundation); SIC = L4–L6 (execution).** Pre-SIC is a sequential waterfall — Workspace → Intent → Scope → Approach — with stop-on-failure semantics. SIC is the actual cognitive work (S, I) plus its evaluation (C, iteration check).

- **No new file.** The original proposal to introduce a dedicated `_alignment.md` (one file per inquiry holding L0–L3 status) was killed in Critique as bureaucracy. Instead, **annotate the existing `_branch.md`** (the per-inquiry question/goal/scope file) with `L0:`, `L1:`, `L2:`, `L3:` section labels. Same content, named layers.

- **Surface uncertainty per layer, not confidence.** When the pre-SIC check is uncertain about a layer, present it with specifics ("L2 ? — goal includes X but question covers Y") and let the user judge whether the gap matters. All-✓ → fast path through to S; any ? → pause and present.

- **The user-confirmation checkpoint sits between L3 and L4** — after foundation alignment is established (or explicitly waived), before Sensemaking starts.

- **Add an inter-iteration intent check.** Between MVL iterations, verify the refined question still serves the **goal** (intent), not the original question (scope). This catches drift without flagging intentional narrowing.

## Finding

### 1. The mapping: built features ARE alignment layers

The reframing that made this inquiry collapse was recognizing that we hadn't been building "features that should add alignment checking." We had been building the alignment chain itself, piece by piece, without naming it as such.

| What we built | Alignment Layer | Where it lives today |
|---|---|---|
| **Briefing** | **L0: Workspace** — is context loaded? | Project briefing files; loaded before MVL starts |
| **Question + Goal** | **L1: Task (intent)** — is the task understood? | `## Question` + `## Goal` sections of `_branch.md` |
| **Scope check** | **L2: Task (scope)** — does the question cover the goal? | `## Scope Check` section of `_branch.md` |
| **Adapter** | **L3: Action-Space** — what approach to take? | Adapter selection (`default`, `wayfinding`, `comprehension`, …) |
| **S → I → C** | **L4: Action-Set** — what specific actions to take | The SIC pipeline run by `/MVL` |
| **Critique** | **L5: Coherence** — do results fit with what exists? | The C step of SIC |
| **Iteration check** | **L6: Outcome** — does the result match intent? | MVL's iteration-complete decision |

This is structural: each layer is a separately-named concern in the framework, and each has a corresponding piece of existing machinery in the loop. The mapping is one-to-one, not a stretch fit.

### 2. The pre-SIC / SIC split

Layers L0–L3 are **foundation**: they establish what we're doing, why, and how we'll approach it. They are pre-SIC because they must be settled before Sensemaking can usefully start. They are sequential — L0 (workspace) precedes L1 (intent) because intent depends on context; L1 precedes L2 (scope) because scope depends on the goal being known; L2 precedes L3 (approach) because approach depends on the scope being settled.

Layers L4–L6 are **execution and verification**: L4 is the SIC pipeline doing the work, L5 is Critique evaluating fit, L6 is the iteration check verifying the answer matches intent.

The user-confirmation checkpoint sits at the boundary — between L3 and L4 — because that is the point at which all foundation layers have produced their result and the execution phase is about to begin.

```
MVL receives a question
    │
    ├── L0: WORKSPACE   — Read briefing. Context loaded and fresh?
    ├── L1: TASK (intent) — Restate question. Intent clear?
    ├── L2: TASK (scope)  — Does the question cover the goal?
    ├── L3: ACTION-SPACE — Adapter selected and appropriate?
    │
    ├── CHECKPOINT: Present aligned task definition → user confirms
    │
    ├── L4: ACTION-SET    — S → I → C
    ├── L5: COHERENCE     — Critique evaluates fit
    └── L6: OUTCOME       — Iteration check: answer addresses goal?
```

### 3. Annotated `_branch.md` (the load-bearing change)

Instead of a separate `_alignment.md` file, the per-inquiry `_branch.md` template gains explicit layer labels on the sections it already has (or grows lightweight new ones for layers not yet represented).

```markdown
# Branch: [name]

## L0: Workspace
Briefing: [loaded (date) / stale / absent]

## L1: Question
[restated clearly]

## L1: Goal
[what a good answer achieves]

## L2: Scope Check
[Question covers goal: YES / NO — details if NO]

## L3: Approach
Adapter: [default / wayfinding / comprehension / …]
```

The labels do two things: they give us **shared vocabulary** (when something misaligns, "L2" names it precisely instead of needing a freeform description), and they make the file **machine-parseable** (a future runner can check "is L0 = loaded?" without guessing which heading to look under).

### 4. MVL output: reveal uncertainty per layer

When MVL runs its pre-SIC pass, it surfaces an alignment block. The format is per-layer status with specifics on any uncertain layer:

```
Alignment:
  L0 Workspace: ✓ (briefing loaded, 2026-04-12)
  L1 Intent:    ✓ (question clear)
  L2 Scope:     ? — goal includes X but question covers Y
  L3 Approach:  ✓ (default adapter)
Proceed or adjust?
```

**Fast path:** all four layers ✓ → MVL proceeds straight to Sensemaking with no user prompt. This keeps simple, well-formed questions cheap.

**Slow path:** any layer is ? → MVL pauses, presents the alignment block with specifics, and waits for the user to either adjust the inquiry definition or explicitly say "proceed anyway." The "?" never appears alone — it always carries the specific reason it was raised.

This rejects two patterns we considered: (a) showing a confidence score per layer, which gives false precision before we have telemetry; and (b) presenting a binary pass/fail without specifics, which forces the user to guess what the system noticed.

### 5. Inter-iteration intent check

At iteration-complete, before the next iteration begins, MVL adds one check:

```
Intent check: does "[refined question]" still serve "[goal]"?
YES → proceed / ? → possible drift, review
```

The check compares the refined question against the **goal** (intent), not against the **original question** (scope). This is the load-bearing distinction. Narrowing between iterations is normal and intentional — the original question is supposed to be reduced. What we want to catch is **drift**: a refinement that has wandered off the goal entirely. Comparing against intent flags drift; comparing against the original question would flag every legitimate narrowing as a false positive.

### 6. Connection to existing pieces

| Layer | Implementation in this design | Pre-existing feature |
|---|---|---|
| L0 | `## L0: Workspace` line in `_branch.md` | Briefing (unchanged) |
| L1 | `## L1: Question` + `## L1: Goal` (labeled) | Question + Goal sections |
| L2 | `## L2: Scope Check` (labeled) | Scope check (unchanged content, labeled) |
| L3 | `## L3: Approach` (labeled) | Adapter selection (unchanged) |
| L4 | S → I → C | SIC (unchanged) |
| L5 | Critique | Critique (unchanged) |
| L6 | Iteration check + new intent check | MVL iteration-complete (one addition) |

Nothing in the existing system is redesigned. The change is: relabel four sections of `_branch.md`; add the alignment-block presentation in MVL; add the intent check at iteration-complete. That's it.

## Next Actions

### MUST

- **What:** Update the `_branch.md` template to use `L0:`–`L3:` section labels as shown in §3.
  **Who:** Whoever maintains the inquiry-folder scaffolding (likely the runner that creates new branches).
  **Gate:** Before the next inquiry is created with the new template.
  **Why:** The labels are the precondition for the per-layer alignment block in MVL; without them MVL has no parseable structure to read against.

- **What:** Update `/MVL` (and `/MVL+`, the extended variant) to surface the alignment block before Sensemaking, with fast-path / slow-path semantics as in §4.
  **Who:** `commands/MVL.md` and `commands/MVL+.md`.
  **Gate:** After the `_branch.md` template change ships (depends on it).
  **Why:** This is the user-visible behavior change. Without it, the labels in `_branch.md` are just notation with no operational effect.

- **What:** Add the inter-iteration intent check at iteration-complete in MVL.
  **Who:** `commands/MVL.md` iteration-complete branch.
  **Gate:** Same shipping window as the alignment-block change.
  **Why:** Catches drift across iterations — the failure mode that motivated half the original inquiry. Cheap to add, no new infrastructure.

### COULD

- **What:** Add a lightweight L1 intent check — a single prompt asking "anything behind this question that isn't captured in the Goal?"
  **Who:** Pre-SIC step in MVL, before L2.
  **Gate:** When we have observed at least 5 inquiries where the L1 gap (intent partially covered by Goal) caused downstream problems.
  **Why:** Sensemaking flagged this as the one alignment layer not fully covered by existing structure; worth addressing if it actually bites in practice.

- **What:** Treat alignment layers as additional Critique dimensions (not replacing existing problem-specific dimensions, augmenting them).
  **Who:** Critique step in SIC.
  **Gate:** When we have a non-disruptive integration design — i.e., a way to add layer-axis evaluation without diluting the problem-specific axes Critique already runs.
  **Why:** Would close the loop: pre-SIC checks alignment going in, Critique checks alignment going out. Currently held back by integration concerns, not by the idea itself.

- **What:** Risk-weighted per-adapter layer focus — let each adapter declare which layers are highest-risk for its problem type, and have MVL focus pre-SIC effort accordingly.
  **Who:** Adapter definitions.
  **Gate:** After at least 3 distinct adapters are in active use, so we have data on which layers each adapter actually misaligns on.
  **Why:** Premature today (we don't have the per-adapter failure data); valuable later when we do.

### DEFERRED

- **What:** Per-layer alignment scores (e.g., "L0: 90%, L2: 40%") replacing the binary ✓ / ? presentation.
  **Gate:** When ≥30 inquiries have run with the binary presentation and we have enough structured alignment-outcome data to calibrate scores.
  **Why (if revived):** Would let the system express degrees of misalignment, useful for prioritizing which "?" deserves the user's attention first when several layers are uncertain.

- **What:** Cross-inquiry alignment — when a new inquiry is created, check it against findings from prior inquiries (via the briefing layer) for L5-style coherence at the project level.
  **Gate:** When the briefing pipeline can ingest prior findings as structured input (not just freeform context).
  **Why (if revived):** Catches the failure mode of inquiries that contradict already-settled findings; today we'd have to do this manually because briefings aren't structured for it.

- **What:** Inter-step alignment between S, I, and C — explicit checks like "does I correctly understand what S found?"
  **Gate:** When we observe SIC runs where information is verifiably dropped between steps (currently no evidence).
  **Why (if revived):** Speculative now; would only matter if step-to-step information loss turns out to be a real problem.

## Reasoning

### Killed

- **`_alignment.md` as a separate per-inquiry file** (proposed in Innovation as design 4a+7b — "one file, all alignment state, inquiry becomes self-describing via three meta-files: `_branch.md`, `_adapter.md`, `_alignment.md`").
  **Prosecution:** Three or four meta-files per inquiry is bureaucracy. The proposed file would duplicate content already in `_branch.md` (question, goal, scope). The "L2" label by itself doesn't catch any misalignment that "scope check" wasn't already catching — it's taxonomy without new capability.
  **Why killed:** The defense's core point — that labels add traceability and parseability — survived the prosecution. But that benefit is achieved by **annotating `_branch.md`**, not by spinning up a new file. So the file dies; the labels live.

- **Per-layer alignment scores** (Innovation 1a — "L0: 90%, L2: 40%, gradient replaces binary").
  **Prosecution:** Scores imply a calibrated measurement we don't have. We have no data on what "60% L2 alignment" would mean operationally. Binary aligned / uncertain / misaligned is more honest about what the system can actually distinguish.
  **Why killed:** False precision. Held in DEFERRED as something to revisit when alignment telemetry exists.

- **Skip alignment, detect from output** (Innovation 3a — "run SIC unchecked, let misalignment reveal itself in the answer").
  **Prosecution:** Misalignment caught after a full SIC pass costs the entire pass. Caught at L0–L3 it costs a few seconds. Earlier is unambiguously cheaper, and nothing about post-hoc detection produces information that pre-SIC detection couldn't have produced.
  **Why killed:** Wastes a SIC pass for no benefit. No reason to revisit unless pre-SIC checks themselves become very expensive (not currently a risk).

### Survived (with refinements imposed by Critique)

- **Reveal uncertainty, not confidence** (Innovation 3b → Critique SURVIVE).
  **Survived because:** "L2 ?" is more actionable than "I think this question is fine" because it tells the user where to look.
  **Refined to require:** Each "?" must carry specifics ("L2 ? — goal includes X but question covers Y"). A bare "?" without reasoning is a defect — it forces the user to guess what the system noticed. The current scope check already produces this kind of specific reason; the design preserves that.

- **Inter-iteration alignment re-check** (Innovation 5b → Critique SURVIVE with caveat).
  **Survived because:** Refinement between iterations can drift away from the goal in ways the next iteration won't catch on its own.
  **Refined to:** Compare the refined question to the **goal** (intent), not to the **original question** (scope). If we compared to the original question, every legitimate narrowing would flag as misalignment — false-positive machine. Comparing to intent catches drift without punishing the intentional narrowing the loop is supposed to do.

- **Annotated `_branch.md`** (Critique-assembled survivor of the killed `_alignment.md`).
  **Survived because:** It captures the benefit Innovation was reaching for (named layers, traceable alignment state) without the cost (a fourth meta-file per inquiry).
  **Refined to:** Use `L0:`–`L3:` section prefixes on existing or lightweight new sections of `_branch.md`. Nothing structurally new in the inquiry folder.

### Held in REFINE (not in this iteration's MUST)

- **Alignment layers as Critique dimensions** (Innovation 2b). Powerful idea — would let Critique evaluate fit per layer alongside problem-specific dimensions — but Critique flagged that integrating it without disrupting existing dimension evaluation needs design work first. Listed in COULD.

- **Risk-weighted layers per adapter** (Innovation 6b). Listed in COULD with a usage-data gate.

- **SIC deeper than alignment** (Innovation 1c). Valid caution that SIC's value isn't only alignment-checking; we shouldn't constrain it to that. Treated as an interpretive note: pre-SIC alignment is the **default framing**, not the **only** framing. No design action this iteration.

## Open Questions

### Monitoring

- **Does per-layer "?"-with-specifics actually change user behavior** versus the previous unstructured "are you sure?" prompts? Observable after ~10 inquiries that hit the slow path.

### Refinement Triggers

- **If alignment-outcome telemetry accumulates across ≥30 inquiries with binary status,** revisit whether per-layer scores would carry enough signal to be worth the false-precision risk.

- **If we observe 5+ inquiries where the L1 intent gap (intent only partially covered by the Goal section) led to a wrong Sensemaking framing,** ship the lightweight L1 intent prompt currently in COULD.

### Blocked

- **Alignment-as-Critique-dimension** is blocked on having a non-disruptive integration design — specifically, a way to add layer-axis evaluation without diluting the problem-specific axes Critique already produces.

- **Cross-inquiry alignment via briefings** is blocked on the briefing pipeline being able to ingest prior findings as structured input. Today briefings are freeform, so this can't be automated.
