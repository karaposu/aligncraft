# Critique — AlignCraft vs AlignCraft Naming

## User Input
`devdocs/inquiries/2026-05-05_16-12__aligncraft_vs_AlignCraft_naming/_branch.md`

Question: Is "AlignCraft" a better book title than "AlignCraft" given what the book preaches?

---

## Phase 0 — Dimension Construction

Extracting evaluation dimensions from the sensemaking output and the user's stated goal:

| # | Dimension | What it asks | Extracted from | Weight |
|---|---|---|---|---|
| D1 | **Substance fit** | Does the name foreground the book's primary substance (practiced methodology) rather than its framing device (taxonomy)? | Sensemaking I1, I2, S2, M5 | **Critical** |
| D2 | **Internal consistency** | Does the name produce an opening sentence that is coherent with the book's body? | Sensemaking N6 (opening-line tautology analysis) | **Critical** |
| D3 | **Audience signal** | Does the name self-select the right reader (senior IC, methodology-conscious dev) without misleading the wrong reader (someone expecting a tech-stack guide)? | Sensemaking N2, M3 | **High** |
| D4 | **Community/movement durability** | Does the name work as a discipline brand for years — workshops, conferences, practitioner-language — not just a book title? | Sensemaking N3, Innovation Extrapolation | **High** |
| D5 | **Term-overload risk** | Does the name collide with a dominant existing meaning in the dev community that primes wrong expectations? | Sensemaking I4 | **Medium** |
| D6 | **Lineage credibility** | Does the name connect to a serious professional tradition rather than feeling invented or twee? | Sensemaking I5, Innovation Domain Transfer | **Medium** |
| D7 | **Verb-ability** | Can the name function in practitioner language ("you should X this codebase")? | Innovation Constraint Manipulation focused | **Low-Medium** |
| D8 | **Switching cost / status quo preservation** | Does keeping the existing brand outweigh the gain from a switch? | User input — explicitly waived | **Excluded** |
| D9 | **Marketing/SEO discoverability** | Does the name help conversion-oriented discovery? | Innovation Lens Shifting generic | **Excluded** (out of scope per user goal) |

**Stake level:** Low. The decision is easily reversible (the book has a small footprint to update, and the user has stated it). Burden of proof: **innocent until proven guilty** — prosecution must demonstrate a clear problem to KILL a candidate.

**Dimension validation:** D1 + D2 together test whether a name fits the book as a unified artifact. D3 + D4 test reader-and-community fit. D5 + D6 + D7 test linguistic cost/benefit. D8 + D9 are explicitly excluded by user scope. This covers the perspectives sensemaking checked. No critical perspective is uncovered.

---

## Phase 1 — Landscape Construction

**Viable region:** A name that scores well on D1, D2 (critical) and at least passably on D3, D4 (high). Failures on medium/low dimensions are acceptable.

**Dead region:** A name that fails D1 (foregrounds the wrong substance) OR D2 (creates persistent internal inconsistency). Either fatal alone.

**Boundary region:** A name that passes D1+D2 but has a non-fatal weakness on D3, D4, D5, or D6. Survivable with explicit positioning support (e.g., a subtitle).

**Unexplored regions in the candidate set so far:**
- Phrase titles (descriptive, not coined) — sensemaking and innovation flagged these but they're outside user's stated scope (a binary AlignCraft vs AlignCraft question)
- Hybrid title+subtitle solutions — innovation produced one (the assembly); critique must test it

---

## Phase 2 — Adversarial Evaluation

### Candidate A: AlignCraft (replace AlignCraft with AlignCraft, no subtitle change)

**Prosecution (strongest case AGAINST):**
The book's most distinctive structural feature is the six-layer taxonomy. "Stack" is a technically precise word for that taxonomy; "Craft" is not. Anyone who reads the book and then looks at the title "AlignCraft" gets a *softer* signal than the book delivers — the book is rigorous, taxonomic, methodologically dense, and the title undersells that. A reader expecting a craft manual finds an engineering taxonomy and feels misled.

Further: "Craft" in 2026 is contaminated by the gaming-suffix (Minecraft, StarCraft, WarCraft) for a sizable portion of the dev population — particularly younger devs. While Software Craftsmanship has lineage, the lineage *is* itself sometimes derided ("craft-bro," "yet another manifesto"). The user is opening their book to a population that may roll its eyes.

The strongest single objection: **AlignCraft sacrifices precision for warmth.** The book is precise; the title becomes warm. This is a measurable mismatch.

**Defense (strongest case FOR):**
The book's MISSION (per its own README) is "to codify what developers do instinctively, turning scattered practices into a cohesive methodology." That sentence is the literal definition of craft — converting tacit skill into explicit practice. The taxonomy exists to organize the practice; it is not the practice itself. The mismatch the prosecution worries about (warmth vs precision) is in fact the *book's actual claim* — "this is craft, made systematic." A title that reads "stack" hides the book's mission and over-emphasizes its structural framing.

The Software Craftsmanship lineage is a feature, not a bug, in the audience that buys methodology books. The gaming-suffix association is recessive in professional contexts (compare: nobody mistakes "Software Craftsmanship" for Minecraft). The prosecution's warmth-vs-precision dichotomy is false: craft IS precision, applied through practice.

**Collision:**
The prosecution's strongest claim is that "Stack" is a more precise word for the six-layer taxonomy. Granted — but precision FOR WHAT? If the book's center of gravity were the taxonomy, this would be decisive. It isn't. The taxonomy is one page; the practice is the book. Precision applied to the wrong target is misalignment, not virtue. Defense survives.

**Position:** Passes D1 (substance fit) strongly, D2 (consistency) strongly, D3 (audience) strongly, D4 (community) strongly, D6 (lineage) strongly, D7 (verb-ability) strongly. Marginal on D5 (gaming-suffix risk recessive but present).

**Verdict: SURVIVE.**
Caveat: D5 (term-overload toward gaming) is a non-fatal real risk. Mitigated by subtitle context.

---

### Candidate B: AlignCraft + structural subtitle ("The Six-Layer Alignment Stack for AI-Driven Development")

**Prosecution:**
A title-plus-subtitle construction is a hedge. The user is being told they can keep both metaphors and not choose — but the book WILL be referenced colloquially by its title alone. "Have you read AlignCraft?" loses the subtitle entirely. So the assembly does no real work that AlignCraft alone doesn't do; it just adds verbiage. Worse, it telegraphs indecision: the author couldn't pick one metaphor, so they used both.

Also: a subtitle invoking "Stack" and "Layer" doubles the technical-jargon density of the cover. A reader scanning it gets BOTH "craft" AND "stack" AND "layer" AND "AI-driven" — that's four marketing concepts colliding in one cover.

**Defense:**
A title-plus-subtitle is the *industry standard* for technical books, not a hedge. Look at "Refactoring: Improving the Design of Existing Code," "Domain-Driven Design: Tackling Complexity in the Heart of Software," "The Pragmatic Programmer: From Journeyman to Master." Books with both a brand-style title AND an explanatory subtitle outperform either alone in the methodology category. The title functions as the brand handle (community, conferences, repeated reference); the subtitle functions as the content-promise (search, browsing, first-page assessment).

Importantly, the subtitle solves the *one real residual benefit* of "Stack" — its literal mapping to the six-layer taxonomy. By embedding "Six-Layer Alignment Stack" in the subtitle, the structural metaphor is preserved exactly where readers need it (on the cover, in search results, in the first sentence of any description).

**Collision:**
The prosecution's "indecision" framing is rhetorically punchy but structurally weak: industry-standard book naming demonstrably uses title+subtitle without indecision-signaling. The "jargon density" point is real but minor — most cover designs handle this with typography (title large and bold, subtitle smaller). Defense survives the prosecution comfortably.

**Position:** Passes all critical dimensions. Adds a marginal benefit on D5 (subtitle context dampens gaming-suffix priming) and D9 (out of scope but coincidentally helps). Adds no measurable cost.

**Verdict: SURVIVE — and rank above Candidate A.**
This is the strongest candidate. Caveat: subtitle wording is illustrative; the user can pick a tighter phrasing.

---

### Candidate C: Keep AlignCraft (the conservative anchor / do-nothing)

**Prosecution:**
The user has explicitly stated they don't mind changing all references and that the existing brand is unimportant. So the do-nothing option's only structural argument — preservation of brand investment — has been waived by the question-asker.

What remains is the substance argument: the existing name foregrounds the taxonomy (stack-shaped framing) while the book's body is heavily practice-shaped. This is not a marketing problem; it's an *internal coherence* problem. Every time the book introduces itself ("AlignCraft is a stack of six fundamental alignment layers"), it tautologically restates the framing while contradicting its mission ("codifies what developers do instinctively"). Two consecutive sentences in the README make conflicting promises about what the book IS.

The do-nothing option preserves this contradiction.

**Defense:**
Defense is genuinely thin here. The strongest case for keeping AlignCraft: epistemic conservatism. We may be wrong about the practice/structure ratio. We may be wrong about the strength of the Software Craftsmanship lineage. The current name is at least *currently working* — community exists, branding exists, momentum exists. Switching is a one-way operation; staying is reversible.

But this defense fails on the user's own framing: they have explicitly stated this is a content-fit question, switching cost is acceptable, and they want to know if AlignCraft is *better*. If the answer to "is X better" is "X is better but conservatism," that's a yes with a footnote, not a no.

**Collision:**
Defense argues from epistemic humility. Prosecution argues from internal-consistency evidence. Internal-consistency evidence — the explicit contradiction between two consecutive sentences in the README — is concrete structural data, not opinion. Prosecution wins on D1 and D2 (the two critical dimensions).

**Verdict: REFINE → KILL.**
The candidate fails on D1 (substance fit) and D2 (internal consistency). REFINE direction would be: keep AlignCraft only if the book's body were rewritten to be primarily a structural taxonomy with practice as commentary — which is not the book the user has written. Therefore: **KILL.**

**Constructive seed extracted from KILL:** The "current state" position is structurally weakest *because of an explicit textual contradiction in the existing book*. If the user wants to preserve AlignCraft, the path forward is to rewrite the README opening so that the name and the mission point in one direction. But the lower-cost path is to change the name. The KILL extracts the seed: *whichever direction the user chooses, the README opening must be made internally consistent.*

---

### Candidate D: A third coined name (AlignWorks, AlignForge, etc.)

**Prosecution:**
The user did not ask "what's the best possible name." They asked "is AlignCraft better than AlignCraft." Introducing a third candidate answers a question they didn't ask. Even if AlignWorks (the strongest third candidate) were marginally better than AlignCraft, the user would have to evaluate a candidate they didn't request, on top of evaluating the question they did ask. This is scope creep.

Also: AlignWorks lacks the Software Craftsmanship lineage that AlignCraft inherits for free. AlignForge is heavier-handed. None clearly beats AlignCraft on D1+D2+D6.

**Defense:**
Critique should not artificially limit candidate space. If a third name dominates both A and C on weighted dimensions, it should be surfaced.

**Collision:**
Defense is correct in principle but fails in evidence. No third candidate dominates AlignCraft on the critical dimensions. AlignWorks ties on D1, loses on D6 (no Software Craftsmanship lineage). AlignForge wins on D7 (verb-ability) but loses on D6 (too heavy a register for a methodology book). None is a Pareto improvement.

**Verdict: KILL all third-candidate variations as primary recommendations.**
**Constructive output:** if the user dislikes AlignCraft for any reason that surfaces post-decision, AlignWorks is the strongest fallback. Surface it as "second-best alternative" but not as a primary verdict.

---

## Phase 3.5 — Assembly Check

The two SURVIVE candidates (A and B) are not really separate solutions — B is a refinement of A. The assembly is:

> **Title: AlignCraft**
> **Subtitle: "The Six-Layer Alignment Stack for AI-Driven Development"** *(or an equivalent phrasing the user prefers)*

This is the strongest emergent candidate. It:
- Foregrounds practice in the brand handle (title) — wins D1, D2, D3, D4, D6, D7
- Preserves structural framing in the content-promise (subtitle) — neutralizes the only real argument for AlignCraft
- Mitigates the gaming-suffix risk on D5 by providing professional-jargon context
- Works for community ("AlignCraft community"), search ("Six-Layer Alignment Stack"), and substance simultaneously

Adversarial test on the assembly: prosecution can object that subtitles are read inconsistently in the wild. Defense: the brand handle is what carries community language; the subtitle is what carries discoverability. They serve different functions and are not in competition. **Assembly survives.**

---

## Phase 4 — Coverage + Convergence Assessment

### Coverage map
| Region | Status |
|---|---|
| AlignCraft as primary | EVALUATED (SURVIVE with caveat) |
| AlignCraft + structural subtitle | EVALUATED (SURVIVE, top-ranked) |
| AlignCraft as primary (do nothing) | EVALUATED (KILL) |
| Third coined name | EVALUATED (KILL as primary; AlignWorks flagged as fallback) |
| Phrase titles (descriptive, no coinage) | OUT OF SCOPE per user's binary question; flagged as optional future direction |
| Marketing/SEO frame | EXCLUDED per user goal |
| Sunk-cost / brand investment | EXCLUDED per user statement |

No unexplored region adjacent to viable territory. Coverage is sufficient for the user's stated question.

### Convergence
- Clean SURVIVE exists: yes — Candidate B (AlignCraft + structural subtitle).
- Multiple iterations not needed: the landscape is small, well-bounded, stable in one pass.
- No unexplored region likely to contain a viable third option (per Candidate D's evaluation).
- Failure modes check:
  - Wrong dimensions? No — D1/D2 directly map to the user's stated criterion ("what the book preaches").
  - Rubber-stamping? No — Candidates C and D were KILLed.
  - Nitpicking? No — Candidate A SURVIVED despite the gaming-suffix caveat.
  - Dimension blindness? Unlikely — D1-D7 cover the perspectives sensemaking checked.
  - False convergence? No — assembly check produced a higher-ranked candidate than any individual.
  - Evaluation drift? Single-pass; nothing to drift.
  - Self-reference collapse? Not applicable — this is content critique, not discipline self-evaluation.

**Signal: TERMINATE.**

---

## Final Deliverable

### Dimensions (with weights)
- **Critical:** Substance fit, Internal consistency
- **High:** Audience signal, Community/movement durability
- **Medium:** Term-overload risk, Lineage credibility
- **Low-Medium:** Verb-ability
- **Excluded (per user scope):** Switching cost, Marketing/SEO

### Fitness Landscape
- **Viable region:** AlignCraft variants. AlignCraft alone passes critical dimensions; AlignCraft + structural subtitle dominates Pareto.
- **Dead region:** AlignCraft as-is — fails D1 and D2.
- **Boundary region:** Third-name candidates (AlignWorks etc.) — pass D1 partially, fail D6, not Pareto-improving.
- **Unexplored:** descriptive phrase titles — out of scope.

### Candidate Verdicts
| Candidate | Verdict | Rank |
|---|---|---|
| AlignCraft + structural subtitle | **SURVIVE** | **1 (recommended)** |
| AlignCraft (no subtitle change) | **SURVIVE (with mild caveat)** | 2 |
| Keep AlignCraft | **KILL** | — |
| Third coined name (AlignWorks etc.) | **KILL as primary; AlignWorks flagged as fallback** | — |

### Coverage Map
All in-scope candidates evaluated. Out-of-scope regions explicitly noted and excluded per user direction. No adjacent unexplored regions likely to contain better candidates.

### Signal: **TERMINATE — at least one clean SURVIVE exists.**

Ranked survivors:
1. **Title: AlignCraft. Subtitle: "The Six-Layer Alignment Stack for AI-Driven Development"** (or equivalent phrasing).
2. AlignCraft alone (acceptable but loses the structural-framing benefit).

---

## Convergence Telemetry

- **Dimension coverage:** 7 active dimensions (2 critical, 2 high, 2 medium, 1 low-medium); 2 explicitly excluded per user scope. No critical perspective from sensemaking is uncovered.
- **Adversarial strength:** STRONG — prosecution constructed a serious case against each candidate (the warmth-vs-precision attack on AlignCraft was the strongest, and it was answered on structural grounds, not dismissed).
- **Landscape stability:** STABLE — single pass, no second iteration needed; assembly check produced the top-ranked output and survived its own adversarial test.
- **Clean SURVIVE present:** YES — the assembly (Candidate B).
- **Failure modes observed:** None.
- **Overall: PROCEED to conclusion.**
