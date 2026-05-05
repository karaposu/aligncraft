# Sensemaking: Intuition as a Thinking Discipline

## User Input
devdocs/inquiries/intuition_as_discipline/_branch.md

---

## SV1 — Baseline Understanding

The user proposes a three-step transform architecture for intuition (forward-transform source → scan corpus in abstraction space → inverse-transform transferable seeds back to source), mirroring mathematical transforms (Z-transform, Laplace, Fourier). They suggest this may demote embeddings from load-bearing substrate to optional, since the LLM can do the transform directly. The inquiry is about architecting this as a first-class discipline.

---

## Phase 1 — Cognitive Anchor Extraction

### Constraints

- **Discipline quality bar:** Must match the structural rigor of existing AlignCraft disciplines (`/explore`, `/sense-making`, `/decompose`, `/innovate`, `/td-critique`). Each has: numbered process model, named failure modes (6–7), convergence criteria, clear I/O, distinguishing definition.
- **Architectural preservation:** The prior finding's three-layer architecture (L1 structural + L3 real-time hunch + L2 retrospective/calibrator) stands. Only the L3 MECHANISM is under revision.
- **Schema preservation:** The prior finding's Popperian hunch schema (prediction + prediction_window + observable_outcome + reliability + INSUFFICIENT_HUNCH state) must carry forward as intuition's output format.
- **Concrete embedding answer:** "Embeddings optional" must be resolved concretely (yes/no/conditional), not deferred.
- **Multi-location invocation:** The discipline must be invocable at multiple points in the SIC loop (pre-sensemaking, inside innovate, inside critique, standalone) — structurally unusual for disciplines.
- **Corpus scale context:** ~20 findings now (~100k tokens total); grows linearly with inquiries; single-user system.

### Key Insights (from exploration)

- **I1:** Case-Based Reasoning (CBR, Aamodt & Plaza 1994) and Structure-Mapping Engine (SME, Gentner) are DIRECT intellectual precedents. The user's proposal maps cleanly onto CBR's Retrieve→Reuse→Revise→Retain and SME's Alignment→Projection→Evaluation. This is 30+ years of mature work.
- **I2:** Transform-technique failure modes transfer DIRECTLY: aliasing, information loss, boundary effects, domain mismatch, overfit abstraction, underfit abstraction. The discipline inherits a ready-made failure taxonomy.
- **I3:** Embedding necessity is SCALE-ADAPTIVE, not binary. LLM-direct is feasible at N ≤ ~50 findings; breaks at N ≥ ~200. Embeddings provide properties LLM-direct structurally lacks (deterministic retrieval, cross-query comparability, calibration stability).
- **I4:** Intuition is MULTI-LOCATIONAL. Most disciplines have one canonical location in the SIC loop; intuition is callable from at least four places. This is a novel architectural property.
- **I5:** Many discipline-spec slots are EMPTY in the user's proposal — output artifact structure, decline conditions, mode split, convergence criteria, entry points. These are sensemaking/decomposition work.
- **I6:** "Transferable part of seed" has FORMAL precedent — SME's Alignment (find structural mappings) + Projection (apply transferable parts to source). Not vague; not to be reinvented.
- **I7:** The mathematical-transform analogy has LIMITS. Z-transform works because the transform is linear and exactly invertible. Natural-language abstraction is neither — information is lost in the forward direction and the "inverse" is asymmetric projection, not mathematical reversal. The analogy is a STRUCTURAL GUIDE, not a mechanical template.

### Structural Points

- **Core operation (three phases):** Forward transform (source → abstraction) → Operate (scan corpus in abstraction space per mode) → Projection (selective mapping of matched seeds' transferable parts back to source context with Popperian framing)
- **Input:** source text + optional explicit corpus reference + optional inquiry-state context
- **Output:** structured seed list (one entry per intuition seed with formal schema) + narrative per-seed reasoning
- **Modes (candidate):** Convergent (pattern match — similar prior findings) + Divergent (cross-domain structural analogy — surface-unrelated findings sharing relational structure, the user's "angle-match" case)
- **Decline conditions (four):** empty abstraction / no corpus matches / contradictory seeds / projection failure → INSUFFICIENT_INTUITION state
- **Invocation points:** before /sense-making, inside /innovate, inside /td-critique, standalone, potentially more (multi-location)
- **Entry points:** source-first (default) or inquiry-state-first (when invoked mid-loop)

### Foundational Principles

- **FP1: Discipline rigor = spec completeness.** A discipline is not real until its spec has all structural slots filled (process model, failure modes, convergence, I/O, decline conditions).
- **FP2: Three-layer architecture (from prior finding) stands.** L1/L3/L2 are load-bearing for the Baldwin cycle; this inquiry does not question them.
- **FP3: Scale-adaptivity > scale-brittleness.** A discipline spec should remain constant while implementation scales. Spec written once; impl shifts at thresholds.
- **FP4: Inherited precedent beats invented novelty.** CBR + SME are mature; the discipline borrows their architectural decisions rather than re-deriving them.
- **FP5: Popperian integration.** Every intuition output is a prediction with an observable outcome, enabling calibration against L2 retrospective signals.
- **FP6: Information loss is structural, not a bug.** Forward abstraction discards surface content. The "inverse" never recovers it. This is an inherent property of the transform, not a failure to repair.

### Meaning-Nodes

- **Intuition (central):** Methodology-level recognition-and-transfer discipline; produces probabilistic signals by identifying structural matches in a corpus and projecting their transferable parts onto the current source.
- **Transform space:** The intermediate representation where source content is lifted (articulated as relational/structural pattern) so pattern-matching becomes tractable.
- **Transferable seed:** The structurally-aligned part of a corpus match that projects back to the source context. Per SME: shared relations and their implications, not shared attributes.
- **First-class discipline:** Invokable standalone with its own artifact output (`intuition.md`), at the same architectural tier as `/explore` or `/innovate`.
- **Multi-locational:** Callable from multiple points in the SIC loop, unlike most disciplines which have a single canonical location.
- **Scale-adaptive:** The spec is constant; the implementation shifts with corpus size (LLM-direct at small scale, embedding-hybrid at large scale).

---

## SV2 — Anchor-Informed Understanding

The user's proposal isn't a refinement of a mechanism — it's an ARCHITECTURAL PROMOTION. Intuition moves from "infrastructure buried inside the L3 layer (P6/P7 in prior finding)" to "first-class thinking discipline with its own spec, artifact, and invocation pattern." The Z-transform analogy is genuinely useful as a structural guide but has specific mathematical limits that don't carry over to natural-language cognition (no linearity, no exact invertibility, no free inverse). The real architecture is CBR + SME — mature, well-understood, well-tested — and the discipline spec should borrow from both rather than inventing from scratch. The embedding question resolves as scale-adaptive: at current corpus size, embeddings are overhead; at Baldwin-cycle growth scale, they're load-bearing. The spec must accommodate both without breaking.

---

## Phase 2 — Perspective Checking

| Perspective | What it revealed |
|---|---|
| **Technical / Logical** | Implementable via LLM calls at current scale; scale-adaptive implementation is sound engineering; SME's Projection gives operational inverse-transform definition |
| **Human / User** | User wants the architecture to feel "straightforward"; transform framing IS more intuitive than "embeddings + primitives + triangulation + hunch production + calibration"; discipline status elevates intuition to same authority as other disciplines |
| **Strategic / Long-term** | Scale horizon exists; spec must not break at it; this is the Baldwin-cycle's L3 mechanism, so the discipline IS the self-improvement substrate; framing affects how the system evolves |
| **Risk / Failure** | Transform failure modes (aliasing, overfit, underfit) are real and specific; without explicit decline conditions the discipline produces confident garbage; bad abstractions are worse than no abstractions |
| **Resource / Feasibility** | LLM-direct works at current N=20; long-context LLMs (Claude 1M, GPT 128k, Gemini 1M+) fit the corpus; per-call cost acceptable with user's discount; no embedding infra needed for MVP |
| **Definitional / Consistency (INTERNAL)** | *The Z-transform analogy's self-consistency.* Z-transform works due to linearity + exact invertibility. Natural-language abstraction has NEITHER. If we apply the analogy literally, the inverse transform step is incoherent. The analogy must be RESCUED by substituting SME's Projection for mathematical inverse — asymmetric, selective, lossy. This is an internal gap in the raw proposal that sensemaking must close. |
| **Definitional / Consistency (EXTERNAL)** | Compatibility with existing disciplines' spec structure is a strong constraint — the spec must have the same slots (process model, failure modes, convergence, I/O). Compatibility with prior finding's three-layer architecture is a strong constraint — L3 role stands. |

### Key perspective convergence

The technical, strategic, and definitional-internal perspectives all converge on: **the transform analogy is useful but must be rescued by SME's Projection framing to be internally coherent.** The user's proposal is GOOD but has an unstated dependency on SME (or something like it) to close the gap between "forward transform" and "inverse transform." Making this explicit is the first load-bearing clarification.

---

## SV3 — Multi-Perspective Understanding

The proposal's central move (three-step transform) is sound, but the Z-transform analogy contains an internal gap: natural-language abstraction isn't linear or exactly invertible. The inverse step must be rescued — SME's Projection (selective mapping of transferable structural parts) closes the gap. Once this is made explicit, the architecture becomes: **CBR's Retrieve + Reuse + Revise loop, structured through SME's Alignment + Projection for the mapping step, framed via the transform-technique pattern for pedagogical clarity, delivered as a first-class AlignCraft discipline.** This is more precise than SV2 and grounded in named intellectual precedents.

---

## Phase 3 — Ambiguity Collapse

### Ambiguity 1: What is the "inverse transform" concretely?

**Counter-interpretation:** a mathematical inverse — perfect reversal of the forward operation, recovering the source from the abstraction.

**Why the counter fails (structurally):** natural-language abstraction is LOSSY. Information discarded in the forward direction is not recoverable from the abstraction alone. Claiming mathematical inverse is a category error.

**Resolution:** The "inverse transform" is **SME-style Projection** — selective mapping of structural correspondences from a matched corpus finding back to the source context. It is ASYMMETRIC (different from forward transform), LOSSY BY DESIGN (only transferable parts transfer), and GUIDED BY STRUCTURAL MAPPING (not by inverting the forward operation). HIGH CONFIDENCE.

- **What is now fixed:** the inverse step operates on matched corpus findings, not on the abstraction alone; it projects structural alignments back to source; information loss is a structural property, not a failure
- **What is no longer allowed:** treating the transform as mathematically invertible; expecting the inverse to recover source from abstraction; using "inverse" as shorthand for "reversal"
- **What depends on this:** the discipline's output schema (what a "transferable seed" contains); the operational definition of projection quality; the failure mode "inverse-transform mismatch"
- **Model change:** the three-step pattern is forward-transform → scan → PROJECTION (not → inverse-transform). Relabel clearly.

### Ambiguity 2: Discipline or subroutine?

**Counter-interpretation:** intuition is a subroutine only — called by other disciplines but not directly invocable.

**Why the counter fails:** the user explicitly asked for intuition to be "sth like a thinking discipline" (first-class). Subroutine-only mode blocks standalone use cases (user wants to intuit about a piece of source text directly) and reduces the discipline's authority in the architecture.

**Resolution:** **First-class discipline WITH multi-location invocation.** Callable standalone (produces `intuition.md` artifact, like `/explore` produces `exploration.md`) AND invocable from within other disciplines (called inline; may produce in-memory seeds rather than file artifact when called this way). HIGH CONFIDENCE.

- **What is fixed:** discipline status; two invocation modes (standalone + embedded); two corresponding output modes (file artifact + in-memory seeds)
- **What is no longer allowed:** subroutine-only framing; single-location invocation
- **What depends on this:** the discipline spec's invocation section; how telemetry records which invocation mode was used
- **Model change:** adds a formal "invocation mode" dimension to the discipline spec — new slot not present in other disciplines

### Ambiguity 3: Replace, refine, or sit beside the prior finding?

**Counter-interpretation:** sit beside — maintain two parallel L3 mechanisms (embedding-based + transform-based) and let practice decide.

**Why the counter fails:** architectural drift. Two parallel mechanisms mean two calibration loops, two failure modes to track, two integration patterns per discipline. Cost exceeds value.

**Resolution:** **REFINES.** The `/intuit` discipline BECOMES the L3 mechanism. Prior finding's P6/P7 are absorbed into the discipline (P6's structural-analogy becomes one mode of /intuit; P7's hunch production becomes the output step). Embeddings demote from Phase 1 foundational substrate to Phase 5 scaling layer. HIGH CONFIDENCE.

- **What is fixed:** one L3 mechanism, not two; /intuit IS the mechanism; embeddings deferred
- **What is no longer allowed:** parallel L3 mechanisms; building the embedding substrate before a calibrated /intuit exists
- **What depends on this:** the prior finding's phased-build order (Phase 1 deferred; new Phase 1 is the discipline spec + LLM-direct implementation)
- **Model change:** the prior finding's phased build is REORDERED — discipline first, substrate later

### Ambiguity 4: What is a "transferable part" of a seed?

**Resolution:** per SME — the structural relations (not attributes) that align between the source's abstraction and the matched finding's abstraction, together with the inferences they license. Specifically: (a) the relational pattern that matches, (b) its consequences in the matched finding (what followed from that pattern), (c) the projected version of those consequences in the source's context. HIGH CONFIDENCE.

- **Fixed:** transferable = structural, not surface; transferable includes consequences, not just the match itself; projection requires a source-context mapping step
- **No longer allowed:** treating "transferable" as synonymous with "similar"; projecting raw content without structural alignment
- **Depends:** the per-seed output schema; the quality criteria for a good projection

### Ambiguity 5: Convergent vs divergent intuition

**Resolution:** **Two modes within one discipline**, selected by parameter. Convergent mode matches findings with similar surface AND abstraction (pattern recognition — "this is like those recent similar cases"). Divergent mode requires abstraction match AND surface-unrelated content (structural analogy — the user's "angle-match" case). Same three-step process; different scan criteria at step 2. HIGH CONFIDENCE.

- **Fixed:** two modes, one discipline, mode as input parameter
- **No longer allowed:** a single-mode discipline that secretly does only one kind of matching; treating the two modes as separate disciplines
- **Depends:** the scan criteria specification per mode; the decline conditions per mode

### Ambiguity 6: Embedding necessity

**Counter-interpretation:** embeddings are fundamental to the geometric substrate and cannot be demoted.

**Why the counter fails:** at current corpus scale (N ≈ 20), LLM-direct operation is feasible and empirically tested to work. The "substrate" concept is rhetorically powerful but structurally, the geometric properties embeddings provide (deterministic retrieval, cross-query comparability, scale-independent repeated queries) earn their weight only at larger N. At small N, they are overhead.

**Resolution:** **Scale-adaptive implementation, constant spec.** Current (N ≤ ~50): LLM-direct — corpus read in-context per query. Future (N > threshold): hybrid — embeddings pre-filter corpus to top-K candidates, LLM performs transform-scan-projection on shortlist. The /intuit spec is identical in both cases; only the "fetch candidate corpus" step differs. HIGH CONFIDENCE.

- **Fixed:** spec is implementation-agnostic; implementation is corpus-size-dependent; scale threshold is a parameter (not hard-coded)
- **No longer allowed:** making the spec depend on embeddings; refusing to build /intuit until embedding substrate exists; treating embeddings as foundational rather than as a scaling layer
- **Depends:** the prior finding's phased build reorder; the scale-transition criteria; the Phase 5 specification of the embedding pre-filter

### Ambiguity 7: Output artifact structure

**Resolution:** **Structured seeds + narrative.** Each seed has formal slots: `source_anchor`, `abstraction`, `mode` (convergent/divergent), `corpus_match` (path + excerpt), `structural_alignment` (what structure matches), `transferable_projection` (what projects back + how), `prediction`, `prediction_window`, `observable_outcome`, `reliability`, `hunch_state`. Plus narrative: one paragraph per seed explaining the transfer in human-readable form. HIGH CONFIDENCE.

- **Fixed:** schema with 11 fields per seed; narrative alongside; both produced by the same call
- **No longer allowed:** narrative-only outputs (blocks calibration); schema-only outputs (blocks human review)
- **Depends:** the per-seed construction protocol; the Popperian field integration

### Ambiguity 8: Decline conditions

**Resolution:** **Four named conditions, all producing INSUFFICIENT_INTUITION state.**
1. **Empty abstraction:** forward-transform produces meaningless or trivial abstraction (e.g., "this is about methodology") — flagged by multi-sample consensus failure
2. **No corpus matches:** scan finds zero matches above similarity threshold (convergent) or zero structurally-aligned surface-unrelated findings (divergent)
3. **Contradictory seeds:** scan produces seeds that make contradictory predictions (e.g., one says "will succeed," another says "will fail") — surface the contradiction rather than collapse
4. **Projection failure:** matches exist but structural alignment cannot project to source context — report as "structural match without transfer"

HIGH CONFIDENCE.

- **Fixed:** four conditions; each has a specific operational trigger
- **No longer allowed:** silently producing low-reliability hunches when any condition is met; collapsing contradictions
- **Depends:** the INSUFFICIENT_INTUITION state's operational definition; the per-condition reporting format

### Ambiguity 9: Retention / learning over time (CBR's Retain step)

**Resolution:** **Deferred for MVP.** Intuition seeds are recorded in a log (for calibration against L2 outcomes) but NOT added to the corpus as new cases in the CBR sense. Retention in AlignCraft already exists via normal inquiry archiving — findings are the cases. Adding a parallel case-base would fork the data model. Revisit if the corpus becomes saturated and CBR's case-adaptation benefits (revise = adapt prior solutions) become load-bearing. MEDIUM CONFIDENCE (could be revisited).

- **Fixed for MVP:** no parallel case-base; seeds logged for calibration only; corpus = findings
- **Not allowed for MVP:** adding new cases beyond normal archiving; using CBR's full learning loop
- **Depends:** the log format for calibration; the revisit trigger

### Ambiguity 10: Entry points

**Resolution:** **Two entry points, one process.**
1. **Source-first (default):** given source text, find seeds from corpus. Used when /intuit is invoked standalone on a new piece of text.
2. **Inquiry-state-first:** when invoked mid-SIC-loop (e.g., inside /innovate), the current inquiry state (question + prior discipline outputs) is the source. The process is identical; the input differs.

HIGH CONFIDENCE.

- **Fixed:** two entry points; process is the same; only input construction differs
- **Not allowed:** a third entry point without explicit specification
- **Depends:** the input-construction sub-step per entry point

---

## SV4 — Clarified Understanding

Post-ambiguity-collapse the discipline has:
- **One concrete core operation** (forward-transform → scan → projection; note the relabel from "inverse-transform" to "projection"); the Z-transform analogy is a teaching guide, not a mechanical template
- **Two modes** (convergent / divergent) with distinct scan criteria
- **Two entry points** (source-first / inquiry-state-first) with identical process
- **Two invocation modes** (standalone / embedded) with different output channels (file / in-memory)
- **One 11-field output schema** plus narrative
- **Four decline conditions** producing INSUFFICIENT_INTUITION
- **One inherited failure-mode taxonomy** (aliasing, information loss, boundary, domain mismatch, overfit, underfit) from transform techniques
- **One relationship to prior finding** (REFINES — becomes the L3 mechanism; embeddings demote to scaling layer)
- **One retention policy for MVP** (seeds logged for calibration; no parallel case-base)
- **One scale-adaptive implementation pattern** (LLM-direct now, hybrid later, spec constant)

---

## Phase 4 — Degrees-of-Freedom Reduction

### Fixed (locked; decomposition / innovation cannot move these)

- Three-step core operation: forward-transform → scan → projection
- Discipline status: first-class, multi-location, with both standalone and embedded invocation modes
- Precedent alignment: CBR's Retrieve-Reuse-Revise + SME's Alignment-Projection
- Relationship to prior finding: REFINES; becomes the L3 mechanism; embeddings demote
- Output: structured 11-field seed schema + narrative per seed
- Popperian integration: every seed has prediction + observable outcome + reliability
- Modes: convergent + divergent (single discipline, parameterized)
- Entry points: source-first + inquiry-state-first
- Decline conditions: four named, producing INSUFFICIENT_INTUITION
- Failure modes: six inherited from transform techniques
- Retention: deferred for MVP (seeds logged for calibration; no parallel case-base)
- Scale-adaptivity: spec constant, implementation shifts

### Eliminated (no longer viable paths)

- Mathematical-transform analogy as literal mechanical template
- Subroutine-only framing of intuition
- Sit-beside-prior-finding (parallel L3 mechanisms)
- Embeddings as Phase 1 foundational substrate (relegated to scaling layer)
- Narrative-only or schema-only outputs
- Single-mode operation (without convergent/divergent distinction)
- Full CBR case-adaptation learning loop (deferred)

### Remaining viable (decomposition territory)

- Exact sub-steps within forward-transform (how the abstraction is produced; number of samples; prompt design)
- Exact sub-steps within scan (per-mode scan criteria; similarity thresholds; abstraction-vs-surface rules for divergent mode)
- Exact sub-steps within projection (SME-style alignment + projection; quality gates)
- Convergence criteria for the discipline (when is an /intuit run "complete"?)
- Numeric parameters (similarity thresholds, minimum-N for calibration, scale-transition point)
- Multi-location invocation formal spec (what each caller passes; what each gets back)
- Coverage strategy (for standalone invocation)
- Process model for the embedded invocation mode (may differ structurally from standalone)
- Calibration-log format (for the deferred retention)
- Integration patterns with /innovate and /td-critique specifically

---

## SV5 — Constrained Understanding

The discipline spec is now mostly determined — the architecture is fixed, the precedents are named, the decline conditions are explicit, the scale-adaptive implementation is defined. What remains open is the DETAIL level: sub-steps within each of the three phases, numeric thresholds, per-mode scan criteria, multi-location invocation formal spec, and the exact integration patterns with other disciplines. Decomposition's job is to partition these open questions into tractable pieces.

The work is concrete rather than speculative. Every remaining decision is bounded by the fixed elements above.

---

## Phase 5 — Conceptual Stabilization

### SV6 — Stabilized Model

**/intuit is a first-class AlignCraft thinking discipline that operates the L3 real-time hunch layer of the three-layer architecture (established by `thinking_space_dynamics`), architected as a scale-adaptive transform-space recognition-and-transfer mechanism grounded in Case-Based Reasoning (Retrieve-Reuse-Revise) and Structure-Mapping Engine (Alignment-Projection) precedent.**

#### The architecture

Three-step core operation:

1. **Forward transform:** source (text OR inquiry state) → abstraction(s) articulating the relational/structural pattern independent of surface domain. Multi-sample consensus for quality. Explicit failure mode: empty / trivial abstraction triggers INSUFFICIENT_INTUITION.

2. **Scan (mode-dependent):**
   - **Convergent mode:** find findings in the corpus with similar abstraction AND similar surface — pattern recognition (prior similar cases).
   - **Divergent mode:** find findings with similar abstraction but surface-unrelated content — cross-domain structural analogy (the user's "angle-match" case; the signature capability).
   - Implementation: at N ≤ ~50, LLM reads corpus abstractions in-context and scans. At N > threshold, embedding pre-filter shortens candidate list; LLM scans shortlist.

3. **Projection (SME-style, NOT mathematical inverse):** for each matched finding, identify structural alignment between its abstraction and the source's; project the transferable parts (structural relations + their consequences) back to the source context; produce a Popperian seed (11-field schema + narrative).

#### Discipline status

- **First-class:** callable as `/intuit <source>` producing `intuition.md` artifact, at the same tier as `/explore` or `/innovate`
- **Multi-locational:** invocable at multiple SIC-loop points (pre-sensemaking, inside /innovate, inside /td-critique, standalone)
- **Two invocation modes:** standalone (produces file artifact) and embedded (returns in-memory seeds to caller)
- **Two entry points:** source-first (default) and inquiry-state-first (when invoked mid-loop)
- **Two content modes:** convergent (pattern match) and divergent (structural analogy), as parameter

#### Output schema (per seed, 11 fields)

`source_anchor`, `abstraction`, `mode`, `corpus_match`, `structural_alignment`, `transferable_projection`, `prediction`, `prediction_window`, `observable_outcome`, `reliability`, `hunch_state` — plus a per-seed narrative paragraph explaining the transfer in human-readable form.

#### Decline conditions (four)

Empty abstraction / no corpus matches / contradictory seeds / projection failure → **INSUFFICIENT_INTUITION** state.

#### Failure modes (inherited from transform techniques)

1. Aliasing — distinct sources mapping to the same abstraction, causing false sharing
2. Information loss — transferable part doesn't fit back when projected
3. Boundary effects — decontextualized seeds that don't reconnect to source
4. Domain mismatch — abstraction applied to corpus of different character
5. Overfit abstraction — too specific; no matches
6. Underfit abstraction — too generic; everything matches

#### Relationship to prior finding (`thinking_space_dynamics`)

**REFINES.** /intuit BECOMES the L3 mechanism. Prior finding's P6 (structural analogy) becomes /intuit's divergent mode. Prior P7 (hunch production) becomes /intuit's projection step with Popperian output. Prior P8 schema carries forward as /intuit's output. Prior Phase 1 (embedding substrate) is DEFERRED to Phase 5 as a scaling layer — activated when corpus size forces it, not built upfront. The three-layer architecture and L2 calibrator role stand unchanged.

#### Scale-adaptive implementation

Spec constant; implementation shifts.

- **Phase 1 (current, N ≤ ~50):** LLM-direct — entire corpus (or its abstractions) read in-context per /intuit call. No persistent embedding store.
- **Phase 2 (future, N > ~100-200):** embedding pre-filter fetches top-K candidate findings; LLM performs transform-scan-projection on shortlist. Embeddings join the build at this threshold.

#### Retention (MVP)

Seeds logged in a calibration log, linked to L2 retrospective outcomes when they fire. No parallel CBR case-base; the inquiry corpus IS the case base.

### How SV6 differs from SV1

SV1 framed this as a mechanism refinement of the prior finding. SV6 reframes it as an **architectural promotion**: intuition moves from infrastructure buried in the L3 layer to a first-class discipline with its own spec, artifact, multi-location invocation, two content modes, two entry points, and inherited failure-mode taxonomy from mature precedent (CBR + SME). The Z-transform analogy is relegated to pedagogical scaffolding; the actual mechanism is Alignment + Projection per SME. The embedding-necessity question is resolved as scale-adaptive, not binary — embeddings are deferred to a future scaling phase rather than discarded. The discipline spec is mostly determined; what remains open is detail-level (sub-steps, numeric thresholds, per-mode scan criteria, multi-location formal spec), which is decomposition territory.

---

## Saturation Indicators

- **Perspectives:** 7/7 run (technical, human/user, strategic, risk, resource, definitional-internal, definitional-external); the definitional-internal perspective produced the load-bearing anchor (Z-transform analogy gap → SME Projection rescue)
- **Ambiguity resolution:** 9/10 HIGH CONFIDENCE; 1/10 MEDIUM (retention mechanism, deferred for MVP with explicit revisit trigger). No silent drops.
- **SV delta:** significant — SV1 "mechanism refinement" → SV6 "architectural promotion of intuition to first-class discipline, CBR+SME grounded, scale-adaptive, multi-location invocable, with Z-transform analogy relegated to teaching guide." Meaningful structural movement.
- **Anchor diversity:** Constraints (6), Insights (7), Structural Points (6), Foundational Principles (6), Meaning-Nodes (6). Balanced across all five types.
- **Load-bearing clarifications:** the Z-transform-analogy internal gap was identified and closed (not patched over) via SME substitution. The embedding-necessity question was resolved concretely as scale-adaptive. The REFINES relationship with the prior finding was chosen over parallel-mechanism alternatives with structural reasoning. The discipline/subroutine question was resolved as hybrid with explicit invocation modes.

**Overall: sufficient for Decomposition.** Central structural understanding stable. The remaining open questions are all detail-level coupling decisions that decomposition will partition into tractable pieces.
