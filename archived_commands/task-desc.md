# /task-desc — Generate Structured Feature Description

Generate a structured feature description document based on the input below. This creates the foundational documentation that all subsequent planning builds on.

## Additional Input/Instructions


$ARGUMENTS

---

## Instructions

### Step 0: Resolve Target Location

Before generating anything, determine where this `desc.md` will be saved:

1. **If the input includes a folder path** — save the output there.
2. **If no path is given** — look at the project's existing `devdocs/` folder structure and follow whatever convention is already established (folder naming, hierarchy, etc.). Propose a location and confirm with the user.
3. **If no `devdocs/` convention exists yet** — ask the user where to write it.

**Only after the location is confirmed**, continue to Step 1.

### Step 1: Read and Generate

1. Read the input carefully. It may be a feature description, an `/elaborate` output, or raw notes.
2. Read relevant parts of the codebase to understand where this feature fits.
3. Create the `desc.md` file at the confirmed location.

## Output Format

The `desc.md` must contain:

### Problem Statement
What problem does this solve? Be specific about the current pain point.

### User Value Proposition
Why do users need this? What changes for them when this ships?

### Success Criteria
How do we know it's working? List concrete, verifiable outcomes.

### Scope Boundaries
What this feature will NOT do. Be explicit about what's out of scope to prevent creep.

### Priority Level
Rate as: Critical / High / Medium / Low. Justify briefly.

## Guidelines

- Keep the document lightweight — this is discovery, not a spec.
- Use language from the codebase (existing naming conventions, domain terms).
- If the input is vague, make reasonable assumptions and flag them clearly with `[ASSUMPTION]`.
- Do NOT start implementation planning here. That's `/task-plan`.
