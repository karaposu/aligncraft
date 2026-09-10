# /devdocs-foundation-identify-modules — Identify Module Boundaries

Read the simplified concepts and identify logical abstractions that can be organized into modules. The goal is a modular architecture that is cleaner and more maintainable — not over-engineered. Only modularize at major conceptual boundaries.

---

## Instructions

### Step 1: Read Simplified Concepts

Read:
- `devdocs/concepts/simplified_concepts.md`
- All files in `devdocs/concepts/simplified_concept_clarifications/`
- `devdocs/foundations/known_requirements.md` (for technical constraints)

If simplified concepts don't exist, tell the user and suggest running `/devdocs-foundation-simplified-concepts` first. Do not proceed without them.

### Step 2: Identify Module Boundaries

Analyze the simplified concepts and find natural boundaries where:
- **Concepts cluster** — multiple concepts that work together and share internal state but have a clean interface to the outside
- **Responsibilities separate** — one group of concepts handles data, another handles presentation, another handles external integration
- **Change frequency differs** — concepts that change together belong in the same module, concepts that change independently belong in different modules

For each proposed module, determine:
- What concepts it contains
- What its public interface looks like (what does it expose to other modules?)
- What it hides internally (what does it encapsulate?)
- What other modules it depends on

### Step 3: Validate Against Constraints

Before finalizing, check:
- **Performance:** Does the module boundary introduce unnecessary overhead? (e.g., serialization between modules that could share memory)
- **Security:** Does the boundary correctly isolate sensitive operations? (e.g., auth shouldn't leak across module boundaries)
- **Simplicity:** Is this module boundary necessary, or is it premature? If two "modules" always change together, always deploy together, and always test together — they're one module pretending to be two.

**Kill any module that fails the "would I ever want to change this independently?" test.** If the answer is no, merge it into its neighbor.

### Step 4: Create Module Proposal

Create `devdocs/foundations/module_proposal.md` with this structure:

```markdown
# Module Proposal

## Overview

[One paragraph: how many modules, what the high-level architecture looks like, what principle guided the decomposition]

## Module Map

[ASCII diagram showing modules and their dependencies]

## Modules

### Module: [Name]

**Contains concepts:** [list from simplified_concepts.md]
**Responsibility:** one sentence — what this module does
**Public interface:** what it exposes to other modules
**Internal details:** what it hides
**Depends on:** which other modules
**Change frequency:** how often this is likely to change and why

### Module: [Name]
...

## Dependency Rules

[Which dependencies are allowed, which are forbidden. E.g., "UI modules depend on Core, never the reverse." Keep it to 3-5 rules.]

## What Was NOT Modularized (and Why)

[Concepts or areas that could have been separate modules but were kept together. Explain why — prevents future over-engineering by documenting the decision.]
```

### Step 5: Present for Review

Print the module proposal in the conversation. Highlight:
- Total number of modules
- The dependency direction (which modules are foundational, which are leaf)
- Any concepts that were hard to place (straddling two modules)

Remind the user:

> Module boundaries are architectural decisions that are expensive to change later. Check: (1) does each module have a clear single responsibility? (2) are the dependencies one-directional where possible? (3) is anything over-modularized — split into pieces that will always change together?

Save the file and confirm the path.

---

## Rules

1. **Only modularize major conceptual boundaries.** If you're unsure whether something should be a separate module, it shouldn't be. Merge and split later if needed.
2. **Fewer modules is better.** 3-6 modules for a prototype is typical. 10+ modules for a prototype is a red flag.
3. **Dependencies should flow one direction where possible.** Circular dependencies between modules indicate the boundary is wrong.
4. **Document what you didn't modularize.** This is as valuable as what you did — it prevents re-asking the same question later.
5. **Create the directory if needed.** `devdocs/foundations/` should already exist from `/devdocs-foundation`.

---

## Output

- `devdocs/foundations/module_proposal.md`

Saved to disk + printed in conversation.
