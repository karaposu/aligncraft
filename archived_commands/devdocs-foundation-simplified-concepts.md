# /devdocs-foundation-simplified-concepts — Simplify Concepts for Prototyping

Read the full concepts and create simplified versions trimmed for prototyping. The simplified concepts keep the same architecture but reduce scope — fewer subconcepts, fewer features, same structural foundation. The result is a buildable prototype that can expand to the full concept later without rewrites.

---

## Instructions

### Step 1: Read Full Concepts

Read:
- `devdocs/concepts/concepts.md`
- All files in `devdocs/concepts/concept_clarifications/`

If these don't exist, tell the user and suggest running `/devdocs-foundation-concepts` first. Do not proceed without them.

### Step 2: Create Simplified Concepts

Create `devdocs/concepts/simplified_concepts.md`.

For each concept in `concepts.md`, create a simplified version that is prototype-ready. Apply these rules:

**1. Reduce features, not architecture.** The simplified concept must retain the structural foundation that the full concept needs. If the full concept requires a plugin system, the simplified version has a plugin system with 1-2 plugins — not a hardcoded implementation that would need rewriting later.

**2. Don't binarize multi-faceted concepts.** If a concept supports multiple subconcepts (e.g., 5 authentication methods), don't reduce to just one. Reduce to 2-3 of the most important ones. The architecture should still handle "multiple" even if the count is smaller.

**3. Preserve expansion paths.** For each simplification, the path from simplified → full should be additive (add more plugins, add more auth methods, add more endpoints) not structural (rewrite the plugin system, redesign the auth flow).

Format:

```markdown
# Simplified Concepts (Prototype Scope)

1. **[Concept Name]** — one-line description of simplified scope
   - **Removed from full scope:** what was cut
   - **Why this simplification is safe:** why the architecture still supports future expansion

2. ...
```

### Step 3: Create Simplified Clarification Documents

For each simplified concept, create a clarification file in `devdocs/concepts/simplified_concept_clarifications/`.

Name files with ordering prefixes matching priority: `01_[concept].md`, `02_[concept].md`, etc. Core concepts first.

Each clarification document answers the same eight questions as the full concepts, but scoped to the simplified version:

1. **What it is and why it matters** — in simplified/prototype scope
2. **How this concept helps the overall project** — what it enables even in reduced form
3. **How this concept limits the overall project** — constraints introduced by the simplification specifically
4. **What kind of information this concept needs as input** — reduced input scope
5. **What kind of process this concept should use** — simplified process
6. **What kind of information this concept outputs or relays** — reduced output scope
7. **Good expected outcome of realizing this concept** — what prototype success looks like
8. **Bad unwanted outcome of realizing this concept** — what to watch for, including oversimplification traps

### Step 4: Present for Review

Print `simplified_concepts.md` in the conversation. For the clarification documents, print a summary per concept showing what was simplified and why.

Remind the user:

> These simplified concepts define your prototype scope. Check two things: (1) is anything oversimplified to the point where the architecture can't support the full concept later? (2) is anything still too complex for a prototype? The goal is the minimum scope that preserves the full architecture's expansion paths.

Save all files and confirm the paths.

---

## Rules

1. **Simplify scope, not structure.** This is the most important rule. A prototype with the right architecture and fewer features is infinitely better than a prototype with the wrong architecture and all features.
2. **Every simplification must explain its expansion path.** "Removed X" is not enough. "Removed X — to add it back later, add a new handler to the existing handler registry" is useful.
3. **Don't drop concepts entirely.** If a concept is in the full list, it should appear in the simplified list — even if heavily reduced. Dropping it entirely means the architecture won't account for it, and adding it later becomes a rewrite.
4. **Create directories if needed.** `devdocs/concepts/simplified_concept_clarifications/` may not exist yet.

---

## Output

- `devdocs/concepts/simplified_concepts.md` — simplified concept list with cut/safe annotations
- `devdocs/concepts/simplified_concept_clarifications/01_[concept].md` through `NN_[concept].md` — one file per simplified concept

All saved to disk + summary printed in conversation.
