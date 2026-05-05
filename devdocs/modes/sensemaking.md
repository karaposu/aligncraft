# Sensemaking: Modes — The Missing Dimension of AlignCraft

## Initial Sense Version (SV1 — Baseline Understanding)

The innovation sensemaking analysis concluded that innovation is not a seventh alignment layer but a "mode" — a different way of operating within the same six layers. The user immediately recognized the meta-implication: if innovation is a mode and alignment is a mode, then the six layers are a constant structure that can operate in multiple modes. The user asks: what other modes exist? And proposes that understanding and exploiting modes might be the key to what the AlignCraft Agent should achieve.

This is a question about the architecture of the framework itself — discovering a hidden dimension that was implicit in everything built so far but never named.

---

## Phase 1 — Cognitive Anchor Extraction

### Constraints

- The six layers remain constant — modes do not add new layers or remove existing ones
- A mode must be distinguishable by changing how ALL six layers operate, not just one
- Modes must be more than just "tasks" or "activities" — they represent a shift in posture and intent across the entire system
- The existing Agent README already has "Operating Modes" (Document/Build/Hybrid) — the new concept must relate to these without conflicting
- Must be grounded in what AlignCraft already does — the existing commands, agents, and workflows should map to modes

### Key Insights

- **The Agent README's "Operating Modes" are actually AUTONOMY LEVELS, not intent modes.** Document/Build/Hybrid describe what you DO about findings (observe, act, or ask). They don't describe what you're TRYING TO ACHIEVE. These are two different dimensions that were conflated under the same word "mode."
- **Every AlignCraft command implies a mode.** The archaeology commands (arch-traces, arch-intro) operate in a different posture than the planning commands (task-plan, roadmap) which are different from the verification commands (critic, verify). These aren't random — they cluster into distinct intents.
- **Mode transitions are where agent intelligence lives.** A single-mode agent is a script. A multi-mode agent that knows when to switch between exploration, alignment, innovation, and diagnosis — that's intelligent behavior. The agents' value isn't just monitoring their layer, it's knowing which mode to operate in.
- **Different agents can be in different modes simultaneously.** Workspace Agent might be in Maintenance mode (checking freshness) while Task Agent is in Alignment mode (understanding a new task) while Action-Space Agent is in Innovation mode (nothing fits, exploring novel approaches). This is richer than the current architecture describes.

### Structural Points

- There are (at least) three structural dimensions to the AlignCraft operating space:
  1. **Layers** — WHERE you operate (the six alignment dimensions) — CONSTANT
  2. **Intent Modes** — WHY you operate (what you're trying to achieve) — VARIABLE
  3. **Autonomy Levels** — HOW you respond (observe, act, or escalate) — CONFIGURABLE
- The existing "Operating Modes" in agent/README.md are dimension 3 (autonomy), not dimension 2 (intent)
- Commands cluster by intent mode, not just by layer
- Mode transitions can be triggered by specific signals

### Foundational Principles

- A mode is a POSTURE, not a task. It changes what counts as success, what questions to ask, and what constitutes progress — across all six layers simultaneously.
- The six layers are the skeleton. Modes are the nervous system — they determine what the skeleton does.
- The intelligence of an agent system is primarily expressed through mode selection and transition, not through operation within a single mode.

### Meaning-Nodes

- Mode as a hidden dimension
- Intent vs autonomy (two different things both called "mode")
- Mode transitions as the locus of agent intelligence
- Per-agent mode independence (different agents in different modes simultaneously)
- Commands as mode-specific tools

---

#### Sense Version 2 (SV2 — Anchor-Informed Understanding)

The picture has shifted from "what other modes exist" (SV1) to something deeper: **modes are a missing structural dimension of AlignCraft itself.** The framework currently has layers (WHERE) and pillars (WHAT CONDITIONS). Modes add WHY — the intent that changes how you operate within the layers. This isn't just about finding a list of modes; it's about recognizing that mode-awareness is the key capability the AlignCraft Agent needs.

The existing "Operating Modes" (Document/Build/Hybrid) are a separate dimension — autonomy level — that was mislabeled. The real modes (intent modes) are something else entirely.

---

## Phase 2 — Perspective Checking

### Technical / Logical

To qualify as a genuine mode (not just a task or activity), a candidate must pass four tests:

1. **Cross-layer impact** — it changes the posture at ALL six layers, not just one
2. **Distinct success criteria** — what counts as "done" is different from other modes
3. **Distinct relationship to the four pillars** — it emphasizes different pillars or uses them differently
4. **Distinct trigger** — something specific causes the system to enter this mode

Applying these tests to candidates derived from existing AlignCraft commands and workflows:

**Exploration** — "What exists?"
- Workspace: what files, what structure? | Task: what does this project do? | Action-Space: what approaches are in use? | Action-Set: what's the current implementation? | Coherence: how do parts fit together? | Outcome: what does the system produce?
- Success: understanding, not correctness
- Pillar emphasis: creating Explicitness (pillar 1) — making the implicit known
- Trigger: entering unfamiliar territory, starting new work
- Commands: arch-small-summary, arch-intro, arch-traces, key-questions
- PASSES all four tests

**Alignment** — "Is this right?"
- Workspace: is context correct? | Task: is intent understood? | Action-Space: are approaches viable? | Action-Set: is the plan optimal? | Coherence: does it break anything? | Outcome: does it match intent?
- Success: correctness
- Pillar emphasis: all four in sequence (explicit → visible → measured → compared)
- Trigger: task is given, work is in progress
- Commands: task-desc, task-plan, critic, critic-d, implement, compare-intent
- PASSES all four tests (already the implicit default mode)

**Innovation** — "What could exist?"
- Workspace: what new contexts could enable this? | Task: what is the REAL problem? | Action-Space: what doesn't exist yet but should? | Action-Set: what novel combinations are possible? | Coherence: what old coherence should be deliberately broken? | Outcome: what new success criteria should we adopt?
- Success: novelty that survives evaluation
- Pillar emphasis: creating NEW Explicitness (pillar 1, generatively)
- Trigger: existing space is insufficient ("nothing fits")
- Commands: imagine-feasible, sense-making
- PASSES all four tests (already identified)

**Diagnostic** — "What went wrong?"
- Workspace: is context stale or corrupted? | Task: was the task misunderstood? | Action-Space: was the wrong approach chosen? | Action-Set: did the plan have errors? | Coherence: what broke and why? | Outcome: where does result diverge from intent?
- Success: localization — finding exactly where and why things went wrong
- Pillar emphasis: creating Visibility (pillar 2) — making hidden failures visible
- Trigger: something failed, unexpected behavior, output doesn't match expectation
- Commands: verify, probe, dead-code-index
- PASSES all four tests

**Maintenance** — "Is everything still fresh?"
- Workspace: are docs current? | Task: are there stalled/completed tasks to handle? | Action-Space: has the approach landscape changed? | Action-Set: do plans still match reality? | Coherence: has anything drifted? | Outcome: are reports generated, evolution logged?
- Success: freshness — preventing decay
- Pillar emphasis: re-Measurement (pillar 3) — measuring again what was measured before
- Trigger: time has passed, no active task, periodic check
- Commands: dead-code-index, dead-code-concepts, archaeology freshness checks, devdocs hygiene
- PASSES all four tests

**Recovery** — "How do we restore function?"
- Workspace: what was the known-good state? | Task: what was the original intent? | Action-Space: what rollback options exist? | Action-Set: what's the minimal path to restore? | Coherence: which alignments need restoring? | Outcome: has function been restored?
- Success: restoration to known-good state
- Pillar emphasis: Comparison (pillar 4) — comparing broken state to known-good state
- Trigger: diagnostic found the problem, now fix it
- Commands: (no dedicated command yet — potential gap)
- PASSES all four tests

**Reflection** — "What happened and why?"
- Workspace: what was the full context? | Task: what was attempted vs achieved? | Action-Space: what approaches were considered? | Action-Set: what was the actual sequence? | Coherence: what unintended effects occurred? | Outcome: what was learned, what patterns emerged?
- Success: insight — understanding the past
- Pillar emphasis: retroactive Explicitness (pillar 1) — making history explicit
- Trigger: work is complete, milestone reached, period elapsed
- Commands: overview-report, compare-intent, evolution log
- PASSES all four tests

New anchor: **Seven intent modes pass the qualification test.** They are genuine modes, not just activities.

### Human / User

From a developer's perspective, these modes are instantly recognizable — they map to distinct mindsets:

- "I just opened this codebase, I need to understand it" → **Exploration**
- "I know what to build, let me do it right" → **Alignment**
- "The obvious approach won't work, I need a new idea" → **Innovation**
- "Something broke, what happened?" → **Diagnostic**
- "Things are getting stale, time for housekeeping" → **Maintenance**
- "The build is broken, roll it back" → **Recovery**
- "Sprint's done, what did we accomplish?" → **Reflection**

Developers already switch between these modes intuitively. The framework would make the switching explicit and the agents capable of it.

New anchor: **Modes are already how developers naturally work. The framework names what's implicit.**

### Strategic / Long-term

If modes are the key dimension, the AlignCraft Agent architecture needs restructuring:

Current: 6 agents × 3 autonomy levels = 18 configurations
With modes: 6 agents × 7 intent modes × 3 autonomy levels = 126 configurations

But not all combinations are meaningful. The power is in mode TRANSITIONS — the agent's ability to detect "I should switch from Alignment to Diagnostic" or "Action-Space Agent is in Innovation mode while Coherence Agent stays in Alignment mode."

This is the strategic insight: **mode-awareness is the differentiator between AlignCraft Agent and every other AI development tool.** Current tools are locked in a single mode (Alignment, roughly). AlignCraft Agent would be the first system that consciously switches between exploration, alignment, innovation, diagnosis, maintenance, recovery, and reflection.

New anchor: **The competitive advantage is not in any single mode but in the mode-switching intelligence.**

### Risk / Failure

- **Mode confusion** — operating in the wrong mode. Trying to align when you should be exploring. Trying to innovate when you should be diagnosing. This is perhaps the most common failure in AI-assisted development: the tool is in alignment mode when the situation calls for exploration or innovation.
- **Mode lock** — getting stuck in one mode. Always exploring, never building. Always aligning, never reflecting. Always diagnosing, never recovering.
- **Mode conflict between agents** — Workspace Agent in Exploration mode while Action-Set Agent is in Execution mode (building with stale understanding). Mode coordination matters.

New anchor: **Mode errors (wrong mode, stuck mode, conflicting modes) are a new category of alignment failure that operates above the layer level.**

### Resource / Feasibility

Seven modes is manageable. Not every mode needs dedicated commands — some can be expressed through existing commands used with different intent. The framework describes modes, not implements them from scratch.

The CLAUDE.md archaeology freshness check is already an implicit Maintenance mode trigger. The agent README's "innovation recognition" is already an implicit mode transition (Alignment → Innovation). Making modes explicit would organize what already exists.

---

#### Sense Version 3 (SV3 — Multi-Perspective Understanding)

Major shifts from SV2:

1. **Modes are a third structural dimension, not an add-on.** AlignCraft now has three dimensions: Layers (WHERE), Modes (WHY), Autonomy (HOW). This is a significant architectural evolution.

2. **Mode-switching intelligence is the key differentiator.** What makes the agent system valuable isn't its ability to operate in any single mode — it's the ability to detect which mode is appropriate and transition smoothly.

3. **Mode errors are a new failure category.** Operating in the wrong mode is as damaging as misalignment at a layer. The framework needs mode-awareness to be observable, not just layer-alignment.

4. **Modes already exist implicitly.** The commands, the CLAUDE.md checks, the agent behaviors — they all imply modes. The contribution is naming them and making transitions explicit.

---

## Phase 3 — Ambiguity Collapse

#### Ambiguity: Is "alignment" both a mode and the name of the whole framework?

**Resolution:** Yes, and this is fine. "Alignment" at the framework level means maintaining correctness across all dimensions. "Alignment mode" at the mode level means the specific intent of navigating known territory correctly. The framework-level concept is broader — it encompasses all modes, because even Innovation mode ultimately serves alignment (it creates new material that then gets aligned). The mode-level concept is narrower — one of seven specific postures.

**What is now fixed?** Alignment-the-framework contains all seven modes. Alignment-the-mode is one of seven. No renaming needed — context disambiguates.

**What is no longer allowed?** Treating alignment as the ONLY mode the framework supports.

**What now depends on this choice?** The framework description should acknowledge that alignment is achieved THROUGH multiple modes, not just through the alignment mode.

**What changed in the conceptual model?** AlignCraft becomes a multi-modal alignment system, not a single-modal one.

---

#### Ambiguity: What is the relationship between intent modes and the existing "Operating Modes" (Document/Build/Hybrid)?

**Resolution:** They are orthogonal dimensions. Intent modes describe WHAT the system is trying to achieve. Autonomy levels describe WHAT THE SYSTEM DOES about what it finds. They combine:

- Exploration + Document = map the territory, report findings
- Exploration + Build = map the territory, auto-generate documentation
- Diagnostic + Document = find the problem, report it
- Diagnostic + Build = find and fix the problem
- Innovation + Hybrid = explore novel approaches, escalate risky ones for human review

**What is now fixed?** Two separate dimensions: intent (7 modes) and autonomy (3 levels). They combine multiplicatively but not all combinations are equally useful.

**What is no longer allowed?** Using "mode" to mean only autonomy level. The agent README's "Operating Modes" section should be renamed or clarified.

**What now depends on this choice?** The agent architecture description needs to separate these two dimensions explicitly.

**What changed in the conceptual model?** The operating space grows from 6 layers × 3 autonomy levels to 6 layers × 7 intent modes × 3 autonomy levels. But this complexity is managed — most of the time, only a few combinations are active.

---

#### Ambiguity: Can different agents be in different modes simultaneously?

**Resolution:** Yes, and this is expected. Mode is per-agent, not global. Examples:

- Workspace Agent in **Maintenance** (checking freshness) while Task Agent is in **Alignment** (understanding a new task)
- Action-Space Agent in **Innovation** (exploring novel approaches) while Coherence Agent stays in **Alignment** (checking that innovations don't break things)
- Outcome Agent in **Reflection** (evaluating overall progress) while Action-Set Agent is in **Alignment** (executing the current plan)

**What is now fixed?** Mode is per-agent. The system's overall mode is the combination of its agents' individual modes.

**What is no longer allowed?** Treating mode as a global switch where all agents must be in the same mode.

**What now depends on this choice?** Mode coordination between agents becomes important. Conflicting modes need to be detected and resolved.

**What changed in the conceptual model?** The agent mesh becomes even more dynamic — agents coordinate not just on alignment state but on mode state.

---

#### Ambiguity: What triggers mode transitions?

**Resolution:** Each mode has specific entry and exit triggers:

| Mode | Entry Trigger | Exit Trigger |
|------|--------------|-------------|
| Exploration | Unfamiliar territory, new codebase, missing context | Territory mapped, understanding established |
| Alignment | Task given, clear goal exists | Task complete, or alignment failure at landscape level |
| Innovation | Existing space insufficient, explicit request for novelty | Novel approach found and validated, or rejected as infeasible |
| Diagnostic | Failure detected, unexpected behavior, output mismatch | Root cause identified |
| Maintenance | Time elapsed, no active task, staleness detected | Everything fresh, or active task starts |
| Recovery | Diagnostic complete, need to restore function | Function restored, system stable |
| Reflection | Milestone reached, period elapsed, work complete | Insights documented, patterns identified |

**What is now fixed?** Mode transitions are signal-driven, not arbitrary.

**What is no longer allowed?** Random mode switching. Modes change in response to specific conditions.

**What now depends on this choice?** The agent system needs signal detection for mode transitions — knowing when to switch is as important as knowing how to operate within a mode.

---

#### Sense Version 4 (SV4 — Clarified Understanding)

AlignCraft has three structural dimensions:

1. **Six Layers** (constant) — WHERE alignment operates
2. **Seven Intent Modes** (variable, per-agent) — WHY the system operates
3. **Three Autonomy Levels** (configurable, per-agent) — HOW the system responds

The seven intent modes are: Exploration, Alignment, Innovation, Diagnostic, Maintenance, Recovery, Reflection.

Each mode passes the four-test qualification (cross-layer impact, distinct success criteria, distinct pillar emphasis, distinct trigger). Modes are per-agent, not global. Mode transitions are signal-driven. Mode-switching intelligence is the key capability that differentiates AlignCraft Agent from single-mode tools.

The existing "Operating Modes" (Document/Build/Hybrid) in agent/README.md are actually Autonomy Levels — a separate dimension that combines orthogonally with Intent Modes.

---

## Phase 4 — Degrees-of-Freedom Reduction

### Fixed

- Seven intent modes, each passing four qualification tests
- Modes are per-agent (different agents can be in different modes)
- Modes combine orthogonally with autonomy levels (Document/Build/Hybrid)
- Mode transitions have specific triggers
- Mode-switching intelligence is the primary differentiator for the agent system
- Modes already exist implicitly in current commands and workflows
- Mode errors (wrong mode, stuck mode, mode conflict) are a new failure category

### Eliminated

- Modes as a global switch (rejected: per-agent)
- "Execution" as a separate mode (it's Alignment + Build autonomy)
- Modes as the same thing as autonomy levels (they're orthogonal)
- The idea that AlignCraft only operates in alignment mode

### Remaining viable paths

- Whether seven modes are exhaustive (likely near-complete but could discover more)
- How to represent mode state in the agent architecture
- Whether mode transitions should be autonomous or require human approval (depends on autonomy level)
- The exact mapping of every command to its primary mode

---

#### Sense Version 5 (SV5 — Constrained Understanding)

The complete AlignCraft operating space:

```
               Layers (WHERE)              ×    Modes (WHY)        ×  Autonomy (HOW)
┌──────────────────────────────────┐  ┌─────────────────────┐  ┌──────────────────┐
│ 1. Workspace                     │  │ 1. Exploration      │  │ 1. Document      │
│ 2. Task (intent, depth, scope)   │  │ 2. Alignment        │  │ 2. Build         │
│ 3. Action-Space                  │  │ 3. Innovation       │  │ 3. Hybrid        │
│ 4. Action-Set                    │  │ 4. Diagnostic       │  │                  │
│ 5. Coherence                     │  │ 5. Maintenance      │  │                  │
│ 6. Outcome                       │  │ 6. Recovery         │  │                  │
│                                  │  │ 7. Reflection       │  │                  │
└──────────────────────────────────┘  └─────────────────────┘  └──────────────────┘
```

Each of the six agents operates at one layer, in one intent mode, at one autonomy level. These can differ per agent and change over time. The agent mesh is a dynamic configuration of 6 × (mode, autonomy) states, coordinated through signals.

The seven modes, with their pillar emphasis and command mapping:

| Mode | Intent | Success Criteria | Pillar Emphasis | Primary Commands |
|------|--------|-----------------|-----------------|------------------|
| Exploration | Map unknown territory | Understanding | Explicitness (pillar 1) | arch-summary, arch-intro, arch-traces, key-questions |
| Alignment | Navigate correctly | Correctness | All four in sequence | task-desc, task-plan, critic, implement |
| Innovation | Create new territory | Viable novelty | Generative Explicitness (pillar 1) | imagine-feasible, sense-making |
| Diagnostic | Find what's broken | Localization | Visibility (pillar 2) | verify, probe, dead-code-index |
| Maintenance | Prevent decay | Freshness | Re-measurement (pillar 3) | freshness checks, dead-code, hygiene |
| Recovery | Restore function | Restoration | Comparison (pillar 4) | (gap — no dedicated command) |
| Reflection | Learn from history | Insight | Retroactive Explicitness (pillar 1) | overview-report, compare-intent |

Natural mode transition flows:

```
Exploration → Alignment → Reflection
                ↓    ↑
           Innovation
                ↓
           Alignment

Alignment → Diagnostic → Recovery → Alignment

Maintenance ←→ (any idle state)

Reflection → (any mode, informed by insight)
```

---

## Phase 5 — Conceptual Stabilization

### Final Sense Version (SV6 — Stabilized Model)

## Modes: The Missing Dimension of AlignCraft

### Core Discovery

The six alignment layers describe WHERE alignment operates. The four pillars describe WHAT CONDITIONS must hold. But neither describes WHY the system is operating — what it's trying to achieve at any given moment.

**Modes are the missing WHY dimension.** They are the intent that changes how all six layers operate simultaneously. The layers are constant. The modes are variable. The intelligence is in choosing the right mode and knowing when to switch.

### The Three Dimensions of AlignCraft

| Dimension | What it describes | Elements | Variability |
|-----------|------------------|----------|-------------|
| **Layers** | WHERE alignment operates | 6 layers | Constant — always all six |
| **Modes** | WHY the system operates | 7 intent modes | Variable — per-agent, changes over time |
| **Autonomy** | HOW the system responds | 3 levels | Configurable — per-agent, per-mode |

### The Seven Intent Modes

**1. Exploration** — "What exists here?"
Map unknown territory. Build understanding before acting. Every layer asks "what is?" not "what should be?"
Pillar emphasis: making the implicit **Explicit** (pillar 1).

**2. Alignment** — "Is this right?"
Navigate known territory correctly. Find the right approach, execute it, verify it. The default mode for task execution.
Pillar emphasis: all four pillars in full sequence.

**3. Innovation** — "What could exist?"
Create new territory. Generate novel approaches, reframe problems, combine concepts. Activated when the existing landscape is insufficient.
Pillar emphasis: creating **new** Explicitness (pillar 1, generatively).

**4. Diagnostic** — "What went wrong?"
Find where and why things broke. Localize failures across all layers. Investigative, not corrective.
Pillar emphasis: creating **Visibility** of hidden failures (pillar 2).

**5. Maintenance** — "Is everything still fresh?"
Prevent decay. Check staleness, archive completed work, update documentation. Activated between active tasks or on periodic schedule.
Pillar emphasis: **re-Measurement** — measuring again what was measured before (pillar 3).

**6. Recovery** — "How do we restore function?"
Fix what's broken. Restore to known-good state. Activated after diagnosis identifies the problem.
Pillar emphasis: **Comparison** between broken state and known-good state (pillar 4).

**7. Reflection** — "What happened and why?"
Learn from history. Extract patterns, document decisions, identify trajectories. Activated at milestones, end of periods, or after significant work.
Pillar emphasis: retroactive **Explicitness** — making the past explicit (pillar 1).

### Why Modes Are the Key for AlignCraft Agent

**1. Mode-switching intelligence is the differentiator.**

Every existing AI development tool operates in essentially one mode: Alignment (or more precisely, a degraded version of Alignment that only covers Action-Set). The intelligence of AlignCraft Agent isn't in being better at any single mode — it's in knowing which mode to operate in and when to switch.

A system that can:
- Start in Exploration when facing new territory
- Switch to Alignment when the territory is mapped
- Detect when Alignment fails at the landscape level and switch to Innovation
- Switch to Diagnostic when something breaks
- Switch to Recovery after diagnosing
- Enter Maintenance when idle
- Enter Reflection at milestones

...is fundamentally more capable than one locked in a single mode.

**2. Per-agent mode independence enables sophisticated behavior.**

The Workspace Agent can be in Maintenance mode (checking freshness) while the Task Agent is in Alignment mode (understanding a new task) while the Action-Space Agent is in Innovation mode (exploring novel approaches that don't exist yet). This parallel multi-modal operation is something no current tool does.

**3. Mode transitions are signal-driven and observable.**

Each mode has specific entry and exit triggers. These triggers are detectable signals:
- "Context is stale" → Workspace Agent: Maintenance
- "Nothing in the action space fits" → Action-Space Agent: Innovation
- "Tests failing after implementation" → Coherence Agent: Diagnostic
- "Work complete" → all agents: Reflection

Mode transitions become part of the alignment signal — you can see not just WHAT each agent is monitoring, but WHY and in what posture.

**4. Mode errors are a new category of failure.**

| Error | What happens | Example |
|-------|-------------|---------|
| Wrong mode | System operates with wrong intent | Aligning when it should be exploring (building on stale understanding) |
| Stuck mode | System can't transition | Always diagnosing, never recovering. Always exploring, never building. |
| Mode conflict | Agents in incompatible modes | Action-Set building while Workspace exploring (building on incomplete understanding) |
| Missing mode | System lacks a needed mode | No recovery mode → can only diagnose problems, not fix them |

These are alignment failures at the MODE level — above any individual layer.

### Relationship to Existing Architecture

The agent README's "Operating Modes" (Document/Build/Hybrid) are actually **Autonomy Levels** — a separate dimension that combines orthogonally with Intent Modes. They answer different questions:

- Intent Mode: "What am I trying to achieve?" (Explore / Align / Innovate / Diagnose / Maintain / Recover / Reflect)
- Autonomy Level: "What do I do about what I find?" (Document only / Act on it / Escalate if severe)

These combine: Exploration + Document = map the territory, report findings. Diagnostic + Build = find and fix the problem. Innovation + Hybrid = explore novel approaches, escalate risky ones.

### How SV6 Differs from SV1

SV1 asked "what other modes might exist besides alignment and innovation?" — treating modes as a curiosity worth enumerating. SV6 reveals that modes are a **fundamental structural dimension of AlignCraft** that was always present but unnamed. The framework is not six layers with occasional modes — it is six layers × seven modes × three autonomy levels, where mode-switching intelligence is the primary source of agent capability. This restructures the entire understanding of what AlignCraft Agent is and why it's different from existing tools.
