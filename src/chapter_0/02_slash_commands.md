# Slash Commands

The AlignCraft methodology ships as an installable command pack. This chapter introduces it briefly so you can install it now and try commands as you read the rest of the book. The full per-command reference lives in **Appendix 8**.

## What Are Slash Commands?

Slash commands are reusable prompts packaged as markdown files. In Claude Code, you type `/command-name` and the contents of the corresponding `.md` file get injected as a prompt — with your input substituted in.

They turn multi-paragraph prompts you would otherwise type (or copy-paste) every time into one-word shortcuts. Each command is self-contained: one prompt in, one artifact out.

Slash commands live as `.md` files in a `commands/` directory:
- **Project-level**: `.claude/commands/` — available only in that project
- **Global**: `~/.claude/commands/` — available in every project

## Installation

Install the full AlignCraft command pack globally with one line:

```bash
# For Claude Code
curl -sL https://raw.githubusercontent.com/karaposu/AlignCraft/main/install_claude.sh | bash

# For Codex
curl -sL https://raw.githubusercontent.com/karaposu/AlignCraft/main/install_codex.sh | bash
```

This downloads all commands and hooks into `~/.claude/` so they are available in every project.

To install for a single project only, copy the `commands/` folder contents into `.claude/commands/` in your project root.

## The Core Workflow

Four commands form the primary AlignCraft workflow. Each produces an artifact the next can consume, but all work independently.

```
/elaborate → /task-desc → /task-plan → /critic
```

- **`/elaborate`** — takes messy, scattered input and makes it tidy. Saves the output as markdown and flags ambiguities. Goal: clarity.
- **`/task-desc`** — turns clear input into a structured feature description (`desc.md`) with problem statement, success criteria, and scope.
- **`/task-plan`** — generates a step-by-step implementation plan (`step_by_step_plan.md`) by reading the relevant code first.
- **`/critic`** — analyzes a plan and produces `critic.md` with each risk rated by severity, plus mitigation strategies.

Use them as a chain when starting a new feature, or independently when you only need one of the four artifacts.

## What Else Is in the Pack

The pack contains additional command families. You will encounter them throughout the book; for the full reference, see Appendix 8.

- **Foundation commands** (`/devdocs-foundation*`) — build the initial `devdocs/` for a new project: foundations, concepts, simplified concepts, modules, architecture.
- **Thinking discipline commands** (`/sense-making`, `/innovate`, `/td-critique`, `/decompose`, `/explore`, `/comprehend`) — domain-agnostic methodologies for specific cognitive operations. Usable independently or chained.
- **Loop runners** (`/MVL`, `/MVL+`, `/inquiry`) — chain thinking disciplines into a multi-step inquiry, with state tracking and resumable progress.
- **Navigation** (`/navigation`, `/wayfinding`) — map the space of possible next directions after a thinking loop completes.
- **Archaeology commands** (`/arch-small-summary`, `/arch-intro`, `/arch-traces`, `/arch-traces-2`, `/arch-top-improvements`, `/dead-code-index`, `/dead-code-concepts`) — for understanding existing codebases by reading code rather than docs.
- **Alignment commands** (`/align`, `/align-modes`) — load task context across the six alignment layers and report gaps.
- **Reporting and maintenance** (`/overview-report`, `/devdocs-archivist`, `/roadmap`) — period reports, devdoc staleness archiving, and roadmap navigation.

## Hooks

The installer also places a small hook script in `~/.claude/hooks/`. The current pack ships one hook:

- **`devdocs_metadata_appender.sh`** — automatically prepends a metadata header (date, branch, commit, author) to every file written under `devdocs/`. Activated via `.claude/settings.json`. See Appendix 8 for the activation snippet and Appendix 9 for the metadata format.

## Where to Go Next

If you want to start using the commands while reading the rest of the book, run the install line above and try `/elaborate` on any messy note. If you want the complete per-command reference — full input/output specs, behavior notes, and links to each command's source — jump to **Appendix 8: AlignCraft Slash Commands**.
