# Exploration — AlignCraft vs AlignCraft Naming

## Mode and Entry Point
- **Mode:** Possibility exploration. The territory is conceptual — name candidates and the dimensions along which a name fits or misfits the book's thesis. Candidates must be generated, not found.
- **Entry point:** Signal-first. Two candidates are pre-named (AlignCraft, AlignCraft). Probe those first, then scan outward for completeness (rule: completeness before novelty in possibility mode — scan obvious adjacent candidates before stopping).

---

## Cycle 1 — Coarse Scan: What dimensions does a book name vary along?

**Dimensions found:**
1. **Central metaphor** — what shape/object does the name evoke? (architecture, craft, tool, place, motion, container)
2. **Connotation register** — engineering / artisan / academic / playful / philosophical
3. **Active vs static** — does the name name a *thing you have* or a *thing you do*?
4. **Fit to content structure** — does the metaphor map to how the book is organized?
5. **Fit to content thesis** — does the metaphor match what the book preaches?
6. **Audience signal** — who self-selects in/out on hearing it?
7. **Term overload in dev culture** — does the suffix already mean something dominant elsewhere?
8. **Discoverability/uniqueness** — collisions with existing brands?
9. **Pronouncability/memorability**
10. **Already-invested brand assets** — sunk cost (user has explicitly waived this)

**Signals detected:**
- High: dimensions 4 and 5 may pull in different directions for this specific book — its *structure* is layered (six layers) but its *thesis* is "codify instinctive practice" (craft-flavored).
- High: dimension 7 — "stack" is overloaded with "tech stack" in dev culture. "Craft" carries the Software Craftsmanship lineage (Pete McBreen, etc.) and gaming suffix (Minecraft, StarCraft, WarCraft).
- Medium: dimension 3 — Stack reads static/noun-y; Craft reads as both noun and verb.

Resolution decision: **Zoom in** on dimensions 4, 5, and 7 — they carry the highest information for the question.

---

## Cycle 2 — Probe: What does the book actually preach?

Pulling from `src/README.md` and project archaeology:

**Thesis statements verbatim:**
- "AlignCraft is a stack of six fundamental alignment layers for AI-driven action"
- "structured methodology with repeatable patterns that bridge the gap between coding by feel and engineering discipline"
- "systematic, repeatable foundations and fine-grained control at every stage of development"
- "This book doesn't introduce new concepts. Instead, it codifies what many developers already do instinctively, turning scattered practices into a cohesive methodology"
- Four pillars: "Alignment requires Comparison. Comparison requires Measurement. Measurement requires Visibility. Visibility requires Explicitness."

**Two distinct things the book is doing:**
- (a) **A taxonomy** — six discrete layers where misalignment can occur. Layered, decomposable, stack-shaped.
- (b) **A practice** — four pillars + iteration + workflow patterns + commands/skills/hooks. Practiced, repeatable, craft-shaped.

**The book's center of gravity** — what does it spend most pages on?
- Part I: Foundations (philosophy)
- Part II: AI Collaboration (relational practice)
- Part III: Patterns (DevDocs, Anchor, Probe, Fuzzy Architecture) — these are *practices*
- Part IV: The Method — *practice*
- Appendices: prompts, command pack — *tools of a practice*

The **taxonomy is the framing device**; the **practice is the substance**. The taxonomy occupies the introduction; the practice occupies the body.

This is a meaningful asymmetry. **Signal: HIGH.**

---

## Cycle 3 — Probe: Connotation analysis of the two candidates

### "Stack"
- **Tech-stack overload:** strongest association in dev culture (MEAN, LAMP, MERN, "what's your stack"). When developers hear "AlignCraft," priming pulls them toward "set of layered tools/technologies" — i.e., a list of components.
- **Architectural feel:** static, modular, swappable layers. OSI stack, network stack, software stack.
- **Static noun:** a stack is something you have or assemble, not something you do.
- **Engineering register:** infrastructure, systems, low-level. Cool, neutral, technical.
- **Maps to:** the six-layer taxonomy literally. "Stack of six alignment layers" is internally consistent.
- **Mismatches:** the practice/methodology body of the book. A "stack" doesn't suggest you *practice* anything — it suggests you *use* it.

### "Craft"
- **Software Craftsmanship lineage:** explicit tradition since Pete McBreen (2002) and the Manifesto for Software Craftsmanship. Carries weight with senior ICs and quality-focused developers.
- **Gaming-suffix association:** Minecraft, StarCraft, WarCraft, World of Warcraft. Mostly positive — memorable, evokes building/mastery — but can read youthful in formal-corporate contexts.
- **Noun + verb:** "a craft" (the discipline) and "to craft" (the action). Active.
- **Artisan register:** practiced, mastered, skill-developed. Warm, human, deliberate.
- **Maps to:** the practice/methodology body. The four pillars, the patterns, the workflows — these are crafts.
- **Mismatches:** the layered-stack framing in the introduction. "AlignCraft has six layers" reads slightly oddly — a craft doesn't typically have "layers," it has techniques/skills/tools.

### Cross-cutting observation
The book's own opening line — "AlignCraft is a stack of six fundamental alignment layers" — is *internally tautological with the current name*. If the name changed to AlignCraft, that opening sentence would have to change too. The book would say "AlignCraft is the practice of maintaining alignment across six layers of AI-driven action." Notice: the **practice** sentence is closer to what the rest of the book teaches.

**Signal: HIGH.** The current name forces the book's framing toward "thing/inventory." A craft framing would force it toward "practice/discipline." The latter matches the book body better.

---

## Cycle 4 — Scan: Adjacent candidates (completeness in possibility mode)

Per the framework's "completeness before novelty" rule, here are the obvious adjacent candidates a domain expert would expect on the map:

**Standard suffixes (architectural / infrastructural):**
- AlignCraft — current; layered, infrastructural
- AlignFrame — framework; methodology-flavored but vague
- AlignKit — toolkit; undersells the philosophy
- AlignOps — operations; narrows to runtime/process

**Practice / craft suffixes:**
- AlignCraft — proposed; craft, practice, discipline
- AlignWorks — practice + plurality; old-craftsman feel ("works of...")
- AlignWright — old craft term (wheelwright, playwright); too archaic
- AlignForge — heavy artisanship; metalworking

**Process / motion suffixes:**
- AlignFlow — process; vague, overloaded with workflow tools
- AlignLoop — iteration; matches the book's loop content but narrow

**Place / institution suffixes:**
- AlignLab — experimental; fits the inquiry-loop subsystem but undersells the methodology
- AlignDojo — practice space; on-brand for craft but precious

**Qualitative / abstract:**
- AlignCore — fundamentals; bland
- AlignWay — path/method; zen-y, vague

**Jump scan — completely different angles:**
- Drop "Align" prefix: "Vibecraft" (collides with "vibe coding" framing), "ScaffoldedDev," "Disciplined AI." Verdict: dropping "Align" loses the load-bearing thesis word — the entire book is structured around alignment as THE problem. Constraint confirmed: the prefix should remain "Align."
- Two-word title: "The Alignment Discipline," "Aligned Development." Verdict: less brandable, harder to community-ize.

**Surprise check:** the candidate space is reasonably mapped. The two strongest candidates remain AlignCraft and AlignCraft, with AlignWorks as a plausible distant third (carries practice connotation without gaming overtones).

---

## Cycle 5 — Probe: The decision pivot

The exploration converges on a single sharp question that downstream disciplines (sensemaking, decomposition, innovation, critique) will operate on:

> **Should the book name reflect its STRUCTURE (a stack of layers) or its SUBSTANCE (a practiced discipline)?**

If structure → AlignCraft wins.
If substance → AlignCraft wins.
If both equally → either works; tie-breakers (overload, active/static, audience signal) decide.

The book's own positioning — "codifies what developers do instinctively, turning scattered practices into a cohesive methodology" — is a substance claim, not a structure claim. The taxonomy is *how* the substance is organized.

This is the highest-value insight from exploration; the verdict itself belongs to critique.

---

## Final Deliverable — The Structural Map

### 1. Territory Overview
Three regions explored:
- **A. The book's content** — taxonomy (stack-shaped) + practice (craft-shaped); practice dominates by page-count and substance
- **B. Connotation space of "Stack" and "Craft"** — Stack: infrastructural/static/overloaded; Craft: artisan/active/lineage-bearing
- **C. Adjacent name candidates** — AlignCraft, AlignCraft, plus 8+ alternates spanning architectural / craft / process / place / abstract

### 2. Inventory (possibility mode candidates)

| Candidate | Metaphor | Active/Static | Maps to structure? | Maps to substance? | Notes |
|---|---|---|---|---|---|
| AlignCraft | Architectural | Static | YES (literal) | NO | Current; tech-stack overload |
| AlignCraft | Craft/discipline | Active | Partial | YES | Software Craftsmanship lineage; gaming suffix |
| AlignWorks | Practice/output | Both | Partial | YES | Less overloaded but less brandable |
| AlignFlow | Process | Active | NO | Partial | Vague, workflow-overloaded |
| AlignKit | Toolkit | Static | NO | Partial | Undersells |
| AlignFrame | Framework | Static | YES | Partial | Bland |
| AlignForge | Smithing | Active | NO | YES | Heavy connotation |
| AlignLab | Place | Static | NO | Partial | Experimental flavor |
| AlignOps | Operations | Active | NO | Partial | Narrow |
| AlignDojo | Practice space | Static | NO | YES | Precious |

### 3. Signal Log

| Signal | Priority | Probed? | Disposition |
|---|---|---|---|
| Tension between book's structure (stack) and substance (practice) | HIGH | Yes | Carried to sensemaking |
| "Stack" overloaded with tech-stack meaning | HIGH | Yes | Connotation cost noted |
| "Craft" carries Software Craftsmanship lineage | HIGH | Yes | Connotation benefit noted |
| Gaming-suffix association of "Craft" | MEDIUM | Yes | Mostly positive, register-dependent |
| Stack reads static; Craft reads active | MEDIUM | Yes | Aligns with practice framing |
| Six-layer structure literally is a "stack" | MEDIUM | Yes | Literal match for current name |
| Existing brand assets (LinkedIn, logo) | LOW | Deferred | User waived sunk-cost concern |
| Trademark / SEO collisions | LOW | Deferred | Out of scope; user did not request |
| AlignWorks as dark-horse candidate | LOW | Yes | Carried as alternative |

### 4. Confidence Map

| Region | Confidence | Notes |
|---|---|---|
| Book's thesis and content shape | **Confirmed** | Read directly from src/README.md, archaeology summary |
| Connotation analysis of Stack and Craft | **Confirmed** | Probed with concrete cultural references |
| Candidate landscape (Align-prefix space) | **Scanned** | Surface-level enumeration; not all probed |
| AlignWorks as alternative | **Scanned** | Surface only; could probe further if it survives critique |
| Trademark / domain availability | **Unknown** | Out of scope — user did not request, and naming-fit is the asked question |
| Reader reactions / market test data | **Confirmed absent** | No A/B data; treated as a content-fit question, not a market question |

### 5. Frontier State and Convergence Assessment
**Convergence check (all three criteria):**
- **Frontier stability:** YES — new scans no longer produce new structural features.
- **Declining discovery rate:** YES — Cycle 4's broad scan added marginal candidates only; Cycle 5 produced a synthesizing pivot, not new territory.
- **Bounded gaps:** YES — remaining unknowns (trademark/SEO, market data) are explicitly out of scope and bounded by neighboring explored regions.
- **Jump scan performed:** YES — explored dropping the "Align" prefix entirely and two-word titles; produced no surprise (constraint confirmed).

**Convergence verdict: ACHIEVED.** The map is sufficient for sensemaking to operate on.

**Frontier — stable on these axes:**
- Structure-fit vs Substance-fit
- Static vs Active
- Overload (Stack) vs Lineage (Craft)
- Internal-tautology cost when changing the name

The map is sufficient for sensemaking to operate on.

### 6. Gaps and Recommendations

**Bounded gaps (acceptable):**
- Trademark / SEO availability — relevant but out of scope of the user's question (which is fit-to-content)
- Empirical reader reaction data — none exists; this is a fit-judgment, not a market test

**Recommendation for next discipline:**
The sharp question to hand to **sensemaking** is: *"Which dimension of the book — its layered structure or its practiced substance — should the name foreground?"* All other considerations (overload, register, active/static) are secondary tie-breakers that pivot on this primary choice.
