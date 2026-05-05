# Decomposition: Thinking-Space Dynamics

## User Input
devdocs/inquiries/thinking_space_dynamics/_branch.md

Sensemaking's SV6 (three-layer architecture with four co-constitutive primitives + missing continuous-state substrate) is the partition seed. Two deferred ambiguities from sensemaking are addressed here:
- Substrate granularity (inquiry / finding / chunk)
- Per-discipline hunch vs cross-cutting mechanism

---

## 1. Coupling Map

```
CLUSTER A: Geometric Substrate Layer (continuous state)
  ├─ P1: Embedding strategy + granularity decision [FOUNDATION]
  ├─ P2: Embedding store (index + refresh protocol)
  └─ P3: Surface-similarity query interface (cosine/dot product)

CLUSTER B: The Four Primitives (operational layer)
  ├─ P4: Attention (active-set representation)
  ├─ P5: Context (activation-state capture)
  └─ P6: Structural-analogy protocol [KEYSTONE — the hardest primitive]
  (Note: Focus and Intuition are NOT separate pieces — they are the
   ACT of querying the substrate using the primitives in P4/P5/P6.
   They live inside P7.)

CLUSTER C: Real-time Hunch Production (L3)
  ├─ P7: Hunch production mechanism (scaffolded judge call using B) [KEYSTONE]
  └─ P8: Hunch output format (structured slot in discipline telemetry)

CLUSTER D: Integration
  └─ P9: Discipline-level integration (cross-cutting substrate + per-discipline hunch call)

CLUSTER E: Calibration Loop (L2 → L3)
  └─ P10: Hunch-vs-outcome tracking (prediction records linked to retrospective L2 signals)

CLUSTER F: Prior-Finding Integration
  └─ P11: Update importance_measurement_problem finding to three-layer architecture

CLUSTER G: Validation
  └─ P12: Retrospective validation on corpus

Valleys (low coupling regions — natural cut points):
  A ─ B     (substrate vs operational primitives — substrate is agnostic to caller)
  B ─ C     (primitives vs hunch production — primitives are reusable; hunch is one user)
  C ─ D     (hunch production vs discipline integration — integration adapts C per discipline)
  core ─ E  (production vs calibration — E reads results, doesn't couple into production)
  core ─ F  (engineering vs prior-finding housekeeping)
  core ─ G  (engineering vs validation)

Shared utilities (flagged):
  - Embedding API client — used by A (P2, P3) and B (P6)
  - Retrieval protocol — used by A (P3) and B (P6)
  - Discipline telemetry block parser — used by C (P8), D (P9), and E (P10)
```

### Coupling confidence assessment

| Boundary | Confidence | Why |
|---|---|---|
| A ↔ B | HIGH | Substrate is caller-agnostic (embedding + query exposes a simple interface) |
| B ↔ C | HIGH | Primitives are reusable; hunch is one consumer |
| C ↔ D | MEDIUM | Integration adapts C per discipline — some coupling leakage if disciplines need custom hunch shapes |
| core ↔ E | HIGH | Calibration reads records; no write-back into production pipeline for MVP |
| core ↔ F | HIGH | Pure housekeeping — no functional coupling |
| core ↔ G | HIGH | Validation operates on corpus in isolation |

### Critical note on Focus and Intuition

The user named four primitives (attention, focus, intuition, context), but only THREE appear as decomposition pieces (P4 Attention, P5 Context, P6 Structural-analogy). Why?

**Focus and Intuition are not static components — they are the ACT of querying the substrate.**

- Focus = the selection act within attention → this IS the hunch production call (P7) choosing which candidate to evaluate deeply
- Intuition = the similarity/analogy query → this IS the query call itself (surface similarity via P3, structural similarity via P6)

Treating Focus/Intuition as separate pieces would create artificial boundaries cutting through what is actually one cognitive act. This is the sensemaking finding I3 (co-constitutive primitives) applied to decomposition: honor the coupling.

---

## 2. Question Tree (12 pieces)

### Cluster A — Geometric Substrate Layer

**P1: Embedding strategy + granularity decision** (FOUNDATION)
- What is embedded? Choice: inquiry_folder / finding / chunk (paragraph/section)
- MVP decision: **finding-level** (one embedding per finding.md + one per archived discipline output)
  - Reasoning: findings are the stable semantic units; chunk-level explodes cardinality; inquiry-level is too coarse to resolve specific hunches
- Embedding model: choose one stable provider (OpenAI text-embedding-3-large or equivalent); document as versioned dependency
- Verification: [ ] granularity documented [ ] embedding model chosen [ ] versioning plan written

**P2: Embedding store + refresh protocol**
- Storage: simple local file (JSON or SQLite) keyed by file path + content hash
- Refresh: re-embed when content hash changes; lazy refresh at query time acceptable for MVP
- No vector-DB dependency for MVP (the corpus size is small — findings count in dozens, not millions)
- Verification: [ ] store format specified [ ] refresh protocol specified [ ] corpus-size sanity check (MVP works until N=10³ findings)

**P3: Surface-similarity query interface**
- Input: query string (or query embedding)
- Output: top-K findings by cosine similarity with their similarity scores
- Simple dot-product / cosine; no fancy retrieval for MVP
- Verification: [ ] query interface specified [ ] top-K default chosen [ ] example queries produce plausible matches on existing corpus

### Cluster B — The Four Primitives (operational layer)

**P4: Attention (active-set representation)**
- What's "in attention" at a discipline invocation? Operational definition:
  - The inquiry being worked on (target)
  - Explicitly linked prior inquiries (via `_state.md` relationships)
  - Recent activity (last N inquiries touched — temporal attention)
  - Top-K surface-similar findings (from P3, query = current inquiry's branch question)
- Output: a concrete attention-set artifact (list of finding paths with why-each-is-included)
- Verification: [ ] active-set construction protocol specified [ ] example attention set produced for a real inquiry

**P5: Context (activation-state capture)**
- What shapes attention's relevance at this moment?
  - Current inquiry's branch question
  - Project-level specs in effect (CLAUDE.md, active disciplines, current phase)
  - User's current focus (the discipline being run, not the whole project)
- Output: a concrete context block passed alongside attention set
- Verification: [ ] context elements enumerated [ ] context block format specified

**P6: Structural-analogy protocol** [KEYSTONE — the non-trivial primitive]
- Purpose: catch the "same angle across unrelated surface domains" case — surface similarity is insufficient
- Mechanism: a TWO-STAGE scaffolded retrieval:
  1. **Abstraction stage:** LLM call prompted to articulate the RELATIONAL STRUCTURE of the current target (e.g., "this is a calibration-of-probabilistic-signal problem, regardless of the surface domain") — output is an abstraction string
  2. **Match stage:** embedding query on the abstraction string (not the raw content), retrieving findings whose abstractions (also pre-computed) are similar
- This requires: findings have PRE-COMPUTED abstraction strings alongside raw embeddings (P1/P2 store both)
- Verification: [ ] abstraction-stage prompt written [ ] match-stage query protocol specified [ ] example where surface-dissimilar but structurally-similar findings are correctly retrieved

### Cluster C — Real-time Hunch Production (L3)

**P7: Hunch production mechanism** [KEYSTONE]
- The cognitive act: given attention set + context + surface matches + structural analogies, produce a real-time value hunch
- Implementation: LLM-as-judge call with structured prompt:
  - Inputs: target (what's being hunched-about), attention set (P4), context (P5), surface matches (P3), structural analogies (P6)
  - Output: hunch with three components:
    - **Prediction:** directional claim (e.g., "this finding is likely high-value / likely low-value / likely to be superseded / likely to be built upon")
    - **Reliability estimate:** 0-1 confidence (must be HONEST, not always-high)
    - **Reasoning:** 1-2 sentences naming the load-bearing similarity/analogy
- Multi-sample option: run N times, aggregate as ensemble if variance matters
- Verification: [ ] prompt template written [ ] output schema defined [ ] hunch produced on 5+ sample findings with plausible directions

**P8: Hunch output format (structured slot in discipline telemetry)**
- Where the hunch gets recorded
- Proposed schema field for discipline outputs:
  ```yaml
  hunch:
    target: [what was hunched about]
    prediction: [directional claim]
    reliability: [0-1]
    reasoning: [1-2 sentences]
    load_bearing_match: [path to the similar/analogous finding]
    timestamp: [when hunched]
  ```
- Verification: [ ] schema integrated into discipline telemetry convention [ ] backward-compatible with existing outputs

### Cluster D — Integration

**P9: Discipline-level integration**
- Resolves deferred ambiguity: **cross-cutting substrate + per-discipline hunch invocation**
  - Substrate (A) is shared infrastructure, called by all disciplines
  - Hunch invocation (C) is discipline-specific — each discipline decides WHAT to hunch about and WHEN
- MVP integration: start with TWO disciplines (not all five):
  - `/innovate` hunches about which candidates are likely-strong before critique runs
  - `/td-critique` hunches about whether the cycle's answer matches the goal (pre-emptive TERMINATE-or-ITERATE signal)
- Rationale: these two benefit most from real-time value judgment; others can adopt after MVP proves out
- Verification: [ ] integration pattern documented for /innovate [ ] integration pattern documented for /td-critique [ ] pattern clearly extensible to other disciplines

### Cluster E — Calibration Loop

**P10: Hunch-vs-outcome tracking**
- How L3 predictions get calibrated by L2 retrospective outcomes
- Records: each hunch's target, prediction, reliability, and a deferred-outcome field
- Outcome match: when L2 signals fire (cited/superseded/implemented per prior finding's L2 infrastructure), link back to the hunch record
- Aggregation: per-discipline hunch accuracy over time (well-calibrated = prediction strength matches outcome frequency)
- NO live weight update in MVP — only recording + reporting
- Verification: [ ] hunch record schema linked to L2 outcome records [ ] per-discipline calibration report format specified

### Cluster F — Prior-Finding Integration

**P11: Update importance_measurement_problem finding**
- Caveat header on prior finding: scope-clarification noting the two-layer view is corrected to three-layer by this inquiry
- Status: prior stays `active` but annotated with the correction reference
- Relationship annotation: `CORRECTED_BY: thinking_space_dynamics` in prior `_state.md`
- Action: rewrite the prior finding's section 7 ("Honest assessment of limits") — the "real-time = structural only" claim is corrected; L2's role as calibrator is added
- Verification: [ ] prior finding annotated [ ] relationship added [ ] section 7 rewrite drafted

### Cluster G — Validation

**P12: Retrospective validation on corpus**
- Corpus: existing inquiry folders (~20 findings) + their discipline outputs
- Test 1 (surface similarity): does P3 retrieve findings that a human would say are related?
- Test 2 (structural analogy): seed cross-domain pairs (e.g., regression detection ↔ thinking-space dynamics share "calibration-of-probabilistic-signal" structure); does P6 retrieve them even though surface topics differ?
- Test 3 (hunch calibration): for findings where L2 outcomes already exist (supersessions, citations), does P7 produce hunches that would have matched the outcomes?
- Threshold: agreement > 70% for surface similarity; > 40% for structural analogy; calibration curves monotonic for hunches
- Verification: [ ] three tests specified [ ] thresholds documented [ ] corpus run plan written

---

## 3. Interface Map

| Source | Target | What flows | Direction |
|---|---|---|---|
| P1 (strategy) | P2 (store), P6 (analogy) | Granularity + model choice | Input |
| P2 (store) | P3 (query), P6 (analogy) | Embeddings keyed by path+hash | Read |
| P3 (surface query) | P4 (attention), P6 (analogy), P7 (hunch) | Top-K matches with scores | Read |
| P4 (attention) | P7 (hunch) | Active-set artifact | Read |
| P5 (context) | P7 (hunch) | Context block | Read |
| P6 (analogy) | P7 (hunch) | Structural matches | Read |
| P7 (hunch) | P8 (output format) | Hunch record | Write |
| P8 (format) | P9 (integration) | Telemetry schema | Contract |
| P9 (integration) | Disciplines (/innovate, /td-critique) | Invocation pattern | Extends |
| P8 (format) | P10 (calibration) | Hunch records | Read |
| L2 records (prior finding infra) | P10 (calibration) | Outcome records | Read |
| P11 (prior integration) | Prior finding files | Caveat + rewrite | Write |
| P12 (validation) | P3, P6, P7 | Test invocations | Calls |

### Hidden interfaces (external format dependencies)

- Embedding model API stability (P1, P2, P3, P6)
- Content-hash computation stability (P2)
- Discipline telemetry block format (P8, P9)
- `_state.md` relationship format (P10 reads L2 relationships)

These are dependencies on EXISTING system conventions and external APIs. Embedding model version changes are the highest-risk external dependency — pin the version.

### Ambiguity resolutions (both deferred from sensemaking)

**Granularity (from sensemaking ambiguity #6):** P1 resolves → finding-level for MVP. Inquiry-level too coarse; chunk-level too fine. Finding-level matches the semantic unit of the system.

**Per-discipline vs cross-cutting (from sensemaking ambiguity #7):** P9 resolves → HYBRID. Substrate (A) is cross-cutting shared infrastructure; hunch invocation (C) is per-discipline, starting with /innovate and /td-critique as MVP.

---

## 4. Dependency Order

```
MVP Phase 1 (Substrate — ship together):
  P1 (strategy) → P2 (store) → P3 (surface query)
  P11 (prior integration) — parallel, independent

MVP Phase 2 (Primitives — parallel once Phase 1 stable):
  P4 (attention) // P5 (context) // P6 (analogy)
    — all parallel once P3 stable
    — P6 has additional dependency: pre-computed abstractions stored via P2

MVP Phase 3 (Hunch Layer):
  P7 (hunch production) — requires P4, P5, P6
  P8 (output format) — parallel with P7 (format can be specified independently)

MVP Phase 4 (Integration):
  P9 (discipline integration) — requires P7, P8
  P10 (calibration) — requires P8 (hunch records exist) + L2 infra from prior finding

Validation:
  P12 — anytime after P3, P6, P7 exist; full test after P10
```

**Critical path:** P1 → P2 → P3 → P6 → P7 → P9 (six pieces on the critical path). P4/P5 are parallelizable with P6 once P3 stable. P8 parallelizable with P7.

**No circular dependencies.**

**Deferred (NOT in MVP):**
- Live calibration weight updates (P10 records only in MVP; tuning is Phase 5+)
- Integration into /explore, /sense-making, /decompose (Phase 5+ after /innovate and /td-critique prove the pattern)
- Chunk-level embedding granularity (Phase 5+ if finding-level proves insufficient)
- Vector-DB migration (Phase 5+ at N≥10³ findings)

---

## 5. Self-Evaluation

| Dimension | Result | Notes |
|---|---|---|
| **Independence** | PASS | Each piece has clear, minimal dependencies; P4/P5/P6 parallelizable |
| **Completeness** | PASS | All three layers (substrate + primitives + hunch), integration, calibration, prior-finding housekeeping, validation covered |
| **Reassembly** | PASS | Pieces + interfaces → three-layer architecture operating over AlignCraft's existing disciplines, matching SV6 |
| **Tractability** | PASS | Each piece small-to-medium; P6 and P7 are the largest (keystones) but still single-focused-pass-sized |
| **Interface clarity** | PASS | All 13 interfaces named; external API dependencies flagged explicitly |
| **Balance** | PASS | No 80% piece. P6 and P7 are the keystones with slightly more weight but not dominating |
| **Confidence** | PASS | Top-down (clusters A-G) and bottom-up (12 atomic pieces) agree on boundaries; one refinement applied (Focus/Intuition folded into P7 rather than treated as separate pieces — this was a bottom-up correction to a top-down naive mapping) |

**All 7 dimensions pass. Decomposition ready for Innovation.**

### Innovation should focus on:

- **P6 (structural-analogy protocol, KEYSTONE)** — the abstraction-stage prompt design; how to reliably elicit relational structure that matches across surface-unrelated domains. This is the hardest primitive and the biggest failure risk.
- **P7 (hunch production, KEYSTONE)** — the judge prompt design; how to combine attention + context + surface + structural into a single well-calibrated hunch; multi-sample variance handling.
- **P4 (attention construction)** — what goes in the active set; how to weight temporal-recent vs. relationship-linked vs. surface-similar
- **P9 (discipline integration)** — the invocation pattern for /innovate and /td-critique; when exactly to call, what to pass, how to interpret
- **P10 (calibration)** — the hunch-outcome matching mechanism; how to aggregate across disciplines without cross-contamination

### Innovation should avoid re-litigating:

- Granularity (finding-level, decided in P1)
- Per-discipline vs cross-cutting (hybrid, decided in P9)
- Whether to include Focus/Intuition as separate pieces (no — they live inside P7 by design)
- Whether to kill L2 (no — L2 is promoted to calibrator; killing it is already refuted in sensemaking)
