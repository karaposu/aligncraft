# Slash Commands & Skills: Packaging AlignCraft Prompts

AlignCraft prompts fall into two categories based on complexity: **slash commands** for single-step operations and **skills** for multi-step workflows.

## The Distinction

- **Slash command** — One prompt, one output. Self-contained. Lives as a markdown file in `.claude/commands/`.
- **Skill** — A multi-phase workflow where each step depends on the previous. Orchestrates several slash commands into a coherent process.

Rule of thumb: if it can run once and produce a useful result, it's a slash command. If it requires a sequence of decisions and outputs, it's a skill.

---

## Core Slash Commands

These four commands form the primary AlignCraft workflow. Each feeds into the next, but all can be used independently.

### `/elaborate`
Take raw, messy input (data dump, ticket, notes) and rephrase it back for alignment verification. Uses codebase context to interpret what the user means.
→ Source: Appendix 4, Step 1

### `/task-desc`
Generate a structured `desc.md` with problem statement, value proposition, success criteria, scope boundaries.
→ Source: Appendix 4, Step 2

### `/task-plan`
Generate a `step_by_step_plan.md` with high-level summary and detailed implementation plan.
→ Source: Appendix 4, Step 3

### `/critic`
Generate a `critic.md` that identifies errors, risks, conflicts, and compatibility issues against an implementation plan.

```
/critic              → generic checklist
/critic --d          → dynamic, tailored to codebase + task context
```

→ Source: Appendix 4, Step 4 (generic), Appendix 7 (dynamic)

### Core flow

```
/elaborate → /task-desc → /task-plan → /critic
```

Each step produces an artifact that the next step consumes. Human verification happens between each step.

---

## Supporting Slash Commands

### `/test-scenarios`
Generate comprehensive test scenarios: trigger points, happy paths, edge cases, error scenarios, integration tests, acceptance criteria.
→ Source: Appendix 4, Step 6

### `/probe-tests`
Generate probe test files — no frameworks, verbose output, real components, real data.
→ Source: Appendix 4, Step 6

### `/anchor-check`
Run all existing tests to verify the current implementation hasn't broken anything. Stable intermediate form validation.
→ Source: Appendix 4, Step 8

### `/implementation-notes`
Document the implementation journey: deviations, obstacles, undocumented behaviors, technical debt.
→ Source: Appendix 4, Step 9

### `/gap-analysis`
Identify knowledge gaps before implementation — logic patterns, providers, frameworks, edge cases. Outputs a gap list and separates resolvable vs needs-human-input.
→ Source: Appendix 5, Gap Analysis

### `/file-relevance-map`
Generate a HOT/WARM/COLD file relevance map for a given task. Identifies which files to modify, reference, or ignore.
→ Source: Appendix 5, File Relevance Mapping

### `/archaeology-summary`
Read all code files in an existing project and produce a non-technical summary.
→ Source: Appendix 2, Phase 1

### `/refactor-detect`
Scan codebase for refactoring opportunities — repeated patterns, long parameter lists, traveling data+functions.
→ Source: Appendix 3, Recognizing Refactoring Opportunities

---

## Skills (Multi-Step Workflows)

Skills compose slash commands into repeatable workflows. Each skill orchestrates the core flow plus task-specific supporting commands.

### `add-feature`
The complete feature lifecycle from idea to finished implementation.

**Steps orchestrated:**
1. `/elaborate` — Verify understanding of raw input
2. `/task-desc` — Generate feature documentation
3. `/task-plan` — Generate step-by-step plan
4. `/critic` — Risk assessment (generic or `--d` for dynamic)
5. Execute the plan
6. `/test-scenarios` + `/probe-tests` — Test planning and execution
7. `/anchor-check` — Regression verification
8. `/implementation-notes` — Document the journey
9. Move feature from `planned/` to `finished/`

→ Source: Appendix 4 (full workflow)

### `new-project`
From idea to prototype — data dump through module implementation loop.

**Steps orchestrated:**
1. Data dump consolidation
2. Foundation document generation (project brief, tech spec, conventions)
3. Architecture planning
4. Module loop: `/task-plan` → implement → `/probe-tests` → `/anchor-check` (repeated per module)
5. Integration and smoke tests

→ Source: Appendix 1 (Phases 0–14)

### `adopt-codebase`
Apply AlignCraft to an existing codebase using the archaeology pattern.

**Steps orchestrated:**
1. `/archaeology-summary` — Non-technical project summary
2. Technical understanding enhancement
3. DevDocs generation from existing code
4. `/gap-analysis` — Identify unknowns
5. `/anchor-check` — Establish baseline on current state

→ Source: Appendix 2 (full workflow)

### `refactor`
Structured refactoring with stability guarantees.

**Steps orchestrated:**
1. `/elaborate` — Clarify refactoring intent
2. `/refactor-detect` — Identify opportunities
3. `/anchor-check` — Establish baseline
4. `/task-plan` — Plan the refactor
5. `/critic --d` — Dynamic risk assessment
6. Execute incrementally
7. `/anchor-check` — Verify after each step

→ Source: Appendix 3 (full workflow)

---

## How They Relate

```
Skills orchestrate Slash Commands:

add-feature
  ├── /elaborate
  ├── /task-desc
  ├── /task-plan
  ├── /critic (or /critic --d)
  ├── /test-scenarios
  ├── /probe-tests
  ├── /anchor-check
  └── /implementation-notes

new-project
  ├── (data dump — manual)
  ├── (foundation docs — manual)
  ├── /task-plan    (per module)
  ├── /probe-tests  (per module)
  └── /anchor-check (per module)

adopt-codebase
  ├── /archaeology-summary
  ├── /gap-analysis
  └── /anchor-check

refactor
  ├── /elaborate
  ├── /refactor-detect
  ├── /anchor-check
  ├── /task-plan
  ├── /critic --d
  └── /anchor-check
```

Slash commands are useful on their own. Skills combine them into repeatable workflows. You can always run a slash command independently outside of a skill.

---

## Hooks: Automating Side Effects

Hooks are shell commands that Claude Code runs automatically in response to events — before a tool executes, after it completes, when a session starts, etc. They let you enforce conventions without relying on prompt instructions.

### What hooks are

A hook is a script that fires on a specific event. Claude Code supports several hook points:

| Event | When it fires |
|-------|--------------|
| `PreToolUse` | Before a tool call executes (can modify or block it) |
| `PostToolUse` | After a tool call succeeds |
| `SessionStart` | When a session begins or resumes |
| `Stop` | When Claude finishes responding |

The key one for AlignCraft is `PreToolUse` — it can intercept file writes and modify the content before the file is created.

### Where hooks live

Hooks are configured in settings files:

```
~/.claude/settings.json              # global — applies to all projects
.claude/settings.json                # project — shared with team via git
.claude/settings.local.json          # project — local only, gitignored
```

### Hook configuration format

```json
{
  "hooks": {
    "EventName": [
      {
        "matcher": "ToolName",
        "hooks": [
          {
            "type": "command",
            "command": "path/to/script.sh"
          }
        ]
      }
    ]
  }
}
```

- **Event**: Which event triggers this hook (`PreToolUse`, `PostToolUse`, etc.)
- **Matcher**: Regex pattern for which tools to match (e.g. `"Write"`, `"Edit|Write"`, `"Bash"`)
- **Hook handler**: What to run — usually a shell command

### How PreToolUse hooks work

A `PreToolUse` hook receives the tool's input as JSON on stdin. It can:

- **Allow** the action (exit code 0, no output)
- **Block** the action (exit code 2, reason on stderr)
- **Modify** the action (exit code 0, return JSON with `updatedInput`)

This means a hook can intercept a file write, prepend content to it, and return the modified version — all before the file hits disk.

### AlignCraft hook: Auto-inject metadata into devdocs

Every devdocs file should carry a metadata header (see Appendix 9). Instead of relying on each slash command to remember this, a `PreToolUse` hook can inject it automatically on every write to `devdocs/`.

The hook:
1. Intercepts `Write` tool calls
2. Checks if the file path contains `devdocs/`
3. If yes, prepends the metadata block (date, branch, commit, author from git)
4. Returns the modified content

The hook script is stored in this book's `hooks/` folder as `devdocs_metadata_appender.sh` ([view source](../hooks/devdocs_metadata_appender.sh)). It reads the tool input, checks the path, and if it's a devdocs file, injects:

```
---
created: 2026-02-27
branch: feat/webhook-retry
base_commit: e9da405
author: ns
---
```

With this hook in place, every file written under `devdocs/` automatically gets metadata — regardless of whether it came from a slash command, a skill, or a manual Claude request. The convention is enforced at the infrastructure level, not the prompt level.

### Installing hooks

The install script (`commands/install.sh`) downloads hook scripts to `~/.claude/hooks/`. After installation, activate the hook by adding this to `.claude/settings.json` (project-wide) or `~/.claude/settings.json` (global):

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

The hook is active immediately — no restart needed.

To share hooks with your team, commit `.claude/settings.json` to git and have team members run the install script. Alternatively, copy hook scripts directly into your project at `.claude/hooks/` and reference them with a relative path.
