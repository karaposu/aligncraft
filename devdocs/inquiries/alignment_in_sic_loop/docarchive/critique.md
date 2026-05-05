# Critique: Alignment in SIC Loop

## User Input
devdocs/inquiries/alignment_in_sic_loop/

---

## Phase 0 — Dimensions

| Dimension | Weight | Success criteria |
|---|---|---|
| **Correctness of mapping** | CRITICAL | Each mapping structurally grounded, not just name-matching |
| **Immediate buildability** | CRITICAL | Changes to MVL command only, no new infrastructure |
| **Doesn't over-engineer** | HIGH | Simple questions pass in seconds, value only when misalignment exists |
| **Answers the question** | HIGH | All five goal points addressed |
| **Doesn't contradict SIC simplicity** | MEDIUM | Pre-SIC is additive context, not alternative pipeline |

Burden: HIGH STAKES — reframes entire architecture.

---

## Candidate Evaluations

### `_alignment.md` as separate file (4a+7b)

**Prosecution:** Four meta-files per inquiry = bureaucracy. Duplicates `_branch.md` content. Alignment labels are taxonomy without capability — "L2" doesn't catch more mismatches than "scope check."

**Defense:** Don't create separate file. Annotate existing `_branch.md` with alignment labels. Labels add traceability (shared vocabulary for diagnosis) and parseability (machine can check "L0 = loaded").

**Verdict: REFINE** — Kill the separate file. Annotate `_branch.md` sections with L0-L3 labels.

---

### Reveal uncertainty (3b)

**Prosecution:** "L2 ?" is less actionable than specific suggestions. Current scope check already says "goal includes X but question covers Y."

**Defense:** Uncertainty WITH specifics is best: "L2 ? — goal includes X but question covers Y." Shows reasoning, invites human judgment on whether the gap matters. More nuanced than binary pass/fail.

**Verdict: SURVIVE** — Must include specifics with each uncertain layer.

---

### Inter-iteration alignment re-check (5b)

**Prosecution:** Narrowing is intentional scope reduction. Re-checking scope after narrowing always flags a gap — false positive machine.

**Defense:** Check INTENT (does refined question still serve the goal?) not SCOPE (does it cover everything the original covered?). Catches drift, not narrowing.

**Verdict: SURVIVE (caveat)** — Compare to goal (intent), not original question (scope).

---

## Phase 3.5 — Assembly

**Annotated `_branch.md` + uncertainty revelation + intent check = minimal alignment-aware MVL**

`_branch.md` gets L0-L3 labels on existing/new lightweight sections. MVL presents uncertainty per layer with specifics. Iteration-complete adds intent check (refined question still serves goal?).

**Assembly verdict: SURVIVE (clean)** — No new files. Labels existing structure. Proportional.

---

## The Design

### `_branch.md` format:

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
Adapter: [default / wayfinding / comprehension / ...]
```

### MVL output (uncertainty revelation):

```
Alignment:
  L0 Workspace: ✓ (briefing loaded)
  L1 Intent:    ✓ (question clear)
  L2 Scope:     ? — goal includes X but question covers Y
  L3 Approach:  ✓ (default adapter)
Proceed or adjust?
```

All ✓ → fast path. Any ? → present and wait.

### Inter-iteration intent check:

```
Intent check: does "[refined question]" still serve "[goal]"?
YES → proceed / ? → possible drift, review
```

### Connection to existing features:

| Layer | Implementation | Existing feature |
|---|---|---|
| L0 | `## L0: Workspace` in `_branch.md` | Briefing (unchanged) |
| L1 | `## L1: Question` + `## L1: Goal` | Question + Goal (labeled) |
| L2 | `## L2: Scope Check` | Scope check (labeled) |
| L3 | `## L3: Approach` | Adapter (labeled) |
| L4 | S → I → C | SIC (unchanged) |
| L5 | Critique | Critique (unchanged) |
| L6 | Iteration check + intent check | MVL iteration-complete (enhanced) |

Nothing redesigned. Everything labeled and connected.

---

## Convergence Telemetry

* **Dimensions evaluated:** 5/5, all critical covered: YES
* **Adversarial strength:** STRONG — forced file→annotations and scope→intent refinements
* **Landscape stability:** CHANGED (file killed) but architecture confirmed
* **Clean SURVIVE:** YES — assembled design
* **Failure modes observed:** None
* **Overall: PROCEED**
