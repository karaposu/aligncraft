---
status: active
refined_by: [intuition_as_discipline, thinking_space_primitives]
refinement_scope: The three-layer architecture (L1 structural + L3 real-time hunch + L2 retrospective/calibrator) stands unchanged. TWO refinements have landed:
  1. intuition_as_discipline — The L3 MECHANISM becomes a first-class thinking discipline (/intuit) with transform-space architecture grounded in CBR + SME precedent. P6 (structural analogy) is absorbed as /intuit's divergent mode; P7 (LLM-as-judge hunch production) is absorbed as /intuit's projection step with Popperian output. The phased build below is REORDERED — this finding's Phase 1 (embedding substrate) is deferred to /intuit's Phase D scaling layer; the new Phase 1 is "write /intuit discipline spec and ship Phase A (convergent mode)". Popperian schema extended additively with source_type, discriminator, and corpus_limit_seeds fields. See devdocs/inquiries/intuition_as_discipline/finding.md.
  2. thinking_space_primitives — Section 2's 4-primitive model (attention/focus/intuition/context) is INTERNALLY CONTRADICTORY (each primitive collapses multiple operationally distinct processes) and INCOMPLETE. The refinement is a typed primitive set of 11 admitted primitives (organized as operations/buffers/drivers/modulators), admitted via a four-criterion primitivity test (independence + necessity + composability + irreducibility) with corpus-located audit. Current 4 are retained with split: Attention → Attention-pointer + Working Memory + Salience (Phase B); Focus → Focus-deep + Inhibition + Commitment (emergent); Intuition → Intuition-similarity + Simulation + Evaluation (Phase B); Context → Context-framing + Motivation (Phase B) + Mood (Phase C+ modulator). Three-layer architecture is clarified (not overridden): most primitives primarily in L3; Metacognition and Working Memory span L3+L2 (in-call = L3; across-call system-level = L2). See devdocs/inquiries/thinking_space_primitives/finding.md.
---
# Finding: Thinking-Space Dynamics

## Question

**How do we approximate the dynamics of the human thinking-space — attention, focus, intuition (as multi-dimensional geometric similarity, including across unrelated surface domains), and context — so that the system can render real-time value judgments on its own outputs, instead of being bounded to structural detection and waiting for retrospective downstream confirmation?**

### Goal

A structural model of thinking-space + a Level 0-2 approximation mechanism, with honest limits, that:
1. Models what thinking-space IS (components and their interaction)
2. Accounts for how humans generate real-time value judgments (not magic — a characterizable process)
3. Provides a concrete approximation approach buildable at Level 0-2
4. Revises the prior finding's claim that real-time detection is bounded to structural
5. Connects to the end-goal program — this may be a frontier of autonomous consciousness work, not just regression detection

---

## Finding

### 1. The correction

The prior finding (`importance_measurement_problem`) was half-right. Value IS retrospective in all cognitive-quality domains — that part of the prior finding stands. But the prior finding then concluded that real-time regression detection is bounded to STRUCTURAL regression — and this conclusion is wrong. Humans make real-time value judgments constantly. A programmer sees a refactor and says "this will work but isn't elegant — let me try a different angle" long before any downstream confirmation. The judgment is real-time, not structural, and not subjective in the sense of "beyond mechanism." It is the cognitive act of intuition operating on a thinking-space.

Applied AI already implements working versions of this — LLM-as-judge, chain-of-thought, self-consistency, analogical retrieval — so the capability is not theoretical. The question is which combination fits AlignCraft's architecture and how to avoid the failure modes that would cause it to silently mis-approximate the signature capability.

### 2. The architecture of thinking-space

Thinking-space dynamics — whether biological or artificial — consist of four co-constitutive primitives operating over a shared representation space:

| Primitive | Operational definition | Cognitive role |
|---|---|---|
| **Attention** | The active set — which candidate mental objects are simultaneously held in the working space | Holds multiple possibilities in parallel (not single-threaded) |
| **Focus** | The selection within attention — which one object receives deep processing right now | Allocates depth; the spotlight within the field |
| **Intuition** | The similarity/analogy query over the representation space — including structural matches across surface-unrelated domains | Produces the HUNCH — a real-time relative ordering over attended candidates |
| **Context** | The activation state shaping attention's contents, focus's target, and intuition's relevance criteria | Determines which similarities count |

These are not independent components. They **co-constitute a single cognitive act**:

> *Context primes the representation space → Attention holds multiple candidates → Intuition fires similarity/analogy queries and produces a hunch → Focus selects based on the hunch → Deeper processing runs → Results update context → cycle repeats.*

This is how humans solve problems. It is also (largely unnamed) how modern AI reasoning systems work.

### 3. Two kinds of similarity, not one

The user's signature claim — "geometrical similarities between shapes even if they are irrelevant, the angle might be the same" — points at a specific kind of intuition that generic embedding similarity DOES NOT CAPTURE:

| Similarity mode | What matches | Example | Approximation |
|---|---|---|---|
| **Surface similarity** | Content, vocabulary, same domain | "This refactor is like that refactor — same module" | Embedding cosine on text |
| **Structural similarity** | Relational pattern, regardless of surface | "This problem has the same SHAPE as a problem in a different field — the angle is the same even though content is unrelated" | Requires scaffolding — not embedding similarity alone |

**Embedding similarity alone captures mostly surface similarity. Structural analogy — the signature ability — requires scaffolded retrieval protocols, explicit relational abstraction, and multi-signal triangulation.** Any approximation that naively equates "intuition" with "embedding search" will fail silently on the capability it most needs to deliver.

> **What "scaffolded" means here:** retrieval that goes through intermediate structural steps instead of matching raw text to raw text. Unscaffolded: `query → embed → match stored text embeddings → top-K` (one step, captures shared vocabulary). Scaffolded: `query → LLM articulates its relational structure independent of surface domain → embed that abstraction → match against pre-computed abstractions of stored findings → top-K` (multiple steps, each stripping surface and keeping structure). The scaffolding is the intermediate transformations (prompts that produce abstractions, pre-computed abstraction stores, multi-sample consensus, quality gates) that force retrieval to operate on structure, not on surface content.

### 4. The three-layer architecture (correcting the two-layer prior)

The prior finding proposed two layers (L1 structural + L2 retrospective). Thinking-space dynamics reveal a missing middle layer:

```
L1 — Structural (T0, immediate, deterministic)
     Format, contradictions, missing sections, removed safeguards
     Source: git diff, text scan
     Signal type: BINARY / DEFINITIVE

L3 — Real-time hunch (T0, immediate, probabilistic)             [NEW]
     Geometric / analogical match to prior work; value estimate from thinking-space
     Source: embedding retrieval + scaffolded analogical reasoning + LLM-as-judge
              + static-feature anchors (Phase 5+)
     Signal type: PROBABILISTIC, must be calibrated

L2 — Retrospective value (T0+ → T4, delayed, empirical)         [UNCHANGED CONTENT]
     Downstream consumption, citation, supersession, implementation
     Source: existing telemetry, _state.md relationships, SUPERSEDED BY density
     Signal type: EMPIRICAL GROUND TRUTH over time
     Role: PROMOTED — now serves as CALIBRATION for L3 (in addition to its original role)
```

L2 is not discarded. Its content is unchanged. Its role is expanded: it is the ground-truth signal against which L3's probabilistic hunches get calibrated over time. The hunch layer's reliability scores are only meaningful if they match actual L2 outcome frequencies — a 0.7-reliability hunch should match outcomes ~70% of the time. Together, L3 and L2 form a closed loop: L3 predicts at T0; L2 confirms or contradicts at T2+; the delta is calibration data; over time L3 hunches become more reliable. **This closed loop IS the Baldwin cycle** — the system's primary mechanism for self-improvement.

### 5. The phased MVP design

The innovation produced a rich architecture; critique imposed a phased build so that each phase delivers standalone value and later-phase failure doesn't invalidate earlier phases.

**Phase 1 — Substrate + surface similarity (ships first, delivers retrieval value alone)**
- **P1 Embedding strategy:** finding-level granularity (one embedding per `finding.md` and per archived discipline output); versioned embedding model as pinned dependency
- **P2 Embedding store:** content-hash keyed file-based store (JSON or SQLite); lazy refresh at query time; no vector-DB dependency at current corpus size
- **P3 Surface-similarity query:** top-K cosine similarity; simple interface (query string → ranked findings)
- **P11 Prior-finding housekeeping:** caveat header on `importance_measurement_problem/finding.md`; relationship `CORRECTED_BY: thinking_space_dynamics` added; section 7 of prior finding rewritten to reflect three-layer architecture

**Phase 2 — Abstraction layer (unlocks structural analogy)**

The core idea of Phase 2: give every finding a second representation — not just its raw text, but a **short structural description stripped of surface content** — and retrieve against that second representation alongside the raw text.

*Worked example of what an abstraction is:*

| Finding | Raw text (surface) | Abstraction (structure) |
|---|---|---|
| `regression_detection_design` | "spec-diff checker detects when discipline specs regress by scanning git diffs for 4 symptom patterns..." | "Detection mechanism for drift-over-time in a specification system, using diff-based signals against a prior baseline." |
| `importance_measurement_problem` | "value is retrospective; need downstream consumption signals..." | "Calibration problem where ground truth is only available on delay; signals must be probabilistic and retrospectively validated." |
| `thinking_space_dynamics` | "LLMs have embeddings, humans have intuition, we need attention/focus/intuition/context..." | "Real-time probabilistic signal production where ground truth is only available on delay; requires calibration loop against eventual outcomes." |

Notice that `importance_measurement_problem` and `thinking_space_dynamics` have **almost the same abstraction** even though their surface topics look unrelated. That's the structural analogy the system must catch — and raw-text embedding similarity would miss it because the vocabulary differs.

- **P6b Abstraction backfill protocol:** a one-time job to compute abstractions for every existing finding (the abstraction field didn't exist until now; this is the catch-up pass). For each finding:
  1. Prompt an LLM: "Articulate the relational/structural pattern this finding represents, independent of its surface domain."
  2. Generate **3 samples** (multi-sample consensus) — single LLM calls are noisy; three samples vote on the stable structural phrasing. If samples diverge wildly, flag for human review.
  3. Store the consensus abstraction alongside the finding's raw-text embedding. Every finding now has TWO embeddings: one of the raw text, one of the abstraction.
  - **REQUIRED: human-reviewed 10% sample before full-corpus trust.** A human spot-checks ~10% of generated abstractions. If quality is bad (shallow, generic, hallucinated), fix the prompt and redo. Bad abstractions are WORSE than no abstractions because they create confident false matches — if the LLM generates "this finding is about AI methodology" for everything, every finding looks structurally similar to every other.
  - **REQUIRED: abstraction quality test in P12 validation.** Pick 5-10 finding pairs a human would say are structurally similar (e.g., `importance_measurement_problem` ↔ `thinking_space_dynamics`). Does abstraction-based retrieval surface them as top matches? If yes, abstractions are working. If no, the prompt needs redesign before the layer ships.

- **P6 Structural-analogy query (initial version):** every structural-analogy query runs TWO retrievals in parallel:
  1. **Surface retrieval:** embed the query text, match against stored RAW-TEXT embeddings → findings with similar vocabulary/content
  2. **Abstraction retrieval:** generate the query's own abstraction on the fly (same prompt used in P6b), embed it, match against stored ABSTRACTION embeddings → findings with similar structure regardless of surface
  
  A finding is a **trusted structural match** only if it appears in BOTH retrieval lists (2-of-2 agreement):
  - In surface only → shared vocabulary, probably not a deep analogy
  - In abstraction only → structural match, but could be a hallucinated abstraction (noisy)
  - In both → surface + structure converge → trusted
  
  This is conservative on purpose. If too few matches get through, loosen to "either list counts" with the retrieval source labeled. If too many false matches get through, Phase 5 adds a third retrieval mode (static features) and moves to 2-of-3.

**Phase 3 — Hunch production (first integration, single discipline)**
- **P4 Hybrid attention:** NOT pure-inverted. Two components:
  - Base attention (fixed rules: target inquiry + `_state.md` relationships + recent activity + top-K surface similarity to branch question)
  - Query-expanded attention (target-shaped additional sources — e.g., if hunch target is "supersession," include prior superseded findings)
  - The base prevents self-reinforcement; query-expansion adds target-relevant context
- **P5 Context:** current inquiry branch + project-level specs in effect + discipline being run; passed as structured context block
- **P7 Hunch production:** LLM-as-judge call using P4 + P5 + P3 + P6 outputs; produces hunch with reliability, reasoning, load-bearing match
- **P8 Popperian hunch schema** — two classes:
  - **RECORDED hunches** (enter P10 calibration): full schema — target, prediction, prediction_window, observable_outcome, reliability, reasoning, load_bearing_match, hunch_state
  - **TRANSIENT hunches** (in-flight use): reliability + load_bearing_match + hunch_state minimum
  - **hunch_state** ∈ {POSITIVE, NEGATIVE, INSUFFICIENT_HUNCH}
  - **INSUFFICIENT_HUNCH** defined precisely: "no substrate match above similarity threshold S" (S is a pre-registered parameter). NOT "low-confidence hunch" — low-confidence hunches still fire with appropriate reliability scores.
- **P9 (partial) integration:** `/innovate` discipline only — hunches about which candidates are likely-strong before critique runs

**Phase 4 — Calibration loop**
- **P10 Hunch-vs-outcome tracking:** hunch records link to L2 outcome signals when those fire; per-discipline calibration curves
  - **RECORDS ONLY** in MVP — no live weight update
  - **N transparency:** every calibration report includes sample size prominently
  - **Gating:** "well-calibrated" claims require N ≥ 30 per discipline; miscalibration claims require N ≥ 50
- **P12 Retrospective validation:** four tests on existing corpus
  - Test 1: surface-similarity quality (P3 gate)
  - Test 2: abstraction quality (P6b gate) — do similar abstractions correspond to structurally similar findings?
  - Test 3: signal-independence between retrieval modes (P6 gate) — if correlation > 0.8 across surface + abstraction modes, triangulation provides no lift
  - Test 4: hunch calibration on findings with existing L2 outcomes

**Phase 5 — Extensions (activate after Phase 4 proves calibration)**
- **P7b Static-feature anchor:** deterministic features per finding (relationship_density, abstraction_match_depth, telemetry_health, survivability_pattern)
  - **FRAMED AS CONSISTENCY ANCHOR, NEVER GROUND TRUTH**
  - Divergence between LLM hunch and static features = diagnostic signal (worth reviewing); agreement = consistency signal
  - Triangulation upgrades from 2-of-2 to 2-of-3 with abstraction + surface + static features
- **P9 (full) integration:** `/td-critique` discipline adopts hunches for pre-emptive TERMINATE-or-ITERATE signals
- **Baldwin seed-generator:** consistent hunch patterns across inquiries become inquiry-PROPOSAL seeds
  - **NEVER direct spec modification** — seeds enter normal SIC loop for validation
  - Gated on P10 well-calibrated threshold
  - Pattern examples: "discipline pair shows consistent INSUFFICIENT_HUNCH at >40%" → seed for investigating that pair's interface

### 6. Connection to the end-goal

If thinking-space dynamics are the substrate of cognition itself, then this inquiry is not a regression-detection refinement — it is a frontier of the `autonomous_consciousness_goal` program. The Baldwin cycle (the end-goal's self-improvement mechanism) REQUIRES real-time hunches as input; without L3, the autonomy ladder has no substrate for Level 3+. The three-layer architecture with L3 at its center is therefore load-bearing for the end goal: it is where the system develops a functional analogue of first-person cognition.

The stakes reframe: we are not debugging regression detection. We are laying the substrate for the system to think about its own outputs in real time — the precondition for everything downstream in the autonomy ladder.

### 7. Honest limits

**What the MVP CAN do:**
- Produce real-time probabilistic value hunches on discipline outputs
- Capture surface similarity reliably (Phase 1)
- Approximate structural analogy via triangulation (Phase 2, upgraded in Phase 5)
- Calibrate hunches against retrospective outcomes over time (Phase 4)
- Generate Baldwin seeds from calibrated hunch patterns (Phase 5)

**What the MVP CANNOT do:**
- Replace L2 retrospective validation — hunches without calibration become confidently wrong
- Guarantee structural-analogy capture — the signal-independence assumption needs empirical validation (P12 Test 3)
- Produce ground-truth judgments — reliability is probabilistic, not certainty
- Handle the closed-vocabulary cases where LLM embedding substrate systematically misses patterns outside its training distribution
- Replace the human in deciding what to act on — hunches inform, they don't authorize

**What requires infrastructure we don't have (deferred):**
- Full neural thinking-space modeling (user-confirmed too wide for MVP)
- ML-layer attention-weight introspection
- Chunk-level embedding granularity (finding-level is sufficient at current corpus size)
- Live calibration weight updates (MVP records only)

**What we accept as structural:**
- LLM "intuition" is a functional analog of human intuition, not identity — the training-distribution bias is real and is corrected only through calibration over time, not through design
- Sparse calibration data in early operation is inevitable; N-gated claims prevent premature confidence
- No approximation of thinking-space is the thinking-space itself; all claims are about the approximation

---

## Reasoning

### Why the prior finding's "real-time = structural only" was wrong

The prior finding correctly rejected subjective real-time metrics — a human asked "does this feel less useful?" is reporting a judgment the system can't verify. But it then over-corrected by concluding that all real-time judgment must be structural. The gap: a real-time judgment can be MECHANISTIC without being STRUCTURAL. LLM-as-judge, chain-of-thought, self-consistency, analogical retrieval — these are working AI mechanisms that produce real-time probabilistic value signals through characterizable processes, not subjective human introspection. Applied AI has been doing this for years. The prior finding's retreat to structural-only was a philosophical retreat, not an engineering necessity.

### Why the architecture is three layers, not two or four

Two layers (L1 + L2) leaves the real-time value signal unaddressed — the system has no way to pre-empt regression, only to detect it retrospectively. Four or more layers over-segments the temporal structure without adding distinct signal types. Three layers (L1 structural / L3 real-time hunch / L2 retrospective) captures the three structurally distinct signal modes: deterministic binary (L1), probabilistic real-time (L3), empirical delayed (L2). Each layer has its own source, its own cadence, and its own failure mode. Collapsing any two would merge distinct mechanisms.

### Why intuition is decomposed into two similarity modes

The user's signature claim explicitly named the harder case: "the angle might be the same" across unrelated surface domains. Cognitive science (Structure-Mapping Theory, Hofstadter/Mitchell's Copycat) confirms this distinction: humans recognize deep structural analogies that do not show up in surface features. Collapsing the two similarity modes into one (as embedding similarity alone does) silently fails on the capability the user named as signature. The finding therefore treats structural analogy as a SEPARATE PRIMITIVE requiring scaffolded protocols, not a free byproduct of embedding retrieval.

### Why triangulation, not single-signal retrieval

Prosecution in critique: triangulation only lifts accuracy if the three signals are independent. If surface, abstraction, and static features all fail together on the same classes of analogies, 2-of-3 agreement is surface-bias confirmation, not analogy validation.

Defense: the three signals are designed to have different failure modes — surface from text similarity, abstraction from LLM-articulated relational restatement, static features from domain-general structural properties with no content dependence. Disagreement between them is itself a diagnostic signal.

Resolution: triangulation is the right direction BUT requires empirical validation of signal independence. P12 Test 3 (signal-independence check) is therefore a gate on the triangulation claim. If pairwise correlation exceeds 0.8 on structural-analogy test cases, triangulation provides no lift — fall back to abstraction-only with clear labeling. The gate is engineering-verifiable, not fundamental.

### Why the Popperian schema was split into RECORDED and TRANSIENT

Prosecution: forcing every hunch into full schema (prediction + window + observable outcome) suppresses real hunches. Human intuition doesn't emerge fully specified.

Defense: without falsifiability, hunches become unfalsifiable claims — the subjective-metric trap.

Resolution: scope the requirement. Hunches entering calibration records need full schema (otherwise the calibration loop can't function). In-flight transient hunches may have partial structure. The calibration loop still functions; the mechanism still falsifiable in the cases that matter; the cognitive overhead of full specification doesn't block early-stage hunches.

### Why static features are framed strictly as consistency anchors

Prosecution: hand-crafted features encode the designer's assumptions and systematically miss what the designer didn't think of. Cognition is not chess — no closed rule system justifies feature engineering.

Defense: static features don't replace LLM hunches. Their role is divergence-diagnostic — a second independent channel against which LLM output is cross-checked. Their value is not "these are the right features" but "these are some reliable signals; divergence is worth investigating."

Resolution: design constraint — static features are NEVER framed as ground truth. Divergence between LLM and static flags the finding for review, not validates the static. If implementation slips to "LLM hunch is wrong because static features disagree," the idea is killed. Engineering constraint enforced via spec.

### Why inverted attention was forced to hybrid

Prosecution: if attention set is shaped by hunch target, the mechanism retrieves only what matches the prediction the hunch will make, then uses that retrieval to justify the prediction. Confirmation bias built into the architecture.

Defense: attention was intended to be hybrid from the start — invocation-context baseline plus query-expansion. The innovation framing ("the hunch target defines which primitives matter") was too aggressive.

Resolution: explicit refinement in P4 spec. Base attention fixed by rules; query-expanded attention adds target-relevant sources. Critique flagged the innovation's framing as misleading; correction applied before build starts.

### Why Baldwin seeds never bypass the SIC loop

Prosecution: letting hunch patterns auto-generate spec changes lets the system drift in directions the user doesn't intend, with each Baldwin cycle amplifying earlier noise. Control risk.

Defense: seed-generation is not auto-modification. Seeds become inquiry proposals that enter the normal SIC loop. Humans review findings. Zero shortcut to spec changes.

Resolution: explicit ban on hunch-pattern-to-spec-diff paths. Seeds produce inquiry proposals only. Gated on calibration threshold — activates only after P10 shows the hunch mechanism is well-calibrated (minimum N per discipline).

### Why the MVP was phased, not monolithic

Critique's signal-to-noise concern: the assembled MVP has 12+ pieces, 2 new additions, multiple refinements, triangulation, Popperian schema, static features, calibration, inverted attention, Baldwin extension. Too much for a first build; if any piece fails, the whole pipeline fails.

Resolution: five phased stages where each delivers standalone value and failure of later phases doesn't invalidate earlier phases. Phase 1 delivers retrieval value alone. Phase 2 adds abstraction. Phase 3 adds hunch production on one discipline. Phase 4 adds calibration. Phase 5 adds static features, second discipline, Baldwin seeds. Staging is the discipline working correctly.

### Killed candidates with seeds

- **"Every hunch is bias-by-default until calibrated" (1c)** — killed as too extreme. A hunch mechanism that can't be used until calibrated never accumulates calibration data. Circular. The conservatism concern is real and is preserved via INSUFFICIENT_HUNCH state + reliability scores + N-gated claims, not via a blanket zero-trust wrapper.
- **"Mimic human failures, not strengths" (3c)** — killed as orthogonal to MVP. Requires a theory of human cognition we don't have. The idea is philosophically interesting but unbuildable at Level 0-2. If the system develops this property emergently, document it retrospectively.
- **"When-not-to-hunch meta-cognitive gatekeeping" (7c)** — killed as premature. Building a meta-layer over an uncalibrated mechanism is building on sand. INSUFFICIENT_HUNCH state covers the immediate need. Revisit after Phase 4 calibration proves the underlying mechanism.
- **RAG as lead framing (1a, 2a, 6a)** — demoted, not killed. Accurate background technology description. Novelty is in WHAT we retrieve (abstractions, static features) and HOW we use it (triangulation, Popperian schema, calibration), not in the retrieval mechanism itself.
- **Pure-inverted attention** — killed at critique, forced to hybrid. Self-reinforcing bias was fatal; hybrid resolution preserves the value while blocking the failure mode.

### Reconciliation with the prior finding

`importance_measurement_problem` is CORRECTED, not superseded. Its L1 structural analysis is unchanged. Its L2 retrospective infrastructure is unchanged in content — L2's role is expanded to include calibration of L3 alongside its original purpose. Its Popperian reframe carries forward and extends to L3 (hunches as Popperian predictions with observable outcomes). The specifically-corrected claim is the "real-time detection is bounded to structural regression" statement in the prior finding's section 7 — that claim is wrong and is replaced by the three-layer architecture.

Action: caveat header on prior finding, relationship annotation `CORRECTED_BY: thinking_space_dynamics`, section 7 rewrite in P11.

---

## Open Questions

From the inquiry's frontier and deferred work:

1. **Signal independence in triangulation** — the P6 mechanism's value depends on surface, abstraction, and static retrieval modes having independent failure modes. P12 Test 3 is the engineering gate, but the empirical answer is unknown until validation runs. If the modes are correlated, the structural-analogy capture degrades to surface similarity with extra steps.

2. **Abstraction quality ceiling** — the abstraction-backfill protocol depends on LLM-generated relational summaries. Multi-sample consistency + human-review gate mitigate noise, but there is a ceiling on what a per-finding text abstraction can capture. Deeper relational representation (Structure-Mapping Theory formalism, typed relational graphs) may be needed at scale.

3. **Sparse-calibration phase** — P10 calibration curves require N ≥ 30 per discipline for "well-calibrated" claims. At current Baldwin cycle rates (unknown but likely slow), this threshold may take months or years to reach. What is the mechanism's value during the sparse phase?

4. **Chunk-level granularity migration** — finding-level granularity is chosen for MVP. If corpus grows 10x (~200 findings), finding-level may under-resolve. Migration path deferred.

5. **Closed-vocabulary failure cases** — LLM embedding substrate reflects training distribution. There are classes of problems where the distribution systematically misses patterns. The calibration loop eventually corrects this, but the speed of correction is proportional to how often those patterns appear. Blind spots exist and may be slow to detect.

6. **Per-discipline hunch shape variation** — integration starts with `/innovate` and adds `/td-critique` in Phase 5. Do other disciplines need different hunch shapes? `/explore` might hunch about "is the frontier genuinely stable or just not being pushed?" — a different kind of claim than `/innovate`'s "will this candidate survive critique?" Spec-level design per discipline is deferred.

7. **Static feature set completeness** — the proposed features (relationship density, abstraction match depth, telemetry health, survivability pattern) are a first-pass hand-crafted set. No guarantee they capture the right signals. Phase 5 should include an evaluation of which features actually correlate with L2 outcomes; drop the others.

8. **Schema evolution across phases** — the Popperian hunch schema may need to evolve as calibration reveals which fields carry signal vs. which are ceremonial. How does the schema evolve without invalidating Phase 3-4 calibration records? Phase-5+ concern.

9. **Human-in-loop bootstrap calibration** — if the sparse-calibration phase is too long, consider implementing the deferred candidate (2c): user reviews N≥20 hunches per discipline before production trust. Delivers calibration faster at the cost of setup time. Currently deferred; revisit if Phase 4 validation reveals MVP calibration is insufficient in practice.

10. **Attention decay across invocations** — the active attention set is currently constructed at invocation time. A durable attention representation that decays over time across invocations (suggested in exploration cycle 5a) is deferred. Useful if hunches need continuity across sessions.

11. **Empirical Baldwin cycle rate** — Phase 5 Baldwin seed-generation activates after calibration threshold. At what rate does AlignCraft actually run Baldwin cycles? If the rate is too low, the seed-generator may accumulate patterns slowly enough that it never reaches useful density. Measure after Phase 4 operation.
