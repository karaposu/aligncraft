# Exploration — Book Chapter/Section Gap Analysis

## Mode and Entry Point
- **Mode:** Possibility exploration — the territory is the candidate space of "what chapter/reorganization would make sense." Candidates must be generated, not found.
- **Entry point:** Frontier-first — the user has not pre-named a candidate, so we scan the territory broadly first, then probe high-signal regions.

---

## Cycle 1 — Coarse Scan: What's actually in the book today?

Read directly from `src/SUMMARY.md`, line-counts of every chapter file, and full content of `chapter_2/01_alignment.md` + `chapter_2/02_alignment_artifacts.md` + `chapter_11_offload/offload_pattern.md` + samples of others.

**Inventory of what exists (artifact survey, scan resolution):**

| Section | Files | Total Lines | State |
|---|---|---|---|
| Front | README, preface | — | Updated for AlignCraft rename |
| Part I — Foundations | terminology, slash commands (new), evolution (5 sub), framework (2 sub) | ~700 | Solid |
| Part II — AI Collaboration | how-AI-thinks (3 sub), practical collab (6 sub), data dump | ~1300 | Solid, deep |
| Part III — Patterns | devdocs (8 sub), run-probes, fuzzy-arch, anchor, archaeology, offload, vibe-testing | ~2300 | **Mixed completion** |
| Appendices | 9 appendices | — | Mostly prompt collections |

**Mixed completion within Part III, identified by line count and inspection:**
- `chapter_8_fuzzy/fuzzy_architecture.md`: 411 lines — substantial.
- `chapter_12_vibe_testing/vibe_testing.md`: 396 lines but **explicit header says "Not finished yet"**.
- `chapter_10_archaeology_pattern/archaeology_pattern.md`: 290 lines — substantial.
- `chapter_11_offload/offload_pattern.md`: **37 lines — stubby/incomplete**.
- `chapter_7_run_probes/`: contains three files including `probe_tests_fixed copy.md` (a duplicate scratch file) — disorganized.
- `chapter_9_anchor`: 79 lines — short relative to the pattern's importance.

**Signals already detected at scan resolution:**
- Part IV is **promised in the README** ("Part IV: The AlignCraft Method - Step-by-step implementation guide") but **does not exist** in SUMMARY.md. This is a structural promise the book doesn't keep. **HIGH SIGNAL.**
- The repo ships ~30 slash commands and 7+ thinking disciplines (sensemaking, innovation, critique, exploration, decomposition, comprehension, navigation, MVL, MVL+). The book only treats sensemaking (one appendix). **HIGH SIGNAL — large investment in repo, near-zero treatment in book body.**
- The four pillars (Comparison, Measurement, Visibility, Explicitness) are introduced in one section of `chapter_2/01_alignment.md` and never given their own chapter — yet the README treats them as load-bearing on equal footing with the six layers. **MEDIUM SIGNAL.**
- Numbering inconsistency: README says "six layers, 1-6"; chapter_2/01_alignment.md numbers them 0-5. Minor but real. **LOW SIGNAL.**
- Several Part III chapters are stubs or incomplete — completion is itself a candidate type. **MEDIUM SIGNAL.**

Resolution decision: **Zoom in** on the highest-signal regions — the missing Part IV, the absent thinking-disciplines chapter, and the four-pillars treatment.

---

## Cycle 2 — Probe: The promised-but-missing Part IV

The README says explicitly:

> "Part IV: The AlignCraft Method - Step-by-step implementation guide"

The current SUMMARY.md ends Part III at chapter 12 and goes straight to Appendices. **Part IV does not exist.** This is a hole the book's own marketing copy creates.

What would Part IV contain, based on what the README and book promise?
- A step-by-step *applied* walkthrough of the methodology — taking a project from zero through the six layers, using the patterns from Part III as the toolkit.
- A diagnostic / "where am I misaligned right now" guide.
- Concrete artifact examples linked to specific layer transitions.

Currently this material is *scattered* in the appendices (1-7 are prompt collections) but never assembled into a narrative chapter. **Probe finding: Part IV is the single largest structural gap because the book promises it explicitly.**

---

## Cycle 3 — Probe: The missing Thinking Disciplines chapter

The repo invests heavily in thinking disciplines (under `~/.claude/skills/` and `commands/`):
- `sense-making`, `innovate`, `td-critique`, `decompose`, `explore`, `comprehend`, `navigation`
- Loop runners: `MVL` (S→I→C), `MVL+` (E→S→D→I→C), `inquiry`, `meta-loop`, `reflect`
- Each has a deep reference doc (e.g., `references/td-critique.md`)

The book treats these in only two places:
- Appendix 6: Sense Making — one discipline only.
- Appendix 8: Slash Commands — one-paragraph descriptions, no methodology.

A reader of the book *cannot* learn what a thinking discipline IS, why they exist, how they relate to the six layers, or how to use the cognitive loop. Yet someone who installs the command pack uses these constantly.

**This is a "structural absence" of the kind described in the explore framework** — something that should exist but doesn't because the book evolved alongside the repo without keeping pace with the repo's growth. The book is now describing a *subset* of what the methodology actually is.

**Probe finding: a Thinking Disciplines chapter (or full Part) is missing entirely. This is the largest *new content* gap.**

---

## Cycle 4 — Probe: The Four Pillars treatment

Currently the four pillars (Explicitness, Visibility, Measurement, Comparison) appear:
- In the README as a "chain of logic" (4 sentences)
- In `chapter_2/01_alignment.md` as a section toward the end
- In `chapter_2/02_alignment_artifacts.md` implicitly through artifact structure

What's missing:
- A dedicated chapter that takes each pillar in turn, shows what it looks like in practice, and shows how to apply it at each of the six layers.
- The cross-product: 4 pillars × 6 layers = 24 specific "what does Explicitness at the Coherence layer look like?" answers. The book's own framing implies this matrix exists, but it's never enumerated.

**Probe finding: the Four Pillars chapter is a smaller but pedagogically important gap — without it, the pillars stay abstract and readers can't apply them concretely.**

---

## Cycle 5 — Scan (broader): Other candidate gaps and reorganizations

Per the framework's "completeness before novelty" rule, here are the obvious adjacent candidates a domain expert would expect on the map:

**Chapter additions (new content):**
1. **Part IV — The AlignCraft Method** (promised, missing) — top-of-stack
2. **Thinking Disciplines chapter / part** — the cognitive loop, the seven disciplines, when to use each
3. **The Four Pillars chapter** — pillars × layers in practice
4. **Failure Modes / Diagnostic chapter** — "you're misaligned at layer X if you observe symptom Y"
5. **End-to-end Case Study** — watch one real project move through all six layers
6. **AI-AI Collaboration chapter** — the README mentions it; the book ignores it
7. **Hooks & Automation chapter** — devdocs metadata hook, structural check, install scripts — currently scattered
8. **Inquiry Loop chapter** — MVL/MVL+, `_branch.md`/`_state.md`/`finding.md` lifecycle
9. **A "Common Misalignments" troubleshooting chapter**

**Reorganizations (no new content):**
10. **Promote APPENDIX6 (Sense Making) into the body** as part of a Thinking Disciplines chapter — solves both "appendix is heavy" and "body is missing the topic"
11. **Complete chapter 11 (Offload, 37 lines stub) and chapter 12 (Vibe Testing, "not finished")** — finish what's already in the TOC
12. **Clean up `chapter_7_run_probes/`** — three files including a "copy" scratch file
13. **Renumber chapter_2's six layers from 0-5 to 1-6** to match the README
14. **Split Part III into two parts**: foundational patterns (DevDocs, Anchor, Probe) and advanced patterns (Fuzzy, Archaeology, Offload, Vibe Testing) — Part III currently has 7 chapters which is a lot
15. **Move the "data dump" (chapter 5, currently in Part II) into Part III as a pattern** — it reads more like a pattern than a Part-II concept

**Jump scan — completely different angles:**
16. Drop the book entirely and lean into the repo as documentation (rejected: out of scope, contradicts the user's investment)
17. Rewrite the book around the 4 pillars instead of the 6 layers (interesting but is a whole-book rework, not a chapter)
18. Add a "How to use this book" chapter at the very front (smaller than the others; useful but secondary)

---

## Cycle 6 — Resolution & convergence pivot

After three probes and one broad scan, the candidate space is well-mapped. The decision pivot for downstream disciplines is:

> **Should the recommendation favor (a) closing the largest *promised* gap (Part IV, the AlignCraft Method), (b) closing the largest *content* gap (Thinking Disciplines chapter), or (c) the highest-leverage reorganization (e.g., promote sense-making out of the appendices and complete the stubs)?**

Two-mechanism convergence: candidates 1 (Part IV) and 2 (Thinking Disciplines) both came up via gap-noticing AND structural-coupling reasoning. They are not the same gap but they are *adjacent* — Part IV would naturally include or reference the thinking disciplines if both existed. Possible synthesis: **a single Part IV that contains both the Method walkthrough AND the Thinking Disciplines, since they belong together as "how you actually apply the methodology."**

---

## Final Deliverable — The Structural Map

### 1. Territory Overview
Three regions explored:
- **A. Promised-but-missing structure** — Part IV (the AlignCraft Method) is referenced in the README but absent from SUMMARY.md
- **B. Repo-vs-book asymmetry** — the repo invests heavily in thinking disciplines, command pack, hooks, loop runners; the book treats almost none of this
- **C. Existing Part III chapters with mixed completion** — Offload (stub), Vibe Testing ("not finished"), Run Probes (disorganized), Anchor (short)

### 2. Inventory of Candidates

| # | Candidate | Type | Estimated Effort | Closes |
|---|---|---|---|---|
| 1 | Part IV: The AlignCraft Method | New part (multi-chapter) | Large | The promised-but-missing structural gap |
| 2 | Thinking Disciplines chapter | New chapter (or sub-part) | Medium-Large | Repo/book asymmetry |
| 3 | Four Pillars in Practice | New chapter | Medium | Pillars-as-abstraction problem |
| 4 | Failure Modes / Diagnostic | New chapter | Medium | "How to detect misalignment" gap |
| 5 | End-to-end Case Study | New chapter | Medium-Large | Methodology-by-example gap |
| 6 | AI-AI Collaboration | New chapter | Medium | README-promised topic ignored |
| 7 | Hooks & Automation | New chapter | Small-Medium | Scattered automation story |
| 8 | Inquiry Loop / Cognitive Loop | New chapter | Medium | Loop runner mechanics absent |
| 9 | Common Misalignments | New chapter | Medium | Troubleshooting gap |
| 10 | Promote Sense-Making appendix into body | Reorganization | Small | Appendix-vs-body classification |
| 11 | Complete Offload + Vibe Testing | Completion | Medium | Stub chapters |
| 12 | Clean up chapter_7_run_probes | Cleanup | Small | Disorganized folder |
| 13 | Renumber chapter_2 layers 1-6 | Cleanup | Tiny | README/chapter inconsistency |
| 14 | Split Part III into two parts | Reorganization | Small | Part III over-large |
| 15 | Move Data Dump from Part II to Part III | Reorganization | Small | Chapter classification |
| 16 | "How to Use This Book" front-matter | New small section | Small | Reader onboarding gap |
| 17 | Synthesis: Part IV containing both Method and Thinking Disciplines | Hybrid (1+2+8) | Large | Multiple gaps at once |

### 3. Signal Log

| Signal | Priority | Probed? | Disposition |
|---|---|---|---|
| Part IV promised in README, missing from SUMMARY | HIGH | Yes | Carried forward as primary candidate |
| Repo ships thinking disciplines, book doesn't cover them | HIGH | Yes | Carried forward as primary candidate |
| Four pillars never get dedicated chapter | MEDIUM | Yes | Carried forward as secondary candidate |
| Several Part III chapters incomplete | MEDIUM | Yes | Carried forward as reorganization/completion option |
| Numbering inconsistency 0-5 vs 1-6 | LOW | Yes | Easy cleanup; carried forward |
| Run-probes folder has scratch files | LOW | Yes | Easy cleanup; carried forward |
| AI-AI collaboration mentioned but not covered | LOW-MEDIUM | Yes | Real gap but smaller priority |

### 4. Confidence Map

| Region | Confidence | Notes |
|---|---|---|
| Existing book TOC and chapter contents | **Confirmed** | Read SUMMARY.md, multiple chapters in full |
| Repo-vs-book asymmetry on thinking disciplines | **Confirmed** | Repo has 7+ disciplines + loop runners; book has 1 appendix |
| Promised-but-missing Part IV | **Confirmed** | README states "Part IV"; SUMMARY.md does not list it |
| Stubby chapter inventory | **Confirmed** | Line counts + headers ("Not finished yet") |
| Reader-experience evidence (which gap hurts most in practice) | **Unknown** | No reader feedback collected; treated as content-fit question |
| Author's actual priorities | **Unknown** | Inferred from repo-vs-book emphasis but not stated |

### 5. Frontier State and Convergence Assessment

**Convergence check (all three criteria):**
- **Frontier stability:** YES — new scans no longer produce new structural features. The candidate space has 17 enumerated options, with 2-3 obvious leaders.
- **Declining discovery rate:** YES — Cycle 5 produced reorganization candidates as a complement to Cycles 2-4's content candidates; Cycle 6 was a pivot, not new territory.
- **Bounded gaps:** YES — remaining unknowns (reader experience data, author priorities) are explicitly bounded; the question is fit-to-content, not popularity.
- **Jump scan performed:** YES — drop-the-book and rewrite-around-pillars angles probed; both rejected on scope grounds.

**Convergence verdict: ACHIEVED.** The map is sufficient for sensemaking to operate on.

**Frontier — stable on these axes:**
- Promised-vs-actual structure
- New content vs reorganization
- Effort/scope of intervention
- Closes-largest-gap vs lowest-effort-per-value

### 6. Gaps and Recommendations

**Bounded gaps (acceptable):**
- Empirical reader feedback — none exists; this is a fit-judgment, not market test.
- The user's priority weighting between effort and value — could be elicited but is not necessary for a recommendation.

**Recommendation for next discipline:**
The sharp question to hand to **sensemaking** is: *"Across the 17 candidates, which one or which combination has the highest fit-to-mission while being scoped to a single coherent action the user can take next?"* The exploration's working hypothesis is that **Part IV (the Method)** and **the Thinking Disciplines chapter** are the two strongest individual candidates, and that they may be most powerful if assembled together as a single Part IV containing both.
