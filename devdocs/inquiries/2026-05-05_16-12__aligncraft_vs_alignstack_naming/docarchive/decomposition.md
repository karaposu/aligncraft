# Decomposition — AlignCraft vs AlignCraft Naming

## Step 1 — Perceive Coupling Topology

**The whole:** the verdict-construction for "Is AlignCraft a better name than AlignCraft given what the book preaches?"

**Elements in the whole:**
- E1. Book's primary substance (what it preaches)
- E2. Book's framing device (six-layer taxonomy)
- E3. Connotations of "Stack" suffix
- E4. Connotations of "Craft" suffix
- E5. Fit-to-substance dimension
- E6. Internal-consistency dimension (does name align with body's self-positioning?)
- E7. Audience-signal dimension
- E8. Community/brand-language dimension
- E9. Register/tonality dimension
- E10. Alternative candidate names (AlignWorks, etc.)
- E11. Switching cost (excluded by user — frozen)
- E12. Final verdict

**Coupling map (key pairs):**

| Pair | Coupling | Reason |
|---|---|---|
| E1 ↔ E5/E6 | STRONG | Fit and consistency are evaluated against substance; can't compute either without E1 fixed |
| E2 ↔ E3 | STRONG | "Stack" maps literally onto the layered framing |
| E1 ↔ E4 | STRONG | "Craft" maps onto the practice substance |
| E3 ↔ E4 | NONE | Connotation analyses of two suffixes are independent of each other |
| E5 ↔ E6 | MODERATE | Both rooted in substance but measure different things (semantic-fit vs textual-consistency) |
| E7/E8/E9 ↔ E3/E4 | MODERATE | Secondary axes consume connotation outputs but evaluate on different criteria |
| E10 ↔ E12 | WEAK | Alternatives matter only if primary pair ties; otherwise discardable |
| E11 ↔ everything | NONE | Frozen out of scope |
| E12 ↔ all upstream | TERMINAL | Verdict is the integrator |

**Major clusters:**
- **Cluster A — Substance ground truth:** E1, E2 (what the book is)
- **Cluster B — Suffix connotations:** E3, E4 (semantic content of each name)
- **Cluster C — Fit evaluation:** E5, E6, E7, E8, E9 (multi-axis scoring of each candidate against substance)
- **Cluster D — Alternative survey:** E10 (escape hatch if both candidates fail)
- **Cluster E — Verdict assembly:** E12

**Major boundaries (low-coupling valleys):**
- Between A and B: substance ground-truth is independent of suffix connotation analysis (you can characterize each in parallel once their inputs exist)
- Between B and C: connotations are inputs to fit-scoring; clean unidirectional flow
- Between C and D: alternatives are only consulted at C's exit if scoring is inconclusive
- Between everything and E: verdict assembles upstream outputs

---

## Step 2 — Detect Boundaries (Top-Down)

Initial piece set, cut at the low-coupling valleys:

- **P1.** Substance characterization (covers Cluster A)
- **P2.** Stack-suffix connotation analysis
- **P3.** Craft-suffix connotation analysis
- **P4.** Multi-axis fit scoring (covers Cluster C)
- **P5.** Alternative-name scan and tiebreaker check
- **P6.** Verdict integration

P2 and P3 are split because their internal coupling is zero — they can be done in parallel.
P4 is one piece (not split per axis) because the axes share scoring methodology and produce one combined matrix.

---

## Step 3 — Validate Boundaries (Bottom-Up)

**Atomic elements check:** the indivisible facts in this problem are:
- a1. The book's stated mission ("codify what developers do instinctively")
- a2. The page-count ratio (taxonomy ~1 page vs practice content ~250 pages)
- a3. "Stack" overload with tech-stack
- a4. "Craft" lineage with Software Craftsmanship movement
- a5. The opening sentence that name-tautologizes
- a6. User waiver of switching cost

Do these atoms group into the same clusters as Step 2?
- a1, a2, a5 → P1 (substance characterization) ✅
- a3 → P2 (Stack connotations) ✅
- a4 → P3 (Craft connotations) ✅
- a6 → frozen (correctly excluded) ✅

No atom is split across boundaries; no atom is misgrouped. **Top-down and bottom-up agree. Confidence: HIGH.**

---

## Step 4 — Express as Question Tree

### P1. What is the book's primary substance, and what is its framing device?
**Verification criteria:**
- [ ] Stated mission identified and quoted
- [ ] Page-count / weight distribution between framing and body assessed
- [ ] Original IP location identified (taxonomy vs patterns)
- [ ] One-paragraph characterization of "what the book preaches"

(Mostly already produced in sensemaking; this piece consolidates and exposes the interface for downstream pieces.)

### P2. What does "Stack" as a suffix connote, and how does it fit the substance from P1?
**Verification criteria:**
- [ ] Dominant cultural associations of "Stack" listed (tech-stack, OSI/network, software stack, architectural stack)
- [ ] Active/static reading determined
- [ ] Fit-to-substance score with explicit reasoning
- [ ] One sentence: "AlignCraft reads as ___, which fits/mismatches the substance because ___"

### P3. What does "Craft" as a suffix connote, and how does it fit the substance from P1?
**Verification criteria:**
- [ ] Dominant cultural associations of "Craft" listed (Software Craftsmanship lineage, gaming-suffix, artisan/practice register)
- [ ] Active/static reading determined
- [ ] Fit-to-substance score with explicit reasoning
- [ ] One sentence: "AlignCraft reads as ___, which fits/mismatches the substance because ___"

### P4. Across secondary axes (audience-signal, brand/community, register, internal-consistency), how does each candidate score?
**Verification criteria:**
- [ ] Each axis scored separately for each candidate (small matrix)
- [ ] Tradeoffs surfaced where they exist
- [ ] Aggregated direction (which candidate wins on net of secondary axes) stated

### P5. Do any alternative names beat both candidates, or do they remain tiebreakers only?
**Verification criteria:**
- [ ] Top alternatives (AlignWorks, AlignFlow, AlignForge) rapidly fit-tested
- [ ] Verdict: keep both candidates as primary, or surface a third name?

### P6. Verdict — which name is better fit, and what is the structural reasoning?
**Verification criteria:**
- [ ] Single-sentence verdict
- [ ] Three structural arguments cited
- [ ] Strongest counter-argument acknowledged and answered
- [ ] Confidence level stated

---

## Step 5 — Map Interfaces

| From → To | Flow type | What flows | Direction |
|---|---|---|---|
| P1 → P2 | Information | Substance characterization (used as fit reference) | One-way |
| P1 → P3 | Information | Substance characterization | One-way |
| P1 → P4 | Information | Substance characterization | One-way |
| P2 → P4 | Information | Stack connotation profile | One-way |
| P3 → P4 | Information | Craft connotation profile | One-way |
| P2 → P6 | Information | Stack fit-to-substance score | One-way |
| P3 → P6 | Information | Craft fit-to-substance score | One-way |
| P4 → P6 | Information | Secondary-axis aggregate | One-way |
| P5 → P6 | Information | Alternative-name tiebreaker (consumed only if needed) | One-way, conditional |

No bidirectional flows. No circular dependencies. All interfaces are information flows; no shared mutable state.

**Hidden-coupling check:** the only hidden-coupling risk is that P4's scoring on "internal consistency" depends on P1's characterization being *specific enough to test against*. To prevent this, P1's verification criteria explicitly require a one-paragraph characterization (concrete enough for P4 to score against).

---

## Step 6 — Order by Dependency

**Phase 1 (must be first):** P1 — substance characterization. Everything else depends on it.

**Phase 2 (parallelizable):** P2 and P3 in parallel. They consume only P1; they are independent of each other.

**Phase 3 (after P2 + P3):** P4 — secondary-axis scoring. Consumes P2, P3, and P1.

**Phase 4 (parallelizable with P4):** P5 — alternative-name scan. Consumes only P1; can run anytime after P1.

**Phase 5 (terminal):** P6 — verdict integration. Consumes everything.

```
P1 → [P2 ∥ P3] → P4 → P6
P1 →           P5  ↗
```

(P5 runs in parallel with the P2/P3/P4 chain; both feed into P6.)

No circular dependencies. Critical path: P1 → P2/P3 → P4 → P6 (4 sequential pieces).

---

## Step 7 — Self-Evaluate

### Minimum 3 dimensions

| Dimension | Check | Result |
|---|---|---|
| **Independence** | Each piece answerable through interfaces only? | PASS — P2 and P3 don't reference each other; P4 consumes P2/P3 only via their score outputs; P6 consumes everything via stated outputs |
| **Completeness** | Pieces cover the whole? | PASS — substance, both connotation analyses, secondary axes, alternatives, and verdict together cover the question |
| **Reassembly** | Pieces + interfaces reconstruct verdict? | PASS — the verdict in P6 follows mechanically from the upstream outputs |

### Full 7 dimensions

| Dimension | Result | Notes |
|---|---|---|
| Independence | PASS | See above |
| Completeness | PASS | See above |
| Reassembly | PASS | See above |
| **Tractability** | PASS | Each piece is a single focused question, answerable in one pass |
| **Interface clarity** | PASS | All flows are information one-way; one conditional flow (P5) explicitly noted |
| **Balance** | MEDIUM | P1 carries somewhat more weight (sets the substance ground truth) but P4 also has moderate complexity. Acceptable spread; no piece is 80%+ of the work |
| **Confidence** | PASS | Top-down and bottom-up boundaries agreed; no atoms split |

**Decomposition is good enough to commit. No DV2 needed.**

---

## Final Deliverable

### Coupling Map
Five clusters (A: substance, B: connotations, C: fit-evaluation, D: alternatives, E: verdict). Major boundaries between A↔B, B↔C, C↔D, all↔E. No high-coupling region split by any boundary.

### Question Tree
Six pieces: P1 (substance), P2 (Stack connotations), P3 (Craft connotations), P4 (secondary-axis scoring), P5 (alternative scan), P6 (verdict). Each with explicit verification criteria.

### Interface Map
Nine information flows, all one-way, one conditional (P5 → P6). No hidden coupling once P1 produces a sufficiently concrete characterization.

### Dependency Order
P1 → (P2 ∥ P3) → P4 → P6, with P5 running parallel after P1 and joining at P6.

### Self-Evaluation
3/3 minimum dimensions PASS. 7/7 full dimensions PASS (Balance MEDIUM but acceptable).

### Handoff to Innovation
Innovation will use this decomposition by treating each piece as a generation slot: produce candidate framings/arguments for each question, then route the surviving candidates into critique. The verdict (P6) is the synthesis target, but the upstream pieces are independent generation surfaces.
