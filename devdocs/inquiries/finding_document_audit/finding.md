---
status: active
---
# Finding: Finding Document Audit — Produce a Better Writing Guide

## Question

**What common problems exist across finding.md documents produced by the extended SIC loop (E→S→D→I→C) — specifically around language ambiguity, missing summaries, and unclear next-action guidance — and what structural improvements to the finding.md template would systematically fix them?**

### Goal

(1) Corpus-grounded problem identification; (2) pattern extraction across working and failing findings; (3) concrete template refinements with per-section purpose/format/content rules; (4) next-action clarity protocol; (5) backward compatibility (no retroactive rewrite); (6) updated `/MVL+` spec.

---

## Finding Summary

- **The existing `finding.md` template** — the document produced at the end of every inquiry in this project, with 4 sections (Question, Finding, Reasoning, Open Questions) as originally defined in the `value_extraction_design` inquiry — **gains 2 new sections for a total of 6.** The new sections are a **Finding Summary** (3-7 scannable bullets with the specific answer, placed between Question and Finding) and a **Next Actions** section required when the finding proposes changes.
- **The Next Actions section has three labeled subsections** — MUST (required for the finding's value to be realized), COULD (worth considering but not required), and DEFERRED (deliberately postponed with a named trigger for revival). Each item inside these subsections carries four fields: **What** (the specific action), **Who** (the discipline, agent, or file that acts), **Gate** (the concrete trigger condition), and **Why** (the expected impact — what this action produces or prevents).
- **The existing Open Questions section** — currently a flat bullet list in all 18 reviewed findings — **is split into 4 typed subsections:** Monitoring (questions observable after more data accumulates), Blocked (questions waiting on specific upstream work), Research Frontiers (open questions with no known path), and Refinement Triggers (conditions under which a decision in this finding should re-open for re-examination).
- **Three writing-style rules are introduced for use inside finding documents:** (1) hedging specificity (any softening phrase must name what specifically is uncertain); (2) cross-reference format (references to other findings use the full path on first mention, bare name thereafter, with relationship label when applicable); (3) gate specificity (any trigger, deferred condition, or revival criterion must be time-bound, condition-bound, or observable).
- **Enforcement lives in one place.** The `/MVL+` command (this project's orchestrator for the extended SIC loop) gains a rewritten finding-production prompt that contains everything an author needs — the 6-section structure, the non-ambiguity principle, the three style rules, the Next Actions format, and the typed Open Questions categories. No separate style file; no separate self-check layer. One canonical instruction source prevents drift between places.
- **The changes are corpus-validated.** Six of seven hypothesized problems were confirmed during exploration by reviewing 18 finding documents — 14 from this project (vibe-driven-development) and 4 from a related project (chatforge). The problems are systematic gaps in the current template, not stylistic preferences.
- **The 4-section argumentative core is preserved.** Existing findings remain valid under the old template — no retroactive rewrite is required. New findings adopt the refined 6-section template. The refinement is **size-adaptive**: findings under ~100 lines may skip optional sections; longer findings must include the applicable ones.

---

## Finding

### 0. Non-ambiguity and understandability (the foundational principle)

The entire template refinement exists to serve ONE foundational principle: **every sentence in a finding must be unambiguous and understandable to a reader who has not seen this inquiry's internal work.** This principle precedes all other rules. Every section specification, style rule, and enforcement layer is an OPERATIONALIZATION of this principle, not a substitute for it.

**The failure mode:** internally-referential shorthand. Authors embedded in an inquiry write sentences that make sense to them — because they've been living with the inquiry's vocabulary, acronyms, section numbers, internal file references, and historical context — but fail for a reader who hasn't. The author's own self-check is primed by this context; they pass their own test while producing text that fails an actual outside reader.

**What internally-referential shorthand looks like:**

❌ *"Template extends from 4 sections to 6"* — Which template? Whose? In what context? The bullet assumes the reader knows.

❌ *"Open Questions gets 4 typed subsections"* — Which Open Questions? Why typed?

❌ *"Three style rules added — hedging specificity, cross-reference format, gate specificity"* — Rules for what? In what document? A new reader sees a list of jargon terms with no anchor.

**What the same information looks like without shorthand:**

✅ *"Our existing finding.md template (defined in the `value_extraction_design` inquiry) has 4 sections — Question, Finding, Reasoning, Open Questions. This audit adds 2 more sections: a brief Finding Summary after the Question, and a Next Actions section with categorized action items."*

✅ *"The Open Questions section of the finding template currently uses flat bullet lists. This audit proposes splitting it into 4 typed subsections so readers can distinguish urgent items from research frontiers."*

✅ *"Three writing-style rules are added for use inside finding documents: (1) Hedging specificity — when a sentence contains a hedge like 'mostly works,' the author must name what specifically is uncertain; (2) Cross-reference format — links to other findings use full paths on first mention; (3) Gate specificity — deferred items name a concrete trigger for revival."*

**The rule.** Before writing any sentence in a finding, the author asks: *"Would a reader with no prior exposure to this inquiry understand this sentence as written?"* If not, the sentence names its subject, provides the minimal context required, and avoids undefined jargon. This rule applies to every section — Finding Summary bullets, Finding prose, Next Actions items, Reasoning, Open Questions — not just the summary.

**Why this is Finding 0, not Finding 4 or Finding 7.** The other sections describe STRUCTURE (6-section template), RULES (3 style rules), ENFORCEMENT (3 layers). Those are the HOW. Non-ambiguity is the WHY. Without this principle stated plainly at the top, readers might interpret the other sections as stylistic preferences. Stated at position 0, the other sections become operationalizations of this principle — they're the means; non-ambiguity is the end.

**Niche terms get defined on first use.** Findings should use precise language, but precision doesn't excuse unexplained vocabulary. Any word that a general reader outside the author's specialty might not know gets a brief inline definition the first time it appears in the finding.

Examples of niche terms this project uses that need first-use definitions:

- **Hedging** (from writing/rhetoric): a phrase that softens a claim — e.g., "mostly works," "generally sound," "potentially useful." Authors use hedges to signal uncertainty; if a hedge doesn't name WHAT is uncertain, it's lazy hedging.
- **Prosecution / Defense / Collision** (from the `/td_critique` discipline): adversarial testing where prosecution constructs the strongest case AGAINST an idea, defense constructs the strongest case FOR it, and collision produces the verdict.
- **Popperian** (from Karl Popper's philosophy of science): a claim is Popperian when it is falsifiable — stated specifically enough that concrete evidence could prove it wrong.
- **Mechanism coverage** (from the `/innovate` discipline): applying at least one Generator mechanism + one Framer mechanism to a seed, so the innovation space is explored systematically.
- **SIC loop** (this project's term): the E → S → D → I → C discipline pipeline (Exploration → Sensemaking → Decomposition → Innovation → Critique).

The rule isn't "avoid niche terms" — niche terms are often precise and useful. The rule is "on first use in a finding, define the term briefly inline." Once defined, the term may be used freely. If the term appears in the Finding Summary, the definition lives there; subsequent sections may use the term without redefining.

**What counts as niche.** If the term is known by a general literate reader (e.g., "argument," "dependency," "context"), it's not niche. If the term belongs to a specific discipline, domain, or project vocabulary (writing/rhetoric, philosophy of science, cognitive science, project-specific conventions), it's niche and gets defined.

**Scope of the non-ambiguity principle:** this applies to findings at writing time, when the author has inquiry context the reader lacks. The AUTHOR-VS-READER asymmetry is compensated by: (a) inquiry-specific terminology always explained; (b) niche terms (domain vocabulary outside general literacy) defined on first use; (c) project-wide common vocabulary used freely without re-definition.

---

### 1. The New Template Structure

```markdown
---
status: active
refines: devdocs/inquiries/X/finding.md         [if applicable]
---
# Finding: [inquiry name]

## Question

[From _branch.md — the question and goal. Comes first so the reader
has context for what was being asked before seeing the answer.]

## Finding Summary

[The specific answer as 3-7 bullet points. Each bullet is a complete claim
that satisfies the non-ambiguity principle (Section 0) — readable
standalone by someone who has not seen this inquiry's internal work.
Bold key terms for scannability. Not the inquiry scope. Bullets preferred
over paragraphs. Every bullet names its subject and provides minimal
context for a new reader.]

## Full Finding

[The full answer. Complete, self-contained, non-compact. Subsections
allowed (numbered or named) when length >100 lines. The Finding Summary
is the brief answer; this section is the detailed one.]

## Next Actions                                  [required when finding proposes changes]

### MUST
[Items required for the finding to be realized.
Per-item format:
  - **What:** specific action
  - **Who:** discipline / agent / file / person
  - **Gate:** time-bound OR condition-bound OR observable trigger
  - **Why:** expected impact — what this action produces or prevents;
             why it earns its place over alternatives]

### COULD
[Items worth considering but not required. Same per-item format as MUST.]

### DEFERRED
[Items deliberately deferred, with trigger specifying revival.
Per-item format:
  - **What:** specific action
  - **Gate:** concrete condition under which this item revives
  - **Why:** expected impact IF revived — what the action would produce]

## Reasoning

[Why this finding over alternatives. KILLs with reasoning. SURVIVEs
with why they held. Contradictions reconciled.]

## Open Questions

### Monitoring
[Observable after N inquiries / when Y completes.]

### Blocked
[Cannot be answered until X ships / Y happens.]

### Research Frontiers
[No known path; requires new investigation.]

### Refinement Triggers
[Specific conditions under which a locked decision re-opens.]
```

**Section order rationale:** Question first provides context (what was being asked); Finding Summary provides the answer as scannable bullets; Full Finding expands the answer completely; Next Actions states what to DO; Reasoning justifies the decision; Open Questions captures the frontier. A reader who already knows the Question can skip straight to Finding Summary; a reader acting on the finding can skip to Next Actions; a skeptic reading for verification goes to Reasoning.

**Size-adaptive application.** "Size-adaptive" in this finding means the template's optional sections appear based on the finding's length and content. Short findings (≤100 lines total) may skip optional sections — for example, the Changes from Prior block is omitted unless the finding refines or supersedes a prior finding; Next Actions is omitted if the finding does not propose any changes; Open Questions subsections may flat-list when only one of the four categories applies. Long findings (>100 lines) must include the applicable optional sections. The 100-line threshold is pragmatic rather than structural — authors apply judgment, but a 150-line finding without at least a Finding Summary is a smell.

### 2. The three style rules

**Rule 1 — Hedging specificity**
A **hedge** is a phrase that softens a claim — e.g., "mostly works," "generally sound," "potentially useful," "with caveats." Authors use hedges to signal uncertainty about a claim. Hedges must name WHAT is uncertain AND WHY — otherwise the reader knows the author is unsure but not about what.
- Acceptable: *"MEDIUM confidence — depends on empirical signal-independence test (P12)"*
- Unacceptable: *"mostly sound with caveats"* (no named condition)
- Failure detection: if a sentence contains a hedge and the reader can't identify the specific uncertainty, the hedge fails.

**Rule 2 — Cross-reference format**
When one finding refers to another finding, it uses the full path to the referenced finding's `finding.md` on first mention within the finding, and the bare inquiry-folder name (e.g., `thinking_space_primitives`) on subsequent mentions. If the reference carries a **relationship type** (a labeled dependency between findings — the project currently uses `REFINES`, `SUPERSEDES`, `IMPACTS`, `CORRECTS`, and `CONTINUES FROM`), the label is included explicitly.

- First reference in a finding: `devdocs/inquiries/thinking_space_primitives/finding.md`
- Subsequent reference: `thinking_space_primitives`
- With a relationship label: `REFINES: thinking_space_primitives (state what specifically from that finding is load-bearing for this one)`
- In a finding's frontmatter: use the full path inside `refines:` / `supersedes:` / `impacted_by:` / `corrects:` / `continues_from:` fields.

**Rule 3 — Gate specificity**
A **gate** in this finding means a named condition that must hold before some deferred or conditional action is taken. Gates, triggers, and deferred conditions must be **time-bound** (tied to a specific time or count), **condition-bound** (tied to a specific observable event), OR **observable** (tied to a measurable signal).

- Acceptable: *"after 30 inquiries accumulate"* (count-bound), *"when the calibration data reaches N ≥ 30 per discipline"* (observable), *"when the first version of `/intuit` ships"* (event-bound — `/intuit` is a future project discipline for handling intuition)
- Unacceptable: *"eventually,"* *"when appropriate,"* *"as needed"* — no reader can tell whether these conditions have fired
- Failure detection: if a reader can't tell whether the gate has fired by looking at the project's state, the gate is not specific enough.

### 3. The reader-extraction contract (framing principle)

The **reader-extraction contract** is the principle that the template's success is measured not by what authors include but by what readers extract, within specific time budgets. The template's purpose is operational: when a new reader opens a finding, they should be able to pull out specific kinds of information in specific amounts of time.

The three time budgets:

- **30-second extraction:** a reader should get the specific answer by reading only the Finding Summary.
- **60-second extraction:** a reader should know the proposed next actions by reading only the Next Actions section (when the finding has one).
- **5-minute extraction:** a reader should grasp the complete argument by reading the full finding.

Template compliance passes or fails against these extraction expectations. The 30-second check is satisfied when the Finding Summary's bullets each satisfy the non-ambiguity principle (Section 0 of this finding) — a reader with no prior exposure to this inquiry understands each bullet as written.

### 4. Enforcement: a single canonical location

Two terms appear below that need first-use definitions:

- **`/MVL+`** — this project's slash command that runs the extended SIC loop (E → S → D → I → C) on an inquiry. Its specification lives in `commands/MVL+.md`. At the end of a successful iteration, `/MVL+` produces the `finding.md` file — which is why the finding-production instructions live inside `/MVL+`.
- **`ITERATION COMPLETE`** — a named section inside `commands/MVL+.md` containing the instructions `/MVL+` follows when all 5 discipline files exist. Its YES-branch is the production-side step that generates `finding.md`.

**Single-layer enforcement.** All instructions for how a finding should be written live in one place: the `ITERATION COMPLETE` section of `commands/MVL+.md`. That section's YES-branch carries the full finding-production instruction: the 6-section structure (Question / Finding Summary / Finding / Next Actions / Reasoning / Open Questions), the optional `Changes from Prior` block for refinement findings, the non-ambiguity principle (Section 0 of this finding) with concrete examples of internally-referential shorthand and its corrected form, the three style rules (hedging specificity / cross-reference format / gate specificity), the Next Actions per-item format (What / Who / Gate / Why), and the four Open Questions category subsections.

Why one location rather than three. An earlier design considered splitting enforcement into three layers — a production prompt, a separate style-rules file, and an author-side self-check checklist. That split was rejected: multiple locations invite drift (rules updated in one place but not another), duplicate the same content for different audiences, and convert enforcement into bureaucracy. One canonical instruction source is simpler and harder to diverge from. The author writing a finding under `/MVL+`'s guidance IS the enforcement — no separate layer is needed.

### 5. Key craft principles

A note on two terms used below:

- **Corpus:** in this finding, "corpus" means the collection of all `finding.md` files across an AlignCraft project's `devdocs/inquiries/` folder. The audit that produced this finding examined two corpora — the vibe-driven-development project's corpus (14 findings) and the chatforge project's corpus (4 findings). Chatforge is a separate project that uses the same SIC loop and finding format.
- **Index-readiness:** a design orientation where each Finding Summary is written so it works as a standalone entry in a hypothetical corpus-wide index (a list of all findings' summaries). This biases authors toward scannable bullets + canonical terminology, even when no actual index exists today.

The craft principles:

- **Summary-first authorship.** Write the Finding Summary BEFORE the detailed Finding body. The summary becomes a commitment the Finding elaborates. If the Finding body reveals the summary needs revision, revise it — the starting discipline is commitment-first, not summary-after.
- **Index-readiness principle.** Finding Summaries should read as standalone entries in a hypothetical corpus-wide index — scannable bullets using vocabulary consistent across the corpus. This is a design-driver biasing author word choice; it is not an enforcement gate.
- **Changes-from-Prior for refinement findings.** When a finding refines / supersedes / corrects a prior finding, an optional block placed before the Question section documents What's Preserved / What's Changed / What's New / Migration. Three of the four chatforge findings currently carry this kind of lineage content as a bold paragraph ABOVE their Question section (an organic workaround — the existing template had no canonical home for it). This rule formalizes that placement into a named optional section.
- **Type-specific gate examples.** Next Actions items use common patterns (process change / spec change / monitoring / deferred / investigation) as examples, not an enumerative taxonomy. If an action doesn't fit a common pattern, authors invent a new gate form appropriate to the action.
- **Why field per Next Action item.** Each Next Action item includes a Why field naming the expected impact — what this action produces or prevents; why it earns its place over alternatives. Deferred items name the expected impact IF the action is ever revived. This scopes impact-thinking to individual Next Actions (where it fits cleanly) rather than forcing an Impact section at the finding level (where some kinds of findings — pure definitions, conservation verdicts, refinements — don't match the "expected benefit" framing).

### 6. Backward compatibility

Existing 18 findings remain valid under the old template. No retroactive rewrite required. New findings use the new template. Over time, authors may opt-in to Finding Summary + Next Actions additions for their own old findings if useful.

### 7. Canonical location

All finding-writing instructions live in ONE file: `commands/MVL+.md`, in the YES-branch of the `ITERATION COMPLETE` section. That location contains the 6-section template, the non-ambiguity principle with examples, the three style rules, the Next Actions item format, and the Open Questions category subsections. No other file needs to be created for this refinement to be effective.

This is a deliberate narrowing from an earlier design that split these across multiple files.

### 8. Example finding demonstration

`devdocs/inquiries/post_completion_navigation/finding.md` serves as the demonstration base — medium-length (58 lines), clear next-actions currently scattered in Finding prose, close to the new template structure. A demonstration will show Finding Summary added, Next Actions extracted from prose into typed subsections, Open Questions categorized (3 items become Monitoring / Refinement Trigger / Research Frontier).

### 9. Honest limits

Two niche terms used below:

- **MVP (Minimum Viable Product):** the smallest version of a proposed system that delivers its core value. Here, "the MVP" means "the first shippable version of the refined template — the rewritten `/MVL+` finding-production prompt — before any deferred enhancements."
- **Lint / linting:** automated tooling that scans text (or code) for violations of style or structure rules. A lint checker for findings would mechanically flag missing sections, wrong cross-reference formats, bare hedges without named uncertainty, etc.
- **LLM (Large Language Model):** the class of AI systems that currently produce and read most of this project's documents.

With those defined:

- **What the MVP CAN do:** produce readable findings where the answer extracts in under 30 seconds from the Finding Summary; next-actions extract in under 60 seconds from the Next Actions section; refinement lineage is explicit via the optional Changes from Prior block; the three specificity rules (hedging / cross-reference / gate) filter out lazy patterns that a reader can detect.
- **What the MVP CANNOT do:** force the author writing under the new `/MVL+` prompt to genuinely internalize the rules. An author primed by inquiry context may follow the template's structure while still producing internally-referential shorthand that fails an outside reader — the author's priming is invisible to the author. The template reduces this risk by naming the failure mode explicitly (Section 0) and showing concrete examples, but does not eliminate it.
- **What requires work we don't have:** automated linting for findings (deferred until manual enforcement demonstrably fails); a corpus-wide Finding Summary index (deferred until the corpus is too large to navigate by folder alone); design adaptations for LLMs as primary readers (deferred as premature — human readers are the current primary audience).

---

## Next Actions

### MUST

- **What:** Rewrite the YES-branch of the `ITERATION COMPLETE` section in `commands/MVL+.md` so the finding-production instruction generates the 6-section template (Question / Finding Summary / Finding / Next Actions / Reasoning / Open Questions), embeds the non-ambiguity principle (Section 0 of this finding) with its failing-bullet-vs-corrected-bullet examples, embeds the three style rules (hedging specificity, cross-reference format, gate specificity), embeds the Next Actions per-item format (What / Who / Gate / Why), and embeds the four Open Questions category subsections (Monitoring / Blocked / Research Frontiers / Refinement Triggers).
  **Who:** edit `commands/MVL+.md`
  **Gate:** before any new inquiry closes and produces a finding under the new template. Until the edit lands, `/MVL+` continues producing 4-section findings regardless of what this finding documents.
  **Why:** the template refinement has no effect on newly-produced findings until the production prompt generates the new structure. Everything this finding describes is latent until `commands/MVL+.md` is updated. This single edit activates the entire refinement.

### COULD

- **What:** Produce an example finding demonstrating the new template, using `devdocs/inquiries/post_completion_navigation/finding.md` as the base
  **Who:** next session writing
  **Gate:** useful when onboarding users to the new template; not required for template to ship
  **Why:** the template spec is abstract; a concrete worked example reduces the gap between reading the spec and producing a conforming finding. Reduces author friction for the first few findings under the new template.

- **What:** Opt-in retroactive update of selected existing findings to use the new template (e.g., add Finding Summaries to the 2-3 longest findings for corpus-scanning benefit)
  **Who:** author judgment per finding
  **Gate:** only when an author is already editing an old finding for other reasons
  **Why:** the longest existing findings (thinking_space_primitives, thinking_disciplines_audit) are where missing Finding Summaries most hurt readers. Retrofitting them adds scannability to the highest-payoff candidates without forcing a mass-migration project.

### DEFERRED

- **What:** Automated linting (validation script for 6-section structure / binary self-check / style-rule compliance)
  **Gate:** if manual self-check proves insufficient after ~10 new-template findings show rubber-stamp pattern
  **Why (if revived):** mechanical enforcement eliminates the rubber-stamp failure mode the author self-check is vulnerable to. Lint catches structure violations and specific style-rule violations (e.g., cross-reference format, bare hedges) that author priming might miss. Worth building when manual enforcement demonstrably fails; not worth building preemptively.

- **What:** Corpus-wide Finding Summary index (concrete artifact that the index-readiness principle currently references aspirationally)
  **Gate:** if corpus grows beyond ~30 findings AND cross-finding discovery becomes a bottleneck
  **Why (if revived):** a generated index of all Finding Summaries would let a reader scan the entire system's decisions quickly and locate findings by topic. The index-readiness principle currently biases TL;DR writing toward this use case; the actual index pays off when the corpus is too large to navigate by folder structure alone.

- **What:** Process-lessons section per finding (meta-learning about the loop itself)
  **Gate:** if `devdocs/improvement_observations.md` proves insufficient for capturing process insights
  **Why (if revived):** per-inquiry meta-lessons about the SIC loop (which mechanism was load-bearing, where sensemaking drifted, etc.) currently have no canonical home. Adding a dedicated section per finding captures learning that `improvement_observations.md` (a cross-cutting file) may lose. Worth doing only if the cross-cutting file demonstrably drops important signals.

- **What:** LLM-primary reader design (structured fields, machine-parseable markers beyond current frontmatter)
  **Gate:** when LLMs emerge as primary consumers of findings at significant scale
  **Why (if revived):** if future operation produces many more machine-reads of findings than human-reads, optimizing for machine-extraction (typed fields, stable schema) pays off. Currently premature — human readers are the primary audience and machine-parseability of free-text sections is already adequate via frontmatter.

---

## Reasoning

### Why the conservatism bar is WEAKER here than in prior audits

A **conservatism bar** is the threshold of evidence or benefit a proposed change must clear before being adopted. A prior inquiry in this project — `devdocs/inquiries/thinking_disciplines_audit/finding.md`, which audited the set of thinking disciplines — applied a strict bar (it required "HUGE OBVIOUS BENEFIT" to justify any change). This finding's conservatism bar is lower, for three reasons:

1. **The user named specific problems explicitly.** The user's feedback listed three concrete complaints — "ambiguity of the language, lack of summary section, and ambiguity of proposed next actions." That is a specific diagnosis, not the more open-ended question ("is there anything to change?") that drove the prior audit.
2. **The corpus validated the complaints.** Six of the seven hypothesized problems were confirmed against the 18-finding corpus during exploration. The complaints are systematic gaps in the current template, not stylistic preferences.
3. **Adjacent document genres agree.** RFCs (formal specifications used in internet standards work), ADRs (Architecture Decision Records used in software design), release notes, and git commit messages all conventionally lead with a summary. The current finding template is the outlier, not the norm.

The change is therefore justified not by a single argument but by three-way convergence — corpus evidence + reader-want + adjacent-genre convention all point the same direction.

### Why the 4-section core is preserved

The original template (from `value_extraction_design`) established: Question → Finding → Reasoning → Open Questions. Each serves a distinct role; together they form the argumentative structure. The audit found NO structural flaw in this 4-section core; the problem is what surrounds and navigates it (Finding Summary inserted between Question and Finding; Next Actions between Finding and Reasoning; typed Open Questions). Refinement is ADDITIVE — the core stays; new sections extend.

### Why Finding Summary goes AFTER Question (not before)

Two placements for the summary section were considered:

- **Pre-Question** (first thing after title) — matches adjacent-genre conventions where RFCs, academic papers, ADRs, press releases, and git commits lead with summary before context
- **Post-Question** (between Question and Finding) — the reader sees what was being asked BEFORE seeing the answer

The post-Question placement was chosen. Reasoning: the Question section is short and provides context; the Finding Summary is the brief answer; the Finding section is the detailed answer. Question → Summary → Detail is a natural flow where each section builds on what the reader just saw. Pre-Question placement would front-load the answer to readers who might not yet know the question — useful for returning readers who know what was asked, but disorienting for first-time readers.

The organic workarounds observed in the two corpora are both evidence that authors WANT a summary section somewhere, even though the old template didn't have one: the chatforge project's findings placed a bold paragraph BEFORE the Question section; this project's (vibe-driven-development's) longer findings placed a numbered subsection titled "The short answer" as the first item inside Finding. Different authors, different projects, same instinct. The post-Question placement chosen here respects the reader's need for context-then-answer, while a dedicated section header — rather than a subsection buried inside Finding — keeps the summary visible on open.

**Name: "Finding Summary" not "TL;DR".** TL;DR is informal; Finding Summary is professional and self-describing. The section name tells the reader exactly what to expect — a summary of the finding.

### Why Next Actions is required only when finding proposes changes

Prosecution considered making Next Actions mandatory. Rejected because some findings are pure analysis / definition / conservation verdicts where forcing "next actions" produces ceremonial items ("continue building the system"). Content-driven requirement prevents ceremony.

Prosecution also considered making it fully optional. Rejected because optional sections get silently skipped — the current problem. Content-driven requirement (when finding proposes changes, MUST include; otherwise optional) resolves both failure modes.

### Why non-ambiguity is stated as Finding 0, not as a self-check item

Earlier drafts of this finding operationalized the "readable standalone" requirement as a self-check item — an author simulates posting the Finding Summary to a colleague and judges whether it would make sense. This operationalization was retired because it failed in practice: the author is primed by inquiry context; their own self-check judges their own bullets as understandable while a naive reader cannot parse them. The self-check was a rubber-stamp in disguise.

The replacement is stronger: state the principle plainly and prominently (Finding 0), name the specific failure mode (internally-referential shorthand), show concrete examples of the failure vs. the correction, and apply the principle to ALL sections (not just Finding Summary). The principle becomes the gate for every sentence in a finding, not an afterthought test for one section.

### Why the index test was refined to the index-readiness principle

Prosecution in critique: the "index test" references an imaginary corpus-wide index. Authors can't validate against it. The test as stated is aspirational.

Defense: even aspirational, it biases wording toward scannability and canonical terminology.

Resolution: demote the test to a PRINCIPLE embedded in the `/MVL+` finding-production instruction. Principles don't require enforcement machinery; they bias author word choice. Keeps the design-driver value; removes the bogus test.

### Why single-layer enforcement (not three)

An earlier design for this finding proposed three enforcement layers: a rewritten `/MVL+` production prompt, a separate style-rules file at `enes/finding_style.md`, and an author-side self-check checklist. Prosecution against that design: three layers × multiple checks = bureaucracy without an enforcement mechanism that actually works. Authors would rubber-stamp self-check items primed by their own context; the separate style file would drift out of sync with the prompt; the overall system would have three places to get inconsistent.

The resolution was to collapse to one layer: everything lives in the `/MVL+` command's `ITERATION COMPLETE` section. The author writing under that instruction set IS the enforcement. No separate files, no separate checklists, no layers to coordinate. If the instruction in `/MVL+` is clear enough, the author produces a compliant finding; if it isn't, no number of additional enforcement layers will save it. Simplicity here is structural, not minimalist — multiple layers were duplicating effort, not providing defense-in-depth.

### Why summary-first authorship with revision allowance

Prosecution: commitment-before-knowing produces wrong Finding Summaries; authors drift silently.

Defense: the commitment is a STARTING DRAFT. Revision after writing the body is allowed; what's enforced is the STARTING DISCIPLINE — write Finding Summary first, then elaborate. Final Finding Summary must satisfy the non-ambiguity principle (Section 0) — every bullet readable standalone by a reader with no prior exposure to this inquiry.

This prevents the "buried answer" failure mode. If the answer is unclear at the start, the author has to clarify it THEN; they can't defer to "the reader will figure it out from the prose."

### Why size-adaptive at ~100 lines

Short findings (<100 lines) don't exhibit the problems that motivate the new template. Adding ceremony to short findings is burden without benefit. The ~100-line threshold is pragmatic, not structural — authors apply judgment. Findings that are 150+ lines without at least a Finding Summary are smells; findings under 80 lines with a Finding Summary are fine but not required.

### Killed candidates with seeds preserved

During the innovation phase of this inquiry, several candidate refinements were generated, evaluated, and rejected. Each rejected candidate preserves a **seed** — a lesson from the rejection that informed the candidates that survived. Each item below names the rejected candidate and the seed extracted from it:

- **Hedges forbidden; replace with numeric confidence percentages** — killed as too extreme. Some hedges are structurally necessary (honest uncertainty about a claim); removing all linguistic hedging produces either false confidence or awkward numeric claims. Seed preserved: the hedging specificity rule (Rule 1 in Section 2) requires the author to name WHAT is uncertain, which addresses the real concern (lazy hedging that says nothing specific) without forbidding honest hedges.
- **Drop the "self-contained finding" constraint** — killed; contradicts a locked design decision from the `value_extraction_design` inquiry that originally defined findings as self-contained argumentative documents. Seed preserved: cross-references can carry SOME context load (for example, "this finding refines X's Y claim" without re-explaining X's claim in full), but findings must still stand on their own for a first-time reader.
- **Design findings primarily for LLM readers, not humans** — killed as premature. Current readers are primarily human; designing for machine-primary consumption now would distort choices toward machine-parseable structures that harm human readability. Seed preserved: findings already carry structured frontmatter for basic machine parsing; revisit if machine-reads come to dominate.
- **Wholesale adoption of court-ruling document structure** (Holding / Rule of Law / Reasoning / Dissent as mandatory sections) — killed; renaming existing sections would break backward-compatibility with the 18 existing findings. Seed preserved: the useful subset of the court-ruling pattern — explicit lineage when a finding refines a prior — survives as the "Changes from Prior" optional section.
- **Academic-paper structure as lead framing** (Abstract / Introduction / Methods / Results / Discussion) — demoted from novelty to background. Accurate as a description of what the new template resembles, but not a novel contribution.
- **Automated linting for finding structure and style compliance** — deferred rather than killed. Valuable but premature; revisit if the manual self-check demonstrably fails after several findings use the new template and show a rubber-stamp pattern.
- **A per-finding "process lessons" section capturing meta-learning about the SIC loop run** — deferred. The project already has `devdocs/improvement_observations.md`, a cross-cutting file for loop-level observations. Adding a per-finding section is only worth it if that cross-cutting file proves insufficient.
- **The "index test" as a self-check item** — refined rather than killed. The index test would have asked authors to validate their Finding Summary against an imaginary corpus-wide index. Since no such index exists, the test was aspirational. Refined into the **index-readiness principle** — a design orientation biasing TL;DR writing toward standalone-scannability, without forcing a test against a nonexistent artifact.

### Reconciliation with prior meta-findings

Two earlier findings in this project already addressed the finding.md template. This audit is the second iteration of their work — **additive**, not a replacement:

- `devdocs/inquiries/value_extraction_design/finding.md` — the finding that originally defined the 4-section argumentative structure (Question → Finding → Reasoning → Open Questions). Its structure is preserved as the core of the new template; this audit adds sections around it, not instead of it.
- `devdocs/inquiries/finding_production_prompt/finding.md` — the finding that specified the prompt `/MVL+` uses to generate `finding.md` at iteration-close. The MUST item "Rewrite `/MVL+` ITERATION COMPLETE YES-branch" in this finding's Next Actions updates the prompt originally specified there.

Both earlier findings' load-bearing claims are preserved: findings are **argumentative documents, not archives**; the finding-production prompt uses a **reader-persona framing** that prevents compression; the **four-section core** remains at the center. What this audit adds on top is: scale-handling for long findings (the Finding Summary for 30-second extraction; the Next Actions section for 60-second actionability; typed Open Questions for navigation) plus style discipline (the three style rules in Section 2 of this finding).

---

## Open Questions

### Monitoring

- **Do authors actually apply the non-ambiguity principle (Section 0) in practice, or do they fall back into internally-referential shorthand because they're primed by inquiry context?** Observable after ~5 findings use the new template — read them from a cold-start perspective and check whether Finding Summary bullets are parseable without prior context.
- **Does summary-first authorship feel natural, or does it become a ritual that authors dodge (write placeholder first, then write real Finding Summary last)?** Observable after ~10 findings.
- **Does the `/MVL+` finding-production prompt reliably produce compliant findings, or do authors regularly produce findings that violate structure or style?** Observable after ~20 findings written under the new prompt. If the prompt alone proves insufficient, the Refinement Triggers (below) name what to escalate to.
- **How often do authors use the Changes from Prior block?** Observable across refinement findings over time.
- **Reader-navigation metadata** — a proposed optional header block for long findings containing fields like "audience," "estimated read time," and "prerequisite findings" — was considered during innovation but is not in the shipping template. If a future finding would have benefited from such a block, authors should flag it. Kill criterion: if 20 long findings have shipped without anyone wanting it, retire the concept from the deferred list.

### Blocked

(No currently-blocked items — all MUST actions are self-contained text edits.)

### Research Frontiers

- **Adjacent-genre patterns we may have missed** — the audit surveyed RFCs, ADRs, academic papers, release notes, git commits. Other genres (e.g., medical case reports, legal briefs, patent applications) might have structural patterns worth importing.
- **LLM-primary reader mode** — if LLMs become the dominant consumer of findings, what design shifts? Currently deferred as premature; worth monitoring as LLM capabilities scale.
- **Corpus-wide scannability artifacts** — what would an actual corpus-wide Finding Summary index look like? Could it be auto-generated from findings? Currently aspirational principle.

### Refinement Triggers

- **If the `/MVL+` finding-production prompt bloats beyond what an author can realistically hold in mind while writing:** split the oversized parts into an auxiliary instruction file referenced from the prompt. Trigger: the prompt section in `commands/MVL+.md` grows so large that authors skip parts of it. The single-layer design chosen in this finding assumed the prompt stays compact; if that assumption fails, add a second location deliberately rather than letting the prompt degrade.
- **If the reader-navigation metadata concept (see Research Frontiers) sees zero adoption for 20+ long findings:** formally retire the concept from the deferred list so future inquiries don't re-propose it.
- **If the non-ambiguity principle (Section 0) proves insufficient on its own:** authors may need concrete external validation — a second reader who has not seen the inquiry reads the Finding Summary cold and reports whether each bullet is parseable. Add this as a gated step if self-application fails after several findings.
- **If the 100-line size-adaptive threshold proves wrong** (short findings suffer without structure, or long findings skip structure they need): re-examine the threshold with fresh evidence from findings written under the new template.
- **If summary-first authorship is abused** (authors write placeholder summaries, ship the detailed Finding body, then back-fill the summary — defeating the commitment-first discipline): enforce stricter starting discipline in the `/MVL+` prompt, or shift to system-generated Finding Summaries derived from the critique step's output.
