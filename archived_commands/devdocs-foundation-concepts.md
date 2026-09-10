# /devdocs-foundation-concepts — Extract and Clarify Core Concepts

Read the foundation documents and extract the essential technical concepts that define the project. For each concept, create a detailed clarification document answering eight structured questions.

---

## Instructions

### Step 1: Read Foundation Documents

Read all three foundation documents:
- `devdocs/foundations/project_description.md`
- `devdocs/foundations/philosophy.md`
- `devdocs/foundations/known_requirements.md`

If any are missing, tell the user and suggest running `/devdocs-foundation` first. Do not proceed without at least `project_description.md`.

### Step 2: Extract Core Concepts

Create `devdocs/concepts/concepts.md`:

- List only **essential** technical concepts — the ones the project cannot exist without
- Order by importance and dependency (foundational concepts first, dependent concepts after)
- One-line description for each
- Do not bloat — if a concept is nice-to-have rather than core, leave it out

Format:

```markdown
# Core Concepts

1. **[Concept Name]** — one-line description
2. **[Concept Name]** — one-line description
...
```

### Step 3: Create Clarification Documents

For each concept in `concepts.md`, create a detailed clarification file in `devdocs/concepts/concept_clarifications/`.

Name files with ordering prefixes matching the concept list: `01_[concept].md`, `02_[concept].md`, etc.

Each clarification document must answer these eight questions:

1. **What it is and why it matters** — clear, short explanation
2. **How this concept helps the overall project** — what it enables, what it makes possible
3. **How this concept limits the overall project** — what constraints it introduces, what trade-offs it forces
4. **What kind of information this concept needs as input** — data, config, user input, other concepts' outputs
5. **What kind of process this concept should use** — how it operates, what steps it follows
6. **What kind of information this concept outputs or relays** — what it produces, what downstream concepts consume
7. **Good expected outcome of realizing this concept** — what success looks like
8. **Bad unwanted outcome of realizing this concept** — what failure looks like, what to watch for

Keep each answer focused. A few sentences per question is enough. The goal is mutual understanding between human and AI, not exhaustive documentation.

### Step 4: Present for Review

Print `concepts.md` in the conversation. For the clarification documents, print a summary (concept name + one-line from each of the 8 questions) so the user can scan without reading every file.

Remind the user:

> These concept documents define how the AI understands your project's building blocks. Read them carefully — if the AI misunderstands a concept here, it will misimplement it later. Correct any misunderstandings now.

Save all files and confirm the paths.

---

## Rules

1. **Only core concepts.** Resist the urge to list every possible concept. A project with 30 "core" concepts has zero core concepts — everything is noise. Aim for 5-12.
2. **Order matters.** Foundational concepts that other concepts depend on come first. This ordering guides implementation sequence later.
3. **Stay honest about understanding.** If a concept is unclear from the foundation docs, say so in the clarification. Don't fill gaps with assumptions presented as facts.
4. **Create directories if needed.** `devdocs/concepts/` and `devdocs/concepts/concept_clarifications/` may not exist yet.

---

## Output

- `devdocs/concepts/concepts.md` — ordered list of core concepts
- `devdocs/concepts/concept_clarifications/01_[concept].md` through `NN_[concept].md` — one file per concept

All saved to disk + summary printed in conversation.
