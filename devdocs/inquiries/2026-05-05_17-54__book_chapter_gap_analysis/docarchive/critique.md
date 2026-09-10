# Critique — Book Chapter/Section Gap Analysis

## User Input
`devdocs/inquiries/2026-05-05_17-54__book_chapter_gap_analysis/_branch.md`

Question: What chapter/section addition or reorganization would most improve this book?

---

## Phase 0 — Dimension Construction

Extracting evaluation dimensions from sensemaking + the user's stated goal:

| # | Dimension | What it asks | Extracted from | Weight |
|---|---|---|---|---|
| D1 | **Promise integrity** | Does this fix a contradiction between what the book promises and what it delivers? | Sensemaking N6, exploration HIGH-signal | **Critical** |
| D2 | **Structural payoff** | Does this *reshape* the book's reader experience, not just enrich one chapter? | Sensemaking S1, S2, I3 | **Critical** |
| D3 | **First-deliverable scope** | Can the user ship the immediate part this week? | User constraint C3, sensemaking SV6 | **High** |
| D4 | **Repo/book parity** | Does this close the gap between what the repo runs and what the book describes? | Exploration HIGH-signal, sensemaking N3 | **High** |
| D5 | **Effort efficiency** | Is the effort proportionate to the value? Reuses existing material where possible? | Innovation Survivor 2 (curation framing) | **Medium** |
| D6 | **Pedagogical concreteness** | Does the recommendation give readers concrete examples to anchor abstractions? | Innovation Survivor 3 | **Medium** |
| D7 | **Reversibility** | Can this be reversed or amended cheaply if the user changes their mind? | General principle | **Low-Medium** |
| D8 | **Reader-experience fit** | Does the recommendation address the felt-pain a real reader would have today? | Innovation Lens Shifting Generic | **Medium** |

**Stake level:** Medium-Low. The recommendation is a structural commitment (declaring Part IV in SUMMARY) plus one chapter of writing. Reversible — Part IV can be redrawn or merged later if directions change. Burden of proof: **innocent until proven guilty** for low-effort moves; **defense must demonstrate viability** for moves that reshape multiple chapters.

**Dimension validation:** D1 + D2 carry the structural-fix burden. D3 + D5 enforce that the recommendation is actually shippable. D4 + D6 + D8 test that the result helps the reader. D7 is a safety net. No critical perspective from sensemaking is uncovered.

---

## Phase 1 — Landscape Construction

**Viable region:** A move that scores well on D1+D2 (critical) and at least passably on D3+D4 (high). Failures on medium/low dimensions are acceptable.

**Dead region:** A move that fails D2 (no structural payoff) OR fails D3 (cannot ship in any reasonable timeframe). Either fatal alone.

**Boundary region:** A move that passes D2 but is heavy on D3 — strong reshape, but slow to deliver. Refinable by scoping the first deliverable smaller.

**Unexplored regions:**
- Combinations of subtraction + addition (the user did not request this combination explicitly).
- Moving Part IV outside the book entirely (innovation's contrarian inversion).

---

## Phase 2 — Adversarial Evaluation

### Candidate A: Assembly — declare Part IV + curation foundation chapter + open with real-inquiry example

**Prosecution (strongest case AGAINST):**
The assembly looks elegant on paper but its three components have different risk profiles. Declaring Part IV in SUMMARY (P1) is trivial. Writing a foundation chapter as *curation* assumes the existing reference docs in `~/.claude/skills/<discipline>/references/<name>.md` are reusable as-is — but those docs were written for a different audience (the AI executing a discipline), not for a reader learning what the discipline IS. The curation framing risks producing a chapter that reads as pasted-together skill specs rather than a unified narrative. Worse, the "open with the real MVL+ inquiry" gambit requires sanitizing actual inquiry content, deciding what to redact, and finding a clean pedagogical narrative inside what is — by design — a methodology in motion. That's editorial work, not curation.

The strongest single objection: **the curation framing is wishful thinking; the reference docs are not chapter material.** Adopting it makes the chapter sound mechanical and undersells the methodology.

**Defense (strongest case FOR):**
The curation framing is not "paste reference docs verbatim" — it's "the substance largely exists, the editorial frame is the new work." The discipline reference docs already capture what each discipline IS, when to use it, what failure modes to watch for, and what the artifact looks like. A chapter that *re-pitches* this content for a reader (rather than for an executing AI) is editorial restructuring, not generative writing. That's still work, but it's bounded work. The same reduction applies to the README's mission statement and APPENDIX6 (Sense Making).

The "real MVL+ inquiry as opening example" is not a gambit — it's a pedagogical move that solves the abstract-concept problem directly. The user has just produced TWO complete MVL+ inquiries today (the AlignCraft rename, this gap analysis). The artifacts are concrete, well-shaped, and demonstrably useful. Showing them in the foundation chapter as "here's the methodology in motion" is the strongest possible motivation for the abstract sections that follow. It also showcases the author's own practice, which builds credibility.

**Collision:**
The prosecution's strongest claim is that the curation framing underestimates the editorial work. The defense concedes that "curation" is a useful name for the work but the work is real. Both sides agree the chapter requires editorial labor; they disagree about scope. The disagreement is bounded: even at the high end, this is one chapter of work, not several. The prosecution's "mechanical-sounding chapter" risk is a *quality* concern, addressable in revision, not a structural failure. Defense survives.

**Position:** Passes D1 (promise integrity — fixes README/SUMMARY contradiction), D2 (structural payoff — reshapes the book's arc), D3 (first-deliverable scope — P1 ship today, P2 ship this week), D4 (repo/book parity — disciplines and loop now in body), D5 (effort efficiency — leverages existing material), D6 (pedagogical concreteness — real inquiry examples), D7 (reversibility — declared structure can be revised), D8 (reader-experience fit — solves the abrupt-ending pain).

**Verdict: SURVIVE.**
Caveat on D5: the "curation" label may understate the editorial work; budget for a real chapter of writing, not a paste job.

---

### Candidate B: Path B (alternate) — Thinking Disciplines chapter alone, placed at end of Part III

**Prosecution:**
Adding a thinking-disciplines chapter at the end of Part III is a smaller commitment than Part IV declaration, but it leaves the README/SUMMARY contradiction in place. The book still doesn't have Part IV. The first-time reader still sees a TOC that ends at chapter 12 (or 13) and jumps to appendices. Worse, putting thinking disciplines at the end of Part III mis-categorizes them: Part III is "Patterns" — disciplines aren't patterns, they're cognitive operations. Squeezing them in distorts the categorization for a small structural win.

**Defense:**
Path B trades structural fix for shipping speed. If the user can't commit to declaring Part IV (because they're not sure what it should contain in full), Path B closes the largest *content* gap (disciplines untreated) without forcing them to plan the full Part IV. It's a stepping stone: write the disciplines chapter at the end of Part III, then later when the broader Part IV shape is clear, lift it into Part IV with minimal rework.

**Collision:**
Defense argues stepping-stone-now beats structural-fix-later. Prosecution argues misplacement creates more rework than direct Part IV declaration. The asymmetry: declaring Part IV is a one-line edit. Writing the chapter is the heavy work. Whether the chapter sits at "end of Part III" or "start of Part IV" is *one line of SUMMARY edit difference*. There is no real cost saving in Path B; only a conceptual hesitation. Prosecution wins on D1 and D2 (critical dimensions).

**Verdict: REFINE → KILL as primary.**
Path B's only advantage over Path A vanishes once you observe that Part IV declaration is essentially free. Where the chapter LIVES is the only difference, and in-Part-IV is structurally correct.
**Constructive seed:** if the user feels uncertain about the *full* shape of Part IV, declare it minimally (just the foundation chapter) and let it grow. Don't avoid declaring it.

---

### Candidate C: Synthesis-page-as-Part-III-closer ("AlignCraft on one page")

**Prosecution:**
A one-page synthesis is a leaf, not a structural change. It addresses the abrupt-ending pain partially, but it doesn't fix the README/Part-IV contradiction. It also doesn't introduce the disciplines and the cognitive loop, which are the methodology's actual operational engine. As a *standalone* recommendation, it's a small win at best.

**Defense:**
A one-pager is one day of work and immediately closes the most visible felt-pain (the book ends on a "Not finished yet" chapter). It's an EXCELLENT *flanking move* alongside Candidate A, not a replacement. Flagging it as primary would be a mis-prioritization, but excluding it would be wasteful.

**Collision:**
Defense correctly characterizes this as flanking. Prosecution is correct that it doesn't substitute for Candidate A.

**Verdict: SURVIVE — but as a Could-do alongside Candidate A, not as a competing primary.**

---

### Candidate D: Subtraction pass on Part III stubs

**Prosecution:**
Subtraction is risky: removing chapter_11 (Offload) and chapter_12 (Vibe Testing) eliminates topics the user cared about enough to outline. Some readers will miss the topics. Removing the "Not finished yet" header without finishing the content lies to readers about completeness.

**Defense:**
Subtraction need not be deletion. Replacing "Not finished yet" with either (a) a finished short version or (b) "Coming in 1.x — see Appendix 8 for current usage" is *honest* completion. Removing the chapter_7 scratch file (`probe_tests_fixed copy.md`) is pure cleanup. The Offload stub at 37 lines should either be expanded or absorbed into another chapter (e.g., merged with Anchor or moved to a brief appendix). All of these are small, independent edits with clear value.

**Collision:**
Subtraction is genuinely valuable but is a *housekeeping track*, not a primary recommendation. It doesn't address the user's "what would make sense most?" question, which seeks a single high-leverage move. Prosecution's "deletion is risky" claim is over-stated; defense's "honest completion" framing is correct. Subtraction survives as Could-do.

**Verdict: SURVIVE as parallel-track Could-do, not as primary.**

---

### Candidate E: Pillar-organized Part IV (alternate Part IV shape)

**Prosecution:**
Reorganizing Part IV around the four pillars (Comparison, Measurement, Visibility, Explicitness) sounds appealing but conflicts with the methodology's actual structure. The cognitive loop and the disciplines are the *operational engine*; the pillars are *required properties* at each layer. Foregrounding the pillars puts the property-checklist before the operational engine. A reader of the pillar-organized Part IV would learn what alignment requires (4 things) without learning HOW to produce them (the disciplines). The pillars are necessary but not sufficient as an organizing principle.

**Defense:**
The pillars are currently underweighted in the book — they appear briefly in chapter_2 and never get dedicated treatment. A pillar-organized Part IV gives them first-class status AND can still introduce the disciplines (as the *means* of achieving each pillar at each layer). It's a different shape, not a worse one.

**Collision:**
Defense's argument is real for the four-pillars-underweighting concern, but using Part IV to fix it forces the pillars to carry organizing weight they weren't designed to carry. The pillars are *quality criteria*, not *operations*. A four-pillar chapter is a perfectly reasonable thing to add — but it's not the right shape for *Part IV: The Method*. The Method is operational; pillars are evaluative. Different category.

**Verdict: REFINE → flag as Could-do for a separate chapter (the existing exploration candidate #3, "Four Pillars in Practice"), not as Part IV's shape.**

---

### Candidate F: Part IV as separate companion artifact (innovation contrarian)

**Prosecution:**
This is the inversion that says Part IV doesn't belong in the book at all — it's a workshop, a course, or a runtime artifact that the book references. The user has invested in the book; relocating Part IV outside it discards that investment AND leaves the README's promise unfulfilled. Worse, it creates two separate artifacts to maintain (book + companion), doubling the divergence problem the recommendation aims to solve.

**Defense:**
The companion artifact is genuinely cheaper to maintain in step with the repo than a book chapter. If the methodology evolves quickly (which the repo's pace suggests), an in-repo companion artifact (markdown files, slash-command flows) keeps pace better than a published book.

**Collision:**
Defense is right about evolution speed — but the *book* has a different role than runtime documentation. The book is the durable conceptual layer; the companion artifact is operational. Both can exist, but they are different things. Part IV belongs in the book as conceptual coverage; runtime documentation can complement it without replacing it. Prosecution wins on the role-clarity argument.

**Verdict: KILL.**
**Constructive seed:** the runtime/companion-artifact framing is correct for *operational* updates (new disciplines, new commands). Part IV in the book is the *conceptual* layer. Both exist, but Part IV stays in the book.

---

## Phase 3.5 — Assembly Check

The surviving candidates assemble into a clear recommendation:

> **Primary deliverable: Declare Part IV in `src/SUMMARY.md` as a multi-chapter part. Write the foundation chapter "The AlignCraft Method" using a curation-with-editorial-labor framing — pulling substance from the existing discipline reference docs, the README mission statement, and APPENDIX6, with original prose binding them. Open the chapter with the user's recent MVL+ inquiries (AlignCraft rename, this gap analysis) as concrete examples that motivate the abstract concepts.**
>
> **Flanking moves (independently valuable, each scoped to under one day):**
> 1. Subtraction pass — clean up `chapter_7_run_probes/probe_tests_fixed copy.md`; either complete or honestly-mark Offload (chapter_11) and Vibe Testing (chapter_12).
> 2. Synthesis page — "AlignCraft on one page" at end of Part III as a graceful close to that part.
> 3. Glossary update — add cognitive-loop-era terms (cognitive loop, MVL/MVL+, finding, inquiry, discipline) to `chapter_0/01_terminology.md`.

This assembly:
- Fixes the structural promise (D1, D2)
- Ships in one week (D3)
- Closes the repo/book gap (D4)
- Reuses existing material (D5)
- Provides concrete examples (D6)
- Is reversible if directions shift (D7)
- Closes felt reader pain (D8)

Adversarial test on the assembly: prosecution can object that the flanking moves dilute focus. Defense: each flanking move is genuinely *independent* — done in any order, by anyone, without affecting the others. Bundling them is bookkeeping, not coupling. **Assembly survives.**

---

## Phase 4 — Coverage + Convergence Assessment

### Coverage map
| Region | Status |
|---|---|
| Declare Part IV + foundation chapter (primary) | EVALUATED (SURVIVE, top-ranked) |
| Path B (disciplines chapter at end of Part III) | EVALUATED (KILL as primary; same chapter belongs in Part IV) |
| Synthesis-page-only | EVALUATED (SURVIVE as flanking, not primary) |
| Subtraction-only | EVALUATED (SURVIVE as flanking, not primary) |
| Pillar-organized Part IV | EVALUATED (REFINE → separate chapter, not Part IV's shape) |
| Companion-artifact instead of Part IV | EVALUATED (KILL) |
| Glossary update / process diagram | EVALUATED (SURVIVE as flanking) |

No unexplored regions adjacent to viable territory. Coverage is sufficient for the user's question.

### Convergence
- Clean SURVIVE exists: yes — Candidate A (assembly).
- Multiple iterations not needed.
- No unexplored region likely to contain a viable third option.
- Failure modes check:
  - Wrong dimensions? No — D1/D2 directly map to the user's stated criterion ("most makes sense").
  - Rubber-stamping? No — Candidates B and F were KILLed.
  - Nitpicking? No — Candidates A, C, D survived.
  - Dimension blindness? Unlikely — D1-D8 cover sensemaking's perspectives.
  - False convergence? No — assembly check produced a higher-ranked candidate than any individual.
  - Evaluation drift? Single-pass; nothing to drift.
  - Self-reference collapse? Not applicable.

**Signal: TERMINATE.**

---

## Final Deliverable

### Dimensions (with weights)
- **Critical:** Promise integrity, Structural payoff
- **High:** First-deliverable scope, Repo/book parity
- **Medium:** Effort efficiency, Pedagogical concreteness, Reader-experience fit
- **Low-Medium:** Reversibility

### Fitness Landscape
- **Viable region:** Candidate A (assembly: declare Part IV + curation foundation chapter + real-inquiry opener) and its flanking moves (Candidates C, D, glossary update).
- **Dead region:** Candidate F (companion-artifact replacement for Part IV).
- **Boundary region:** Candidate B (disciplines chapter alone) — REFINE, equivalent to Candidate A once SUMMARY edit is recognized as nearly free. Candidate E (pillar-organized Part IV) — REFINE, separate chapter not Part IV shape.
- **Unexplored:** None adjacent to viable territory.

### Candidate Verdicts
| Candidate | Verdict | Rank |
|---|---|---|
| A: Declare Part IV + curation foundation chapter + real-inquiry opener (assembly) | **SURVIVE** | **1 (recommended)** |
| C: Synthesis-page at end of Part III | **SURVIVE (flanking)** | 2 (Could-do) |
| D: Subtraction pass on Part III stubs | **SURVIVE (flanking)** | 2 (Could-do) |
| Glossary update | **SURVIVE (flanking)** | 2 (Could-do) |
| B: Disciplines chapter at end of Part III | **REFINE → folds into A** | — |
| E: Pillar-organized Part IV | **REFINE → separate "Four Pillars in Practice" chapter, not Part IV shape** | — |
| F: Companion-artifact replacement for Part IV | **KILL** | — |

### Coverage Map
All in-scope candidates evaluated. No adjacent unexplored regions likely to contain better candidates.

### Signal: **TERMINATE — at least one clean SURVIVE exists.**

Ranked survivors:
1. **Declare Part IV in `src/SUMMARY.md` and write "The AlignCraft Method" as the foundation chapter** — primary. P1 (declaration) is a one-line edit; P2 (chapter) is one week's editorial-curation work pulling from existing discipline reference docs, opening with the user's recent MVL+ inquiries as concrete examples.
2. **Flanking moves**, each independently shippable: synthesis-page, subtraction pass, glossary update.

---

## Convergence Telemetry

- **Dimension coverage:** 8 active dimensions (2 critical, 2 high, 3 medium, 1 low-medium). No critical perspective from sensemaking is uncovered.
- **Adversarial strength:** STRONG — prosecution constructed serious cases against each candidate (the "curation is wishful thinking" attack on A was the strongest, and was answered on bounded-effort grounds, not dismissed).
- **Landscape stability:** STABLE — single pass, no second iteration needed; assembly check produced the top-ranked output and survived its own adversarial test.
- **Clean SURVIVE present:** YES — the assembly (Candidate A).
- **Failure modes observed:** None.
- **Overall: PROCEED to conclusion.**
