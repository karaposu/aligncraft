# Innovation: Intuition as a Thinking Discipline

## User Input
devdocs/inquiries/intuition_as_discipline/

---

## Seed

Write a discipline spec for `/intuit` at the quality level of /explore and /sense-making, with the architecture already LOCKED by sensemaking (three-step transform, CBR+SME grounding, scale-adaptive, multi-location, REFINES prior finding). Open territory is detail-level: what sharpens P3 (abstraction prompt), P4 (divergent-mode scan), P5 (Alignment + Projection prompt), P6 (output format), P8 (overfit/underfit mitigation), P12 (integration patterns)? Biggest failure risk: treating /intuit as "LLM-with-three-prompts" rather than a properly instrumented discipline with structural honesty.

---

## Mechanism Applications (7 × 3 = 21 candidates)

### 1. Lens Shifting (Framer)

**1a (generic):** View `/intuit` as a RAG-with-reasoning system — standard AI engineering pattern. Accurate background description.

**1b (focused):** View each `/intuit` call as a **scientific observation**. The abstraction is a hypothesis, corpus matches are evidence, projection is the conclusion, reliability is the confidence. Each call is a micro-experiment, calibrated retrospectively.

**1c (contrarian):** View `/intuit` not as producing HUNCHES but as producing **PROVOCATIONS** — seeds designed to destabilize the caller's current framing, not confirm it. Flip the default output purpose from "here's what this is like" to "here's what might be wrong about your current frame."

### 2. Combination (Generator)

**2a (generic):** Abstraction + LLM judge = standard abstraction+evaluation pipeline.

**2b (focused):** **SME Alignment + Popperian prediction schema + two-mode (convergent/divergent) scanning** → a unified output where each seed is simultaneously a recognition, a transfer, and a testable prediction. Three operations fused into one output type.

**2c (contrarian):** Combine `/intuit` with **the inquiry creation step itself** — every `_branch.md` automatically triggers an `/intuit` call before `/explore` runs, producing a baseline "what does this remind us of" artifact. Intuition becomes the system's ambient first response to every new question.

### 3. Inversion (Framer)

**3a (generic):** Instead of "LLM generates abstraction, then scans corpus," invert: corpus findings generate candidate abstractions; source text is matched against those abstractions. Retrieval-first, not generation-first.

**3b (focused):** Instead of "source → abstraction → match" (inductive), invert to **"source → hypothesis → extract abstraction from hypothesis → match against corpus"** (hypothetico-deductive). The source produces a candidate prediction directly; the abstraction is the RELATIONAL FORM of that prediction; the corpus scan tests the prediction. Makes the Popperian frame load-bearing at the abstraction step, not just at the output step.

*Depth check:* Invert again — instead of "system produces hypotheses," the discipline produces **PAIRS** of competing hypotheses (what if X? what if NOT X?) and the scan adjudicates. Component-level. Don't push further; system-level inversion ("hunch is joint human-system act") destabilizes the discipline itself.

**3c (contrarian):** Invert the DIRECTION — instead of `/intuit` producing seeds FOR the caller discipline to consume, the caller discipline **PROPOSES** candidate seeds and `/intuit` rates them against the corpus. `/intuit` becomes a VALIDATOR of the caller's intuitions, not a generator. Complements `/td-critique`'s prosecution/defense.

### 4. Constraint Manipulation (Framer)

**4a (generic):** Add constraint: every `/intuit` call must cite at least one specific finding path — no unsupported hunches.

**4b (focused):** Add constraint: **the abstraction must be articulable as a single relational claim with named predicates**. Not prose ("this is a calibration problem") but structured: `calibrates(Signal, Outcome) where Signal is probabilistic and Outcome is delayed`. Force structured relational abstractions, not prose abstractions. Enables reliable pattern-matching at scan time.

**4c (contrarian):** Remove the constraint "intuition must be corpus-grounded." Allow the LLM to draw on its training distribution when no corpus match exists, **EXPLICITLY LABELED** as `TRAINING_DISTRIBUTION_MATCH` vs `CORPUS_MATCH`. Honest about source; preserves utility in cold-start / edge cases.

### 5. Absence Recognition (Generator)

**5a (generic):** `/intuit` has no way to declare "intuition doesn't apply here" — e.g., for pure-computation queries where analogical reasoning isn't useful. Missing exit condition beyond INSUFFICIENT_INTUITION (which means "couldn't find match," not "intuition wasn't the right tool").

**5b (focused):** **No mechanism to store FAILED PROJECTIONS as corpus-boundary data.** When P5 finds a structural match but can't project it back (matched abstraction but no transferable consequences), that fact is informative — it names what the corpus CAN'T yet handle. Missing slot: failed projections logged as "corpus-limit seeds" for future inquiry prioritization.

**5c (contrarian):** **No adversarial-intuition slot.** `/intuit` as currently specced always produces AFFIRMING matches ("this is like prior X, therefore Y is likely"). But equally valuable: "this is like prior X, which FAILED — the failure pattern is likely to repeat." Negative-space intuition: prior failures as seeds. Not in current schema.

### 6. Domain Transfer (Generator)

**6a (generic):** Transfer from RAG systems — standard background.

**6b (focused):** Transfer from **chess opening books**. A chess player doesn't reason from scratch each game; they recognize positions from a learned book, with transferable plans attached to each position. AlignCraft analog: inquiry states are "positions"; prior inquiries form an "opening book"; transferable methodology moves attach to each book entry. The `/intuit` discipline is the lookup-and-transfer mechanism over this book.

**6c (contrarian):** Transfer from **differential diagnostic medicine**. Differential diagnosis produces a RANKED LIST of hypotheses with specific DISCRIMINATORS — "if A is the cause, we'd see X; if B is the cause, we'd see Y; the test that separates them is Z." Reframes `/intuit`'s output: not flat seed list but ranked differential hypotheses with discriminators that the next discipline step uses to narrow. Substantially more actionable than flat seeds.

### 7. Extrapolation (Generator)

**7a (generic):** At 10x corpus growth, finding-level scan becomes insufficient; chunk-level migration needed. Already in prior finding.

**7b (focused):** **If `/intuit` becomes reliably calibrated, it will want to be called EARLIER in the pipeline.** Extrapolate: intuition moves from "optional between-discipline call" to "automatic first step on every new inquiry" (pipeline becomes I → E → S → D → I → C, where the leading I is `/intuit` at branch creation). Front-loaded recognition.

**7c (contrarian):** If LLMs continue to improve, the distinction between "intuition" (recognition from corpus) and "innovation" (generation from mechanisms) weakens — both become "generate-with-rationale." The discipline may not be long-term stable; it may collapse INTO an enhanced `/innovate`. Future-proofing: design `/intuit` so that absorption into `/innovate` is possible without breaking calibration records.

---

## Convergence Analysis

Four independent convergences — robustness-tested survivors:

**Convergence 1: Structured relational abstractions, not prose.**
Mechanisms: 4b (constraint-add), 3b (Popperian hypothesis with relational form), 6b (chess-opening position as structured state).
→ The abstraction step produces a claim with named predicates — `calibrates(Signal, Outcome)`, `drift_detects(System, Baseline, Symptoms)`, etc. — not a prose summary. Scan quality depends on this; prose abstractions are where noise enters.

**Convergence 2: Differential / ranked-hypothesis output with discriminators.**
Mechanisms: 6c (diagnostic medicine), 1b (scientific observation), 3c (validator role).
→ `/intuit`'s output is not a flat seed list but a ranked list of hypotheses with DISCRIMINATORS — what each hypothesis predicts differently, so the caller's next step can select. This makes seeds actionable at the moment of receipt rather than requiring caller interpretation.

**Convergence 3: Honesty about source + purpose.**
Mechanisms: 4c (labeled training-distribution), 5a (intuition-not-applicable), 5c (adversarial/negative-space intuition), 1c (provocations not confirmations).
→ The discipline needs MORE than binary POSITIVE/NEGATIVE/INSUFFICIENT states. Honest categorization of WHERE the intuition came from (corpus-grounded vs training-distribution) and WHAT IT MEANS (affirming match vs contradicting/failure-pattern match vs not-applicable) prevents the discipline from producing confident garbage.

**Convergence 4: Pipeline-early invocation and book-like integration.**
Mechanisms: 2c (auto-trigger at inquiry creation), 7b (front-loaded in pipeline), 6b (opening book).
→ `/intuit` wants to be called EARLIER, and the mental model that fits is a "book of prior positions." Integration pattern: every inquiry gets an automatic ambient `/intuit` baseline before discipline work begins; callers look up transferable moves like a chess player consults an opening book.

---

## Key Innovations

### 1. Structured relational abstractions (Convergence 1) — KEYSTONE REFINEMENT for P3

P3's abstraction prompt requires output in RELATIONAL FORM, not prose. Schema:

```
abstraction: {
  claim: "<predicate>(<typed-argument>, <typed-argument>, ...)"
  example: "calibrates(Signal, Outcome) where Signal is probabilistic, Outcome is delayed"
  surface_stripped: [list of surface details deliberately NOT in the claim]
}
```

Benefits: scan-time matching becomes comparison of claims with same predicate structure; prose fuzziness is eliminated; overfit/underfit abstractions (P8 failure modes) are detectable (claim too specific with rare predicate = overfit; claim too generic with common predicate = underfit).

### 2. Differential-hypothesis output (Convergence 2) — REFINEMENT for P6 schema

Output is not N independent seeds but a RANKED DIFFERENTIAL:

```yaml
differential:
  - rank: 1
    hypothesis: "<prediction about source>"
    load_bearing_match: <finding_path>
    supporting_projection: "<why this hypothesis projects back to source>"
    reliability: <0-1>
    discriminator: "<what observation would favor this hypothesis over rank-2>"
    observable_outcome: "<specific L2 signal>"
    prediction_window: "<T1 / T2+ / T4>"
    hunch_state: POSITIVE | NEGATIVE | INSUFFICIENT_HUNCH
    source_type: CORPUS_MATCH | TRAINING_DISTRIBUTION_MATCH | ADVERSARIAL_MATCH
    mode: CONVERGENT | DIVERGENT
```

The **discriminator** field is load-bearing: it names what the caller should check to decide between top-N hypotheses. Turns `/intuit`'s output from advisory into directive — callers know exactly what to examine next.

### 3. Honest source labeling (Convergence 3) — REFINEMENT for P8 and P6

Extend the schema's state field beyond POSITIVE/NEGATIVE/INSUFFICIENT_HUNCH:

- `source_type`: **CORPUS_MATCH** (grounded in AlignCraft corpus) / **TRAINING_DISTRIBUTION_MATCH** (LLM's training knowledge, no corpus finding) / **ADVERSARIAL_MATCH** (matches a prior FAILURE pattern, predicts repetition of failure) / **NOT_APPLICABLE** (intuition isn't the right tool for this source — pure computation, direct verification, etc.)
- `hunch_state` unchanged: POSITIVE / NEGATIVE / INSUFFICIENT_HUNCH

The combination lets downstream systems treat each source_type differently — CORPUS_MATCH feeds calibration directly; TRAINING_DISTRIBUTION_MATCH flagged for lower automatic trust; ADVERSARIAL_MATCH consumed as risk signal, not opportunity; NOT_APPLICABLE short-circuits to "skip intuition, run discipline normally."

### 4. Adversarial / failure-pattern intuition slot (5c) — NEW feature for P4 scan + P6 output

Scan explicitly searches for FAILURE patterns in the corpus — prior findings that got superseded, prior inquiries that failed to converge, prior hypotheses that were falsified. A match against a failure pattern means the source is LIKELY TO REPEAT THAT FAILURE. This intuition is distinct from affirming match intuitions and appears in output as `source_type: ADVERSARIAL_MATCH`.

Without this, the discipline systematically misses negative-space intuition — the most valuable kind in some cases (preventing repeat mistakes).

### 5. Pipeline-early auto-invocation + opening-book framing (Convergence 4) — ADDITION to P12

New integration pattern: `/MVL+` at inquiry creation automatically runs `/intuit` on the new `_branch.md`, producing `intuition.md` BEFORE `/explore`. The user reviews the baseline intuition; `/explore` operates with those seeds pre-loaded as attention anchors.

Mental model for users: each inquiry is a "position"; the corpus is an "opening book" of prior positions with transferable moves attached. Intuition is the lookup step — finding which book entries fit this position. Natural, memorable, implementable.

### 6. Failed-projection storage as corpus-limit data (5b) — REFINEMENT for P6 + P11

When P5's projection fails (structural match exists; no transferable consequence projects back), log the failed projection as a `corpus_limit_seed`. These are not thrown away as INSUFFICIENT_INTUITION; they are recorded as evidence that the corpus has a pattern it cannot yet resolve. Over time, concentration of corpus_limit_seeds around a topic suggests "this is an inquiry worth starting."

### 7. Hypothesis-first inversion (3b focused) — REFINEMENT for P2 + P3 sub-step order

Instead of abstraction-then-hypothesis, invert: the LLM produces a CANDIDATE HYPOTHESIS about the source first ("this inquiry will likely supersede prior X," "this spec change will likely produce Y regression"), then EXTRACTS the relational abstraction FROM the hypothesis, then scans the corpus to TEST the hypothesis.

Makes the Popperian frame load-bearing from step 1. Output becomes "tested hypothesis with corpus evidence," not "matched finding with inferred projection." Stronger epistemic posture.

### 8. Validator invocation mode (3c contrarian) — NEW invocation variant for P7

Add a fourth cell to the 2×2 matrix: `/intuit` invoked in VALIDATOR mode, where the caller passes a proposed hypothesis and `/intuit` rates it against the corpus rather than generating its own. Useful for `/td-critique` prosecution/defense — the critique supplies the "this candidate is like prior success X" or "is like prior failure Y" claim and `/intuit` confirms or refutes with corpus evidence.

---

## Assembly

```
REFINED MVP (convergence-assembled):

P3 Forward Transform:
  - Output is STRUCTURED RELATIONAL CLAIM (predicate + typed args)
  - Multi-sample consensus on predicate choice
  - Quality gate: predicate must be non-trivial; args must be typed
  - Hypothesis-first variant: generate candidate hypothesis, then abstract

P4 Scan (enriched):
  - Convergent mode: same predicate + similar args + similar surface
  - Divergent mode: same predicate + similar args + DIFFERENT surface (the "angle-match")
  - ADVERSARIAL mode (new): scan for matching predicates where the matched finding got SUPERSEDED/FAILED
  - Scan prompt references corpus abstractions (pre-computed per P6b-equivalent) + corpus _state.md for SUPERSEDED BY

P5 Projection (enriched):
  - Alignment: identify which args map source → match
  - Projection: transfer consequences from match to source context
  - On projection failure: store as corpus_limit_seed
  - Output: differential-ranked hypotheses with discriminators

P6 Output Schema (refined):
  - Differential-ranked list (not flat seeds)
  - Per-hypothesis: hypothesis, load_bearing_match, projection, reliability,
    DISCRIMINATOR, observable_outcome, prediction_window, hunch_state,
    source_type (CORPUS/TRAINING_DIST/ADVERSARIAL/NOT_APPLICABLE), mode
  - Separate bucket for corpus_limit_seeds (failed projections)
  - INSUFFICIENT_INTUITION preserved as explicit state

P7 Input Surface (extended):
  - 2×2 matrix: (standalone vs embedded) × (source-first vs inquiry-state-first)
  - PLUS validator mode (5th cell, 2.5D matrix): caller supplies hypothesis;
    /intuit rates

P8 Failure + Decline (enriched):
  - 6 inherited transform failure modes
  - Overfit abstraction detection: predicate is novel/rare across corpus → retry P3
  - Underfit abstraction detection: predicate matches majority of corpus → retry P3
  - 4 decline conditions + NOT_APPLICABLE as a 5th distinct state
  - corpus_limit_seeds surfaced as reporting output, not suppressed

P12 Integration (enriched):
  - Pipeline-early auto-invocation: /MVL+ runs /intuit at inquiry creation;
    intuition.md produced before /explore; user reviews baseline
  - Opening-book mental model documented
  - /innovate integration: seeds feed mechanism generators (especially
    Domain Transfer and Combination)
  - /td-critique integration: prosecution + defense request validator-mode
    /intuit calls with their own hypotheses
  - ADVERSARIAL_MATCH seeds flagged prominently in all integrations

P2 Process Model (refined):
  - 7 steps: Prepare input → Generate candidate hypothesis (new) →
    Extract relational abstraction → Mode selection → Scan (convergent +
    divergent + adversarial) → Projection with differential ranking →
    Produce output / decline
```

**Emergent value:** `/intuit` becomes a PROPER COGNITIVE DISCIPLINE with structural honesty — not a retrieval-and-summarize toy. It produces structured relational claims with discriminators that shape next-step work; handles corpus vs training-distribution sources honestly; offers adversarial and failure-pattern slots; integrates as pipeline-wide capability with a clean mental model (opening book); and has five distinct state buckets (POSITIVE / NEGATIVE / INSUFFICIENT_HUNCH corpus match / corpus_limit_seed / NOT_APPLICABLE) giving it the signal honesty the prior inquiries demanded. The assembly produces a discipline that is more CALIBRATABLE than the sensemaking baseline because every output has a discriminator and every decline has a reason.

---

## Verdicts

### SURVIVE (MVP)

- **Structured relational abstractions** (C1) — keystone refinement for P3
- **Differential-hypothesis output with discriminators** (C2) — keystone refinement for P6
- **Honest source-type labeling** (C3) — refinement for P6/P8 (CORPUS / TRAINING_DIST / ADVERSARIAL / NOT_APPLICABLE)
- **Adversarial/failure-pattern scan mode** (5c) — new mode in P4; new source_type
- **Pipeline-early auto-invocation + opening-book framing** (C4) — new integration pattern in P12
- **Failed-projection as corpus-limit data** (5b) — refinement for P6 + P11
- **Hypothesis-first inversion** (3b focused) — refinement for P2 step order
- **Validator invocation mode** (3c) — new cell in P7 input surface

### REFINE (deferred — candidates but not MVP)

- **Training-distribution-labeled hunches** (4c) — useful for cold-start but dilutes corpus-grounded principle; adopt ONLY if the honest labeling (Convergence 3) works in practice without eroding trust. Revisit after P11 calibration shows the labeling is respected.
- **Chunk-level granularity migration** (7a) — already in prior finding's scale-adaptive spec; no MVP action needed
- **Auto-trigger on every MVL+ creation** — the pipeline-early invocation may be too aggressive at first; offer as opt-in for early use, default-on later

### KILL

- **RAG as lead framing** (1a, 2a, 6a) — not killed, demoted from novelty to background tech. The discipline is NOT a RAG system; it is a cognitive discipline that uses RAG-like retrieval as one implementation detail. (Seed preserved: the retrieval mechanism itself is standard; novelty is in WHAT we retrieve, HOW we scan it (modes + adversarial), HOW we project (SME Alignment + Projection), and the Popperian differential output.)
- **Innovation-intuition merger** (7c) — premature future-proofing. The distinction today is architecturally load-bearing (intuition is corpus-grounded recognition; innovation is mechanism-driven generation). If LLMs collapse the distinction in 3-5 years, revisit. Designing for that future now destabilizes the present spec. (Seed preserved: keep the discipline spec clean enough that absorption is possible later without data migration.)
- **Depth-2 inversion (human-rated hypotheses)** (3b depth check) — too invasive; Level 3+ concern; MVP is system-autonomous. (Seed preserved: P11 calibration against L2 outcomes is the substitute for human rating.)
- **Remove corpus constraint entirely** (pure 4c without labeling) — killed. Without honest source labeling, unrestricted LLM-memory hunches erode the discipline's calibration basis. The labeled REFINE version preserves the value; the unlabeled version does not. (Seed: the training-distribution vs corpus distinction MUST be labeled if admitted at all.)

---

## Mechanism Coverage

- **Generators applied:** 4/4 (Combination, Absence Recognition, Domain Transfer, Extrapolation all produced load-bearing survivors)
- **Framers applied:** 3/3 (Lens Shifting, Constraint Manipulation, Inversion all produced load-bearing survivors)
- **Convergence:** YES — 4 independent convergences identified (structured abstractions, differential output, honest source labeling, pipeline-early opening-book integration)
- **Survivors tested:** 8 MVP survivors, each tested against novelty / scrutiny / fertility / actionability / mechanism-independence (see Reasoning section of upcoming finding; critique will formalize)
- **Failure modes observed:** None. The assembly is integrative, not premature. Kills have extracted seeds.
- **Overall: PROCEED** — sufficient coverage + convergence + tested survivors + assembly produces emergent value not in any individual innovation

---

## Innovation-Level Changes to Decomposition (for Critique to validate)

Structural additions/changes to the discipline spec beyond what sensemaking locked:

- **P2 step order REVISED:** hypothesis-first inversion places "generate candidate hypothesis" before "extract relational abstraction" (7 steps → 8, with new step inserted)
- **P3 output format CONSTRAINED:** relational-claim form with typed predicates, not prose
- **P4 MODE EXTENDED:** adversarial/failure-pattern mode added alongside convergent + divergent (3 modes, not 2)
- **P6 OUTPUT RESHAPED:** differential-ranked hypotheses with discriminators (not flat seed list); 12-13 fields per hypothesis (not 11); corpus_limit_seeds as separate bucket; source_type field with 4 values
- **P7 INPUT SURFACE EXTENDED:** validator invocation mode added (5th cell beyond 2×2 matrix)
- **P8 STATES EXTENDED:** NOT_APPLICABLE as a 5th state distinct from INSUFFICIENT_INTUITION
- **P12 INTEGRATION EXTENDED:** pipeline-early auto-invocation added; opening-book mental model documented
- **P11 CALIBRATION ENRICHED:** corpus_limit_seeds fed back as corpus-boundary evidence

Critique should test especially:
- Does structured-relational-abstraction form actually work reliably via LLM prompt, or do LLMs drift back to prose?
- Does the discriminator field in differential output produce actionable next-step guidance, or generic observations?
- Do source-type labels (especially ADVERSARIAL vs CORPUS) produce reliably distinguishable outputs, or do they blur?
- Is pipeline-early auto-invocation valuable enough to justify a mandatory step, or does it produce noise on most inquiries?
- Is validator mode worth the spec complexity, or does it duplicate what the caller could do with a direct LLM call?
