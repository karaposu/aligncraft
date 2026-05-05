# Innovation: Thinking-Space Primitives — Completeness Audit

## User Input
devdocs/inquiries/thinking_space_primitives/

---

## Seed

Write operational specifications for the primitivity test (P1), the 11 admitted primitives (P2/P3 Phase A+B), and the propagation to `/intuit` (P7–P11), at the quality level of existing discipline specs. Architecture is LOCKED by sensemaking (typology, admitted primitives, phasing, substrate ceiling). Open leverage points: how the primitivity test becomes pass/fail rather than aspirational; how Simulation and Metacognition (the hardest primitives) get concrete operational definitions; how delegation decisions per primitive are justifiable not arbitrary; how primitive contributions become visible in `/intuit` outputs; how primitive compositions map to autonomy-goal indicators. Biggest failure risk: producing a primitive list that looks rigorous but is treated as aspirational nomenclature — primitives named but never traceable in actual operation.

---

## Mechanism Applications (7 × 3 = 21 candidates)

### 1. Lens Shifting (Framer)

**1a (generic):** View primitives as MODULES in a cognitive architecture (ACT-R, SOAR analog). Standard AI-architecture framing. Each primitive has an API; compositions are architecturally explicit.

**1b (focused):** **CALIBRATION-FIRST LENS.** Re-evaluate each primitive's spec under the condition "this primitive must be independently measurable against L2 retrospective outcomes." What makes each primitive MEASURABLE decides its operational definition. Unmeasurable primitives are either (a) named-but-operational-deferred, (b) composite of measurable primitives, or (c) killed. This forces the operational definitions into concrete observable signatures.

**1c (contrarian):** Primitives are not THINGS the discipline HAS — they are BEHAVIORS the discipline ELICITS from the LLM substrate. Under this lens, `/intuit` is not composed OF primitives; it INVOKES primitives from the substrate. The entire "discipline approximates externally" category in the delegation decision is reframed as "discipline invokes explicitly." Subtle but significant difference: primitives live in the substrate, not in the spec.

### 2. Combination (Generator)

**2a (generic):** Primitives + discipline telemetry = per-primitive calibration. Standard extension of the existing calibration loop to track primitive-level signal.

**2b (focused):** **PRIMITIVE CARD** — combine (primitive operational definition + primitivity-test evidence + delegation decision + verification approach + /intuit impact list + observable signatures) into a single unified artifact per primitive. One card per primitive, 11 cards total at Phase B. Replaces spread-across-multiple-pieces documentation with consolidated per-primitive reference. Fits the "discipline spec quality bar" — each card is stand-alone inspectable.

**2c (contrarian):** Combine primitive invocations with **a call-stack/trace metaphor from software debugging**. Every `/intuit` run produces a primitive invocation trace: which primitive was called, with what inputs, producing what output, at what time, feeding into which other primitive. Debuggable cognition. `/intuit` stops being a prompt-pipeline and becomes a traced-execution system.

### 3. Inversion (Framer)

**3a (generic):** Instead of "define primitives → measure their operation," invert: "identify measurable signatures in existing outputs → reverse-engineer which primitives must exist to produce them." Bottom-up primitive validation.

**3b (focused):** **AUDIT-EXISTING-OUTPUTS FIRST.** Before writing prompts for new primitives, scan the existing 20+ findings in the corpus. For each admitted primitive, find an INSTANCE where that primitive visibly operated (even though unnamed). Working memory is visible in every finding's context block. Metacognition is visible in every INSUFFICIENT output. Simulation is visible in every "what if" construction. Inhibition is visible in every KILL verdict with preserved seed. If a primitive can't be located in existing outputs, it may be vestigial. Empirical grounding before theoretical spec.

*Depth check (invert again):* instead of auditing our own outputs, invert to "audit the LLM's own chain-of-thought." If primitives are BEHAVIORS the substrate exhibits (1c), their signatures should appear in raw CoT output, not just in /intuit's structured artifacts. System-level: the primitive catalog is an audit of the substrate, not of the discipline. Don't invert further — next level would destabilize.

**3c (contrarian):** Invert the LOCKED "primitives live in L3." Maybe primitives span ALL THREE layers:
- L1 primitives: format-checking, constraint-verification, structural-match (deterministic operations)
- L3 primitives: the 11 we admitted (probabilistic, real-time)
- L2 primitives: calibration-recording, outcome-linkage, decay-over-time (longitudinal operations)

Under this inversion, the three-layer architecture is refined: each layer has its own primitive set, with shared primitives operating across layers. Sensemaking LOCKED "primitives live in L3" without testing this. Worth checking.

### 4. Constraint Manipulation (Framer)

**4a (generic):** Add: every primitive must have at least one named failure mode. Prevents aspirational primitives with no operational failure.

**4b (focused):** Add: **every primitive must produce a RECORDED SIGNATURE in every /intuit call that invokes it**. Not "the primitive theoretically operates" but "the primitive left evidence in the output that can be verified post-hoc." Forces measurability. The output schema's `primitive_contributions` field (from P11) becomes mandatory, not optional. Drives delegation decisions — primitives that can't leave a signature under delegation must be externally approximated.

**4c (contrarian):** Remove the constraint "LLM substrate is fixed." Delegation decisions become MODEL-SPECIFIC and VERSIONED. When the substrate changes (Claude 4.7 → Claude 5.x), the delegation table is re-evaluated. Primitives can migrate between approximate-externally and delegate-to-substrate as substrate capabilities evolve. Adds a Model Dependency Registry to the spec.

### 5. Absence Recognition (Generator)

**5a (generic):** No mechanism for primitive DISCOVERY OVER TIME. If operation reveals we need a new primitive, the system has no path to admit it without a full SIC loop. Missing: a primitive-discovery-seed log that accumulates observations suggesting "there's a primitive here we haven't named."

**5b (focused):** **NO PRIMITIVE USAGE REPORT per inquiry.** Currently, `/intuit` produces seeds with primitive_contributions fields (Phase B schema), but no aggregation exists that asks "which primitives did this inquiry use?" Without the report, we can't tell if an inquiry chronically under-uses a primitive (suggesting it's not really operating) or over-uses one (suggesting it's doing too much). Missing: per-inquiry and cross-inquiry primitive-usage aggregator.

**5c (contrarian):** **NO EXPLICIT BUFFER/WORKING-MEMORY OBJECT in AlignCraft's state.** Sensemaking admitted Working Memory as a primitive in the Buffer type. But where does the buffer LIVE in AlignCraft's architecture? Currently: in the LLM's context window (ephemeral, per-call). There's no persistent thinking-space buffer across calls. If the buffer is truly primitive, it should have a first-class state representation — perhaps a `thinking_space.md` artifact per inquiry, updated during each discipline call, holding the current active set. This would be a significant architectural addition.

### 6. Domain Transfer (Generator)

**6a (generic):** Transfer from SOFTWARE ARCHITECTURE — primitives as services with APIs, SLAs, and observability requirements. Standard microservices analog.

**6b (focused):** Transfer from **CHESS ENGINE STATIC EVALUATION** — primitives as evaluation FEATURES with WEIGHTS, and composability via feature-combination. A position's value is computed from a weighted sum of features (material, piece mobility, king safety, pawn structure, etc.). AlignCraft analog: each primitive is a FEATURE of the current inquiry state; primitive-level signals feed a composite `/intuit` output. Makes composition mechanical rather than prompt-orchestrated.

Chess engines also have a key lesson: feature sets EVOLVE over time (modern engines learned features neural-net-style, replacing hand-crafted features). Suggests the Phase C+ primitive set should be data-driven, not pre-declared.

**6c (contrarian):** Transfer from **BIOLOGICAL CELLULAR SYSTEMS**. Primitives are organelles; each has a specific function; they share the cytoplasm (shared representation space); the cell membrane is the substrate boundary (what the LLM can and cannot do). The "cell" IS the thinking-space. Under this transfer, primitive interactions are BIOCHEMICAL not MECHANICAL — Inhibition doesn't just "suppress"; it produces inhibitory signaling molecules that diffuse through the shared space affecting multiple primitives. Less mechanical, more emergent, harder to implement but more accurate to how cognition actually feels.

### 7. Extrapolation (Generator)

**7a (generic):** As corpus grows, primitive set may need refinement; version the primitives. Standard forward-projection.

**7b (focused):** **PRIMITIVE EVOLUTION UNDER BALDWIN CYCLES.** If a primitive's calibration curves show systematic miscalibration across enough inquiries, the primitive itself becomes a Baldwin-cycle target. Refining primitives is a form of self-modification — exactly the autonomy mechanism the end-goal names. Extrapolated: over time, the primitive set becomes learned-from-use rather than pre-declared.

**7c (contrarian):** If AGI-level substrate emerges, ALL externally-approximated primitives become redundant (the substrate provides them reliably, inspectably, natively). The discipline's value shrinks toward the boundary-defining roles: what to delegate, how to compose, when to calibrate. Design for substrate-takeover: ensure primitives can migrate from external-approximation to substrate-delegation without breaking calibration continuity. Effectively: the spec should survive the substrate it's built on.

---

## Convergence Analysis

Four independent convergences — robustness-tested survivors:

**Convergence 1: Measurability-first drives operational spec.**
Mechanisms: 1b (Calibration-First Lens), 4b (Recorded Signature constraint), 5b (Primitive Usage Report), 6b (features-with-weights chess framing).
→ A primitive's operational definition is NOT complete until it has: (a) a recorded signature in every invocation, (b) a failure mode, (c) a measurement approach feeding L2 calibration, (d) aggregation into inquiry-level and cross-inquiry reports. Without these, the primitive is aspirational, not operational. This is the quality gate.

**Convergence 2: Primitive invocation is TRACEABLE, not just declared.**
Mechanisms: 2c (call-stack/trace metaphor), 4b (recorded signature), 6a (observability services analog), 6b (features-with-weights).
→ Every `/intuit` call produces a primitive invocation trace — which primitives fired, in what order, with what inputs/outputs, composing how. `/intuit` is a TRACED execution system, not a prompt pipeline. Debuggability becomes first-class.

**Convergence 3: Bottom-up audit validates top-down spec.**
Mechanisms: 3a (reverse-engineer from signatures), 3b (audit existing outputs), 5a (primitive-discovery log), 7b (primitive evolution via Baldwin).
→ Before declaring a primitive operational, find it in existing corpus outputs. If a primitive can't be located post-hoc in findings we've already produced, it's either vestigial or mis-defined. This is a Phase A gate: primitive admission requires a corpus-located instance.

**Convergence 4: Substrate-aware design is structural, not tactical.**
Mechanisms: 1c (primitives are behaviors elicited from substrate), 4c (delegation is model-versioned), 7c (substrate-takeover future-proofing), 5c (buffer as first-class state).
→ The discipline's relationship to the LLM substrate is more than per-primitive delegation choice. It's architectural: substrate versioning, migration paths for primitives moving between approximation and delegation, and potentially first-class representation of substrate-native primitives (like working memory as a persistent artifact).

---

## Key Innovations

### 1. Primitive Card artifact (Convergence 1 + 2b) — KEYSTONE REFINEMENT for P2/P3

Each of the 11 admitted primitives gets a single unified "card" — a stand-alone document with structured fields:

```yaml
primitive:
  name: Metacognition
  type: Operation
  phase: A
  operational_definition: "..."
  distinguishing_from:
    - Focus (monitors focus, doesn't select)
    - Intuition (observes cognition, doesn't pattern-match)
  primitivity_evidence:
    independence: "..."
    necessity: "..."
    composability: ["Metacognition + Inhibition → real-time steering", "..."]
    irreducibility: "..."
  substrate_status: APPROXIMATE_EXTERNALLY
  delegation_reasoning: "..."
  observable_signatures:
    - "INSUFFICIENT_INTUITION output with named reason"
    - "Mid-run course-correction in reasoning chain"
    - "Explicit 'I'm stuck on X' statements in CoT"
  failure_modes:
    - silent_failure: "No INSUFFICIENT signal when warranted"
    - overactive: "Every output flagged as stuck when processing is fine"
  intuit_impact:
    - P8: Decline conditions attributed to this primitive
    - Output schema: source_type verification
  audit_instance:
    finding: "importance_measurement_problem/finding.md"
    evidence: "INSUFFICIENT_DATA state defined explicitly — this IS a Metacognition output"
```

Replaces fragmented documentation (operational def in P2, delegation in P5, verification in P6, impact in P7-P11) with ONE CARD PER PRIMITIVE. 11 cards total at Phase B. Each card passes the quality bar on its own.

### 2. Primitive invocation trace (Convergence 2) — REFINEMENT for P11 + NEW artifact

Every `/intuit` call produces a **primitive invocation trace** alongside the seed list:

```yaml
invocation_trace:
  call_id: intuit_2026_04_22_001
  source: thinking_space_primitives/_branch.md
  primitives_invoked:
    - step: 1
      primitive: Context-framing
      operation: "framed inquiry from _branch.md"
      output: "current_framing_block"
    - step: 2
      primitive: Working Memory
      operation: "constructed active set"
      input: "current_framing_block + top-K surface"
      output: "working_set[5 items]"
    - step: 3
      primitive: Simulation
      operation: "forward-transform to abstraction"
      input: "source_text from working_set"
      output: "calibrates(Signal, Outcome) where..."
      samples: 3
    - step: 4
      primitive: Intuition-similarity
      operation: "convergent scan"
      input: "abstraction + working_set"
      output: "matches[3]"
    - step: 5
      primitive: Metacognition
      operation: "verify sufficient matches"
      output: "POSITIVE — 3 above threshold"
    # ...
```

Enables debuggability, failure diagnosis, calibration per-primitive, and corpus aggregation. Output schema refactor (P11) adds this as a top-level section alongside seeds.

### 3. Corpus-located primitive audit (Convergence 3, 3b focused) — NEW artifact + P2 admission gate

Before a primitive's card ships in Phase A, it must pass a **corpus-audit** — an instance where the primitive visibly operated in existing findings. The audit is one paragraph per primitive citing the finding + excerpt.

Example audit instances:
- **Working Memory** → `intuition_as_discipline/finding.md` Section 2 defines "active set" concept explicitly
- **Inhibition** → `thinking_space_dynamics/critique.md` KILL entries for "pure-inverted attention" — critique actively suppressed alternatives
- **Simulation** → `/intuit`'s forward-transform step IS this primitive; also every "what if" exploration in innovation.md files
- **Metacognition** → every INSUFFICIENT_INTUITION output; every "is the frontier stable?" check in exploration telemetry
- **Motivation** → the branch.md "why this matters" sections carry motivational content distinct from framing
- **Salience** → the exploration discipline's signal-detection step (novelty/tension/absence detectors)
- **Evaluation** → critique's prosecution/defense/verdict is explicit evaluation
- **Intuition-similarity** → every "this is like prior X" retrieval in discipline outputs
- **Focus-deep** → deep-processing allocation (long discussions vs. brief notes per item)
- **Attention-pointer** → the current target of every discipline sub-step
- **Context-framing** → every _branch.md's framing section

**Rule:** any primitive that can't be located in existing corpus within reasonable effort triggers REFINE (operational definition needs sharpening) or KILL (primitive may not be real).

### 4. Calibration-first operational definition (Convergence 1, 1b focused) — REFINEMENT for P2

Primitives are defined OPERATIONALLY through their measurable signatures, not through their phenomenological role. Phenomenology (how the primitive "feels") guides discovery; operational definition (what signal it produces) governs admission.

Definition template:
1. **Phenomenological anchor:** what it feels like for humans (one sentence, soft)
2. **Functional role:** what computational job it does (one paragraph, hard)
3. **Observable signature:** what evidence appears in outputs when it fires (enumerated)
4. **Failure signature:** what appears when it should have fired but didn't
5. **Measurement approach:** how to aggregate signatures for calibration

Only the last three govern admission. Phenomenology is the discovery hint; functional role is the bridge; signatures are the gate.

### 5. Substrate-versioned delegation table (Convergence 4, 4c) — NEW artifact, P5 refinement

P5's delegation decision table is **versioned per LLM substrate**. Format:

```yaml
substrate_version:
  model: claude-opus-4-7
  version: "1.0"
  evaluated: 2026-04-22
delegations:
  Attention-pointer: DELEGATE
  Focus-deep: DELEGATE
  Intuition-similarity: HYBRID
  Inhibition: APPROXIMATE_EXTERNALLY
  Simulation: APPROXIMATE_EXTERNALLY
  Metacognition: APPROXIMATE_EXTERNALLY
  Working Memory: HYBRID
  Context-framing: APPROXIMATE_EXTERNALLY
  Motivation: APPROXIMATE_EXTERNALLY
  Evaluation: HYBRID
  Salience: APPROXIMATE_EXTERNALLY
migration_paths:
  - primitive: Metacognition
    target: HYBRID or DELEGATE
    trigger: "substrate provides inspectable metacognition markers (e.g., 'confidence trace' API)"
```

When substrate version changes, table is re-evaluated. Migration paths document how a primitive might move from approximate to delegate (or vice versa). Spec survives substrate changes.

### 6. Primitive usage report (5b focused) — NEW artifact, cross-primitive aggregation

Per-inquiry aggregation of primitive invocations + cross-inquiry trends:

```yaml
# Per-inquiry (alongside _state.md)
primitive_usage:
  inquiry: thinking_space_primitives
  phase: in-progress (sensemaking)
  invocations:
    Simulation: 47  # abstraction construction dominates in this inquiry
    Intuition-similarity: 23
    Metacognition: 19
    Inhibition: 12
    Working Memory: (continuous, not counted)
    ...
  patterns:
    - "High Simulation count — inquiry required extensive hypothesis construction"
    - "Moderate Inhibition — several Tier C candidates suppressed"
```

Cross-inquiry aggregator surfaces systematic patterns — e.g., "inquiries about measurement always have high Evaluation counts; inquiries about architecture have high Simulation counts." Informs primitive evolution (Convergence 3 → 7b).

### 7. Three-layer-primitive refinement (3c contrarian) — REFINEMENT for the three-layer architecture

Sensemaking LOCKED "primitives live in L3." The contrarian probe suggests this is partly wrong:

- **L1 primitives (structural):** format-check, constraint-verification, structural-match — deterministic, fast
- **L3 primitives (real-time cognition):** the 11 admitted — probabilistic, immediate
- **L2 primitives (retrospective):** calibration-recording, outcome-linkage, supersession-detection — longitudinal, delayed

Not all 11 primitives live exclusively in L3. Metacognition spans L3 and L2 (real-time "stuck" signal is L3; accumulated calibration-curve monitoring is L2 metacognition at system level). Working Memory spans L3 (in-call) and L2 (durable thinking-space state across calls — see innovation #8).

**Refinement (not override):** L3 holds most primitives; some span layers; the locked claim "primitives live in L3" is refined to "most primitives live PRIMARILY in L3; some operate across layers."

### 8. Persistent thinking-space artifact (5c contrarian) — NEW architectural addition

Working Memory as a primitive raises the question: where does the buffer live? Currently: only in the LLM context window (ephemeral).

**Proposal:** a persistent `thinking_space.md` per inquiry, updated during each discipline call. Holds:
- Active set (what's in attention-as-buffer)
- Currently-focused pointer
- Recent invocation trace
- Working memory contents of prior calls (with decay)

This makes thinking-space FIRST-CLASS STATE, not ephemeral context. Enables cross-call continuity — hunches persist, attention can decay over time, working memory is genuinely durable.

**Cost:** one more artifact per inquiry; complexity of maintenance.
**Benefit:** the substrate becomes inspectable and the Working-Memory primitive becomes operational at a level it isn't currently.

### 9. Primitive evolution via Baldwin cycles (7b focused) — ARCHITECTURAL EXTENSION, gated

Once calibration data accumulates (Phase C+ territory), primitives that show systematic miscalibration become candidates for refinement. The inquiry seeded by miscalibration-pattern goes through full SIC loop, proposes revised primitive operational definition, ships as Phase D update.

Gated by: calibration N ≥ some threshold per primitive; miscalibration pattern sustained ≥ N inquiries; pattern is not attributable to other primitives.

This makes the primitive set LIVE — it evolves with the system, which is exactly the autonomy mechanism the end goal describes.

### 10. Autonomy-indicator composition table (Convergence across probes, P12) — NEW artifact

Formalizes the autonomy-goal mapping (from sensemaking I5) as a table:

```yaml
autonomy_indicators:
  spontaneous_attention:
    composition: [Salience (Phase B), Metacognition]
    how:
      "Salience surfaces an unattended signal as surprise;
       Metacognition registers it and shifts pointer. Without Salience,
       nothing interrupts current focus. Without Metacognition, the
       interruption isn't noticed as meaningful."
  intrinsic_valuation:
    composition: [Evaluation (Phase B), Motivation (Phase B)]
    how: "..."
  real_time_steering:
    composition: [Metacognition, Inhibition]
    how: "..."
  discontinuity_awareness:
    composition: [Simulation (temporal projection sub-application), Metacognition (self-model sub)]
    how: "..."
  intrinsic_curiosity:
    composition: [Motivation (Phase B), Salience (Phase B), information-gap signal from Intuition]
    how: "..."
  current_position_indicator:
    composition: [Metacognition over accumulated calibration]
    how: "..."
```

Makes the indicator-to-primitive mapping inspectable and falsifiable. If an indicator starts appearing without its composition's primitives, the composition is wrong.

---

## Assembly

```
REFINED MVP (convergence-assembled):

PRIMITIVE CARDS (P2/P3) — one per primitive, unified artifact:
  - phenomenological anchor + functional role + observable signatures
    + failure signatures + measurement approach
  - primitivity-test evidence per 4 criteria
  - delegation decision + reasoning
  - /intuit impact list
  - audit instance from existing corpus (P2 admission gate)
  - 11 cards total at Phase B; 8 at Phase A; 13 at Phase C+ (with modulator cards)

CALIBRATION-FIRST OPERATIONAL DEFINITIONS (P2):
  Admission requires observable signatures + failure signatures + measurement
  approach, not just functional role. Phenomenology is discovery hint; signatures
  are the gate.

INVOCATION TRACE (P11 + new artifact):
  Every /intuit call produces a primitive invocation trace — which primitives
  fired, in what order, with what I/O, composing how. Debuggable cognition.
  Alongside seed output.

CORPUS-LOCATED AUDIT (P2 admission gate):
  Before primitive card ships, locate one instance in existing corpus where
  the primitive visibly operated. If absent, REFINE or KILL.

SUBSTRATE-VERSIONED DELEGATION (P5 refinement):
  Per-primitive delegation decisions are tagged with substrate version.
  Migration paths documented. Re-evaluated on model change.

PRIMITIVE USAGE REPORT (new artifact):
  Per-inquiry + cross-inquiry aggregation of primitive invocations.
  Informs primitive evolution, flags under/over-use, surfaces missing primitives.

THREE-LAYER REFINEMENT (not override):
  L3 holds most primitives; some (Metacognition, Working Memory) span layers.
  Sensemaking's "primitives live in L3" refined to "primarily in L3; some
  span layers."

PERSISTENT THINKING-SPACE (architectural addition, Phase B+):
  thinking_space.md per inquiry — active set + pointer + invocation trace
  + decaying working memory. Makes Working Memory primitive operational
  as first-class state.

PRIMITIVE EVOLUTION VIA BALDWIN (Phase D+, gated):
  Calibration miscalibration patterns → primitive-refinement inquiry seeds.
  Primitive set becomes live-evolvable.

AUTONOMY-INDICATOR COMPOSITION TABLE (P12):
  Formalizes primitive-composition → indicator mapping. Inspectable,
  falsifiable.
```

**Emergent value:** The primitive model stops being a static list and becomes an OPERATIONALIZED, TRACEABLE, AUDITABLE, EVOLVABLE system. Each primitive has a card, a corpus audit, a signature in every invocation, a delegation decision tagged to substrate, a report aggregator, and a path to evolution. The assembly is the difference between "we have 11 primitives" (nomenclature) and "we have 11 primitives we can inspect, verify, diagnose, and refine over time" (operational system).

---

## Verdicts

### SURVIVE (MVP)

- **Primitive Card artifact** (2b + convergence 1) — keystone; unifies per-primitive documentation
- **Primitive invocation trace** (convergence 2) — makes cognition debuggable; new /intuit output section
- **Corpus-located primitive audit** (3b + convergence 3) — Phase A admission gate; empirical grounding
- **Calibration-first operational definitions** (1b + convergence 1) — admission quality gate
- **Substrate-versioned delegation table** (4c + convergence 4) — future-proof spec
- **Primitive usage report** (5b) — cross-inquiry aggregator; informs evolution
- **Three-layer-primitive refinement** (3c contrarian) — refines sensemaking's lock, doesn't override
- **Persistent thinking-space artifact** (5c contrarian) — Phase B+; makes Working Memory operational as state
- **Autonomy-indicator composition table** (convergence + P12) — makes indicator mapping falsifiable

### REFINE (deferred — candidates but not MVP)

- **Primitive evolution via Baldwin cycles** (7b) — architecturally valuable; defer until sufficient calibration data accumulates (Phase D+). Premature in Phase A.
- **Features-with-weights composition rules** (6b) — chess-engine analog is intellectually clean but mechanical composition may be premature; keep as pattern hint, revisit if organic composition proves insufficient.
- **Biological cellular systems metaphor** (6c) — beautiful framing but adds no operational specifics; absorbed as intuition-level guidance for reviewing spec coherence, not as structural addition.
- **Primitive-discovery-seed log** (5a) — valuable but small primitive set right now; activate if new primitive candidates surface during operation.

### KILL

- **Primitives as substrate behaviors only, not disciplinary** (1c in pure form) — too contrarian. If primitives are ONLY in the substrate, the discipline has nothing to spec — it's just prompt-orchestration. The spec must have enough ownership of primitives to make them inspectable and calibratable. The delegation table already handles the spectrum; going fully contrarian here eliminates the discipline layer. Seed preserved: "primitives span discipline and substrate" is captured in the HYBRID delegation decisions.
- **Substrate-takeover future-proofing as design driver** (7c in pure form) — valid concern but wrong driver. Designing primarily for substrate-takeover distorts MVP decisions toward abstraction that pays off only in hypothetical AGI scenarios. Seed preserved: migration paths in the substrate-versioned delegation table (innovation #5) address this in a proportionate way.
- **RAG/microservices as lead framing** (6a) — accurate background tech description; not the novelty. Demoted.
- **Deep invert-again inversion (audit substrate CoT directly)** (3b depth check) — outside MVP scope; substrate-layer inspection is ML-layer work, not methodology-layer. Seed preserved as a future research direction.

---

## Mechanism Coverage

- **Generators applied:** 4/4 (Combination, Absence Recognition, Domain Transfer, Extrapolation all produced load-bearing survivors)
- **Framers applied:** 3/3 (Lens Shifting, Constraint Manipulation, Inversion all produced load-bearing survivors)
- **Convergence:** YES — 4 independent convergences (measurability-first, traceable invocation, bottom-up audit validation, substrate-aware design)
- **Survivors tested:** 9 MVP survivors — each tested for novelty, scrutiny survival, fertility, actionability, mechanism independence (details in Reasoning section of upcoming finding; critique formalizes)
- **Failure modes observed:** None from the 6. The scope is rich but explicitly deferred items are named-and-reasoned rather than conflated.
- **Overall: PROCEED** — sufficient coverage + 4 convergences + 9 tested survivors + assembly produces emergent value (operationalized + traceable + auditable + evolvable primitive system)

---

## Innovation-Level Changes to Decomposition (for Critique to validate)

Structural additions/changes beyond what sensemaking+decomposition locked:

- **Primitive Card** becomes the unified output artifact for P2/P3 — replaces fragmented documentation (operational def + delegation + verification + impact separately) with single-per-primitive card
- **Corpus audit gate** added to P2's verification criteria — no primitive card ships without a corpus-located instance
- **Invocation trace** becomes mandatory /intuit output — affects P11 schema + adds a new top-level field
- **Persistent thinking-space artifact** (thinking_space.md) — NEW, first-class state; affects architecture beyond /intuit
- **Substrate-versioned delegation table** — P5 outputs become VERSIONED; migration paths documented
- **Primitive usage report** (per-inquiry + cross-inquiry) — NEW, aggregator artifact; affects P12 and longitudinal operation
- **Three-layer refinement** — sensemaking's "primitives live in L3" LOCK is REFINED (not overridden): most in L3; some span layers
- **Autonomy-indicator composition table** — P12 produces a formal composition table, not just prose mapping
- **Calibration-first** principle governs operational definitions — observable signatures + failure signatures + measurement approach admission gate

Critique should test:
- Do Primitive Cards actually work as stand-alone references, or do they create duplication with source specs?
- Is the corpus audit gate achievable for all 8 Phase A primitives, or does at least one primitive fail to locate?
- Does the invocation trace add load-bearing debuggability or just overhead?
- Does the persistent thinking-space artifact provide enough value to justify the new state management?
- Is substrate-versioned delegation over-engineering for a single-substrate MVP?
- Does three-layer-primitive refinement destabilize anything locked in sensemaking, or is it purely additive?
- Is the composition table falsifiable, or is it just a pretty mapping?
