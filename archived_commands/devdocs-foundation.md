# /devdocs-foundation — Establish DevDocs Foundation

Set up the foundational devdocs for a project. Reads all available project context (data dumps, READMEs, existing docs, conversation history) and creates the three foundation documents that everything else builds on.

---

## Instructions

### Step 1: Gather Context

Read all available project information:
- Any data dump files (data_dump.txt, notes, briefs)
- Existing README or project description
- Any conversation context about the project
- Existing code if the project has already started

Do not ask the user to provide more information. Work with what exists. Fuzzy and incomplete is fine — the foundation docs will be refined later.

### Step 2: Create Foundation Documents

Create the following three documents:

#### 1. `devdocs/foundations/project_description.md`

Answer these questions:
- What are we building?
- What problem are we solving?
- What are the various scopes of this project?
- Who are the targeted users?

Write clearly and concisely. Focus on mutual understanding between human and AI. If something is unclear from the available context, state what's unclear rather than guessing.

#### 2. `devdocs/foundations/philosophy.md`

Capture the philosophy of the project:
- What principles guide decision-making?
- What trade-offs does the project prefer (speed vs correctness, simplicity vs flexibility, etc.)?
- What kind of experience should the end result provide?

Stay non-technical. This is about intent and values, not implementation.

#### 3. `devdocs/foundations/known_requirements.md`

Document what's known about requirements across three dimensions:
- **Technical requirements** — languages, frameworks, platforms, infrastructure, constraints
- **Business requirements** — deadlines, budget, scale, compliance, stakeholders
- **User requirements** — who uses it, what they need, what they expect

For each requirement, note confidence level: known (stated explicitly), inferred (derived from context), or unknown (gap that needs clarification).

### Step 3: Present for Review

Print all three documents in the conversation. Remind the user:

> These foundation documents are the base that all future devdocs build on. Please read them carefully and correct any misunderstandings now — errors here propagate into concepts, plans, and implementation.

Save all three files and confirm the paths.

---

## Rules

1. **Work with what you have.** Don't interrogate the user for missing information. Document what's unclear as "unknown" — that's more useful than blocking on questions.
2. **Be honest about uncertainty.** If the context is vague, say so. Don't fabricate specifics.
3. **Stay high-level.** These are foundation docs, not implementation plans. No code, no architecture decisions, no technical design.
4. **Create the directory if needed.** `devdocs/foundations/` may not exist yet.

---

## Output

Three files:
- `devdocs/foundations/project_description.md`
- `devdocs/foundations/philosophy.md`
- `devdocs/foundations/known_requirements.md`

All printed in conversation + saved to disk.
