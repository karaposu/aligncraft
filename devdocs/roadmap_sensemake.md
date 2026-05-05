# Sensemaking: /roadmap Command Restructure

## Initial Sense Version (SV1 — Baseline Understanding)

The `/roadmap` command generates a navigation map from current state to desired end state. The current implementation has two modes (CREATE and EXPAND), auto-infers the starting state from the codebase, uses a fuzziness system (clear/foggy/unknown), and produces node-based roadmaps with ASCII diagrams.

The user has identified several problems: the auto-inference of starting state is unreliable and can be confused by half-finished code, the fuzziness levels are too coarse, roadmaps aren't updateable, and there's no persistent storage of the starting/ending context that expansion and revisits can refer back to.

---

## Phase 1 — Cognitive Anchor Extraction

### Constraints
- Starting state cannot always be auto-inferred — codebase may contain half-built features, abandoned experiments, or irrelevant code
- Starting state can be the entire codebase, so it can't be copied literally — it needs references
- The command must work for code, design, ideas, and any multi-step endeavor (not code-specific)
- EXPAND mode needs access to the original starting state context
- Roadmaps must be updateable over time

### Key Insights
- **Starting state is the foundation** — if the starting state is wrong, the entire roadmap is wrong. Currently the command auto-infers it, which is the weakest link.
- **Persistence is required** — both starting state and end state need to live as files, not just conversation context, because expansion and updates happen in later sessions.
- **Fuzziness is a maturity spectrum, not three bins** — "foggy" conflates many different stages of readiness. A node that has a concept but no design is very different from a node that has a design but no implementation plan.
- **Roadmaps are living documents** — they need checkboxes, status tracking, and the ability to be revisited without reconstructing context.

### Structural Points
- The command needs a **folder per roadmap**, not just a single file
- Starting state is a mix of **references** (pointers to existing docs/traces) and **structured summary** (what exists, what's designed, what's incomplete)
- End state is a structured text description
- Nodes need a maturity/status field that's richer than fuzziness
- Todo checkboxes enable roadmap-as-working-document

### Foundational Principles
- Don't auto-read what you're not sure about — ask or accept explicit input
- Save context that will be needed later
- Status tracking should be human-editable (checkboxes, not computed)

### Meaning-Nodes
- Starting state as reference document
- End state as structured description
- Roadmap folder as unit of work
- Node maturity as spectrum
- Updateability as first-class concern

---

#### Sense Version 2 (SV2 — Anchor-Informed Understanding)

The core problem isn't the roadmap generation itself — it's the **context management** around it. The current command treats context as ephemeral (inferred, used, discarded). The redesign needs to treat context as persistent (captured, saved, referenced). This shifts the command from "generate a map" to "establish a roadmap workspace, then generate and maintain a map within it."

---

## Phase 2 — Perspective Checking

### Technical / Logical
- A folder per roadmap is clean: `devdocs/roadmaps/<name>/starting_state.md`, `end_state.md`, `map.md`
- Starting state references (file paths to traces, archaeology docs) are stable because those docs are also in devdocs
- Todo checkboxes in markdown are universally supported and human-editable
- EXPAND mode becomes: read `starting_state.md` + `map.md`, expand node, update `map.md`

### Human / User
- Users often know the starting state better than AI does — they should be able to state it directly
- Users sometimes want to provide BOTH starting and ending state explicitly (no inference at all)
- The "ask questions" approach for starting state must not become an interrogation — a few focused questions, not a survey
- Checkboxes give a sense of progress and make the roadmap feel actionable

### Strategic / Long-term
- Roadmap folders become part of the devdocs ecosystem — they can be referenced by other commands
- Starting state documents serve double duty: roadmap context AND project state snapshot
- The maturity spectrum aligns with the AlignCraft workflow: concept → elaboration → design → plan → implementation

### Risk / Failure
- If starting state is too detailed, it becomes stale quickly
- If starting state is only references, it might not capture the user's subjective understanding
- Too many maturity levels create decision fatigue when labeling nodes
- Folder proliferation if many roadmaps are created

### Resource / Feasibility
- The folder creation, file writing, and reference-gathering are all within what slash commands can do
- Checkboxes are zero-cost to add
- The maturity spectrum is just a field change — no structural impact

---

#### Sense Version 3 (SV3 — Multi-Perspective Understanding)

Two major shifts from SV2:

1. **Starting state should be a hybrid** — references to existing docs (for the objective part) PLUS a human-written or human-validated summary (for the subjective part: "what I think the state is"). This prevents both staleness (references stay current) and loss of human context (summary captures intent).

2. **The maturity spectrum should match the AlignCraft workflow** but stay generic enough for non-code roadmaps. The levels should describe knowledge maturity, not implementation progress.

---

## Phase 3 — Ambiguity Collapse

#### Ambiguity: Should the command auto-read the codebase or not?

**Resolution:** Never auto-read by default. Three input modes for starting state:
1. User provides it explicitly (text or file)
2. User points to existing docs (references)
3. User asks the command to infer it (opt-in, not default)

**What is now fixed?** The command never silently reads the codebase. Starting state is always user-controlled.

**What is no longer allowed?** Auto-inference as the default behavior.

**What now depends on this choice?** The command needs a Step 0 that resolves how starting state will be established.

**What changed in the conceptual model?** The command becomes user-driven rather than AI-driven at the input stage. AI generates the map, but the human controls the inputs.

---

#### Ambiguity: What maturity levels replace fuzziness?

**Resolution:** A knowledge-maturity spectrum that doesn't assume implementation:

- **unknown** — this area exists but we don't know what it contains
- **concept** — the idea is understood but not shaped
- **designed** — structured and detailed enough to evaluate
- **planned** — actionable steps exist (e.g., an implementation plan, a checklist)
- **done** — completed and verified

**What is now fixed?** Five levels, ordered by knowledge maturity. "Fuzziness" is replaced by "Status."

**What is no longer allowed?** The three-bin fuzziness system (clear/foggy/unknown). The word "fuzziness."

**What now depends on this choice?** Node format changes. Summary counts change. The "do not resolve fuzziness" rule becomes "do not inflate status" — don't mark something as designed when it's only a concept.

**What changed in the conceptual model?** Status is now a maturity progression, not a confidence label. It tells you what has been done, not how confident you are. This is more actionable.

---

#### Ambiguity: What goes in starting_state.md?

**Resolution:** A structured document with two parts:

1. **References** — file paths to existing docs that describe the current state (archaeology files, traces, devdocs, etc.)
2. **Summary** — human-validated structured text:
   - What exists
   - What's designed but not built
   - What's incomplete

**What is now fixed?** Starting state is always a file. It always has references + summary. It never tries to contain the full codebase analysis.

**What is no longer allowed?** Ephemeral starting state that lives only in conversation context.

**What now depends on this choice?** EXPAND mode reads `starting_state.md` for context. Updates can reference it. The folder structure is now mandatory.

**What changed in the conceptual model?** Starting state becomes a persistent, referenceable artifact — not a throwaway assessment.

---

#### Ambiguity: How are roadmaps made updateable?

**Resolution:** Each node in `map.md` includes a checkbox. Nodes are markdown todo items at the top level, with details below. This allows:
- Marking nodes as done: `- [x] Node 1: Foundation`
- Seeing progress at a glance
- Human editing without breaking structure

**What is now fixed?** Roadmaps are living documents with checkboxes.

**What is no longer allowed?** Static, read-only roadmaps.

**What now depends on this choice?** The node format must include a checkbox. The summary should reflect checked vs unchecked counts.

**What changed in the conceptual model?** The roadmap goes from "generated artifact" to "working document."

---

#### Sense Version 4 (SV4 — Clarified Understanding)

The `/roadmap` command creates a **roadmap workspace** (folder) with three files:
1. `starting_state.md` — references + validated summary of where things are
2. `end_state.md` — structured description of where things should go
3. `map.md` — the roadmap itself with checkboxes, status levels, and ASCII diagram

Starting state is user-controlled (explicit, referenced, or opt-in inference). Status replaces fuzziness with a five-level maturity spectrum. EXPAND mode operates within the folder. Roadmaps are updateable via checkboxes.

---

## Phase 4 — Degrees-of-Freedom Reduction

### Fixed
- Folder structure: `devdocs/roadmaps/<name>/` with three files
- Starting state: always saved, always user-validated
- Status levels: unknown → concept → designed → planned → done
- Checkboxes: always present on nodes
- No auto-inference by default

### Eliminated
- Single-file roadmaps (always a folder now)
- Auto-reading codebase as default behavior
- Three-bin fuzziness (clear/foggy/unknown)
- CREATE/EXPAND as the primary mode split (replaced by a phased workflow)

### Remaining viable paths
- Whether the ASCII diagram should be in `map.md` or a separate file (keep in `map.md` — it's the visual summary)
- Whether end_state.md is always structured or can be freeform (allow both — structure it if possible, accept freeform if that's what the user has)
- Whether "done" status is tracked in the node or only via checkbox (both — checkbox for quick scan, status field for detail)

---

#### Sense Version 5 (SV5 — Constrained Understanding)

The command has three phases, not two modes:

**Phase 0: Establish Context**
- Resolve starting state (user provides, references, or requests inference)
- Resolve end state (user provides)
- Save both as files in the roadmap folder
- User validates before proceeding

**Phase 1: Generate Map**
- Create `map.md` with nodes, ASCII diagram, checkboxes, status levels
- Save and print

**Phase 2: Expand/Update (on subsequent invocations)**
- Read the folder's context files
- Expand a node, update status, or regenerate based on changed state

This is cleaner than CREATE/EXPAND because the phases are sequential on first use and selective on revisit.

---

## Phase 5 — Conceptual Stabilization

### Final Sense Version (SV6 — Stabilized Model)

The `/roadmap` command should be restructured around these principles:

**1. Roadmap as workspace, not file.**
Each roadmap is a folder: `devdocs/roadmaps/<name>/` containing `starting_state.md`, `end_state.md`, and `map.md`.

**2. Starting state is user-controlled.**
Three options: provide it explicitly, point to existing docs, or ask the command to infer (opt-in). Never auto-inferred by default. Always saved and validated before generating.

**3. Starting state is references + summary.**
References point to existing devdocs/archaeology files. Summary is structured: what exists, what's designed but not built, what's incomplete. This avoids duplicating the codebase while preserving human context.

**4. Status replaces fuzziness.**
Five levels of knowledge maturity: `unknown` → `concept` → `designed` → `planned` → `done`. These are progression stages, not confidence labels.

**5. Roadmaps are living documents.**
Each node has a checkbox for progress tracking. The map is meant to be edited by humans over time.

**6. Three-phase workflow.**
- Phase 0: Establish context (starting state + end state → save to folder)
- Phase 1: Generate map (nodes + ASCII diagram + summary → save to folder)
- Phase 2: Expand/update (on revisit — expand nodes, update status, regenerate)

**Difference from SV1:** The original command was a one-shot map generator with auto-inference and coarse fuzziness. The stabilized model is a persistent roadmap workspace with explicit context management, human-controlled inputs, fine-grained status tracking, and built-in updateability.

---

## Recommended Next Step

Rewrite `commands/roadmap.md` based on SV6. The key structural changes are:
1. Replace CREATE/EXPAND modes with Phase 0/1/2 workflow
2. Add folder creation with three files
3. Replace fuzziness with five-level status
4. Add checkboxes to node format
5. Make starting state user-controlled with three input options
