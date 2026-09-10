# APPENDIX 8: AlignCraft SLASH COMMANDS

## What Are Slash Commands?

Slash commands are reusable prompts packaged as markdown files. In Claude Code, you type `/command-name` and the contents of the corresponding `.md` file get injected as a prompt — with your input substituted in.

They turn multi-paragraph prompts you'd otherwise type (or copy-paste) every time into one-word shortcuts. Each command is self-contained: one prompt in, one artifact out.

Slash commands live as `.md` files in a `commands/` directory:
- **Project-level**: `.claude/commands/` — available only in that project
- **Global**: `~/.claude/commands/` — available in every project

## Installation

Install all AlignCraft skills (slash commands) globally with one line:

```bash
#For CLAUDE
curl -sL https://raw.githubusercontent.com/karaposu/AlignCraft/main/install_claude.sh | bash

#For CODEX
curl -sL https://raw.githubusercontent.com/karaposu/AlignCraft/main/install_codex.sh | bash
```

This downloads all slash commands and hooks into `~/.claude/` so they're available in every project you open with Claude Code.

To install for a single project only, copy the `commands/` folder contents into `.claude/commands/` in your project root.

### Activating the devdocs metadata hook

The installer downloads the `devdocs_metadata_appender.sh` hook to `~/.claude/hooks/`. To activate it, add this to your `.claude/settings.json` (project) or `~/.claude/settings.json` (global):

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write",
        "hooks": [
          {
            "type": "command",
            "command": "~/.claude/hooks/devdocs_metadata_appender.sh"
          }
        ]
      }
    ]
  }
}
```

This automatically prepends a metadata header (date, branch, commit, author) to every file written under `devdocs/`. See Appendix 9 for the metadata format.

---

## Core Commands

These four commands form the primary AlignCraft workflow. Each produces an artifact that the next can consume, but all work independently.

```
/elaborate → /task-desc → /task-plan → /critic
```

`/task-impl` runs that chain end to end — it calls `/task-desc`, `/task-plan` and `/critic-d` in sequence, folds the critic's selected fixes back into the plan, then implements and verifies.

`/elaborate` and `/task-desc` serve different purposes: `/elaborate` takes messy input and makes it readable — no structure imposed, just clarity. `/task-desc` takes that clear input and shapes it into a formal feature description with problem statement, success criteria, and scope. One tidies, the other structures for implementation.

### `/elaborate`

Take messy, scattered input and make it tidy — structured, clear, and easy to read. Accepts raw text, file paths, images or all. Saves the output as markdown and flags important ambiguities.

The primary goal is clarity, not task analysis. Alignment verification is a side effect.

**Input**: Raw text, file path, or file path + additional text
**Output**: Structured rephrasing saved as markdown + printed in conversation

[View full command](../commands/elaborate.md)

---

### `/task-desc`

Generate a structured feature description (`desc.md`) with problem statement, user value proposition, success criteria, scope boundaries, and priority level.

Follows the project's existing `devdocs/` folder conventions for output location. Confirms where to save before writing.

**Input**: Feature description, `/elaborate` output, or raw notes
**Output**: `desc.md` at confirmed location

[View full command](../commands/task-desc.md)

---

### `/task-plan`

Generate a step-by-step implementation plan (`step_by_step_impl_plan.md`) based on a feature description. Reads all relevant code to understand existing patterns before writing. If multiple `desc.md` files exist, lists them and asks which feature to plan for.

Blockers are identified before any steps are written, through two gates. **Gate 1 — resolvability:** if you can resolve it yourself, resolve it; it is not a blocker. Reading the code, reading the documentation, searching the web, or writing a probe and running it are all expected before anything is declared. A question is a *huge hard blocker* only when every route is exhausted and it is still out of reach — it needs a human decision, the information exists nowhere reachable, or the action is outside what the AI can do. **Gate 2 — separation:** would knowing the answer rewrite the steps, or only change when they run?

That split produces the two kinds recorded in the plan's `### Huge Hard Blockers` section:

- **Planning blockers** — a missing premise, not a missing detail. The answer would reorder, replace or delete steps rather than adjust them. An open one **stops the plan**: the file is written with the blocker recorded and `BLOCKED — no steps written` as its first line, and nothing further is produced. A plan written over an open planning blocker is misleading, because it looks like a decision has been made when it hasn't.
- **Execution blockers** — something outside the plan that must happen before a step can run (a person notified, a branch deployed, an account granted). The plan is sound and complete; it just can't be finished alone. These stop nothing and bind to the step they gate.

A strong assumption does not close a blocker. Convention-based reasoning is recorded as `OPEN — working assumption`, never as resolved.

Each step carries **Proposed changes**, **Output**, **Safe in nature** (True/False), **Peripheral concepts**, and **Hardness Lvl** (1–5).

**Input**: `desc.md` file path, `/elaborate` output, or direct description
**Output**: `step_by_step_impl_plan.md` in the same directory as the `desc.md`

[View full command](../commands/task-plan.md)

---

### `/critic`

Analyze an implementation plan and identify errors, risks, conflicts, and compatibility issues. Produces a `critic.md` with each risk rated by severity, with ELI5 explanations and mitigation strategies.

If multiple plans exist, lists them and asks which to critique before proceeding.

**Input**: `step_by_step_plan.md` file path or direct plan description
**Output**: `critic.md` in the same directory as the plan

[View full command](../commands/critic.md)

---

### `/critic-d`

Dynamic variant of `/critic`. Instead of a generic checklist, it builds one tailored to the specific plan and codebase. Three passes, run automatically one after another:

1. **Generate** a critic prompt for this plan and codebase, saved as `dynamic_critic_prompt.md` and printed so it can be inspected
2. **Execute** it — produce the verdict and the risks, each with quick / robust / long-term proposals and empty selection boxes
3. **Select** — judge the proposals, tick the boxes, write the notes

Before analysing anything it reads the plan's `### Huge Hard Blockers` and the sibling `desc.md`'s `## Known Blockers`. Anything declared there is known, not a discovery — a critic that "finds" what the plan already said is noise. A declared working assumption gets tested rather than restated.

**Three verdicts.** `IMPLEMENT AS WRITTEN`; `IMPLEMENT AFTER FOLDING THESE IN` (the usual case); or `DO NOT IMPLEMENT — MEANING GAP`, when the plan rests on a premise that is wrong or unestablished so its steps would be rewritten rather than adjusted. The verdict is about the plan's *shape*, not the count or severity of findings — several High risks can still be verdict 2 if the premise holds, and a single finding is verdict 3 if that finding is the premise. Verdicts 1 and 2 judge the plan's content; verdict 3 judges whether it should exist. Verdict 3 triggers its own procedure: state the gap, prefix the plan file with `DEPRECATED_`, record the blocker in `desc.md`, and do not re-plan until it is closed.

**Each risk is stated twice.** Paragraph one is plain — self-contained for someone who has never opened the repository, every project-specific name introduced before it is used, no file paths or symbol names. Paragraph two is precise — exact paths, symbols, call path and trigger conditions. Same risk at two resolutions; the first is an explanation of the second, not a summary of it.

**Mitigations are chosen, not just listed.** Selection compares *elegance* — reach (does this close the instance, or the whole class?) divided by extent (how much has to move). A class must be enumerable to count: if you cannot name another genuine instance, there is no class and long-term collapses into robust. Each proposal carries three boxes — `selected`, `elegant`, `last_resort` — and a two-section note (*Why chosen* / *For future*). A robust fix marked `selected` + `last_resort` alongside a long-term fix marked `elegant` but unselected records the case that matters: the lesser fix was taken knowingly, and the better one is named along with what blocks it.

**Input**: `step_by_step_impl_plan.md` file path or direct plan description
**Output**: `dynamic_critic_prompt.md` + `critic.md` in the same directory as the plan

[View full command](../commands/critic-d.md)

---

### `/task-impl`

Orchestrator. Runs the whole chain on one task: `task-desc` → `task-plan` → `critic-d` → fold → implement → verify. Each step is delegated to the command that owns it; `/task-impl` sequences them, folds the critic's selected mitigations back into the plan, and decides when to halt.

Two jobs are its own. **The fold** — merging the proposals the critic marked `selected` into the plan, adjusting or inserting steps, and re-checking each touched step's `Safe in nature` flag, since a mitigation that reaches into existing behaviour can make a previously safe step unsafe. **Halting** — stopping when an open huge hard blocker or a `DO NOT IMPLEMENT — MEANING GAP` verdict means the plan rests on an assumption already known to be unreliable. Halting is a successful outcome, not an error: it reports what is unresolved, where it is recorded, and what would close it.

On a meaning gap it asks the single question that would close the gap, updates `desc.md`, and re-plans — capped at two cycles before handing back to a human. Resumable: re-run it on the same folder and it continues from whichever artifact is missing.

Uses `/critic-d`, not `/critic` — the three-pass critic is what marks proposals `selected`, and the fold has nothing to read without it.

**Input**: A folder containing `desc.md`, a path to a `desc.md`, or a raw description
**Output**: The task folder's artifacts (`desc.md`, plan, `critic.md`), the folded plan, the implementation, and a test report

[View full command](../commands/task-impl.md)

---

## Foundation Commands

These commands set up a new project's devdocs from scratch. They form a pipeline — each builds on the output of the previous one.

```
/devdocs-foundation → /devdocs-foundation-concepts → /devdocs-foundation-simplified-concepts → /devdocs-foundation-identify-modules → /devdocs-foundation-architecture
```

### `/devdocs-foundation`

Establish the foundational devdocs for a project. Reads all available project context (data dumps, READMEs, conversation history) and creates three foundation documents: project description, philosophy, and known requirements. Works with whatever exists — marks gaps as "unknown" rather than blocking on questions.

**Input**: None
**Output**: `devdocs/foundations/project_description.md`, `devdocs/foundations/philosophy.md`, `devdocs/foundations/known_requirements.md`

[View full command](../commands/devdocs-foundation.md)

---

### `/devdocs-foundation-concepts`

Extract the essential technical concepts from the foundation documents. For each concept, creates a detailed clarification document answering eight structured questions (what it is, how it helps, how it limits, inputs, process, outputs, good outcome, bad outcome).

**Input**: None (reads foundation docs)
**Output**: `devdocs/concepts/concepts.md` + `devdocs/concepts/concept_clarifications/01_*.md` through `NN_*.md`

[View full command](../commands/devdocs-foundation-concepts.md)

---

### `/devdocs-foundation-simplified-concepts`

Simplify the full concepts for prototype scope. Reduces features but preserves architecture — the simplified version can expand to the full version without rewrites. Each simplification documents what was cut and why the architecture survives.

**Input**: None (reads concepts docs)
**Output**: `devdocs/concepts/simplified_concepts.md` + `devdocs/concepts/simplified_concept_clarifications/01_*.md` through `NN_*.md`

[View full command](../commands/devdocs-foundation-simplified-concepts.md)

---

### `/devdocs-foundation-identify-modules`

Identify logical module boundaries from the simplified concepts. Only modularizes at major conceptual boundaries — avoids over-engineering. Documents what was NOT modularized and why.

**Input**: None (reads simplified concepts)
**Output**: `devdocs/foundations/module_proposal.md`

[View full command](../commands/devdocs-foundation-identify-modules.md)

---

### `/devdocs-foundation-architecture`

Propose the project architecture based on simplified concepts and module proposal. Critically evaluates the module proposal (accepts, merges, or rejects modules). Every design pattern must earn its place by solving a named problem. Documents expansion paths and key trade-offs.

**Input**: None (reads simplified concepts + module proposal)
**Output**: `devdocs/foundations/architecture.md`

[View full command](../commands/devdocs-foundation-architecture.md)

---

## Analysis & Sensemaking

### `/sense-making`

Run the Structural Sensemaking Framework against any input. Transforms vague or complex input into stable understanding through five phases: anchor extraction, perspective checking, ambiguity collapse, degrees-of-freedom reduction, and conceptual stabilization. Produces six progressive Sense Versions (SV1–SV6).

**Input**: Raw text, file path, or file path + additional text
**Output**: Full sensemaking analysis saved as markdown

[View full command](../commands/sense-making.md)

---

## Thinking Discipline Commands

These commands implement the AlignCraft Thinking Disciplines. Each discipline is a domain-agnostic methodology for a specific cognitive operation. They can be used independently or chained via `/inquiry`.

### `/innovate`

Apply the Structural Innovation Framework to any input. Systematically generates novel ideas using seven mechanisms (4 Generators + 3 Framers) — Lens Shifting, Combination, Inversion, Constraint Manipulation, Absence Recognition, Domain Transfer, and Extrapolation. For each mechanism, produces three variations: one generic, one focused, one controversial. Tests outputs for novelty, scrutiny survival, fertility, and actionability.

**Input**: Raw text, file path, or file path + additional text
**Output**: Full innovation analysis saved as markdown

[View full command](../commands/innovate.md)

---

### `/td-critique`

Apply the Structural Critique thinking discipline. Constructs evaluation dimensions from the understood problem, builds a multi-dimensional fitness landscape, conducts adversarial testing on each candidate (prosecution + defense + collision), and produces verdicts: SURVIVE, REFINE, or KILL — each with constructive output. The contraction force that turns divergent thinking into convergent results.

**Input**: Candidates to evaluate + problem context (sensemaking output or equivalent)
**Output**: Fitness landscape with positioned candidates, coverage map, and verdicts saved as markdown

[View full command](../commands/td_critique.md)

---

### `/decompose`

Apply the Structural Decomposition thinking discipline. Perceives the internal coupling topology of a complex whole — where things are tightly connected (keep together) vs loosely connected (natural boundary) — and partitions into independently coherent pieces with explicit interfaces and dependency ordering. The scale operator that makes any problem tractable.

**Input**: Complex problem, task, or system to decompose
**Output**: Coupling map, question tree with pieces, interfaces, and dependency ordering saved as markdown

[View full command](../commands/decompose.md)

---

### `/explore`

Apply the Structural Exploration thinking discipline. Maps unknown territory through iterative scan-signal-probe cycles at managed resolution levels. Two modes: artifact exploration (codebases, literature — find what exists) and possibility exploration (solution spaces, design options — enumerate what could exist). Tracks the frontier between known and unknown with confidence assessment.

**Input**: Territory to explore (codebase path, problem space, domain)
**Output**: Structural map with confidence levels, frontier, and gaps saved as markdown

[View full command](../commands/explore.md)

---

### `/comprehend`

Apply the Structural Comprehension thinking discipline. Builds internal working models of observable-but-opaque artifacts through progressive model construction, perturbation testing, and adversarial self-verification. Produces five Comprehension Versions (CV1–CV5) across a depth hierarchy (Descriptive → Structural → Causal → Predictive → Generative). Two primary aspects: mechanistic ("how does it work?") and intent ("why was it built this way?"). Each CV includes frontier questions — unanswered questions that mark the boundary of current understanding and serve as direction signals for further investigation.

**Input**: Artifact to comprehend (file path, folder path, raw description) + optional aspect (mechanistic/intent) and depth target
**Output**: Comprehension versions with tested predictions, confidence map, and frontier questions saved as markdown

[View full command](../commands/comprehend.md)

---

### `/navigation`

Apply the Structural Navigation thinking discipline. A boundary discipline that maps the full space of possible next directions after a SIC cycle completes. Reads C's verdicts (survivors, refinements, kill seeds), frontier questions, telemetry, and optionally R's observations — then produces a navigation map: every possible direction typed from a 15-type taxonomy across 3 categories (content-directed, process-directed, context-directed). Each direction has its own WHY, and 3-6 independently reasoned guidelines (each with its own WHY). Includes confidence levels (■ HIGH / ○ MEDIUM / · LOW) and an excluded section for types considered and rejected. Navigation enumerates WITHOUT selecting — the full space, not a filtered top N.

Navigation replaces wayfinding (superset — 15 types vs 6 moves, full enumeration vs single direction).

**Input**: Inquiry folder with SIC outputs, raw text describing current state, or file path
**Output**: Navigation map saved as `navigation_N.md` (numbered per iteration)

[View full command](../commands/navigation.md)

---

### `/wayfinding` *(superseded by `/navigation`)*

Apply the Structural Wayfinding thinking discipline. Produces a single steering move from six options (BROADEN, NARROW, SHIFT, DIAGNOSE, TERMINATE, RECONSIDER). Navigation (`/navigation`) is the recommended replacement — it produces the full possibility space instead of a single direction.

[View full command](../commands/wayfinding.md)

---

### `/inquiry`

The loop runner for chaining thinking disciplines. Not a thinking discipline itself — operational plumbing. For NEW inquiries: classifies the problem (CONFIGURE), selects and sequences disciplines into a pipeline, creates an inquiry folder. For RESUME: checks progress and tells you what to run next. After each pipeline iteration: calls wayfinding for a steering checkpoint. Does NOT run disciplines itself — tells you which discipline command to type next.

**Input**: New question/problem, or existing inquiry folder to resume
**Output**: Pipeline configuration + inquiry folder, or next command to run

[View full command](../commands/inquiry.md)

---

### `/MVL`

The minimum viable loop — runs Sensemaking → Innovation → Critique (SIC) on any question. Always the full pipeline, no classification, no variable sequencing. For NEW questions: creates an inquiry folder with `_branch.md` (question + goal + scope check) and `_state.md` (progress tracking). For RESUME: reads state, detects which discipline to run next. When the iteration completes: writes `finding.md` (self-contained argumentative output: Question → Finding → Reasoning → Open Questions) and archives source files to `docarchive/`. If the question isn't answered, loops again with refined focus.

**Input**: New question/description, or existing inquiry folder to resume
**Output**: Inquiry folder (`devdocs/inquiries/<name>/`) with `_branch.md`, `_state.md`, SIC outputs, and eventually `finding.md`

[View full command](../commands/MVL.md)

---

### `/MVL+`

The extended cognitive loop — runs Exploration → Sensemaking → Decomposition → Innovation → Critique on any question. Adds two first-phase disciplines (E maps unknown territory, D partitions complexity) that `/MVL` classic lacks. Strictly sequential in the first phase. Coexists with classic `/MVL` — `_state.md` has a `flow-type: extended` field to distinguish. Use `/MVL+` as the default for new inquiries; use `/MVL` classic for simple well-defined problems when speed matters. When the iteration completes: writes `finding.md` from six sources (`_branch.md` + all five discipline outputs) and archives them to `docarchive/`.

**Input**: New question/description, or existing extended inquiry folder to resume
**Output**: Inquiry folder with 5-step progress tracking, all discipline outputs, and `finding.md`

[View full command](../commands/MVL+.md)

---

## Archaeology Commands

These commands are for understanding existing codebases. They read code (not documentation) and produce honest assessments of what the project actually is and how it's built.

### `/arch-small-summary`

Read all code files and produce a non-technical summary of the project — what it does, what state it's in, who would use it. Based purely on code behavior, not what docs claim.

**Input**: Optional `-n` flag (no save)
**Output**: Saves to `devdocs/archaeology/small_summary.md` + prints in conversation

[View full command](../commands/arch-small-summary.md)

---

### `/arch-intro`

Produce a high-level architecture introduction covering data flow paths, main abstractions, and top-level design patterns. Written as if onboarding a new engineer on their first day.

**Input**: Optional `-n` flag (no save)
**Output**: Saves to `devdocs/archaeology/intro2codebase.md` + prints in conversation

[View full command](../commands/arch-intro.md)

---

### `/arch-traces`

Trace every internal interface and submodule-level interaction end-to-end. Creates one file per trace with core sections (entry point, execution path, resource management, error path, performance, observable effects, design rationale) and assessment sections (incomplete, vulnerable, bad design — each with ELI5, impact, and fixes).

**Input**: None
**Output**: One file per trace in `devdocs/archaeology/traces/`

[View full command](../commands/arch-traces.md)

---

### `/arch-traces-2`

Enhanced version of `/arch-traces` with structured trace categories. Organizes traces into six categories: lifecycle traces, data transformation traces, integration boundary traces, decision and routing traces, error and recovery traces, and cross-cutting mechanism traces. Each trace includes core sections (entry point, execution path, resource management, error path, performance, observable effects, design rationale) and assessment sections with ELI15 explanations, impact analysis, robust fixes, architectural fixes, and speculative defence for unusual design choices.

Writes a grouped enumeration of all traces before writing individual trace files. Requires codebase understanding — suggests running `/arch-small-summary` and `/arch-intro` first if context is missing.

**Input**: None
**Output**: One file per trace in `devdocs/archaeology/traces/`

[View full command](../commands/arch-traces-2.md)

---

### `/arch-top-improvements`

Based on existing traces, identify the 5 highest-impact improvements for the codebase. For each, explains why it matters, what it affects, and a plausible reason it hasn't been done yet (respecting that there may be undocumented decisions behind the current state).

Requires `/arch-traces` to have been run first.

**Input**: None
**Output**: `devdocs/archaeology/top_improvements.md`

[View full command](../commands/arch-top-improvements.md)

---

### `/dead-code-index`

Scan the codebase and inventory all unused code candidates — unreferenced files, dead code paths, commented-out blocks, duplicate implementations, abandoned features, orphaned tests and configs. Each candidate gets structured fields (imported by, called by, used in configs, dynamic loading, attached concepts, assumed intent, confidence) plus a ready-to-run grep command for manual verification.

Does not delete anything — inventory only.

**Input**: None
**Output**: `devdocs/archaeology/dead_code_index.md`

[View full command](../commands/dead-code-index.md)

---

### `/dead-code-concepts`

Analyze dead code at a concept level. Groups dead code entries from `/dead-code-index` into higher-level concepts — technical frameworks, business logic, design patterns, architecture, methodology, conventions — and identifies which ideas the codebase has moved past entirely.

Requires `/dead-code-index` to have been run first.

**Input**: None
**Output**: `devdocs/archaeology/dead_concepts_index.md`

[View full command](../commands/dead-code-concepts.md)

---

## Navigation

### `/roadmap`

Generate a navigation map from starting state to end state. Creates a roadmap workspace (folder) with persistent context: `starting_state.md`, `end_state.md`, and `map.md`. Starting state is user-controlled — never auto-reads the codebase unless asked. Supports node expansion for progressive refinement. Each node has a five-level status (unknown → concept → designed → planned → done) and a checkbox for progress tracking.

Three-phase workflow:
1. Phase 0: Establish context (starting state + end state → save to folder)
2. Phase 1: Generate map (nodes + ASCII diagram + summary)
3. Phase 2: Expand/update on revisit

**Input**: Starting state, end state, or existing roadmap folder + node reference
**Output**: `devdocs/roadmaps/<name>/` folder with `starting_state.md`, `end_state.md`, `map.md`

[View full command](../commands/roadmap.md)

---

## Reporting

### `/overview-report`

Generate a structured report of what happened in the project over a given time period. Combines git history, devdocs artifacts (plans, fixes, traces), and code changes into a readable summary. Each work item gets Why/How/Impact sections. Includes a Direction section connecting individual changes into a trajectory, and a By the Numbers table with concrete metrics.

**Input**: Time period — `24h`, `1d`, `7d`, `30d` (default: `7d`)
**Output**: `devdocs/reports/overview_<period>_<date>.md`

[View full command](../commands/overview-report.md)

---

## Alignment

### `/align`

Load all relevant context for a specific task and assess alignment across all six layers. Reads archaeology, task docs, plan, critic, affected modules, and success criteria — then reports gaps and recommends what to do next. After running, the AI has full context loaded and is ready to discuss or implement.

**Input**: Task path, task name, or description
**Output**: Alignment report printed in conversation (not saved to file)

[View full command](../commands/align.md)

---

### `/align-modes`

For a given task, assess what is needed across all seven intent modes (Exploration, Alignment, Innovation, Diagnostic, Maintenance, Recovery, Reflection) and all six alignment layers. Produces a complete strategic picture — not just what to build, but what to explore, what might need innovation, what could break, what to maintain, and what to reflect on. Includes a synthesis with critical items, risk areas, mode sequence recommendation, and recovery plan.

**Input**: Task path, task name, or description
**Output**: Full multi-modal assessment printed in conversation

[View full command](../commands/align-modes.md)

---

## Maintenance

### `/devdocs-archivist`

Scan all devdocs, compare each folder and file against the codebase and current context, and determine what should be archived. Staleness is inferred, not declared — the AI checks "does the code reflect what this doc describes?" Archives as a unit (entire folders move together). Cross-reference integrity is preserved — done docs stay if active docs reference them. Each run creates an isolated timestamped folder under `devdocs/archive/`.

**Input**: Optional `-doc` flag (produce report only, don't move files)
**Output**: Without `-doc`: archive plan + confirmation prompt + file moves. With `-doc`: `devdocs/archive_report_<date>.md`

[View full command](../commands/devdocs-archivist.md)

---

## Quick Reference

| Command | What it does | Output |
|---------|-------------|--------|
| `/devdocs-foundation` | Create foundation docs (description, philosophy, requirements) | `devdocs/foundations/` (3 files) |
| `/devdocs-foundation-concepts` | Extract and clarify core concepts | `devdocs/concepts/` + clarifications |
| `/devdocs-foundation-simplified-concepts` | Simplify concepts for prototype | `devdocs/concepts/simplified_*` |
| `/devdocs-foundation-identify-modules` | Identify module boundaries | `devdocs/foundations/module_proposal.md` |
| `/devdocs-foundation-architecture` | Propose project architecture | `devdocs/foundations/architecture.md` |
| `/elaborate` | Tidy up messy input | Markdown file(s) + conversation |
| `/task-desc` | Structured feature description | `desc.md` |
| `/task-plan` | Step-by-step plan, gated on huge hard blockers | `step_by_step_impl_plan.md` |
| `/critic` | Risk/error/conflict analysis (generic) | `critic.md` |
| `/critic-d` | Risk analysis (dynamic, three-pass) + verdict + mitigation selection | `dynamic_critic_prompt.md` + `critic.md` |
| `/task-impl` | Orchestrator: desc → plan → critic-d → fold → implement → verify | Full task folder + implemented code |
| `/sense-making` | Structural sensemaking analysis | Markdown file(s) |
| `/innovate` | Structural innovation (7 mechanisms × 3 variations) | Markdown file(s) |
| `/td-critique` | Structural critique (fitness landscape + adversarial verdicts) | Markdown file(s) |
| `/decompose` | Structural decomposition (coupling map + question tree) | Markdown file(s) |
| `/explore` | Structural exploration (scan-signal-probe + confidence map) | Markdown file(s) |
| `/comprehend` | Structural comprehension (model construction + prediction testing + frontier questions) | Markdown file(s) |
| `/navigation` | Full possibility map (15 types × 3 categories, directions + guidelines) | `navigation_N.md` per iteration |
| `/wayfinding` | Search steering — superseded by `/navigation` | Steering directive as markdown |
| `/inquiry` | Loop runner (CONFIGURE + track + resume) | Inquiry folder + next command |
| `/MVL` | Minimum viable loop (S → I → C) | Inquiry folder + `finding.md` |
| `/MVL+` | Extended cognitive loop (E → S → D → I → C) | Inquiry folder + `finding.md` |
| `/arch-small-summary` | Non-technical project summary | `devdocs/archaeology/small_summary.md` + conversation |
| `/arch-intro` | Architecture introduction | `devdocs/archaeology/intro2codebase.md` + conversation |
| `/arch-traces` | End-to-end interaction traces | `devdocs/archaeology/traces/` |
| `/arch-traces-2` | Categorized traces (6 categories, enhanced assessments) | `devdocs/archaeology/traces/` |
| `/arch-top-improvements` | 5 highest-impact improvements | `devdocs/archaeology/top_improvements.md` |
| `/dead-code-index` | Inventory unused code candidates | `devdocs/archaeology/dead_code_index.md` |
| `/dead-code-concepts` | Group dead code into dead concepts | `devdocs/archaeology/dead_concepts_index.md` |
| `/roadmap` | Navigation map from start to end state | `devdocs/roadmaps/<name>/` folder |
| `/overview-report` | Period overview report (why/how/impact) | `devdocs/reports/overview_<period>_<date>.md` |
| `/align` | Load task context across all 6 layers, report gaps | Alignment report in conversation |
| `/align-modes` | Assess task across 7 modes × 6 layers | Multi-modal assessment in conversation |
| `/devdocs-archivist` | Scan devdocs, detect staleness, archive done work | Archive plan + moves (or `-doc` report) |

## Hooks

| Hook | What it does | Trigger |
|------|-------------|---------|
| `devdocs_metadata_appender.sh` | Auto-injects metadata header (date, branch, commit, author) into devdocs files | `PreToolUse` on `Write` |

[View hook script](../hooks/devdocs_metadata_appender.sh)
