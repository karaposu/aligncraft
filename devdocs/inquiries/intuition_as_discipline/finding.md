---
status: active
impacted_by: thinking_space_primitives
impact_scope: The /intuit discipline's P4 (attention), P5 (context), P7 (hunch production), P8 (failure modes + decline), and output schema refactor to use a refined typed primitive set (11 admitted primitives across operations/buffers/drivers/modulators). Phase A adds Primitive Cards as canonical per-primitive artifacts + corpus-audit admission gate + evidence-linked invocation trace in every /intuit call output. Phase B adds Motivation/Evaluation/Salience primitives. Phase C+ adds modulator cards (Mood, Arousal — operationalization deferred). Core discipline architecture (three-step transform: forward-transform → scan → projection; CBR + SME grounding; phased build A/B/C/D; Popperian schema) is UNCHANGED. See devdocs/inquiries/thinking_space_primitives/finding.md for full primitive audit.
---
# Finding: Intuition as a Thinking Discipline (Transform-Space Architecture)

## Question

**Can intuition be architected as a first-class thinking discipline using transform-space logic — source text → abstraction extraction (forward transform) → seed-scanning in abstraction space → inverse-transform of transferable seed parts back to the source — making it callable on its own like `/explore` or `/innovate`, with explicit inputs, outputs, process model, failure modes, and success criteria, and potentially removing the load-bearing dependency on embeddings?**

### Goal

A complete discipline specification for `/intuit` that:

1. Mirrors transform-technique pattern precisely
2. Specifies I/O and invocation
3. Defines the process model step by step
4. Names failure modes
5. Resolves the embedding question
6. Specifies the relationship to `thinking_space_dynamics`
7. Specifies integration with existing disciplines

---

## Finding

### 1. Yes — intuition can be architected as a first-class discipline, and the design is ready to be built.

`/intuit` is a methodology-level thinking discipline that operates the L3 real-time hunch layer of the three-layer architecture (established by `thinking_space_dynamics`). Its core operation is a three-step transform-space pattern grounded in mature AI and cognitive-science precedents: **Case-Based Reasoning** (Aamodt & Plaza 1994: Retrieve → Reuse → Revise) for the overall cycle and **Structure-Mapping Engine** (Gentner: Alignment → Projection → Evaluation) for the mapping step.

### 2. The Z-transform analogy is a teaching scaffold, not a mechanical template.

The user's proposal borrowed from Z-transform / Laplace / Fourier pattern: *lift into a space where the hard operation becomes easy; operate; lift back*. This analogy is genuinely useful as a structural guide — the three-step pattern is real — but has a specific mathematical limit that does not carry over: mathematical transforms are linear and exactly invertible. **Natural-language abstraction is neither**. Information discarded in the forward direction is not recoverable from the abstraction alone. Applied literally, the "inverse transform" step is incoherent.

The gap is closed by substituting **SME's Projection step** for mathematical inverse: an asymmetric, selective, lossy mapping of structural alignments from a matched corpus finding back to the source context. Projection is not reversal. Projection is the transfer of structural relations and their consequences, guided by the alignment between source-abstraction and match-abstraction, bounded by what structurally fits the source's domain. The three-step pattern is therefore:

**Forward-transform → Operate (scan) → Projection** — not "inverse-transform"

### 3. The discipline architecture (LOCKED by sensemaking, REFINED by critique into phases)

**Identity:**
- First-class discipline (same tier as `/explore`, `/innovate`, etc.)
- Multi-locational — invocable at multiple points in the SIC loop
- Two invocation modes: standalone (produces `intuition.md` artifact) and embedded (returns seeds to caller)
- Two entry points: source-first (given text) and inquiry-state-first (given inquiry folder)
- Scale-adaptive implementation: LLM-direct at current N (~20 findings), embedding pre-filter at N > ~100-200; spec remains constant across both

**Relationship to prior finding (`thinking_space_dynamics`):** REFINES. `/intuit` BECOMES the L3 mechanism; the prior finding's P6 (structural analogy) is absorbed as `/intuit`'s divergent mode; P7 (hunch production) is absorbed as `/intuit`'s projection step with Popperian output. The three-layer architecture (L1 structural / L3 hunch / L2 retrospective-as-calibrator) stands unchanged. The prior finding's Phase 1 (embedding substrate) is DEFERRED to Phase D as a scaling layer, not built upfront.

### 4. The phased build (four phases, each standalone-valuable)

Critique forced a phased build because the full assembled feature set (3 scan modes + hypothesis-first option + differential output + source labels + failed-projection log + pipeline-early + validator + etc.) was too much for a first ship — roughly twice the surface area of existing disciplines. Each phase delivers value; later-phase failure does not invalidate earlier phases.

#### Phase A — Core discipline (first ship)

The minimum coherent `/intuit`:

**Process model (7 steps):**
1. Prepare input (source text from standalone source-first entry point)
2. Forward-transform: extract structured relational abstraction
3. Scan: convergent mode — find corpus findings with similar abstractions and similar surface
4. Project: SME-style Alignment + Projection on top matches
5. Decline check: trigger any of 4 decline conditions if warranted
6. Produce output: flat ranked seed list with reliability
7. Write `intuition.md` artifact (for standalone invocation)

**Abstraction format (forward-transform output):**
Structured relational claim form — `predicate(typed_arg, typed_arg)` — not prose. Example: `calibrates(Signal, Outcome) where Signal is probabilistic, Outcome is delayed`.

Required mechanisms:
- Multi-sample consensus (3 samples, pick consensus predicate)
- Prior-abstraction hint (LLM is shown abstractions previously produced for this corpus as context to prevent per-call predicate explosion)
- Quality gate: trivial abstractions ("this is about AI methodology") trigger retry; persistent failure → INSUFFICIENT_INTUITION

**Output schema (reduced, 10 fields per seed):**
`source_anchor`, `abstraction`, `corpus_match`, `structural_alignment`, `transferable_projection`, `prediction`, `prediction_window`, `observable_outcome`, `reliability`, `hunch_state`, plus `source_type` field initially supporting two values: `CORPUS_MATCH` and `INSUFFICIENT_INTUITION`.

**Source-type verification (not self-report):** `CORPUS_MATCH` requires a cited `corpus_match` with specific file path and excerpt; verification checks path existence and excerpt presence. `INSUFFICIENT_INTUITION` is an explicit decline with reason. The LLM cannot fake either label.

**Decline conditions (4):** empty abstraction / no corpus matches / contradictory seeds / projection failure → `INSUFFICIENT_INTUITION` output with reason.

**Failure modes (6 inherited from transform techniques):** aliasing (same abstraction from distinct sources — detection via multi-sample consistency check); information loss (structural, not a bug, documented); boundary effects (decontextualized seeds — mitigated by projection including source-context mapping); domain mismatch (abstraction applied to different-character corpus — detection via corpus-coverage check); overfit abstraction (predicate novel/rare — retry P3 with broadening hint); underfit abstraction (predicate matches majority of corpus — retry P3 with specificity hint).

**Phase A validation (required before Phase B):**
- Convergent correctness on 5-10 known related pairs (≥70% agreement with human judgment)
- Predicate stability across runs on similar sources (≥70%, else fall back to prose with predicate extraction)

#### Phase B — Expansion (gated on Phase A calibration ≥ N=15)

Adds:
- **Divergent mode:** same abstraction predicate + surface-dissimilar findings — the "angle-match" case, the signature capability for cross-domain structural analogy
- **Inquiry-state-first entry point:** `/intuit <inquiry-folder>` treats the folder's state as source
- **Embedded invocation:** callable from `/innovate`, `/td-critique`, etc.; returns seeds in-memory
- **Validator lighter path:** caller supplies hypothesis and (optionally) abstraction; /intuit scans + projects and returns verdict (supported/contradicted/INSUFFICIENT). Not a distinct matrix cell — a flag on embedded invocation.
- **Differential output with discriminators:** output becomes a ranked differential of hypotheses, each with a `discriminator` field naming what observation would favor this hypothesis over the next-ranked. GATED on P14 test: discriminators must be ≥60% actionable; else fall back to flat ranked list.
- **Source labels extended:** adds `TRAINING_DISTRIBUTION_MATCH` (no cited corpus path — explicit LLM-knowledge source, not corpus-grounded) and `NOT_APPLICABLE` (LLM declines because intuition isn't the right tool — e.g., pure-computation queries)
- **Failed-projection logging:** when P5 finds structural match but cannot project back, log as `corpus_limit_seed` in a lightweight single log file (`devdocs/intuit_corpus_limits.log`). One line per entry; manual review by user; no automated escalation. Kill if accumulates noise.

#### Phase C — Adversarial + Hypothesis-First (gated on corpus having failure-annotated findings)

Adds:
- **Adversarial mode:** scans for matches to prior FAILED findings. Triggers require specific failure-indicator relationships — `CORRECTED_BY`, `REPLACED_BY`, `status: failed/retracted` frontmatter, or `SUPERSEDED_BY` **only when paired with `correction_scope` field** (as used by `importance_measurement_problem`'s annotation). Bare `SUPERSEDED_BY` is not a failure indicator — many supersessions are refinement-with-transfer, not failure.
- **ADVERSARIAL_MATCH source label:** output `source_type` extends to signal "this matches a prior failure pattern; failure may repeat."
- **Hypothesis-first process variant:** an alternate P2 step order — source produces candidate hypothesis first, abstraction is extracted from the hypothesis, scan tests the hypothesis. **CANNOT ship without adversarial mode** (coupling rule — without adversarial scan, hypothesis-first becomes confirmation-bias-by-construction). The scan in hypothesis-first mode MUST include adversarial search; the output reports whether the hypothesis was supported, contradicted, or unresolvable.
- **Pipeline-early auto-invocation (opt-in):** `/MVL+ <question> --intuit` runs `/intuit` on the new `_branch.md` before `/explore`, producing a baseline `intuition.md`. Opt-in at MVP; default-on is deferred.

#### Phase D — Scale + maturity

Adds:
- **Embedding pre-filter:** at N > threshold (~100-200 or context-window headroom < 30%), corpus fetch uses embedding cosine to narrow to top-K candidates before LLM scan. This activates the prior finding's previously-deferred Phase 1 (embedding substrate) as a scaling layer, not a foundation.
- **Pipeline-early default-on:** after P11 calibration shows reliable performance (≥N=30 per discipline with good curves), the opt-in flag flips to default-on; users opt-out when intuition isn't wanted for a specific inquiry.
- **Extension to other disciplines:** `/explore` (pre-seeding the scan), `/sense-making` (pre-seeding anchor extraction), `/decompose` (similar coupling topologies from prior decompositions). Each extension gated on Phase C calibration being mature.

### 5. Integration patterns

**With `/innovate`:** embedded + inquiry-state-first; `/innovate` calls `/intuit` and uses returned seeds as INPUT TO INNOVATION MECHANISMS (especially Domain Transfer and Combination). Structural analogies from `/intuit` become Domain Transfer's starting points; failed-projection seeds (Phase B+) become Absence Recognition inputs.

**With `/td-critique`:** embedded in validator mode; critique's prosecution and defense each pass candidate hypotheses to `/intuit` ("this candidate will succeed because prior X succeeded under similar conditions"; "this candidate will fail because prior Y failed under similar conditions"). `/intuit` returns corpus-grounded verdicts; critique uses them to strengthen adversarial testing.

**Opening-book mental model:** users and readers think of AlignCraft's corpus as a "book of prior positions" (like chess opening books). Each inquiry state is a position; prior inquiries are book entries with transferable methodology moves attached. `/intuit` is the lookup mechanism. This is architectural branding, not implementation — memorable and aligned with how humans actually use analogical reasoning.

### 6. Resolution of the embedding question

**Embeddings are not necessary for MVP.** At the current corpus scale (~20 findings, ~100k tokens), LLM-direct implementation reads the corpus (or pre-computed abstractions) in-context per call. The spec is implementation-agnostic — only the corpus-fetch step differs between Phase A (direct read) and Phase D (embedding pre-filter). Neither version breaks the spec.

What embeddings provide that LLM-direct loses (deterministic retrieval, cross-query comparability, sub-millisecond repeated queries, scale-independence) earns their weight at larger N. At current N, it is overhead. The Baldwin cycle's growth trajectory eventually forces Phase D, but not now.

The user's original claim — "embeddings may be unnecessary" — is therefore resolved as: **not unnecessary in principle, but deferred in MVP; mandatory eventually; spec accommodates both**.

### 7. Concrete update to `thinking_space_dynamics/finding.md`

The prior finding is REFINED, not superseded. Specifically:

- Prior finding's **P6 (structural analogy via triangulated retrieval)** is absorbed as `/intuit`'s divergent mode. The triangulation concept becomes one mechanism within divergent-mode scan; the discipline layer unifies it with convergent mode and adversarial mode.
- Prior finding's **P7 (LLM-as-judge hunch production)** is absorbed as `/intuit`'s projection + output step. The Popperian hunch schema becomes `/intuit`'s output schema (extended from 11 to 12 fields with `source_type`).
- Prior finding's **P8 (output format)** carries forward as `/intuit`'s Phase B differential output.
- Prior finding's **Phase 1 (embedding substrate)** is REORDERED to Phase D scaling layer. New build order: `/intuit` spec → Phase A → Phase B → Phase C → Phase D (which is when embeddings enter).
- Three-layer architecture (L1/L3/L2 with L2 as calibrator) is UNCHANGED.
- Popperian schema is UNCHANGED in its core fields; extended additively with `source_type`, `discriminator`, and the `corpus_limit_seed` bucket.

Action: caveat header on prior finding with `refined_by: intuition_as_discipline`; Section 5 rewrite to reflect new phase order; relationship annotation `REFINED_BY: intuition_as_discipline` in prior `_state.md`.

### 8. Honest limits

**What the MVP CAN do (Phase A):**
- Produce real-time probabilistic value signals on source text
- Capture convergent (pattern-match) intuition with corpus-grounded seeds
- Produce Popperian predictions with observable outcomes
- Decline honestly via INSUFFICIENT_INTUITION
- Verify source-type labels externally (no LLM self-report)

**What the MVP CANNOT yet do (requires later phases):**
- Divergent structural analogy across unrelated surface domains (Phase B)
- Adversarial/failure-pattern detection (Phase C, requires failure-annotated corpus)
- Hypothesis-first testing (Phase C, coupled with adversarial)
- Embedding-based scale (Phase D, at corpus N > threshold)
- Baldwin-cycle spec-modification seeds (Phase D+, gated on calibration)

**What the discipline accepts as structural:**
- Information loss in forward-transform (SME's Projection is asymmetric by design)
- Probabilistic signals, not ground truth — every hunch has reliability, not certainty
- LLM "intuition" is a functional analog of human intuition, calibrated against L2 outcomes over time
- Predicate vocabulary stabilizes across calls via hint mechanism, not global schema
- Sparse calibration data in early operation is inevitable; N-gated claims prevent premature confidence

---

## Reasoning

### Why the Z-transform analogy had to be rescued

The user's proposal leaned heavily on mathematical transform techniques as the architectural template. Sensemaking's definitional-internal perspective caught the specific structural gap: the Z-transform works because the transform is LINEAR and EXACTLY INVERTIBLE in the mathematical sense. Natural-language abstraction is neither. Applied literally, the "inverse transform" step would require recovering source content from an abstraction — which discards surface in the forward direction. The operation is not defined.

The rescue was substitution, not abandonment. SME's Projection step is also a "going back" operation but with the correct mathematical properties: asymmetric (different from forward), selective (only structural alignments transfer), lossy by design (non-transferable parts stay in the match), and guided by structural correspondence (not by inverting the forward transform). The three-step pattern is preserved as pedagogy; the mechanism is Projection.

Without this rescue, the entire proposal would have been structurally unsound. With it, the transform framing remains useful as a teaching scaffold ("lift → operate → project back") while the discipline rests on 30+ years of mature work in CBR + SME.

### Why structured relational abstractions require a vocabulary-hint mechanism

Critique's prosecution of candidate 1: LLMs drift back to prose under any prompt; forcing `predicate(arg, arg)` form produces syntactically-formatted prose with ad-hoc predicates invented per-call, making cross-call comparison unreliable.

Defense: structured form improves matching even as veneer, and predicate vocabulary can converge.

The resolution was not "hope convergence happens" but a specific mechanism: each call is shown a **list of predicates that prior abstractions in this corpus have used** as context, encouraging reuse; true novelty is allowed but flagged. This prevents the combinatorial explosion where every call invents a unique predicate, while preserving the LLM's ability to find genuinely new relational patterns. P14 validation then TESTS the predicate stability (≥70% agreement on similar sources) — if the mechanism doesn't work, fall back to prose-with-predicate-extraction is the documented escape hatch.

### Why source-type labels must be verifiable, not self-reported

Critique's prosecution of candidate 3: the LLM cannot reliably introspect whether a hunch came from in-context corpus vs training distribution. Self-reported labels would be systematically unreliable — the LLM will claim CORPUS_MATCH for any plausible-sounding match.

Defense: labels are NOT self-reported — they are mechanically verifiable. `CORPUS_MATCH` requires a cited file path and excerpt; verification checks path existence and excerpt presence. `TRAINING_DISTRIBUTION_MATCH` = no cited path. `ADVERSARIAL_MATCH` = cited match has specific failure-relationship annotations. `NOT_APPLICABLE` = LLM explicitly declines with reason. The LLM can't fake a path that doesn't exist or an excerpt that isn't there.

This is a clean design decision: the labels' trustworthiness comes from external mechanical verification, not from trusting the LLM's introspection. Spec must specify the verification step explicitly in P6/P8.

### Why adversarial mode's trigger had to be sharpened

Critique's prosecution of candidate 4: `SUPERSEDED BY` in `_state.md` is too coarse to mean "failure." Many supersessions are refinement-with-transfer. Example from this session's own work: `regression_detection_design` was SUPERSEDED BY `importance_measurement_problem`, but the seeds transferred (L1 spec-diff MVP persisted). Treating bare SUPERSEDED as failure would produce false adversarial matches.

The refinement lists specific failure-indicator relationships: `CORRECTED_BY` (explicit wrong-claim identification), `REPLACED_BY` (full content replacement), explicit `status: failed/retracted` frontmatter, `SUPERSEDED_BY` paired with `correction_scope` (as used in `importance_measurement_problem`'s annotation of `regression_detection_design`). Bare `SUPERSEDED_BY` is not a failure indicator.

This depends on the corpus accumulating these richer annotations. At MVP, the failure-annotated corpus may be thin — which is why adversarial mode is gated to Phase C. Acceptable trade-off: the mode is powerful when the data supports it; absent that data, it would produce noise.

### Why hypothesis-first had to be coupled with adversarial scan

Critique's prosecution of candidate 7: starting with a hypothesis biases the whole process toward confirming it. Classic confirmation-bias-by-construction.

Defense: Popperian framing makes hypothesis-first valuable IF the scan actively searches for CONTRADICTING evidence.

Resolution: the two innovations (hypothesis-first mode + adversarial scan) are coupled at the spec level. Hypothesis-first mode cannot run without adversarial scan alongside convergent/divergent. If the corpus doesn't yet support adversarial mode (no failure-annotated findings), hypothesis-first is disabled. This is an explicit architectural dependency, not an implementation detail.

### Why validator was demoted to a lighter-path variant

Critique's prosecution of candidate 8: validator mode duplicates what the caller could do with a direct LLM call; abstraction-and-projection machinery is overkill for validating a supplied hypothesis.

Defense: bypassing `/intuit` fragments calibration — direct LLM calls from different callers produce different calibration data.

Resolution: validator survives but as a LIGHTER PATH. Caller supplies hypothesis (and optionally abstraction); `/intuit` skips forward-transform, runs scan + projection, returns single verdict. Same calibration infrastructure, less machinery. Not a new matrix cell; a flag on embedded invocation.

### Why the MVP had to be phased

Critique's assembly-level concern: the assembled spec had 3 scan modes × 2 entry points × 2 invocation modes + validator variant + hypothesis-first option + structured abstractions + differential output + 4 source labels + 5 states + corpus_limit_seeds + pipeline-early opt-in — roughly 2× the feature surface of existing disciplines (`/explore` has ~2 modes, 2 entry points, 1 invocation mode). Too much to ship at once; if any piece fails, whole discipline fails.

The four-phase build (A/B/C/D) addresses this structurally. Each phase has a coherent standalone value proposition:
- Phase A: a working convergent-mode discipline, which is useful on its own
- Phase B: adds the cross-domain analogy capability (divergent) and caller integration
- Phase C: adds failure-pattern detection and hypothesis-testing, gated on corpus maturity
- Phase D: adds scale infrastructure, gated on calibration maturity

Later-phase failure doesn't invalidate earlier phases. Each phase has its own validation test (P14 instances). The discipline grows incrementally with corpus and calibration maturity.

### Killed candidates with seeds

- **RAG as lead framing (1a, 2a, 6a)** — demoted, not killed. Accurate background technology description; not the novelty. The novelty is WHAT we retrieve (structured relational abstractions, failure patterns) and HOW we use it (SME Alignment + Projection, differential output, adversarial mode), not the retrieval mechanism itself.
- **Innovation-intuition merger (7c)** — premature future-proofing. The distinction between intuition (corpus-grounded recognition) and innovation (mechanism-driven generation) is architecturally load-bearing today. Designing for hypothetical LLM convergence destabilizes the present spec. Seed preserved: keep the discipline spec clean enough that absorption into `/innovate` would be possible without calibration data migration, if that future arrives.
- **Depth-2 inversion (human-rated hypotheses)** — Level 3+ concern. MVP is system-autonomous. Seed preserved: P11 calibration against L2 retrospective outcomes is the system-autonomous substitute for human rating.
- **Unlabeled training-distribution hunches** — dilutes calibration if unlabeled. The labeled version (admitted as `TRAINING_DISTRIBUTION_MATCH` with honest source-type) preserves value; the unlabeled version does not. Preserved in Phase B with explicit labeling.
- **Pure-inverted attention (from thinking_space_dynamics critique — carried forward as learned constraint)** — killed in the prior inquiry for self-reinforcing-bias reasons; `/intuit`'s attention is hybrid (base context + query-expansion) following the same resolution.
- **Pure-monolithic MVP (assembly-level kill in this critique)** — replaced by four-phase build. Not killed in principle; killed as a ship strategy. The full design remains the target; the path is phased.

### Reconciliation across inquiries

Three inquiries have now built on each other:

1. `regression_detection_design` — proposed output-property-based regression detection; architecturally superseded by #2
2. `importance_measurement_problem` — proposed two-layer architecture (L1 structural + L2 retrospective); `real-time = structural only` claim corrected by #3
3. `thinking_space_dynamics` — proposed three-layer architecture (L1 + L3 new + L2 as calibrator); L3 mechanism refined by this inquiry
4. `intuition_as_discipline` (this) — REFINES #3's L3 mechanism by making it a first-class discipline with transform-space architecture

Each inquiry preserves its predecessor's content while refining or correcting a specific claim. The architecture accumulates rather than thrashes. The locked elements from each flow forward.

---

## Open Questions

From exploration, sensemaking, decomposition, innovation, and critique frontiers:

1. **Predicate vocabulary evolution** — the vocabulary-hint mechanism is designed to encourage predicate reuse, but may converge on too-narrow a vocabulary (reducing expressiveness) or fail to stabilize (predicate explosion). P14 stability test is the first-order check; longer-term, we may need explicit vocabulary curation or automated merging of synonymous predicates.

2. **Adversarial corpus thinness** — adversarial mode depends on failure-annotated findings. At MVP, the corpus has few explicit failure annotations (mostly supersessions without correction_scope). The discipline may need a one-time audit of the existing corpus to add failure annotations where applicable; deferred but likely needed before Phase C is useful.

3. **Discriminator quality ceiling** — differential output's value depends on LLMs producing meaningfully distinguishing discriminators. Prompt engineering may not be sufficient; the fallback to flat ranked list is the escape hatch, but an intermediate option (weaker discriminators with honest reliability gradations) may be worth exploring.

4. **Phase A's convergent-only limitation** — Phase A ships with only convergent mode (pattern-match intuition). The user's signature claim was DIVERGENT (cross-domain angle-match). Phase A is useful but does not yet deliver the signature capability; Phase B is where that arrives. Temporal gap between ship and full value.

5. **Opening-book mental model's value** — whether users actually adopt the opening-book framing in practice, or whether the discipline's internal mechanics are complex enough that the mental model doesn't help. Measurable after first deployment.

6. **Interaction with multi-head inquiries** — if AlignCraft evolves to support multiple concurrent inquiries (multi-head), `/intuit` as specced operates on one source at a time. Multi-source intuition (finding structural connections across concurrent inquiries) is an interesting future direction; not scoped here.

7. **Calibration log scale** — `corpus_limit_seeds` is lightweight by design, but the calibration log proper (P11) may grow. When does the calibration log need structured querying? Deferred until volume forces it.

8. **Embedding model selection for Phase D** — when Phase D activates, which embedding model? Pinned in prior finding but may be revisited given model evolution by the time Phase D arrives.

9. **Retention as parallel case-base (CBR's Retain step)** — deferred for MVP. Seeds are logged for calibration but not added to the corpus as new cases. Revisit if the corpus becomes saturated and CBR's case-adaptation benefits become load-bearing.

10. **Extension to disciplines beyond `/innovate` and `/td-critique`** — `/explore`, `/sense-making`, `/decompose` could each benefit from `/intuit` integration. Deferred to Phase D; each extension needs its own integration design.

11. **Multi-location invocation formal spec** — the 2×2 invocation matrix is documented, but the formal contract of what each invocation combination passes and receives is deferred to Phase A implementation. Mostly mechanical but may surface coupling issues during real integration.

12. **When does `/intuit` DECLINE gracefully vs trigger a retry?** — the discipline has 4 decline conditions; some might benefit from retry (overfit abstraction → retry with broadening hint is already specced). Other conditions (no corpus matches) are terminal. The retry/decline taxonomy may need refinement during implementation.
