# Sensemaking: Adapter Pattern for Scalable Loop

## User Input
devdocs/inquiries/adapter_pattern_for_scalable_loop/_branch.md

---

## SV1 — Baseline Understanding

The question asks how to design the adapter mechanism (where discipline specs auto-attach to SIC) in a way that serves two masters: practical usability today AND future autonomous multi-headed loops. Options A (auto-detect in MVL) and B (named entry points) are on the table, but the user wants the full design space — especially considering loop automation and multi-headed branching.

---

## Phase 1 — Cognitive Anchor Extraction

### Constraints

- **C1**: System runs in Claude Code sessions. State persists ONLY through files. No daemon, no runtime state.
- **C2**: Human currently types every command. Automation means something else must decide "what to run next."
- **C3**: Multi-headed branching requires TREES, not linear sequences. The folder-based exploration system was designed for this but never activated in MVL.
- **C4**: Context window limits mean each branch must be independently runnable with only its own context + minimal shared context.
- **C5**: Adapter must be DATA (markdown), not code. Everything in the system is markdown files and slash commands.
- **C6**: The minimum viable loop needs two fixes: (1) inquiry reads telemetry, (2) inquiry-scoped file organization. (2) is partially done via MVL. (1) is still open.

### Key Insights

- **I1**: An adapter is three things: (a) input template for S, (b) generation guidance for I, (c) evaluation traps for C. All TEXT — injectable as paragraphs.
- **I2**: Current discipline commands already ARE adapters for S, I, C slots. The adapter pattern needs to be GENERALIZED from what exists, not invented.
- **I3**: For automation, "what to run next" must be derivable from state files alone — no human judgment required.
- **I4**: Multi-headed branching already has a design: the folder-based exploration system. Each branch = folder with `_branch.md` and `_state.md`. File system IS the tree.
- **I5**: Claude Code's `/loop` and `ScheduleWakeup` enable autonomous execution. An automated loop = repeatedly invoke MVL on an inquiry folder.
- **I6**: Multi-heading happens when C produces multiple survivors pointing in different directions. Each direction gets its own branch, each branch runs its own SIC loop.
- **I7**: Option A reintroduces classification (CONFIGURE returns). Option B doesn't compose (combinatorial commands). Both have structural scaling problems.
- **I8**: Adapter-as-file (`_adapter.md`) in the inquiry folder avoids both problems: no classification, composable, automation-compatible, level-agnostic.
- **I9**: Automation bottleneck is MVL's dispatch model. Currently REPORTS next step; must EXECUTE next step.
- **I10**: Multi-heading is a state-management extension. Folder convention supports it. Missing: MVL branch creation/tracking.
- **I11**: Adapter templates stored centrally + copied per inquiry = simplest UX with full flexibility.
- **I12**: Adapter-as-file is LEVEL-AGNOSTIC — same mechanism works at all autonomy levels. What changes is WHO writes the file.
- **I13**: Multi-heading requires SELF-CONTAINED BRANCHES. Each branch runnable with only its own folder contents.
- **I14**: Automation requires telemetry-based quality gates FIRST. Without them, automation = amplified error.
- **I15**: Build sequence: adapters → telemetry gates → auto-dispatch → multi-heading → autonomous loop. Each depends on previous.

### Structural Points

- **SP1**: Three levels of loop complexity: Level 1 (linear, human-driven), Level 2 (adapter, semi-automated), Level 3 (multi-headed, automated).
- **SP2**: Adapter, automation, and multi-heading are ORTHOGONAL concerns. Can be designed independently.
- **SP3**: The bottleneck for automation is the DECISION POINT between iterations — must be made explicit and file-based.

### Foundational Principles

- **FP1**: Moving from Level 0 to Level 3 means relaxing "human reviews between every step" to "human reviews at checkpoints."
- **FP2**: Graduated autonomy model: Level 0→4, each level builds on previous.
- **FP3**: "The file system IS the thinking structure." Adapters must be files or file-embeddable.

---

### SV2 — Anchor-Informed Understanding

THREE independent design dimensions, not one: (1) Adapter (data problem), (2) Automation (dispatch problem), (3) Multi-heading (tree problem). Options A and B only address dimension 1, and both have scaling flaws.

---

## Phase 2 — Perspective Checking

### Technical
Option A reintroduces CONFIGURE. Option B doesn't compose. Alternative: adapter-as-file in inquiry folder — data-driven, composable, automation-compatible. For automation: MVL must invoke commands directly, not tell human. For multi-heading: folder convention already supports it, MVL needs branch management logic.

### Human / User
Simplest UX: central templates + copy to inquiry. One file copy at inquiry creation. Human picks adapter once, not at every step.

### Strategic
Graduated autonomy maps to the build sequence. Adapter-as-file supports ALL autonomy levels without redesign.

### Risk
Automation without telemetry gates = amplified error. Build order matters: adapters → telemetry → dispatch → branching → autonomy. Multi-heading needs self-contained branches to avoid context explosion.

### Definitional
Adapters don't change the pipeline (always S→I→C) — they change slot contents. Consistent with MVL's core rule. Automation relaxes "human reviews every step" intentionally per graduated autonomy model. Consistent with system's strategic direction.

---

### SV3 — Multi-Perspective Understanding

Both Options A and B superseded by adapter-as-file. Clear build sequence identified. Key risk: automation before telemetry gates. Key design constraint: branches must be self-contained.

---

## Phase 3 — Ambiguity Collapse

### Ambiguity 1: Where does the adapter live?

**Resolution:** Two-tier: central templates in `thinking_disciplines/adapters/` + per-inquiry `_adapter.md` copied from template. Template = reusable source. Copy = runtime config.
**Confidence:** HIGH

### Ambiguity 2: Multi-heading — parallel or sequential?

**Resolution:** Design for parallel, implement sequentially first. Architecture supports both. Dispatcher starts sequential, upgrades to parallel later.
**Confidence:** LOW

### Ambiguity 3: When does branching happen?

**Resolution (OPEN):** Allow after both S (decomposition-triggered) and C (multiple survivors). S-triggered branching mechanism needs more design thought.

### Ambiguity 4: What goes in `_adapter.md`?

**Resolution:** Three sections — S guidance, I guidance, C traps. Contains only the DELTA from default SIC, not the full discipline spec.
**Confidence:** HIGH

**Format:**
```markdown
# Adapter: [type]
## S — Input Guidance
[How to structure the input for sensemaking]
## I — Generation Guidance
[What kind of outputs to generate beyond the obvious]
## C — Evaluation Traps
[Specific failure-mode traps to check during critique]
```

---

### SV4 — Clarified Understanding

Adapter = file, two-tier, three-section. Automation = telemetry first, then dispatch. Multi-heading = self-contained branches, sequential first. Build sequence = adapters → telemetry → dispatch → branching → autonomy. Options A and B superseded.

---

## Phase 4 — Degrees-of-Freedom Reduction

**Fixed:**
- Adapter is `_adapter.md` in inquiry folder, three-section format
- Central templates for reuse, per-inquiry copies for runtime
- Build sequence: adapters → telemetry → dispatch → branching → autonomy
- Each branch self-contained
- Pipeline per branch always S→I→C

**Eliminated:**
- Option A (auto-detect) — reintroduces CONFIGURE
- Option B (named commands) — doesn't compose
- Full spec injection — context bloat
- Automation before telemetry — unsafe

**Remaining paths:** Five sequential builds, each independently useful, each unlocking the next.

---

### SV5 — Constrained Understanding

Five-step build sequence:
1. **NOW:** Adapter-as-file + templates + MVL reads/injects
2. **NEXT:** Telemetry gates in MVL RESUME
3. **AFTER:** Auto-dispatch (MVL invokes commands directly)
4. **THEN:** Multi-heading (branch creation, tree tracking)
5. **FUTURE:** Autonomous loop (`/loop` + MVL)

Each build is independently useful. Each unlocks the next. Adapter-as-file supports all without redesign.

---

## Phase 5 — Conceptual Stabilization

### SV6 — Stabilized Model

**The adapter pattern should be implemented as a file (`_adapter.md`) in the inquiry folder, with three sections (S guidance, I guidance, C traps), sourced from central templates.**

This design is the foundation for a five-step build sequence:

```
thinking_disciplines/adapters/       ← Central templates
  wayfinding.md
  comprehension.md
  exploration.md
  decomposition.md
  default.md

devdocs/inquiries/<name>/           ← Per-inquiry runtime
  _branch.md                         (the question)
  _adapter.md                        (copied from template, customizable)
  _state.md                          (progress, iteration, history)
  sensemaking.md / innovation.md / critique.md
  branch_a/                          ← Sub-branch (Build 4)
    _branch.md / _adapter.md / _state.md / ...
```

**Why A and B are superseded:**

| | Option A | Option B | Adapter-as-file |
|---|---|---|---|
| Classification | YES (CONFIGURE returns) | NO | NO |
| Composability | N/A | NO | YES |
| Automation-compatible | Fragile | YES | YES |
| Multi-heading | Unclear | Awkward | Natural |
| Maintenance | Logic in MVL | N commands | N templates |

**Five bottlenecks and build sequence:**

| # | Bottleneck | Resolution |
|---|---|---|
| 1 | No adapter mechanism | Adapter-as-file, three-section format |
| 2 | No quality gates | Telemetry reading in MVL RESUME |
| 3 | Human-typed dispatch | MVL invokes commands directly |
| 4 | Linear-only state | Branch folders with independent state |
| 5 | No autonomous trigger | `/loop` or `ScheduleWakeup` wiring |

**Key principle: adapter-as-file is LEVEL-AGNOSTIC.** Same `_adapter.md` works whether human wrote it (Level 0), system suggested it (Level 2), or system selected it autonomously (Level 3). What changes is WHO writes the file, not HOW it works.

**How SV6 differs from SV1:** SV1 saw an A-vs-B adapter choice. SV6 sees three independent dimensions (adapter, automation, multi-heading), a five-step build sequence, and a single unifying pattern that supports all autonomy levels without redesign.

---

## Saturation Indicators

- **Perspective saturation**: 5 perspectives, Technical produced most anchors, Risk produced critical ordering constraint. Saturated.
- **Ambiguity resolution ratio**: 4 addressed, 3 HIGH, 1 OPEN (S-triggered branching).
- **SV delta**: Very significant — from A-vs-B choice to three-dimensional design space with five-step build sequence.
- **Anchor diversity**: C(6), I(15), SP(3), FP(3), MN(4) across 5 perspectives. I8, I14, I15 load-bearing.
