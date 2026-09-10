---
status: active
---
# Finding: Book Chapter/Section Gap Analysis

## Question

Given the AlignCraft book's current state — Parts I–III, nine appendices, a sizable gap between what the repo runs and what the book describes — what single chapter/section addition or structural reorganization would most improve the book's coverage of what it actually preaches?

**Goal:** a concrete, ranked recommendation (one primary + one alternate) the user can act on directly, grounded in the book's stated mission and current contents, without further analysis.

---

## Finding Summary

- **Primary recommendation: Declare Part IV in `src/SUMMARY.md` and write its foundation chapter — "The AlignCraft Method."** This is the single highest-leverage move on the book.

- **The structural reasoning is dual-grounded.** Part IV is *promised* in the existing README ("Part IV: The AlignCraft Method - Step-by-step implementation guide") but does not appear in `src/SUMMARY.md` — the book's own marketing copy and its actual table of contents are out of sync. Separately, the repo runs a substantial cognitive-loop and thinking-discipline machinery (the slash-command `/MVL`, `/MVL+`, and the seven thinking disciplines: sense-making, innovation, critique, exploration, decomposition, comprehension, navigation) that the book body never describes — only Appendix 6 (Sense Making) covers any of it. Part IV is the natural home for both, and fixing one fix addresses both gaps.

- **The first deliverable is small and shippable.** The structural fix has two parts: (a) one-line SUMMARY edit declaring `# Part IV: The AlignCraft Method` with placeholder chapter entries, and (b) one foundation chapter (~300–500 lines) that introduces the cognitive loop, the seven disciplines, and the inquiry-folder mechanic at the abstraction level. The rest of Part IV (cognitive-loop deep-dive, per-discipline chapters, end-to-end walkthrough) ships *incrementally* over subsequent weeks/months.

- **The foundation chapter is largely a curation task, not a writing task.** The substance already exists in the discipline reference docs at `~/.claude/skills/<discipline>/references/<discipline>.md` (each ~200–400 lines, written for an executing AI but lifting cleanly to reader-facing prose), in the existing Appendix 6, and in the README's mission statement. The new editorial work is the unifying frame and the connecting prose between sections. Estimate: one focused week, not a multi-month project.

- **Open the foundation chapter with concrete example: the user's own recent MVL+ inquiries.** The two inquiries run today (the AlignCraft rename inquiry at `devdocs/inquiries/2026-05-05_16-12__aligncraft_vs_alignstack_naming/`, and this gap analysis itself) are the methodology-in-motion. Showing them at the chapter's opening — the user actually used the cognitive loop to ask both "what should my book be called?" and "what should I add to it?" — gives readers a concrete anchor before any abstract section.

- **Alternate (Path B) if Path A is too large:** add a single Thinking Disciplines chapter at the *end of Part III*, with the understanding that Part IV declaration follows after. This sacrifices the structural fix (Part IV stays missing) for slightly faster shipping. Critique downgraded this to second-place because declaring Part IV is essentially free (one SUMMARY line); placing the same chapter inside Part IV vs at the end of Part III is the only real difference.

- **Three flanking moves, each ≤1 day's work, each independently valuable, none required for the primary recommendation:**
  - A "AlignCraft on one page" synthesis page at the end of Part III — closes the abrupt-ending pain whether or not Part IV ships immediately.
  - A subtraction pass on Part III stubs — finish or honestly-mark `chapter_11_offload/offload_pattern.md` (37 lines), `chapter_12_vibe_testing/vibe_testing.md` (header says "Not finished yet"), and remove `chapter_7_run_probes/probe_tests_fixed copy.md` (a scratch file).
  - A glossary update — add cognitive-loop-era terms (cognitive loop, MVL/MVL+, inquiry, finding, discipline) to `src/chapter_0/01_terminology.md`.

- **Out of scope (handled in this finding's killed candidates):** moving Part IV outside the book as a companion artifact (rejected — book is the durable conceptual layer), reorganizing Part IV around the four pillars instead of the disciplines (rejected — pillars are evaluative criteria, not operational engines, but a separate "Four Pillars in Practice" chapter is a valid future addition).

---

## Finding

### Why this is a structural question, not a content-brainstorming question

A request to "add a chapter" admits many reasonable answers. A request to fix a *contradiction between what the book promises and what it delivers* has a much sharper answer. Once you read the README closely, the book points at its own gap.

The README states explicitly: *"Part IV: The AlignCraft Method - Step-by-step implementation guide."* The current `src/SUMMARY.md` ends Part III at Chapter 12 ("Vibe Testing") and goes directly to Appendices. **Part IV does not exist in the table of contents.** This is the same kind of internal-consistency defect that surfaced in the earlier inquiry on the AlignCraft-vs-AlignStack rename (where the book's opening sentence and its mission statement made conflicting claims). The book's own marketing copy sets a bar; the bar is not currently met.

This is the single most important structural fact in the whole inquiry. Once it's surfaced, the question contracts from open-menu ("what could be added?") to focused ("what does the book promise but not deliver?").

### Why the gap matters, beyond the broken promise

The promise is the *visible* gap. Two deeper gaps sit underneath it.

**First, the book ends at vocabulary, not application.** A reader who finishes Part III has names for patterns — DevDocs, Anchor, Probe Tests, Fuzzy Architecture, Archaeology, Offload, Vibe Testing — and no narrative for how they fit together into a workflow. Part III is a catalog. The reader is then handed appendices full of prompts and expected to assemble the workflow themselves. Books that teach methodology rarely succeed when they stop at vocabulary; *Domain-Driven Design* dedicates Part IV ("Strategic Design") to integration of the smaller patterns from earlier parts; *The Pragmatic Programmer* closes with "Pragmatic Projects." The integration chapter is not optional in this genre; it's the part readers come for.

**Second, the repo runs a methodology the book doesn't describe.** Over time the repo has accumulated seven thinking disciplines, two loop runners (`/MVL`, `/MVL+`), the inquiry-folder mechanic (`_branch.md`, `_state.md`, `finding.md`), the navigation discipline, the meta-loop runner, the reflect discipline, and a substantial command pack. The book body covers exactly one of these (Sense Making, in Appendix 6). Anyone who installs the command pack and runs `/MVL+` daily — which the user does — uses material the book has no chapter-level treatment of. The book and the repo are evolving on different cadences, and the gap widens with every new discipline added to the repo.

These two gaps are deeply linked. The disciplines and the cognitive loop are *exactly* what the missing Part IV would naturally contain — they are the operational engine that turns Part III's patterns into a workflow. Filling Part IV closes both gaps with one structural move.

### What goes in Part IV (high level)

Part IV's scope is "the method" — how a practitioner applies the alignment chain in practice. The natural multi-chapter shape:

**Chapter 13 (foundation, ship first): "The AlignCraft Method."** Frames the method at the abstraction level. Introduces the cognitive loop (S→I→C minimum, E→S→D→I→C extended) as the methodology's reasoning engine. Names the seven thinking disciplines and the cognitive role each plays. Introduces the inquiry-folder mechanic at the abstraction level (what `_branch.md`, `_state.md`, and `finding.md` each do). Shows how the disciplines map onto the six alignment layers (the layers are *where* alignment can break; the disciplines are *how* you maintain it).

**Chapter 14 (deferrable): "The Cognitive Loop."** Deeper treatment of `/MVL` and `/MVL+`. When each phase fires, what its outputs feed, when iteration ends, what termination criteria look like.

**Chapter 15 (deferrable, possibly multi-chapter): "The Thinking Disciplines."** One section per discipline. What cognitive operation it performs, when to use it, what artifact it produces, common failure modes. Most of the substance lifts directly from the existing reference docs. Whether this is one chapter or seven is a decision to make during writing — the decomposition step flagged it as a DV2 trigger ("treat as one chapter; split if execution reveals coupling problems").

**Chapter 16 (deferrable): "Inquiry Folders."** Anatomy of a folder, the role of each artifact, how findings link via Relationships, the `docarchive/` lifecycle, when to start vs continue an inquiry.

**Chapter 17 (deferrable, latest): "End-to-End Walkthrough."** A single project — real or representative — moves through all six alignment layers, using the patterns from Part III as concrete tools and the disciplines from chapter 15 as the cognitive engine. This depends on the prior chapters having established vocabulary; it should not come first.

The user can declare all five chapters in SUMMARY now (with the deferrable ones marked "(forthcoming)" or similar) and ship them incrementally. Or declare just Chapter 13 and grow the part organically. Either is structurally sound; the difference is communication style.

### Why the foundation chapter is a curation task, not a writing-from-scratch task

A naive read of "write a foundation chapter" suggests weeks of generative writing. A closer look at the source material says otherwise.

- The seven discipline reference docs at `~/.claude/skills/<discipline>/references/<discipline>.md` are each 200–400 lines of tightly-written treatment of what the discipline IS, when to use it, what its components are, what its failure modes are, and how its process flows. They were written for an executing AI to load before running a discipline, but the substance is reader-facing once the audience is shifted.
- Appendix 6 (Sense Making) is already a 200+ line treatment of one discipline in body-style prose. It can move into Part IV with minimal editing.
- The README's mission statement and the four-pillars chain ("Alignment requires Comparison...") supply the conceptual framing.
- The user's own recent MVL+ inquiries are concrete artifacts that already demonstrate the methodology in motion.

The new work in Chapter 13 is the *connecting tissue* — the unifying frame that pulls these sources into a single argumentative narrative. That's editorial work, not generative work. Critique flagged a real risk that "curation" undersells the editorial labor — the reference docs are written for the wrong audience and need re-pitching, not just pasting. That's true. The estimate should be "one focused week of editorial work," not "one afternoon of copy-paste." But it remains substantially smaller than writing 300–500 lines of new prose from a blank page.

### Why open with the user's own MVL+ inquiries

Adult learners with prior practice anchor abstract concepts on concrete examples. The user has just produced two complete MVL+ inquiries today: the AlignCraft-vs-AlignStack naming inquiry and this gap-analysis inquiry. Both are well-shaped, demonstrably useful, and *exactly* the kind of artifact the methodology is supposed to produce. They show:

- The cognitive loop fired (E → S → D → I → C in this case).
- Each discipline produced its own artifact (`exploration.md`, `sensemaking.md`, etc.).
- The disciplines fed each other (sensemaking's pivot question shaped innovation's seed; critique's adversarial pass was load-bearing for the verdict).
- The result was a `finding.md` the user could act on.

Showing this once, at the chapter's opening, gives readers a concrete reference frame. Every subsequent abstract section ("the role of sensemaking is to...") can point back to "you saw this happen on page X." The artifacts are already written; the cost is sanitization and selection of which inquiry to show, not generation of new examples.

This is the strongest single pedagogical move available because the example *is the methodology applied to itself* — the user employed AlignCraft to ask both "what should this book be called?" and "what should this book contain?". That's not a manufactured demonstration; it's the practice in motion. The book becomes a methodology that has been used to question its own contents — which is itself a credibility argument.

### Why Path B (disciplines chapter at end of Part III) is second-best, not equivalent

A simpler move is to add a single Thinking Disciplines chapter at the end of Part III without declaring Part IV at all. This was tested and demoted to second-place because:

- The disciplines are not patterns. Patterns are concrete recurring solutions to alignment problems. Disciplines are abstract cognitive operations. Putting disciplines at the end of "Part III: AlignCraft Patterns" mis-categorizes them, distorting the part's identity for a small structural win.
- Whether the chapter sits at "end of Part III" or "start of Part IV" is *one line of SUMMARY edit difference*. Path B saves no real work. Its only advantage is hesitancy: if the user is unsure what *all* of Part IV should contain, Path B avoids forcing that decision.
- That hesitancy is solvable by declaring Part IV minimally — just Chapter 13 — and letting the rest grow. There's no penalty for declaring a part with only one chapter and adding more later. There IS a penalty for leaving the README/SUMMARY contradiction in place.

The constructive seed from Path B's REFINE: if the user feels uncertain about Part IV's full shape, declare it minimally. Don't avoid declaring it.

### Why "the four pillars should be Part IV's organizing principle" was rejected

An interesting alternate framing: organize Part IV around the four pillars (Comparison, Measurement, Visibility, Explicitness) rather than around the disciplines. The pillars are currently underweighted in the book — they appear in a single section of Chapter 2 and never get dedicated treatment.

This alternate was tested and rejected on category grounds. The pillars are *quality criteria* — properties that alignment must have at every layer. The disciplines are *operations* — things you do to produce alignment. A "Method" part is operational by nature; pillars don't fit it as an organizing principle. Pillar-organized Part IV would teach readers what alignment must be without teaching them how to produce it.

The constructive seed from the rejection: a separate chapter — "The Four Pillars in Practice" — IS a valid future addition. It belongs alongside Chapter 13 in Part IV, treating each pillar as it applies across the six layers (4 × 6 = 24 specific applied prescriptions). That's a different chapter from the foundation, not a different shape for it.

### Why "Part IV as a separate companion artifact" was rejected

A genuinely contrarian inversion proposed taking Part IV *out* of the book entirely — making it a workshop, course, or runtime artifact (markdown files in the repo, slash-command flows) that the book references. The argument: in-repo artifacts evolve faster than published books, which matches the methodology's own pace.

This was killed on role-clarity grounds. The book is the *durable conceptual layer*; runtime artifacts are the *operational layer*. Both can exist, but they are different things. Part IV-as-companion-artifact would discard the book's investment in Part IV without resolving the README's promise. Worse, it creates two separate artifacts to maintain in step. Part IV in the book is correct.

The constructive seed: the runtime/companion-artifact framing is *correct for operational documentation* (per-command reference, hook setup details, version-specific notes). The slash-commands appendix and the `commands/` directory already serve this role. Part IV is conceptual; appendix 8 and the repo's README are operational. Both layers exist and complement each other.

### What the parallel housekeeping track does

The flanking moves (synthesis-page closer, subtraction pass, glossary update) are *not* alternatives to Path A. They are independent improvements with their own value, none of which require the primary recommendation to ship first. The user can do any combination in any order:

- The **synthesis page** at end of Part III — "AlignCraft on one page" — closes the most visible reader-pain (the book ending on a "Not finished yet" chapter) regardless of Part IV's status. One day of work; pure win.
- The **subtraction pass** addresses public-facing defects: the "Not finished yet" header in chapter_12; the 37-line stub in chapter_11; the `probe_tests_fixed copy.md` scratch file in chapter_7. Each fix is independent. Honest completion ("a brief version is below; the full treatment is in section X / Appendix Y") is better than the current "Not finished yet" admission.
- The **glossary update** in `chapter_0/01_terminology.md` — adding cognitive-loop-era terms — is a small change with disproportionate value because every other chapter can reference these terms confidently once they're defined.

These three are filed as Could-do items, listed individually in Next Actions.

### Confidence and caveats

The recommendation is rendered at **HIGH confidence on the structural-fix dimension** (the README/SUMMARY contradiction is concrete, textual, not interpretive) and **HIGH confidence on the repo/book parity dimension** (the disciplines and loop runners are observably central to the user's daily practice and observably absent from the book body).

The mild residual risk is on the *effort* dimension. The "curation" framing of Chapter 13 is correct in pattern but may understate the editorial labor; the chapter takes a focused week of work, not an afternoon of compilation. If that week-of-work is unavailable, the alternate path is to ship even narrower content — just declare Part IV in SUMMARY and write a 100-line "Coming soon" chapter with the goals and a forward-reference list. Even that minimal move closes the README/SUMMARY contradiction on day one.

---

## Next Actions

### MUST

- **What:** Declare Part IV in `src/SUMMARY.md`. Add the heading `# Part IV: The AlignCraft Method` (or equivalent) after the last entry in Part III. List Chapter 13 ("The AlignCraft Method") as the first entry, optionally with placeholder forthcoming entries (Cognitive Loop, Thinking Disciplines, Inquiry Folders, End-to-End Walkthrough).
  **Who:** the user.
  **Gate:** condition-bound — before the next public release of the book site, OR within one writing session of accepting this finding.
  **Why:** fixes the README/SUMMARY contradiction immediately. One-line edit; no chapter content required.

- **What:** Write the foundation chapter "The AlignCraft Method" (`src/chapter_13_method/01_the_method.md` or equivalent path). Open with one or two of the user's recent MVL+ inquiries (AlignCraft rename inquiry; this gap-analysis inquiry) as concrete examples that motivate the abstract sections. Then introduce, in this order: the cognitive loop, the seven thinking disciplines, the inquiry-folder mechanic, the disciplines-vs-layers mapping, and forward-references to the deferrable chapters.
  **Who:** the user.
  **Gate:** time-bound — within one focused week of the SUMMARY declaration; condition-bound — before the deferrable Part IV chapters are started.
  **Why:** delivers the structural fix in working form; closes the largest content gap (disciplines/loop untreated) at the right level of abstraction; reuses ~70% of substance from existing reference docs.

### COULD

- **What:** Add a "AlignCraft on one page" synthesis chapter or appendix at the end of Part III (e.g., `src/chapter_12.5_synthesis/on_one_page.md`). Single page (or single section) summarizing the six layers, four pillars, seven disciplines, two loop runners, and Part III's patterns in one diagram or one structured list.
  **Who:** the user.
  **Gate:** any time — independent of Part IV work.
  **Why:** closes the "book ends abruptly on a Not-finished-yet chapter" pain immediately. One day of work; pure win.

- **What:** Subtraction pass on Part III. Three independent edits: (a) finish or honestly-mark `chapter_11_offload/offload_pattern.md` (currently 37 lines); (b) replace the "Not finished yet" header in `chapter_12_vibe_testing/vibe_testing.md` with either a finished short version or "Coming in 1.x — see Appendix 8 for current usage"; (c) delete `chapter_7_run_probes/probe_tests_fixed copy.md` (a scratch file).
  **Who:** the user.
  **Gate:** any time — independent of Part IV work; suggested before the next public release.
  **Why:** removes publicly visible defects at low cost.

- **What:** Glossary update. Add cognitive-loop-era terms to `src/chapter_0/01_terminology.md`: cognitive loop, MVL / MVL+, inquiry, finding, thinking discipline (with one-line definitions or pointers to Part IV).
  **Who:** the user.
  **Gate:** any time — best done before or alongside Chapter 13 so that Chapter 13 can reference the terms without re-defining them.
  **Why:** disproportionately valuable for a tiny edit because every other chapter can reference the terms confidently.

- **What:** Future "Four Pillars in Practice" chapter — a separate Part IV chapter (after Chapter 13) treating each pillar (Comparison, Measurement, Visibility, Explicitness) as it applies across the six layers. Pillar-organized matrix (4 × 6 = 24 applied prescriptions).
  **Who:** the user.
  **Gate:** condition-bound — after Chapter 13 ships and before Chapter 17 (the walkthrough), if the four-pillars treatment is desired in Part IV at all.
  **Why:** gives the four pillars first-class treatment without forcing pillar-organization onto Part IV's overall shape (which is operational, not evaluative).

### DEFERRED

- **What:** Cognitive Loop chapter (Chapter 14), per-discipline chapters (Chapter 15, possibly multi-chapter), Inquiry Folders chapter (Chapter 16), End-to-End Walkthrough chapter (Chapter 17). The deferrable Part IV chapters.
  **Gate:** revival trigger — after Chapter 13 ships, when the user has a focused block for one of these. Each is independently writable given Chapter 13's vocabulary frame.
  **Why (if revived):** complete Part IV's full shape; lift the discipline reference docs into the book body; deliver the integration walkthrough that closes the methodology arc.

- **What:** AI-AI Collaboration chapter (the README mentions it; the book ignores it).
  **Gate:** revival trigger — when AI-AI workflows in the user's actual practice produce reusable patterns worth documenting; not before. Currently the book and the repo are both AI-Human focused.
  **Why (if revived):** delivers on a README promise that is currently latent.

---

## Reasoning

### The five-discipline path that produced this verdict

The inquiry passed through Exploration → Sensemaking → Decomposition → Innovation → Critique. Each step contracted the candidate space and tested the surviving recommendation against different pressures.

Exploration enumerated **17 candidates** — 9 new chapters and 8 reorganizations — including chapters on the four pillars, failure modes, AI-AI collaboration, hooks/automation, and a closing case study, plus reorganizations like splitting Part III, completing stubs, promoting Sense Making out of the appendix, and renumbering the alignment layers from 0–5 to 1–6 (a real internal inconsistency between the README's 1–6 numbering and Chapter 2's 0–5 numbering). Two leaders emerged early: **Part IV declaration** and a **Thinking Disciplines chapter**, with strong evidence that they are not competing but rather adjacent — the disciplines naturally belong inside the missing Part IV.

Sensemaking ran six perspectives on the leaders. The **Definitional/Consistency perspective** produced the load-bearing anchor (N6): Part IV is not just an addition; it's a fix to an existing internal inconsistency in the book (README promises Part IV; SUMMARY does not deliver it). The **Adversarial perspective** (N7) tested whether the patterns alone are sufficient to teach the methodology and confirmed they are not — patterns are nouns, not workflows; disciplines are not appendix material. Three ambiguities were resolved at HIGH confidence (multi-chapter Part IV vs single mega-chapter; whether to block Part IV on stub completion; what the foundation chapter contains).

Decomposition partitioned the work into seven pieces with explicit interfaces and ordering: **P1 (declare Part IV in SUMMARY) → P2 (foundation chapter) → P3/P4/P5 in any order (cognitive loop, thinking disciplines, inquiry folders) → P6 (walkthrough)**, with **P7 (Part III stub completion) as a fully independent parallel track**. The critical immediate-action path is P1 → P2.

Innovation generated 21 variations across 7 mechanisms (4 generators + 3 framers). Multi-mechanism convergence on the assembly: **declare Part IV (P1) + curation foundation chapter (P2 with Constraint Manipulation contrarian framing) + open with real MVL+ inquiry (P2 enriched by Combination Generic + Inversion Focused).** Two mechanisms surfaced flanking moves (synthesis-page, subtraction pass) as independently valuable. One contrarian (Part IV as separate companion artifact) was generated and tested.

Critique evaluated all candidates against 8 dimensions extracted from sensemaking (2 critical, 2 high, 3 medium, 1 low-medium). The strongest prosecution against the primary candidate ("curation framing is wishful thinking; reference docs are not chapter material") was answered on bounded-effort grounds: the work is editorial restructuring, real but bounded, sized at one focused week. The primary candidate SURVIVED on all 8 dimensions. Path B (disciplines chapter at end of Part III) was REFINED into "fold into Path A" because the SUMMARY edit is essentially free. Pillar-organized Part IV was REFINED into "separate Four Pillars in Practice chapter, not Part IV's shape" — pillars are evaluative, Method is operational. Companion-artifact replacement was KILLED on role-clarity grounds.

### Killed candidates (full record for transparency)

**KILL — Companion-artifact replacement for Part IV.** Genuinely contrarian inversion. Argument: in-repo artifacts evolve faster than published books, matching the methodology's own pace. Killed because the book is the durable conceptual layer; runtime documentation (slash-command appendix, repo README) is the operational layer. Both layers exist and complement each other; replacing one with the other discards the book's investment AND fails the README promise. The constructive seed from the kill: companion artifacts ARE correct for operational documentation, and that role is already served by Appendix 8 and the repo's READMEs.

**REFINE → fold into A — Path B (Thinking Disciplines chapter at end of Part III).** Identified as a smaller-commitment alternate. Demoted because (a) the disciplines are categorically different from patterns, so placing them at the end of Part III mis-categorizes them, and (b) declaring Part IV is essentially free (one SUMMARY line), so the only difference between Path A and Path B is conceptual, not effort-based. The constructive seed: if the user is uncertain about the *full* shape of Part IV, declare it minimally and let it grow.

**REFINE → separate chapter — Pillar-organized Part IV.** Argued for a different shape: organize Part IV around the four pillars instead of around the disciplines. Rejected because pillars are evaluative (quality criteria) and Method is operational (cognitive operations). The constructive seed: a separate "Four Pillars in Practice" chapter IS valid and valuable as a Part IV chapter alongside Chapter 13, treating each pillar as it applies across the six layers — but it does not displace the foundation chapter's discipline-organized framing.

### Why this verdict is robust

When five discipline paths converge on the same answer through different evaluation lenses, the answer is robust against any single path being wrong. Exploration converged on Part IV via the gap-noticing lens. Sensemaking converged via the internal-consistency lens. Decomposition confirmed the work was tractable. Innovation produced multi-mechanism convergence (4 mechanisms on the primary candidate) plus the assembly with two enrichments (curation framing, real-inquiry opener). Critique tested the assembly against 8 weighted dimensions and found no failed dimension.

The recommendation is also unusually well-supported by *internal* evidence — the book's own README, the repo's own discipline reference docs, the user's own recent practice — rather than by external arguments about what methodology books should generally contain. The user does not have to take the recommendation on faith; the supporting evidence is in their own files.

---

## Open Questions

### Refinement Triggers

- **If a focused week of editorial work is unavailable, the foundation chapter scope contracts.** Trigger: time-bound — when the user has less than ~5 hours of writing time before the next desired ship date. Refined recommendation: ship just the SUMMARY declaration plus a 100-line "What this part will cover" chapter that lists the topics, references the existing reference docs, and forward-references the deferrable chapters. The README/SUMMARY contradiction still gets fixed on day one; the substance fills in over time.

- **If readers feedback after Chapter 13 ships indicates the disciplines need *more* depth than the foundation chapter provides** — promote Chapter 15 (per-discipline chapters) up the priority order. Trigger: observable — multiple reader questions or issues asking for more detail on a specific discipline.

- **If the four pillars become the operational organizing principle for the user's daily practice** (rather than the layers + disciplines), reconsider Part IV's overall shape. Trigger: condition-bound — observable shift in how the user themselves talks about the methodology.

### Deferred (intentionally not answered here)

- **Whether Chapter 15 ("The Thinking Disciplines") should be one chapter or seven.** Decomposition flagged this as a DV2 trigger: treat as one chapter; split if execution reveals coupling problems. The decision is best made during writing, not in advance.

- **Exact subtitle conventions for Part IV** (e.g., "The AlignCraft Method" vs "Applying the Method" vs "The Method in Practice"). The current name in the README ("The AlignCraft Method") is fine; bikeshedding the subtitle is out of scope of the recommendation.

- **AI-AI collaboration coverage.** README mentions it; the book and the repo are both AI-Human focused. Listed as Deferred until the user's own practice produces reusable AI-AI patterns.

### Research Frontiers

- **How to keep book and repo from re-diverging after Part IV ships.** This finding closes today's gap but doesn't prevent next year's. A possible future inquiry: "what process or convention keeps the book in step with the repo as the repo evolves?" Candidates include a versioning convention, a per-discipline release-checklist, a periodic audit, or treating the book as a first-class deliverable in the same release cadence as the command pack.
