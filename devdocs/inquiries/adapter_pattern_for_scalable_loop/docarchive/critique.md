# Critique: Adapter Pattern for Scalable Loop

## User Input
devdocs/inquiries/adapter_pattern_for_scalable_loop/

---

## Phase 0 — Dimensions

| Dimension | Weight | Success criteria |
|---|---|---|
| **Immediate buildability** | CRITICAL | Implementable as markdown edits to commands, no new infrastructure |
| **Automation compatibility** | CRITICAL | All decisions derivable from file state |
| **Architectural coherence** | HIGH | Consistent with S→I→C, file-is-structure, graduated autonomy |
| **Multi-heading support** | HIGH | Branch creation doesn't require redesign; inheritance works; merge defined |
| **Simplicity** | HIGH | Build 1 is minimal; complexity appears only when needed |
| **Regression safety** | MEDIUM | No unguarded new failure modes |

Burden of proof: HIGH STAKES (architectural direction). Defense must prove viability.

---

## Candidate Evaluations

### Candidate 1: Telemetry-in-Adapter + Checklist Format (2b + 4a)

**Prosecution:** Collapsing Builds 1+2 violates the build sequence's own logic. Thresholds need calibration from real use (I15). Inventing thresholds before data exists = either blocks good work (too strict) or passes garbage (too lenient). Checklist format reduces expressiveness of prose guidance.

**Defense:** Start with deliberately lenient placeholder thresholds — catch only egregious failures. Lenient thresholds are safer than no thresholds. Format can be hybrid: prose S/I guidance, checklist C traps, key-value thresholds.

**Collision:** "Start lenient" counters calibration concern. Hybrid format resolves expressiveness concern. But collapsing still frontloads complexity — you can't ship adapters until threshold format is also designed.

**Verdict: REFINE**
- Fails: Simplicity, Immediate buildability — bundles two independently useful features
- Direction: Split into Build 1 (adapter, no thresholds) + Build 1.5 (add thresholds after ~10 runs). Same file, additive. Preserves collapse vision without frontloading.

---

### Candidate 2: Merge as SIC with Synthesis Adapter (6c)

**Prosecution:** S must read N branch outputs simultaneously — context window pressure. Conflict detection between branches is a different S operation than normal sensemaking. Merge blocked until slowest branch completes.

**Defense:** Pass branch ANSWERS (1-2 pages each), not full outputs. Accommodation trigger handles conflicts (branches = perspectives). Timing concern inherent to any merge strategy.

**Collision:** Summarization resolves context. Accommodation trigger handles conflict detection. No remaining structural objection.

**Verdict: SURVIVE with caveat**
- Passes: Coherence, Simplicity, Automation, Multi-heading
- Caveat: Build 4 (not now). Synthesis adapter template needs design: S reads answers, I generates resolution strategies, C evaluates coherence against parent question.

---

### Candidate 3: Abort Signal (5c)

**Prosecution:** Safety mechanism for Build 5 autonomous loops — premature now.

**Defense:** One status field in `_state.md`. Zero cost. Dispatcher checks `if ABORT → stop`. Not premature — trivially simple guard rail.

**Collision:** Defense wins easily. One field is not premature engineering.

**Verdict: SURVIVE (clean)**
- Passes all dimensions, no caveats on critical
- Implementation: `## Status` field in `_state.md`: ACTIVE | ABORT | COMPLETE

---

## Phase 3.5 — Assembly Check

**Assembly: Refined candidate 1 + Survivor 2 + Survivor 3 → Incremental build path**

Each build adds one section or one behavior to the SAME file and the SAME command. No redesign between builds:

```
Build 1:   _adapter.md (3 sections) + _state.md status field + MVL reads/injects
Build 1.5: _adapter.md adds Telemetry Thresholds section
Build 2:   MVL reads thresholds, flags quality issues
Build 3:   MVL auto-dispatches (invokes commands directly)
Build 4:   Branch folders + synthesis adapter template + merge-as-SIC
Build 5:   /loop wiring + self-triggered abort via telemetry
```

**Assembly verdict: SURVIVE — no caveats on critical dimensions.**

Emergent value: the architecture is ONE incrementally-growing file and ONE incrementally-growing command. Not five separate builds — one continuous evolution.

---

## Phase 4 — Coverage + Convergence

### Accumulator

| Candidate | Verdict |
|---|---|
| Telemetry-in-adapter + checklist | REFINE → split Build 1 / 1.5 |
| Merge as SIC | SURVIVE (caveat — Build 4) |
| Abort signal | SURVIVE (clean) |
| **ASSEMBLY** | **SURVIVE (clean)** |

### Coverage
- Adapter format: fully covered
- Quality gating: covered (deferred thresholds)
- Merge protocol: covered (SIC with synthesis adapter)
- Safety: covered (abort signal)
- Build sequence: covered (incremental additive path)
- Unexplored: protocol script adapters, bulletin board, inheritance semantics — all Build 4+ concerns

### Signal: TERMINATE

Clean survivor (incremental architecture). All critical dimensions passed. Build path concrete and additive.

---

## The Architecture

### Build 1 (NOW)

**`_adapter.md` format:**
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

**`_state.md` addition:**
```markdown
## Status
ACTIVE
```

**MVL changes:**
- On NEW: prompt user to select adapter template (or use default), copy to inquiry folder
- On RESUME: read `_adapter.md`, inject S section into sensemaking prompt, I section into innovate prompt, C section into critique prompt
- On RESUME: check Status field, halt if ABORT

**Central templates:** `thinking_disciplines/adapters/` — wayfinding.md, comprehension.md, exploration.md, decomposition.md, default.md

### Build 1.5 (after ~10 runs)

**`_adapter.md` addition:**
```markdown
## Telemetry Thresholds
- S: perspective_count >= 3
- I: mechanisms_applied >= 2, convergence = YES
- C: adversarial_strength = STRONG
```

MVL reads thresholds after each discipline step, flags (warns, doesn't block) when below.

### Build 2-3: Auto-dispatch + human at iteration boundaries

### Build 4: Branch folders + synthesis adapter + merge-as-SIC

### Build 5: `/loop` + MVL autonomous + self-abort

---

## Convergence Telemetry

* **Dimensions evaluated:** 6/6, all critical covered: YES
* **Adversarial strength:** STRONG — prosecution forced Build 1/1.5 split (meaningful). Merge prosecution required genuine defense via summarization.
* **Landscape stability:** STABLE — refined the build sequence, didn't overturn it
* **Clean SURVIVE:** YES — assembled incremental architecture
* **Failure modes observed:** None
* **Overall: PROCEED**
