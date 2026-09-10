# /devdocs-foundation-architecture — Propose Project Architecture

Read the simplified concepts and module proposal, then propose the most suitable architecture for the project. Priority is a solid foundation that can expand over time — not an immediate full-scope solution. The architecture should be as simple as possible while remaining extensible.

---

## Instructions

### Step 1: Read Context

Read:
- `devdocs/concepts/simplified_concepts.md`
- `devdocs/foundations/module_proposal.md`
- `devdocs/foundations/known_requirements.md`
- `devdocs/foundations/philosophy.md`

If any are missing, tell the user which commands to run first. At minimum, simplified concepts and module proposal must exist.

### Step 2: Evaluate Module Proposal

Before proposing architecture, critically evaluate the module proposal:

- **Accept modules** that represent genuine architectural boundaries
- **Merge modules** that are over-split for prototype scope — if two modules would have 1-2 files each and always change together, merge them
- **Reject modules** that are premature — if the project doesn't need the separation yet, don't build it yet

Document what you accepted, merged, or rejected and why. This is part of the architecture decision record.

### Step 3: Propose Architecture

Create `devdocs/foundations/architecture.md` with this structure:

```markdown
# Architecture Proposal

## Design Philosophy

[One paragraph: what principles guided this architecture. Reference the project philosophy where relevant.]

## High-Level Overview

[ASCII diagram showing the major components, their relationships, and data flow direction]

## Module Decisions

### Accepted from module_proposal.md
[List with brief reasoning]

### Merged
[Which modules were combined and why]

### Rejected / Deferred
[Which modules were dropped for now and why — with notes on when they'd become necessary]

## Components

### [Component Name]

**Responsibility:** one sentence
**Key patterns:** what design patterns it uses and why (e.g., repository pattern for DB, facade for external services)
**Interfaces:** what it exposes
**Dependencies:** what it consumes
**Expansion path:** how this component grows when moving from prototype to full scope

### [Component Name]
...

## Design Patterns

[List the patterns used across the architecture and WHY each was chosen — not just the name but the problem it solves here]

## Data Flow

[Describe how data moves through the system — from input to storage to output. ASCII diagram if helpful.]

## What This Architecture Does NOT Handle (Yet)

[Explicitly list things that are out of scope for prototype but will need architectural support later. For each, note whether the current architecture can accommodate it or will need changes.]

## Key Trade-offs

[List the major trade-offs made and why. E.g., "chose simplicity over performance because the prototype won't have scale concerns." These are decisions future-you needs to understand.]
```

### Step 4: Present for Review

Print the architecture proposal in the conversation. Highlight:
- Total component count
- The key trade-offs made
- What was deferred and when it would become necessary

Remind the user:

> This architecture is designed for iterative development — solid enough to build on, simple enough to evolve. Check: (1) can you trace how each simplified concept maps to a component? (2) are the expansion paths realistic — or would growth require rewrites? (3) is anything over-engineered for prototype scope?

Save the file and confirm the path.

---

## Rules

1. **Simplicity over cleverness.** If a simpler pattern works, use it. Don't use a microservice architecture when a well-structured monolith will do. Don't use event sourcing when simple CRUD is sufficient.
2. **Patterns must earn their place.** Every design pattern used must solve a specific problem in THIS project. "It's a best practice" is not enough. Name the problem it solves here.
3. **Expansion paths must be additive.** Growing the prototype to full scope should mean adding code, not rewriting code. If a component would need restructuring at scale, note it explicitly.
4. **Avoid tight coupling.** Components should communicate through defined interfaces. But don't over-abstract — a direct function call is better than an unnecessary abstraction layer.
5. **Document what you deferred.** Future architects (including future-you) need to know what was deliberately left out and why.

---

## Output

- `devdocs/foundations/architecture.md`

Saved to disk + printed in conversation.
