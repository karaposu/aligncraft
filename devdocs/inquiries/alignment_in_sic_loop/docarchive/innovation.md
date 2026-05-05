# Innovation: Alignment in SIC Loop

## User Input
devdocs/inquiries/alignment_in_sic_loop/sensemaking.md

---

## Seed

SIC loop IS the alignment chain. Pre-SIC = L0-L3. SIC = L4-L6. Features (briefing, scope check, adapter) are alignment layers. Innovation question: what novel designs emerge from treating SIC as the alignment chain — for pre-SIC, the L1 gap, checkpoint UX, and alignment-aware behavior at each layer?

---

## Mechanism Application

### 1. Lens Shifting
**1a. Generic — Alignment SCORE:** Per-layer scores (L0: 90%, L2: 40%). Gradient replaces binary. Human calibrates tolerance.
**1b. Focused — Continuous monitoring:** Check alignment during SIC too — after S (did intent shift?), after I (did approach change?). Not just pre-SIC.
**1c. Controversial — SIC deeper than alignment:** Cognition ≠ delegation. Don't constrain SIC to only alignment-checking when its power is cognitive transformation.

### 2. Combination
**2a. Generic — Alignment check AS an adapter:** The pre-SIC check IS a meta-adapter — an adapter that configures the inquiry setup. Written in adapter format with per-layer checks.
**2b. Focused — Alignment layers AS C dimensions:** C evaluates against alignment layers (L0-L6) instead of/alongside generic dimensions. Each layer = one evaluation axis.
**2c. Controversial — R checks alignment of the PROCESS:** R's observations become per-LAYER alignment assessments. "L1 alignment degraded during S" — alignment-aware reflection.

### 3. Inversion
**3a. Generic — Skip alignment, detect from output:** Run SIC unchecked, let misalignment reveal itself. Misalignment in the output is diagnostic.
**3b. Focused — Reveal uncertainty, not confidence:** System shows WHERE it's uncertain: "L0 ✓, L1 ✓, L2 ? (scope narrow), L3 ?" User addresses uncertainty directly.
**3c. Controversial — AI-to-AI alignment:** S→I and I→C have internal alignment. Inter-step alignment check: "Does I understand what S found?"

### 4. Constraint Manipulation
**4a. Generic — One artifact: `_alignment.md`:** All alignment state in one file. L0-L3 status, question restatement, intent, scope, approach. S reads it, R updates it.
**4b. Focused — Layers checked during SIC too:** Some layers re-checked during execution. L2 re-checked after S reveals unexpected scope. Not rigid pre/during boundary.
**4c. Controversial — Skip alignment with `--skip-align`:** Escape hatch for experienced users who pre-contextualized internally.

### 5. Absence Recognition
**5a. Generic — Missing: alignment HISTORY:** Track alignment state across inquiries. Which layers consistently misalign? Patterns drive improvement.
**5b. Focused — Missing: inter-iteration alignment check:** Narrowing between iterations can break L1/L2. Re-check after narrowing before next S.
**5c. Controversial — Missing: cross-inquiry alignment:** New inquiry checked against findings from prior inquiries (via briefing). L5 coherence at project level.

### 6. Domain Transfer
**6a. Generic — From aviation (pre-flight checklist):** Standardized, sequential, mandatory, visible. Print the checklist in output.
**6b. Focused — From medicine (differential diagnosis):** Check most likely misalignment based on question type. Adapter specifies high-risk layers.
**6c. Controversial — From constitutional law (separation of powers):** Pre-SIC = legislature (defines), SIC = executive (does), C+iteration = judiciary (evaluates). Each phase can't overreach.

### 7. Extrapolation
**7a. Generic — Explicit → visible → measurable → comparable → optimizable:** Alignment telemetry across inquiries drives systematic improvement.
**7b. Focused — `_alignment.md` as inquiry DNA:** Together with `_adapter.md` + `_branch.md`, fully self-describing inquiry. Complete resumability.
**7c. Controversial — Round-trip verification:** C re-checks L0-3 after SIC. Did execution break pre-SIC alignment? Full circle: check → execute → re-check.

---

## Assembly Check

**4a + 3b + 5b + 2b → Full alignment lifecycle:**

```
PRE-SIC:
  Create _alignment.md with L0-L3 status
  Reveal uncertainty: "L0 ✓, L1 ✓, L2 ? (scope narrow), L3 ✓"
  User addresses gaps → _alignment.md updated → SIC starts

DURING SIC:
  C evaluates against alignment layers alongside problem-specific dimensions

BETWEEN ITERATIONS:
  Re-check L1-L2 on narrowed question
  _alignment.md updated with iteration alignment state

POST-SIC:
  R reads alignment state + outputs
  Identifies where alignment held/drifted
```

Full lifecycle: check → execute → re-check → reflect. `_alignment.md` is the persistent record.

---

## Verdicts

### SURVIVE

**4a + 7b. `_alignment.md`** — One file, all alignment state. Inquiry becomes fully self-describing: `_branch.md` (what), `_adapter.md` (how), `_alignment.md` (aligned?). Three files = complete inquiry DNA. Immediately buildable.

**3b. Reveal uncertainty, not confidence** — "L2 seems narrow, L3 uncertain" is more actionable than "here's what I think." Human addresses specific gaps. Phrasing change in MVL.

**5b. Inter-iteration alignment re-check** — Narrowing can break L1/L2. Re-check after narrowing prevents compounding misalignment. One addition to iteration-complete.

### REFINE

**2b. Alignment as C dimensions** — Powerful but needs non-disruptive integration. Alignment layers as ADDITIONAL dimensions alongside problem-specific ones.

**6b. Risk-weighted layers** — Adapter specifies high-risk layers. Design target for after adapters in use.

**1c. SIC deeper than alignment** — Valid caution. Alignment as default framing, not constraint. Skippable for pure exploration.

### KILL (seeds)

**1a. Alignment score** — False precision. Binary (aligned/uncertain/misaligned) is more honest. Seed: scores useful when telemetry accumulates.

**3a. Skip and detect from output** — Wastes a SIC pass. Earlier is cheaper.

---

## Mechanism Coverage (Telemetry)

* **Generators applied:** 4/4
* **Framers applied:** 3/3
* **Convergence:** YES — 3 → "alignment in single persistent artifact." 3 → "alignment at multiple points." 2 → "alignment as evaluation criteria."
* **Survivors tested:** 6 (3 SURVIVE, 3 REFINE) / 2 killed
* **Assembly check:** YES — full alignment lifecycle
* **Failure modes observed:** None
* **Overall: PROCEED**
