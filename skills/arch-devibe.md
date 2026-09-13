name: arch-devibe
description: Evolutionary architecture audit. Examines a codebase for structures that exist because of the historical sequence in which the project developed rather than because the problem requires them — the software equivalent of the giraffe's recurrent laryngeal nerve. Separates essential from incidental from historical complexity, designs a clean-sheet architecture from today's known requirements, and identifies large structural optimizations that ordinary incremental refactoring will not find. Use on a project grown through many local modifications — vibe coding, AI-generated changes, patches, feature accretion, changing requirements.

# /arch-devibe — Evolutionary Architecture Audit

Ask whether this codebase is trapped in a local architectural optimum created by its
own history, while a significantly better global design has become visible only now
that the product has matured.

Not a code review. Not a refactoring pass. The question is not *how do we clean up
the architecture we have* but **would we have invented this architecture at all,
knowing what we know now?**

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

1. **Load whatever understanding already exists.** Read `devdocs/archaeology/` if it
   is present — `small_summary.md`, `intro2codebase.md`, and especially `traces/`.
   Traces are the single best evidence for this audit: an end-to-end execution path
   is where an indirect route becomes visible. If the folder is absent and the
   codebase is unfamiliar, say so and suggest running `/arch-small-summary`,
   `/arch-intro` and `/arch-traces` first.

2. **Read the code itself.** Existing documentation describes intent; this audit is
   about what the structure actually is. Where docs and code disagree, the code wins.

3. **Read the history if it is available.** `git log` on a suspicious module,
   the order in which files appeared, commit messages around a compatibility layer
   — this is the direct evidence for the historical category. Where history is not
   available, infer from the code and label the inference as inference.

4. Execute the audit below and produce all ten sections.

5. Save to `devdocs/archaeology/devibe.md`, opening with:

   ```yaml
   ---
   model: [model id from session context, e.g., claude-opus-4-7[1m]; "unknown" if not derivable]
   effort: [effort setting from session context, e.g., max; "unknown" if not derivable]
   ---
   ```

   This output is dense judgement. What produced it is part of how much weight it
   carries.

---

---- NOW SOLID INSTRUCTIONS START ----

## The principle

A famous example from evolutionary biology is the giraffe's recurrent laryngeal
nerve. The nerve connects the brain to the larynx, but instead of taking a short
direct path, it travels down the neck, loops around an artery near the heart, and
travels back up.

The route makes sense historically. In distant vertebrate ancestors the nerve and
artery sat close together. As the body plan changed gradually, the neck lengthened
and the heart moved away, but the nerve stayed constrained by its inherited route
around the artery.

The general principle:

> **A system produced through many incremental modifications can be locally
> reasonable at every step while ending up globally inefficient, awkward, or
> unnecessarily complicated.**

Designed from scratch, knowing the final form in advance, the nerve could take a
direct route. Evolution modifies a working system rather than repeatedly redesigning
the organism from first principles.

Software developed progressively — through vibe coding, AI-generated changes, bug
fixes, feature additions, refactors, patches, and changing requirements — is subject
to exactly this. Every individual change may have been reasonable. The architecture
that results may contain structures that exist only because of the order in which
the project grew.

## Step 1 — Understand the system holistically

Before looking for anything, extract:

- actual features and user-visible behaviours
- functional requirements
- non-functional requirements
- constraints and limitations
- important domain concepts
- data models
- state
- APIs and external integrations
- major modules and responsibilities
- dependencies between concepts
- data flows
- control flows
- lifecycle of important entities
- invariants that must remain true
- compatibility requirements
- performance and operational constraints

Then separate **what the system fundamentally needs to do** from **how the current
implementation happens to do it**. Build a conceptual model of the project that is
independent of the current directory structure, classes, functions, frameworks, and
implementation history.

## Step 2 — Look for the detours

Look for the software equivalent of the recurrent laryngeal nerve: structures that
are not necessarily bugs, may be well-written locally, but are unnecessarily
indirect, complicated, duplicated, tightly coupled, or strangely layered because of
how the codebase developed.

Candidates include:

- data taking a long indirect path between two concepts that should interact directly
- abstractions existing only because older versions of the system required them
- compatibility layers whose original reason no longer exists
- state duplicated across components because features were added independently
- one concept represented differently in different areas of the application
- an API boundary that made sense before later features existed and is now unnatural
- database structures reflecting the chronological order features were added rather than the domain
- multiple pipelines that are manifestations of one underlying concept
- modules that accumulated responsibilities because each new feature attached to the nearest existing component
- workarounds that became permanent architecture
- abstractions built around limitations that no longer exist
- configuration or feature flags whose historical purpose has disappeared
- chains of adapters, wrappers, callbacks, transformations, or synchronization steps that could disappear under a different design
- behaviour requiring coordination across many modules even though it is conceptually one operation
- repeated local refactors that improved individual components without addressing a globally unnecessary structure

For each suspected detour, investigate its history as far as the code and git allow.

## Step 3 — Classify the complexity

Every structure you flag falls into one of three categories. Say which.

| Category | What it is |
|---|---|
| **Essential** | Required by the actual problem or requirements |
| **Incidental** | Caused by implementation choices |
| **Historical** | Exists because the system evolved incrementally from an earlier architecture |

The third category is the point of this audit. The first two are ordinary
engineering findings and belong in a normal review.

## Step 4 — Design from first principles

Temporarily ignore the existing implementation. Design an alternative architecture
as if all of today's requirements were known before the first line of code.

- What are the true domain concepts?
- What should own each responsibility?
- What state should exist, and where should it live?
- Which boundaries are genuinely useful?
- Which concepts should communicate directly?
- Which abstractions would we introduce deliberately?
- Which current abstractions would never be invented?
- Could several current subsystems collapse into one simpler model?
- Could one current subsystem separate into several clearer concepts?
- Could data ownership be simplified?
- Could control flow become substantially more direct?
- Could an entire layer disappear?
- Could multiple representations of one concept become a single canonical one?

Do not preserve existing abstractions merely because they already exist.

## Discipline

**Do not assume shorter is better.** An apparently indirect structure may be
protecting isolation, security, reliability, performance, backwards compatibility,
extensibility, transaction boundaries, or fault tolerance. **For every candidate
simplification, state what would be lost or endangered by removing the current
structure.** A candidate without that field is not finished.

**Be skeptical.** Do not invent redesigns for elegance. A redesign is valuable only
if it materially improves simplicity, correctness, maintainability, performance,
reliability, or the ability to evolve the product.

**Architectural cases only.** Duplicated helpers, naming, style, and ordinary
refactoring opportunities are out of scope. If a finding would survive being fixed
by a careful afternoon of tidying, it does not belong in this audit.

**Label inference as inference.** Where you reconstruct history from the shape of
the code rather than from commits, say so.

---

## Output Format

Produce all ten sections, in this order.

### 1. Conceptual model of the current product

What the system fundamentally is, independent of implementation details.

### 2. Current architecture

Major components, responsibilities, dependencies, state ownership, important flows.

### 3. Historical / evolutionary artifacts

Structures that appear to be consequences of incremental development. For each:

- what the structure is
- why it is unusual or indirect
- what historical development may have produced it
- whether it still serves an important purpose
- what would happen if it disappeared

### 4. Recurrent laryngeal nerve candidates

The strongest examples, ranked most to least significant. Meaningful architectural
cases only.

### 5. Clean-sheet architecture

The system as it would be designed if all current requirements were known before
development started.

### 6. Current vs. clean-sheet comparison

The important differences. Highlight where the clean-sheet design removes entire
flows, layers, synchronization mechanisms, abstractions, state copies, or concepts.

### 7. Architectural optimization opportunities

For each major opportunity, estimate:

- architectural benefit
- complexity reduction
- code likely to disappear
- risks
- migration difficulty
- likely effect on reliability
- likely effect on development speed
- whether it is worth doing

### 8. Incremental refactor vs. redesign

Classify each recommendation and explain why:

- safe incremental refactor
- medium structural refactor
- subsystem rewrite
- architectural redesign

### 9. The strongest redesign opportunity

If only ONE part could be redesigned, which change produces the greatest
improvement? Explain the current historical constraint, the clean alternative, and
why incremental refactoring is unlikely to reach that architecture naturally.

### 10. Final verdict

Answer directly:

- **Does this codebase contain architectural complexity that appears to exist mainly because of its development history?**
- **Is there a substantially cleaner architecture available now that the final requirements are better understood?**
- **Would reaching it require crossing an architectural boundary that normal incremental refactoring is unlikely to cross?**

---

The objective is not to make the code look cleaner. It is to discover whether the
codebase is trapped in a local architectural optimum created by its own history,
while a significantly better global design has become visible only now that the
product has matured.
