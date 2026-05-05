# Exploration: Intuition as a Thinking Discipline

## User Input
devdocs/inquiries/intuition_as_discipline/_branch.md

---

## Mode and Entry

**Mode:** Possibility exploration (hybrid with artifact) — the territory is mostly conceptual (how to architect a transform-space intuition discipline), but it has concrete artifact anchors: existing AlignCraft discipline specs (the reference quality bar) and well-developed AI/cognitive-science fields (Case-Based Reasoning, Structure-Mapping Engine, transform techniques from signal processing).

**Entry:** Signal-first — the user supplied a strong anchor (Z-transform as architectural template), a specific architectural claim (intuition = first-class discipline, not infrastructure), and a load-bearing hypothesis (embeddings may be demotable from substrate to optional tool). Start by probing the transform pattern; scan outward.

---

## Cycle 1 — Coarse Scan (Unweighted)

Surface-level inventory of the territory's major regions.

| Region | What lives here | First-pass note |
|---|---|---|
| **R1: Mathematical transform techniques (the template)** | Z-transform, Laplace, Fourier, Wavelet, Radon; pattern = forward / operate / inverse | Three-step pattern is genuinely universal across transforms; domain lift is the unifying move |
| **R2: Existing AlignCraft discipline specs** | `/explore` (7-step scan-signal-probe), `/sense-making` (SV construction), `/decompose` (7-step coupling/boundaries), `/innovate` (mechanism × seed), `/td-critique` (dimension × prosecution × defense) | Reference quality bar. Each has: explicit inputs, process model (numbered), failure modes (6–7 named), coverage/convergence criteria |
| **R3: Case-Based Reasoning (CBR)** | Retrieve → reuse → revise → retain; literally the user's proposed pattern with different vocabulary | Mature AI field (30+ years). Known challenges: indexing, adaptation, maintenance. Direct precedent. |
| **R4: Structure-Mapping Engine (SME) / analogical reasoning** | Gentner's formal model: predicates + mappings + alignment + transfer | Formalized analogical reasoning; explicitly includes the inverse-transform (mapping back) step |
| **R5: Chain-of-Thought and reasoning scaffolds** | CoT, Self-Ask, Tree-of-Thoughts, Reflexion, Least-to-Most | Operates by rephrasing / decomposing — same "transform to easier space" pattern, but implicit not explicit |
| **R6: Embedding-alternative retrieval** | BM25 (keyword), LLM-as-retriever, MCTS-based search, keyword-extraction retrieval, long-context direct-read | Direct alternatives to embedding similarity — relevant for the "embeddings optional" claim |
| **R7: Long-context LLMs** | Modern models: 200k–2M tokens; can fit full corpora at current AlignCraft scale | Changes the cost calculus — "read everything each time" becomes feasible for small corpora |
| **R8: Schema induction / abstraction in ML** | Prompt-based abstraction, schema learning, meta-prompting | How LLMs reliably produce abstractions; known limits on consistency |
| **R9: Discipline integration patterns in AlignCraft** | How /innovate reads /sense-making, how /td-critique reads /innovate — file-based handoff via inquiry folder | Reference for how /intuit would integrate with other disciplines |
| **R10: The prior finding (thinking_space_dynamics)** | Three-layer architecture; P6/P7 as mechanism; Phase 1 substrate | The predecessor being potentially refined |
| **R11: Failure modes of transform approaches** | Aliasing (multiple sources → same transform), inverse-transform mismatch, boundary effects, information loss during transform | Transform techniques have known failure modes; intuition-discipline will inherit them |
| **R12: AlignCraft corpus characteristics** | ~20 findings now, each ~5k tokens; grows linearly with inquiries; single-user system | Scale context — determines which approaches are buildable now |
| **R13: The embedding-necessity question** | Embeddings add: deterministic retrieval, cross-query comparability, cheap repeated queries, persistent geometric space | Enumerates what's LOST if embeddings are dropped |
| **R14: Cognitive science of intuition** | Dual-process theory, fluency heuristic, analogical transfer, expertise chunking | Empirical anchors for what the discipline must approximate |
| **R15: Confirmed absent — a general formal theory of "intuition as discipline"** | — | No existing discipline spec for "intuit" in AlignCraft or (to my knowledge) in any methodology literature |

### Scan signals (what stands out)

- **Density spike at R3 ∩ R4:** Case-Based Reasoning + Structure-Mapping Engine form a dense cluster. These are the direct intellectual precedents for what the user is proposing. The user may not know the names, but the architecture is well-explored.
- **Novelty at R1 → R11:** mapping the transform-technique pattern TO an LLM-powered cognitive discipline is genuinely novel framing. The pattern itself is borrowed; the application is new.
- **Tension at R6 ∩ R7 vs R13:** long-context models + LLM-as-retriever make embedding-free operation feasible at current scale; but R13's list of what embeddings add isn't nothing. The tradeoff is real, not a clean win for the user's position.
- **Absence at R15:** no prior discipline spec exists for this. AlignCraft's other disciplines have decades of meta-methodology roots (exploration ← research design; sensemaking ← Weick's org theory; critique ← epistemology; innovation ← creativity research). Intuition does NOT have a comparable meta-methodology. This is unusual — suggests the discipline needs to invent its structural spec, not just adapt one.
- **Relevance at R2:** the quality bar is explicit and measurable. The existing disciplines show what "discipline" means structurally: numbered process model, named failure modes, convergence criteria, clear I/O.

---

## Cycle 2 — Resolution Decision + Targeted Probes

Zoom in. High-importance / low-confidence regions: R3/R4 (direct precedents), R2 (quality bar), R11 (failure modes the framing inherits), R13 (the embedding tradeoff), R1 (the template's actual structure).

### Probe 1 (R3 + R4) — CBR and SME as direct precedent

**Case-Based Reasoning four-step cycle (Aamodt & Plaza, 1994):**
1. **Retrieve** — find cases in the case base most similar to the current problem
2. **Reuse** — map the solution of the retrieved case to the current problem
3. **Revise** — evaluate and adapt the mapped solution
4. **Retain** — store the new solution as a new case for future use

**The user's proposed discipline mapped onto CBR:**
- Source text + forward-transform (abstraction) = **indexed query** in CBR terms
- Corpus scan for matches = **Retrieve**
- Transferable parts = **Reuse + Revise**
- (Implicit) storing the new finding as a case = **Retain**

The user is proposing CBR with two specific architectural choices: (a) abstraction as the indexing representation rather than raw-feature similarity, (b) LLM-driven transform and retrieval rather than algorithmic matching.

**Structure-Mapping Engine (SME) formalizes the mapping step:**
1. **Alignment** — find mappings between source relations and target relations
2. **Projection** — transfer inferences from source to target based on alignment
3. **Evaluation** — rate candidate mappings by structural systematicity

**Depth finding:** The user's proposal has strong, well-developed intellectual precedent. This is useful — it means known failure modes are documented, and adapting existing patterns is cheaper than inventing from scratch. It's also a discipline constraint — if the user's proposal fails to account for what CBR/SME already know, it's naive.

**Direct implication:** the discipline spec should explicitly borrow from CBR's Retain step (what happens to the result of an /intuit call — does it become a case in the base?) and SME's Alignment → Projection distinction (the inverse-transform isn't one step; it's two: align structures, then project the transferable part).

### Probe 2 (R2) — What a discipline spec requires structurally

Looking at existing specs in AlignCraft (as loaded in the system-reminder at the top of this session's work):

| Spec component | Example (from /explore) | /intuit must provide |
|---|---|---|
| Definition ("what X IS") | "mapping unknown territory through..." | "transforming source into abstraction space, identifying seeds, inverse-transforming back" |
| Distinguishing from neighbors | "Exploration is not sensemaking, innovation, research, browsing" | "Intuition is not retrieval, is not innovation, is not sensemaking, is not random brainstorming" |
| Core operation(s) | "Scan-signal-probe cycles at managed resolution" | "Forward transform → operate in abstraction space → inverse transform" |
| Modes (if applicable) | "Artifact vs Possibility" | Possibly: "Convergent intuition (match known patterns) vs Divergent intuition (generate unprecedented transfers)" |
| Key components | "Scan, Signal Detection, Probe, Resolution, Frontier, Confidence" (6) | TBD — abstraction, seed detection, transfer, calibration? |
| Process model | "7-step cycle, iterative" | TBD — must be numbered, testable per step |
| Entry points | "Frontier-first, Signal-first" | TBD — "Source-first" vs "Corpus-first"? |
| Coverage/convergence criteria | "Frontier stability + declining discovery + bounded gaps" | TBD — what makes intuition "complete enough"? |
| Failure modes | 6 named (Premature depth, Surface-only, etc.) | TBD — must be specific to transform-space mechanism |

**Depth finding:** /intuit has many spec slots currently empty. The user's proposal supplies the core operation and the three-step process skeleton. It does NOT yet supply: distinguishing definition, modes, convergence criteria, failure modes, entry points. These are ALL downstream discipline work for this inquiry.

### Probe 3 (R11 + R1) — Transform-technique failure modes that intuition-as-discipline inherits

Mathematical transforms have known failure modes. Each has an intuition-discipline analog.

| Transform failure | Mathematical form | Intuition-discipline analog |
|---|---|---|
| **Aliasing** | Multiple source signals map to the same transform (Nyquist violation in Fourier) | Multiple distinct source problems abstract to the same string → false structural matches across unrelated problems |
| **Inverse-transform mismatch / information loss** | Not every transform is exactly invertible; some information lost in forward direction | Abstraction discards surface; the "transferable part" may no longer fit when brought back |
| **Boundary effects / edge artifacts** | Finite-window transforms produce distortion at boundaries | Abstracting a finding out of context of its inquiry-folder produces a decontextualized seed that doesn't reconnect |
| **Domain mismatch** | Z-transform assumes discrete-time; using it on continuous data is category error | Abstracting a finding but scanning a corpus of different-character findings (e.g., abstracting a methodology and scanning code artifacts) produces noise |
| **Overfit abstraction** | Transform parameters tuned to specific input don't generalize | The LLM produces an abstraction so specific to the source that no corpus match exists — false negatives |
| **Underfit abstraction** | Transform too broad; loses all discrimination | The LLM produces an abstraction so generic ("this is about AI methodology") that everything matches — false positives |

**Depth finding:** The transform-technique framing gives us a READY-MADE TAXONOMY of failure modes. These are not speculative concerns; they are predictable structural problems the discipline will face. Discipline spec MUST name them and provide mitigation.

### Probe 4 (R13) — What embeddings actually provide that LLM-direct loses

Critical probe for the user's load-bearing claim. What's at stake:

| Property | Embeddings provide | LLM-direct loses |
|---|---|---|
| **Deterministic retrieval** | Same query → same top-K | Same query → potentially different top-K across calls (esp. at temperature > 0) |
| **Cross-query comparability** | Distance(A, B) is a measurable number | LLM judgments are comparative but not scalar; you can't say "B is 0.73 similar, C is 0.82 similar" reliably |
| **Sub-millisecond repeated queries** | Once embedded, similarity = one multiplication | Every query is a full LLM call |
| **Persistent geometric substrate** | Findings exist as points in a space; clusters, trajectories, drift measurable over time | No persistent substrate; each query is fresh |
| **Scale** | Linear in corpus size, fast | Linear in corpus size, slow; context-window limited |
| **Zero-content operation** | Embeddings can compare findings without reading them | Every comparison requires reading both |

| Property | LLM-direct provides | Embeddings lose |
|---|---|---|
| **Native structural reasoning** | LLM can articulate WHY two findings match | Embedding similarity is a number; no reasoning |
| **Abstraction generation on-the-fly** | Can produce an abstraction per-query tailored to the question | Pre-computed abstractions are fixed; may not match the specific query's intent |
| **Multi-hop reasoning** | LLM can chain: "this is like X, which suggests Y" | Embeddings don't chain |
| **Handling of novel patterns** | LLM can recognize structure it wasn't trained on via in-context reasoning | Embeddings encode what the embedding model learned; novel structures underrepresented |

**Depth finding:** NEITHER ALONE IS SUFFICIENT. The honest answer to "do we need embeddings?" is: it depends on what the discipline needs to do.

- If `/intuit` is called rarely, on single sources, with small corpora → LLM-direct works, embeddings are overhead
- If `/intuit` is called frequently, used for calibration over time, needs cross-query comparability → embeddings earn their weight
- If `/intuit` needs to support Baldwin-cycle calibration (tracking hunch accuracy over time) → deterministic retrieval matters → embeddings are load-bearing

The discipline spec must name WHICH use case it is optimizing for. The user's "cost is negligible" argument applies to the rare-call case; it does not automatically apply to the calibration case.

### Probe 5 (R7) — Long-context feasibility at current scale

Corpus: ~20 findings × ~5k tokens = ~100k tokens. Fits in Claude Opus 4.7 (1M context), GPT-4o (128k), Gemini 1.5 (1M+). Fully feasible to dump the entire corpus into context for a single /intuit call.

Cost at scale:
- At N=20 findings: 100k tokens × 1 call = trivial at current discount
- At N=50 findings: 250k tokens × 1 call = still feasible, minutes per call
- At N=200 findings: 1M tokens × 1 call = at context-window ceiling; expensive even discounted
- At N=1000+ findings: infeasible without chunking/retrieval

**Depth finding:** The user's "cost is negligible" claim has a clear scale horizon. For current and near-term corpus size, embedding-free operation is feasible. For the growth trajectory the Baldwin cycle implies (many inquiries over years), long-context direct-read eventually fails. The discipline spec should NOT be brittle to this transition — it should work both ways, with embeddings as an OPTIONAL SCALING LAYER that turns on when the corpus exceeds a threshold.

---

## Cycle 3 — Possibility Space (Discipline Architecture Candidates)

Enumerate possible discipline architectures. Coverage before novelty.

### Candidate discipline architectures

| # | Candidate | Core approach | Buildable now? |
|---|---|---|---|
| A1 | **Pure transform discipline (LLM-direct)** | One LLM call: forward-transform source, scan corpus in-context, produce inverse-transformed seeds. No embeddings, no pre-computation. | Yes, at current corpus scale |
| A2 | **Pure transform with pre-computed abstractions** | Abstractions are pre-computed per finding (P6b from prior); forward-transform done per-query; corpus scanned via LLM reading pre-computed abstractions | Yes |
| A3 | **Hybrid: embedding pre-filter + LLM transform on shortlist** | Embedding similarity filters corpus to top-K candidates; LLM does transform-scan-transfer on shortlist only | Yes |
| A4 | **Iterative transform (multi-level abstraction)** | First abstraction at "what problem is this?"; second at "what pattern-class?"; third at "what primitive cognitive move?". Each level scanned | Yes; higher cost |
| A5 | **Tree-search transform** | Generate N abstractions from source, scan each against corpus, merge seeds with de-duplication | Yes |
| A6 | **Dialogic transform** | Two LLM calls: first articulates abstraction; second critiques the abstraction; third scans with refined abstraction | Yes |
| A7 | **Transform with explicit alignment + projection (SME-style)** | Three sub-steps: abstract source, find structural mappings to corpus findings, project transferable parts with justification | Yes |
| A8 | **Transform with calibration slot** | Each intuition seed produced includes a Popperian prediction + observable outcome link (carries prior finding's schema) | Yes; requires P10-style record |
| A9 | **Transform as embedded operation (called by other disciplines)** | /intuit is not a user-invoked command but a callable subroutine; /innovate or /td-critique invoke it internally | Yes; process integration choice |
| A10 | **Transform as first-class discipline (user-invokable)** | /intuit runs standalone like /explore or /innovate; produces an `intuition.md` artifact | Yes |
| A11 | **Scan-first variant** | Instead of "source → abstraction → scan", invert: "corpus abstractions are pre-computed; source's abstraction is matched against the pre-computed set"; same architecture as A2 but framed retrieval-side | Yes |
| A12 | **Two-mode: convergent + divergent intuition** | Convergent mode: find PATTERN-MATCHES (this source looks like these prior cases). Divergent mode: find STRUCTURAL ANALOGIES ACROSS UNLIKE DOMAINS (the user's "angle-match" case) | Yes |
| A13 | **Transform with retention (CBR's 4th step)** | After intuition produces a result, store the result as a new case in the corpus for future retrieval | Yes; infrastructure question |
| A14 | **Scale-adaptive discipline** | At small N, use A1 (LLM-direct). At N > threshold, switch to A3 (hybrid with embedding pre-filter). The discipline spec is constant; the implementation scales | Yes; specification choice |
| A15 | **Transform without explicit abstraction (implicit reasoning)** | LLM reasons about source and corpus in single chain-of-thought without articulating abstraction string | Yes; fast; loses the artifact |

### Why these are the candidates

- A1 = the user's literal proposal; the "just LLM" baseline
- A2 = user's proposal + pre-compute optimization (prior finding's P6b)
- A3 = hybrid (prior finding's full architecture)
- A4–A7 = different ways to strengthen the transform step
- A8 = integration with prior finding's Popperian schema
- A9 vs A10 = the DISCIPLINE-OR-SUBROUTINE question, which is architectural
- A11 = symmetric framing (useful contrast)
- A12 = mode split
- A13 = CBR's Retain step — addresses what happens to intuition outputs over time
- A14 = resolution for the embedding-necessity question
- A15 = the minimum-discipline variant to test against

### Candidates deliberately mapped (not forgotten)

- **Formal SME implementation with typed predicates** — too wide for Level 0-2 MVP. Confirmed deferred.
- **Neural analogical reasoning models** — research-level; not buildable with current tooling.
- **Human-in-loop intuition elicitation** — valid but tangential to the "system-intrinsic" question the user is asking.

---

## Cycle 4 — Jump Scan

Deliberate scan in different directions to check for uncharted voids.

### Jump 1 — "What is the discipline's OUTPUT, concretely?"

The user's proposal specifies the process but not the output artifact clearly. For /explore the output is a structural map; for /innovate it's a candidate list with mechanism coverage. What is `intuition.md`?

Candidate output structures:
- **Seed list**: ordered list of intuition seeds, each with: source anchor, corpus match, transfer rationale, reliability, failure-mode check
- **Narrative intuition**: one paragraph "this reminds me of X, which suggests Y, with confidence Z" — more human-readable but harder to compose
- **Structured seed + narrative**: both; seeds for programmatic use, narrative for human review

**Finding:** output artifact structure is undefined in the user's proposal. Discipline spec must specify it. Recommendation: structured seed list with per-seed narrative reasoning.

### Jump 2 — "When does the discipline DECLINE to produce intuition?"

Every discipline needs a "refuse to speak" condition. /explore has "frontier closed, exploration complete." /td-critique has "no candidates — ITERATE." What is /intuit's?

- **Empty abstraction:** if forward-transform produces a meaningless or trivial abstraction, refuse
- **No corpus matches:** if scan finds zero relevant seeds above threshold, return INSUFFICIENT (from prior finding)
- **Contradictory seeds:** if scan finds seeds that contradict (e.g., one saying "this will succeed," another saying "this will fail"), surface the contradiction rather than collapsing to one verdict
- **Inverse-transform failure:** if found seeds don't have transferable parts (they match in abstraction but nothing applies back to source), report as "structural match without transfer" — honest partial answer

**Finding:** the discipline spec needs FOUR explicit decline conditions. Missing from the user's proposal. Addable.

### Jump 3 — Connection to the prior finding's three-layer architecture

Does this inquiry REPLACE thinking_space_dynamics's L3 mechanism, REFINE it, or SIT BESIDE it?

- **Replace:** L3 mechanism becomes /intuit discipline; prior P6/P7 schemas are retained in /intuit's output spec
- **Refine:** /intuit is an elaboration of P7 (hunch production) with cleaner architecture
- **Sit beside:** /intuit is one of TWO mechanisms for producing L3 signals (embedding-based + transform-based), both feed into same calibration

**Finding:** the three-layer architecture and L3 role stand regardless. What changes is the mechanism. The cleanest framing: /intuit discipline BECOMES the L3 mechanism, with the prior finding's Popperian schema preserved as the output format. Embeddings become an OPTIONAL scaling layer (Phase 5 in prior) not the foundational substrate (Phase 1 in prior).

### Jump 4 — What intuition IS NOT (boundary check)

Disciplines are defined partly by their neighbors. Intuition (as discipline) is not:

- Not **retrieval** (retrieval = find similar items; intuition = find similar items AND project transferable insights)
- Not **analogy** (analogy = source-target mapping; intuition = source-corpus mapping, broader)
- Not **innovation** (innovation generates new concepts; intuition surfaces recognitions — "this is like that")
- Not **sensemaking** (sensemaking converts ambiguity to understanding; intuition produces probabilistic signals from existing understanding)
- Not **LLM-as-judge** (judge = rate; intuition = recognize-and-transfer)
- Not **case-based reasoning** fully — CBR is a technical AI framework; intuition-as-discipline is methodology-layer

**Finding:** the distinguishing definition is: *a methodology-level discipline for recognition-and-transfer under uncertainty, producing probabilistic signals from corpus-pattern matches via an explicit transform-operate-inverse-transform pattern.*

### Jump 5 — Sequential vs parallel with existing disciplines

Where does /intuit fit in a workflow?

- **Before /sense-making:** intuition primes sensemaking with "here's what this reminds me of" anchors
- **Inside /innovate:** intuition generates seeds by recognizing analogous prior solutions
- **Inside /td-critique:** intuition produces hunches about which candidates are worth adversarial testing
- **After /td-critique:** intuition surfaces "this cycle's result reminds me of prior result X — is that a seed for next iteration?"
- **Standalone:** user invokes /intuit on any source text for its own sake

**Finding:** intuition is multi-locational. It can be invoked at multiple points in the SIC loop. This is unusual — most disciplines have a single canonical location. The discipline spec should explicitly support multi-location invocation, with per-location guidance.

---

## Frontier

**Advancing:**
- Direct precedents (CBR, SME) give mature architectural patterns to adapt rather than invent
- Discipline spec slots enumerated — many currently empty, clear where sensemaking/decomposition must fill in
- Failure-mode taxonomy inherited from transform techniques (aliasing, information loss, boundary effects, etc.) — specific and usable
- Embedding-necessity question probed concretely — both sides have real costs; discipline must be scale-adaptive
- Multi-location invocation pattern (intuition is callable from multiple disciplines) — architectural

**Stable:**
- Transform-technique pattern itself (forward/operate/inverse) is universal and borrowed cleanly
- Prior finding's three-layer architecture (L1/L3/L2) stands; mechanism inside L3 is what's under revision
- Popperian schema from prior finding carries forward as intuition's output format
- Reference quality bar (existing AlignCraft disciplines) is explicit and measurable

**Unexplored (deliberate deferral):**
- Formal SME predicate calculus implementation (too wide for MVP)
- Neural analogical reasoning models (research-level)
- Full intuition-to-spec-change Baldwin path (downstream; gated on calibration)
- Inter-inquiry intuition (/intuit called on active inquiry to surface prior finding connections) — valuable but second-order
- Real-time collaborative intuition (multi-user) — structurally inapplicable at single-user scale
- Which SPECIFIC SURVIVING candidate (A1–A15) is the MVP — decomposition/innovation territory

---

## Confidence Map

| Region | Confidence |
|---|---|
| Transform-technique pattern applies to intuition | Confirmed (user's proposal + pattern universality) |
| Case-Based Reasoning is direct precedent | Confirmed |
| Structure-Mapping Engine formalizes the mapping step | Confirmed |
| Existing AlignCraft discipline specs set the quality bar | Confirmed |
| /intuit spec has many empty slots (modes, convergence, failure modes specific to mechanism) | Confirmed |
| Transform failure modes are inheritable | Confirmed (aliasing, information loss, boundary effects, domain mismatch, overfit, underfit) |
| Embeddings are not strictly necessary at current corpus size | Confirmed |
| Embeddings provide scaling AND calibration-determinism properties that LLM-direct loses | Confirmed |
| Long-context LLMs make direct-read feasible at N≤~50 findings | Confirmed |
| Scale horizon exists where LLM-direct fails | Confirmed (N≥~200) |
| Three-layer architecture from prior finding stands | Confirmed |
| Intuition is a multi-location discipline (callable from multiple points) | Scanned |
| Output artifact structure undefined in user proposal | Confirmed absent |
| Decline conditions undefined in user proposal | Confirmed absent |
| Which specific candidate (A1–A15) wins | Unknown (downstream) |
| Operational definition of "transferable part of seed" | Unknown (partially addressed by SME's Alignment + Projection) |
| Abstraction quality control for this approach | Scanned (inherits multi-sample + human-review gate from prior) |
| Retention / learning-over-time mechanism | Scanned (CBR's Retain step; concrete mechanism TBD) |

---

## Gaps (for sensemaking)

1. **Output artifact structure** — what does `intuition.md` contain? Structured seed list? Narrative? Both?
2. **Decline conditions** — four explicit conditions identified; formalize
3. **The inverse-transform concretely** — "transferable parts of seeds" is vague; SME's Alignment→Projection gives a formal pattern; instantiate operationally
4. **Mode split** — convergent (pattern-matching) vs divergent (cross-domain structural analogy) intuition; are these one mode with parameters or two modes?
5. **Multi-location invocation pattern** — how does the discipline spec accommodate being called from multiple points in the SIC loop?
6. **Scale-adaptive specification** — how does the spec remain constant while implementation shifts from LLM-direct to hybrid at scale threshold?
7. **Relationship to prior finding** — REPLACE / REFINE / SIT-BESIDE question; sensemaking must resolve
8. **Retention mechanism** — after /intuit produces seeds, do they become cases in the corpus? If yes, with what metadata? If no, what happens to the accumulated intuition over time?
9. **Calibration integration** — how does the Popperian schema from prior finding get instantiated within /intuit's output?
10. **Entry points** — source-first vs corpus-first; and whether there's a hybrid (inquiry-state-first when invoked mid-SIC-loop)

---

## Saturation Indicators

- **Frontier stability:** STABLE — four cycles produced diminishing new structural features; jump scan (cycle 4) surfaced 5 extensions but no new regions
- **Discovery rate:** DECLINING — cycle 4's jumps produced clarifications (output artifact, decline conditions, multi-location, mode split) rather than new territory
- **Bounded gaps:** YES — all 10 gaps are adjacent to explored regions, not beyond them
- **Region coverage:** 15 regions scanned, 5 probed in depth (R3+R4 direct precedent, R2 quality bar, R11+R1 failure modes, R13 embedding tradeoff, R7 scale feasibility), 1 confirmed absent (prior discipline spec for intuition)
- **Candidate coverage:** 15 discipline-architecture candidates enumerated across the tradeoff space; obvious approaches (A1 pure LLM, A2 pre-computed, A3 hybrid) included alongside novel ones (A12 mode-split, A14 scale-adaptive, A8 calibration-integrated)

**Overall: sufficient coverage for sensemaking.** Central insight stable: the user's transform-space proposal has mature precedent (CBR + SME), inherits a ready-made failure-mode taxonomy from transforms, can be architected as a first-class discipline with specific empty-slots to fill, and resolves the embedding question not as yes/no but as scale-adaptive (LLM-direct for current corpus, embeddings as optional scaling layer). Sensemaking must resolve: output artifact, decline conditions, mode split, multi-location invocation, scale-adaptive spec structure, and precise relationship to prior finding.
