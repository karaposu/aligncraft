# Branch: book_chapter_gap_analysis

## Question
Given the AlignCraft book's current structure and content, what single chapter / section addition or structural reorganization would most improve the book's coverage of what it preaches?

## Goal
A concrete, ranked recommendation (one primary + one alternate) for either (a) a new chapter or section to add OR (b) a structural reorganization of the existing chapters/sections, with explicit reasoning grounded in: (1) the book's stated mission ("codify what developers do instinctively, layered alignment for AI-driven action"), (2) what's actually written today, and (3) where the highest-value gap lies. The user should be able to act on the recommendation directly — start writing the chapter or execute the reorganization — without further analysis.

## Scope Check
Question covers goal. The question asks "what would make most sense" (= top recommendation), goal asks for ranked actionable recommendation with reasoning. Aligned. No widening needed.

## Context (for downstream disciplines)
- **Current book name:** AlignCraft (recently renamed from AlignStack — see `2026-05-05_16-12__aligncraft_vs_alignstack_naming/finding.md`)
- **Current TOC** (from `src/SUMMARY.md`):
  - Front: Introduction (README), Preface
  - Part I — Foundations: Terminology, Slash Commands (just added), Evolution of Development (chapter 1: 5 sub-chapters), AlignCraft Framework (chapter 2: 2 sub-chapters)
  - Part II — Understanding AI Collaboration: How AI Thinks (chapter 3: 3 sub), Practical Collaboration (chapter 4: 6 sub), The Data Dump (chapter 5)
  - Part III — AlignCraft Patterns: DevDocs (chapter 6: 8 sub), Run Probes (7), Fuzzy Architecture (8), Anchor (9), Archaeology (10), Offload (11), Vibe Testing (12)
  - Appendices 1-9: New Project Prompts, From Existing Codebase Prompts, Refactoring, Adding Features, Useful Prompts, Sense Making, Dynamic Prompts, AlignCraft Slash Commands, Devdocs Folder Convention
- **Stated mission:** "AlignCraft is a stack of six fundamental alignment layers for AI-driven action. Bridges coding by feel and engineering discipline. Codifies what developers do instinctively, turning scattered practices into a cohesive methodology."
- **Six alignment layers** (from README): Workspace, Task, Action-Space, Action-Set, Coherence, Outcome.
- **Four pillars:** Comparison, Measurement, Visibility, Explicitness.
- **Repo also ships** (beyond the book itself): the slash command pack, hooks, install scripts, the structured "thinking discipline" skills (sensemaking, innovation, critique, exploration, decomposition, comprehension, navigation), and the loop runners (MVL, MVL+, inquiry).
