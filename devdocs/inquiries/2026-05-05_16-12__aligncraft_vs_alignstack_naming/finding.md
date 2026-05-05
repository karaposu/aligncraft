---
status: active
---
# Finding: AlignCraft vs AlignCraft Naming

## Question

The user is considering renaming the book currently titled **AlignCraft** to **AlignCraft**. They have stated that they don't mind changing all references and that switching cost is unimportant — they want to know whether AlignCraft is a better fit for what the book actually preaches.

**Goal:** a clear verdict (Keep AlignCraft / Switch to AlignCraft / Neither) with structural reasoning that ties each name's connotations to the book's thesis. The user should be able to make a confident, low-regret decision in one read.

---

## Finding Summary

- **Yes — AlignCraft is the better name.** The book's center of gravity is its practiced methodology (patterns, workflows, commands, tools), not its six-layer taxonomy. The taxonomy is a diagnostic frame that organizes the practice; the practice is the substance. A name should signal substance, and the substance here is craft.

- **Recommended form: title plus subtitle.** Use **AlignCraft** as the title (carries practice metaphor, becomes the brand handle for community/repeated reference) and a subtitle that retains the structural metaphor — e.g., *"The Six-Layer Alignment Stack for AI-Driven Development"* — so the only real benefit of "Stack" (its literal mapping to the six layers) is preserved exactly where readers need it (cover, search results, descriptions). The user can choose any subtitle wording; the structural point is to keep "stack" or "layers" in the descriptive line.

- **AlignCraft alone is acceptable but second-best.** It still wins on substance, audience, and lineage, but forfeits the literal-six-layer-mapping benefit that the subtitle preserves.

- **Keeping AlignCraft as-is fails on two critical grounds:** (a) substance fit — it foregrounds the framing (taxonomy) instead of the substance (practice); (b) internal consistency — the existing README opens with "AlignCraft is a stack of six fundamental alignment layers," then immediately states the book "codifies what developers do instinctively, turning scattered practices into a cohesive methodology." Those two consecutive sentences make conflicting promises about what the book IS. The current name preserves that contradiction; AlignCraft resolves it.

- **No third coined name dominates** AlignCraft. AlignWorks is the strongest fallback if AlignCraft is rejected for any reason, but it lacks the Software Craftsmanship lineage that AlignCraft inherits for free.

- **Out of scope (per user direction):** sunk-cost / brand-investment, marketing-SEO discoverability. Trademark availability was not assessed — flagged as a pre-rename due-diligence step (see Next Actions).

---

## Finding

### Why this is a structural question, not a taste question

A book name is a promise to the reader about what they'll get. When the name's central metaphor matches the book's center of gravity, every reference to the book reinforces what it is. When the metaphor mismatches, the title creates dissonance every time someone reads it and then reads the body.

The current book has two distinct things going on:

1. **A taxonomy** — six discrete layers where misalignment between human intent and AI implementation can occur (Workspace, Task, Action-Space, Action-Set, Coherence, Outcome). This is layered, decomposable, **stack-shaped**.
2. **A practice** — four pillars (Comparison, Measurement, Visibility, Explicitness), the patterns chapters (DevDocs, Anchor, Probe Tests, Fuzzy Architecture, Archaeology, etc.), the four-part method, the appendices full of prompts, and the installable command pack. This is practiced, repeatable, **craft-shaped**.

The two metaphors don't fit under a single suffix. So the name has to pick which one to foreground.

### Which one is the book's center of gravity

By page count, by chapter count, and by where the book's original intellectual property lives, the answer is **the practice**.

The taxonomy occupies roughly one page (the README's opening). The practice occupies the body — twelve-plus chapters of patterns, a dedicated method section, an appendix set, and the command/skill pack. Several of those patterns (Archaeology, the DevDocs convention, Fuzzy Architecture) appear novel in this synthesis, not just repackaging. The taxonomy is a framing device that gives readers a diagnostic vocabulary for *where* alignment fails; the patterns are the load-bearing content for *how* to maintain alignment.

The book's own positioning statement makes the same point: it says it "codifies what developers do instinctively, turning scattered practices into a cohesive methodology." That sentence is the literal definition of craft — converting tacit skill into explicit practice. The book IS a craft, made systematic. The taxonomy organizes the craft; it isn't the craft itself.

### Why "Stack" hurts more than it helps

In the dev community, "Stack" is heavily overloaded by *tech stack* — "what's your stack?", MEAN/LAMP/MERN, the architectural connotation of layered runtime infrastructure. When a developer encounters "AlignCraft" cold, the priming pulls them toward "set of layered tools or technologies." That's a reasonable read of the *taxonomy* but a misleading read of the *book*.

"Stack" also reads as a static noun — something you *have*, not something you *do*. Methodology books succeed when readers see them as practice. "Stack" makes the book sound like infrastructure.

The single real benefit of "Stack" is that it literally maps to "six layers." The opening sentence "AlignCraft is a stack of six fundamental alignment layers" is internally tautological with the name. That benefit appears once (in the opening) and pays a cost throughout the body.

### Why "Craft" works for this book and audience

"Craft" has a serious lineage in the senior-developer audience: the Software Craftsmanship movement (Pete McBreen 2002, the Manifesto for Software Craftsmanship 2009, Robert Martin's *The Clean Coder*, the *Apprentice Patterns* book by Hoover and Oshineye, multiple ongoing professional conferences). Anyone in the methodology-conscious developer audience hears that lineage and takes the book seriously by association.

"Craft" reads as both noun and verb — you *have* a craft and you *craft* things. That makes it work as practitioner language ("you should AlignCraft this codebase") in a way that "Stack" cannot ("you should AlignCraft this codebase" is awkward).

The gaming-suffix association (Minecraft, StarCraft, WarCraft) exists but is recessive in professional dev contexts. Nobody confuses "Software Craftsmanship" with Minecraft. In any audience that buys methodology books, the Software Craftsmanship signal dominates.

### Why the title-plus-subtitle assembly is the strongest answer

Industry-standard methodology books use title-plus-subtitle: *"Refactoring: Improving the Design of Existing Code"*, *"Domain-Driven Design: Tackling Complexity in the Heart of Software"*, *"The Pragmatic Programmer: From Journeyman to Master"*. The title functions as the brand handle (community, conferences, repeated reference); the subtitle functions as the content-promise (search, browsing, first-page assessment).

For this book, that pattern produces:

> **AlignCraft: The Six-Layer Alignment Stack for AI-Driven Development**

(or any equivalent phrasing the user prefers — the structural requirement is just that the subtitle carry "stack" or "layers" so the structural metaphor is preserved.)

This assembly:
- Foregrounds practice in the brand handle (matches substance).
- Preserves structural framing in the content-promise (neutralizes the only real argument for AlignCraft).
- Inherits Software Craftsmanship lineage **and** captures readers searching for "alignment stack."
- Works for community-language ("AlignCraft community"), search-language ("Six-Layer Alignment Stack"), and substance-language simultaneously.

It does not require dropping any of the structural content the existing book has built. The taxonomy stays intact; only the framing metaphor on the cover changes.

### What the existing README needs regardless

The current README opens with two consecutive sentences that contradict each other in metaphor: one calls the book "a stack of six fundamental alignment layers" and the next says the book "codifies what developers do instinctively, turning scattered practices into a cohesive methodology." Even if the user *kept* AlignCraft, this opening should be rewritten so the name and the mission point in one direction. Renaming to AlignCraft is the lower-cost path because it lets the rewrite preserve the mission sentence (which is more accurate to the body) and just adjust the framing sentence around the new name.

### Confidence and caveats

The verdict is rendered at **HIGH confidence on substance fit and internal consistency** (the two critical dimensions). The mild residual risk on AlignCraft is the gaming-suffix priming for younger or non-Software-Craftsmanship-exposed readers — a non-fatal, register-dependent concern that the subtitle context further dampens.

Trademark availability and SEO performance were not evaluated — the user's stated question was content-fit, and these checks belong to a pre-rename due-diligence step rather than to this inquiry.

---

## Next Actions

### MUST

- **What:** Pick a final subtitle and update `src/README.md`'s opening so the name and the mission point in one direction (replace "AlignCraft is a stack of six fundamental alignment layers" with a sentence that matches the chosen title).
  **Who:** the user.
  **Gate:** before the next public release of the book site (condition-bound: triggered by the rename decision).
  **Why:** removes the framing-vs-mission contradiction in the existing README that this inquiry surfaced. This change is required even if the user decides to keep AlignCraft — the contradiction is independent of the name choice.

### COULD

- **What:** Run a trademark / domain-availability check on "AlignCraft" before committing to the rename.
  **Who:** the user (or a brief search via standard trademark and domain tools).
  **Gate:** before publicly announcing the rename (condition-bound).
  **Why:** prevents discovering a collision after the rename is committed. Out of scope for this inquiry by user direction, but cheap to run before the rename ships.

- **What:** Update the LinkedIn community name, repository description, logo files, command pack references, and installer scripts to reflect the new title.
  **Who:** the user.
  **Gate:** within one release cycle of the rename (time-bound, after the README update lands).
  **Why:** the user has already accepted this work; doing it as one batch keeps the brand consistent.

### DEFERRED

- **What:** Reconsider the broader question of whether a coined-word title is right at all (versus a descriptive phrase title like *"The Alignment Discipline"*).
  **Gate:** revival trigger — if AlignCraft underperforms in community recognition after six months of public use, or if a stronger phrase-title alternative emerges from reader feedback.
  **Why (if revived):** sensemaking and innovation flagged that descriptive phrase titles dominate methodology-book conventions (e.g., *Refactoring*, *Domain-Driven Design*). The user's stated question constrained scope to a binary coined-word choice, but the deferred option is genuinely viable in the long run if brand-style coinage shows weakness.

---

## Reasoning

### Why AlignCraft + structural subtitle was chosen over the alternatives

This inquiry evaluated four candidate paths. Each was tested adversarially on seven dimensions extracted from the book's stated mission and structure: substance fit, internal consistency, audience signal, community/movement durability, term-overload risk, lineage credibility, and verb-ability. Sunk-cost and marketing/SEO were excluded per the user's stated scope.

**Survivor (top-ranked): AlignCraft + structural subtitle.** Passes both critical dimensions (substance fit, internal consistency) and adds incremental wins on audience, community, and lineage. The only adversarial objection — that title-plus-subtitle telegraphs author indecision — was answered structurally: industry-standard methodology books use this pattern (*Refactoring*, *Domain-Driven Design*, *The Pragmatic Programmer*) without indecision-signaling. The subtitle does real work: it preserves the "literal six-layer mapping" benefit of "Stack" exactly where readers see content-promises (cover, search results), without sacrificing the practice metaphor in the brand handle.

**Survivor (second-ranked): AlignCraft alone.** Same substance, audience, community, and lineage wins. Forfeits the literal-six-layer-mapping benefit. Acceptable if the user prefers a tighter cover, but Pareto-dominated by the assembly.

**Killed: keep AlignCraft.** Defense was thin once the user explicitly waived sunk-cost. The remaining defense was epistemic conservatism — "we might be wrong about the practice/structure ratio." Prosecution responded with concrete textual evidence: the existing README's two consecutive opening sentences are in metaphor-conflict (taxonomy framing vs. practice mission). That contradiction is in the file the user wrote; it is not contested. Defense from epistemic humility cannot survive contradiction-from-evidence on critical dimensions. Verdict: KILL.

**Killed as primary: third coined names (AlignWorks, AlignForge, etc.).** AlignWorks is the strongest alternative — it carries practice connotation without gaming overtones. But it lacks the Software Craftsmanship lineage that AlignCraft inherits for free, and the user did not ask for a third candidate. No third candidate Pareto-dominates AlignCraft on weighted dimensions. Verdict: KILL as primary; flag AlignWorks only as a fallback if AlignCraft is rejected post-decision for an unforeseen reason.

### Killed earlier (during innovation, before critique)

- **Stack-as-modular-menu argument** — the idea that "Stack" subtly signals "swappable/modular layers" was a real argument *for* AlignCraft that hadn't been made. But the book doesn't actually present the six layers as swappable; all six are required for full alignment. The argument exists but contradicts the book's own content. Killed.

- **Marketing/SEO frame favoring AlignCraft** — "AlignCraft" may be more discoverable for searchers using "stack" as a keyword. Real but bounded: the user explicitly framed the question as content-fit, not marketing. Filed as out-of-scope flag, not verdict-changer.

### What the alternative perspectives produced

The exploration step considered ten candidate names spanning architectural, craft, process, place, and abstract suffix categories. The sensemaking step ran six perspectives (technical, human/user, strategic, risk, resource, definitional) and flagged that the strongest single argument — the README's internal contradiction — came from the definitional/consistency perspective, not from any subjective taste judgment. The innovation step applied all seven mechanisms (combination, absence recognition, domain transfer, extrapolation, lens shifting, constraint manipulation, inversion) and produced five-mechanism convergence on AlignCraft as primary, plus a two-mechanism convergence on the title+subtitle assembly. The critique step ran adversarial prosecution-defense-collision on each candidate and reached the same verdict via a different path.

When five separate analytical paths converge on the same answer, the answer is robust against any single path being wrong.

---

## Open Questions

### Refinement Triggers

- **If reader/community feedback after six months of public use indicates the AlignCraft title is underperforming on recognition** — re-open the broader question of coined-word vs descriptive phrase titles (the deferred option above). Trigger: observable — if the LinkedIn community growth or organic search traffic shows a measurable drop after the rename relative to pre-rename baseline (with seasonality controlled for).

- **If trademark or domain availability check reveals a hard collision on AlignCraft** — re-open the candidate evaluation with AlignWorks as the new top candidate. Trigger: observable — collision found in standard trademark/domain search.

### Deferred (intentionally not answered here)

- Trademark and domain availability for "AlignCraft" — explicitly out of scope of the user's stated question; flagged as a Could-do action.
- Whether a phrase title (e.g., *"The Alignment Discipline"*) might dominate both AlignCraft and AlignCraft in the long run — out of scope of the user's binary question; preserved as a deferred future inquiry.
