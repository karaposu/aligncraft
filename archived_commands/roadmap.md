# /roadmap — Navigation Map Generator

Generate a structured path from where you are to where you want to be. Works for code, design, ideas, or any complex multi-step endeavor. Each roadmap is a workspace — a folder with persistent context that supports expansion, updates, and revisits.

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

### Phase 0: Establish Context

Before generating any map, establish and save both the starting state and end state.

#### Starting State

Determine the starting state using one of these approaches:

1. **User provides it explicitly** — text, file path, or description given in the input. Use it directly.
2. **User points to existing docs** — references to devdocs, archaeology files, traces, etc. Gather and summarize.
3. **User asks for inference** — only if explicitly requested (e.g., "infer from codebase"), read relevant code and docs to build the starting state.

**If none of the above is clear from the input**, ask the user: *"How should I understand the starting state? You can describe it, point me to existing docs, or ask me to infer from the codebase."*

**Do NOT auto-read the codebase unless the user asks for it.**

Save as `starting_state.md` in the roadmap folder with this structure:

```markdown
# Starting State

## References
- [list of file paths to existing docs that describe current state]

## What exists
- [list]

## What's designed but not built
- [list]

## What's incomplete
- [list]
```

Present the starting state to the user for validation before proceeding.

#### End State

The end state can be:
- A file path containing a description
- Raw text describing the goal
- A vague aspiration ("I want a working conversation analysis system")

If the end state is vague, that's fine. Mark downstream nodes as `unknown` or `concept` accordingly. Do NOT force clarification. Embrace the vagueness.

Save as `end_state.md` in the roadmap folder.

**Only after the user validates the starting state**, proceed to Phase 1.

---

### Phase 1: Generate Map

Create `map.md` in the roadmap folder.

#### ASCII Diagram (Required)

Start with a visual overview before detailed nodes. This is the first thing the reader sees.

**Status** is tracked across three dimensions, shown as a compact triple `idea / design / impl`:

**Idea** — how well the concept is understood:
- `unclear` — we know this area exists but not what it contains
- `fuzzy` — roughly understood, details unresolved
- `clear` — fully understood, no ambiguity

**Design** — how shaped the solution is:
- `none` — no design work done
- `partial` — some structure, gaps remain
- `mostly done` — nearly complete, minor gaps
- `crystal clear` — fully designed, ready to evaluate

**Impl** — how much implementation exists:
- `none` — nothing built
- `scattered pieces` — fragments exist, not connected
- `some` — meaningful parts built
- `mostly exists` — most of it works
- `only wiring left` — pieces exist, just need connecting
- `done` — completed and verified
- `n/a` — implementation doesn't apply to this node

**Layout rules:**
- Nodes flow left-to-right or top-to-bottom
- Arrows (`────▶` or `│▼`) show dependencies
- Independent/parallel nodes are placed side by side
- Each box shows: node number, label, status triple, effort

**Example:**

```
┌─────────────────────┐     ┌─────────────────────┐     ┌─────────────────────┐
│ 1. Foundation       │     │ 2. Core Signals     │     │ 3. Upper Layers     │
│                     │────▶│                     │────▶│                     │
│ clear/crystal/done  │     │ clear/partial/some  │     │ unclear/none/none   │
│ effort: M           │     │ effort: L           │     │ effort: ?           │
└─────────────────────┘     └──────────┬──────────┘     └─────────────────────┘
                                       │
                                       ▼
                            ┌─────────────────────┐
                            │ 4. Testing          │
                            │ fuzzy/none/none     │
                            │ effort: M           │
                            └─────────────────────┘
```

#### Node Format

**Node count:** If the user specified a number, use it. Otherwise, choose 3-7 nodes based on the distance between starting and end state.

Each node:

```markdown
- [ ] **Node N: [Label]**

  **Description:** 2-3 sentences of what this step involves.

  **Idea:** unclear | fuzzy | clear
  **Design:** none | partial | mostly done | crystal clear
  **Impl:** none | scattered pieces | some | mostly exists | only wiring left | done | n/a

  **Depends on:** [which prior nodes must complete first, or "none"]

  **Produces:** [what artifact, capability, or state this step creates]

  **Effort:** small | medium | large

  **Why this order:** One sentence explaining why this comes here, not earlier or later.
```

#### Roadmap Summary

After all nodes:

```markdown
## Summary

**Total nodes:** N

**By idea:** clear: N | fuzzy: N | unclear: N
**By design:** crystal clear: N | mostly done: N | partial: N | none: N
**By impl:** done: N | mostly exists: N | some: N | scattered: N | none: N

**Recommended next action:** [which node to work on first and why]

**Biggest risk:** [what could invalidate this roadmap]
```

Save `map.md` and print the full roadmap in the conversation.

---

### Phase 2: Expand / Update

When the user provides an existing roadmap folder + a node reference (e.g., `/roadmap devdocs/roadmaps/my_project/ node:3`):

1. Read `starting_state.md` and `map.md` from the folder
2. Find the specified node
3. Break it into sub-nodes (use specified count, or 3-5 by default)
4. Each sub-node follows the same format (checkbox, label, description, status, depends_on, produces, effort, why_this_order)
5. Sub-nodes are numbered as N.1, N.2, N.3 etc.
6. Update `map.md` in place — replace the node with its expansion
7. Update the ASCII diagram and Summary counts
8. Print the updated section in the conversation

---

## Folder Structure

Each roadmap creates a folder under `devdocs/roadmaps/`:

```
devdocs/roadmaps/<name>/
├── starting_state.md    # References + validated summary
├── end_state.md         # Structured or freeform goal description
└── map.md               # The roadmap with checkboxes and ASCII diagram
```

If the user specified an output path, use that. Otherwise, create a folder name by slugifying the end state (e.g., "I want a working auth system" → `devdocs/roadmaps/working_auth_system/`). If a folder with that name already exists, ask the user whether to overwrite or create a new one with a date suffix (e.g., `working_auth_system_2026-03-29/`).

---

## Rules

1. **This is a MAP, not a PLAN.** Maps show terrain including unexplored areas. Plans pretend everything is known. Use map language: "this area is unknown" not "we will do X then Y."

2. **Status is the primary output.** The most valuable thing the roadmap produces isn't the steps — it's knowing each node's idea clarity, design maturity, and implementation state. This tells the user what to work on next.

3. **Do NOT inflate status.** If the idea is fuzzy, say fuzzy. If design is partial, say partial. Don't mark implementation as "mostly exists" when only scattered pieces are there.

4. **Embrace vague end states.** "I want a working app" is a valid end state. Mark later nodes as unknown and note that the roadmap will sharpen as the end state clarifies.

5. **Dependencies must be explicit.** If node 4 requires node 2, say so. If nodes are independent, say "none." This lets the user parallelize.

6. **Why-this-order matters.** Every node must justify its position. This prevents arbitrary sequencing and makes the roadmap auditable.

7. **Starting state validation is non-negotiable.** Always present your understanding of the starting state and get user confirmation before generating the map. Wrong starting point = wrong map.

8. **Keep nodes at uniform granularity within one roadmap level.** Don't mix "implement the auth system" (large) with "fix the typo in config" (tiny) at the same level. If granularity varies, suggest expansion of the larger nodes.

---

## Example Invocations

```
/roadmap "I want a working conversation analysis system"
→ Asks about starting state, saves context, generates 3-7 node map

/roadmap starting state: we have a basic parser. end state: full NLP pipeline
→ Uses explicit starting/end state, saves both, generates map

/roadmap devdocs/roadmaps/my_project/ node:3
→ Expands node 3 of existing roadmap into sub-nodes

/roadmap devdocs/roadmaps/my_project/ node:3 5
→ Expands node 3 into exactly 5 sub-nodes
```
