# /arch-traces — End-to-End Interaction Traces

## Additional Input/Instructions

$ARGUMENTS

---

To run traces the context should already have enough level of the understanding of the codebase. If codebase structure is unknown output "to run traces run arch-summary and arch-intro first"

Identify every internal interface and submodule-level interaction defined within the codebase (excluding external packages). For each interface, follow its execution path end-to-end: what calls it, what it triggers, how data or state moves through the layers, and what outcomes it produces.

Document these flows at a high level, explaining what each interaction corresponds to, what it affects, and why it behaves that way.

Create one file per interaction trace under devdocs/archaeology/traces/ (e.g., trace_1.md, trace_2.md).
Base all analysis strictly on actual code behavior rather than names or assumptions.

Each trace file should have the following sections

Core sections:
  - Entry Point
  - Execution Path
  - Resource Management
  - Error Path
  - Performance Characteristics
  - Observable Effects
  - Why This Design

Assessment sections (each must include an ELI5 explanation, an Impact field, and a Robust Fixes / Best Practices field):
  - What feels incomplete
  - What feels vulnerable
  - What feels like bad design

  for each of the three Assessment sections, include these subsections:
      the issue itself
      an ELI5 (plain-language explanation)
      Impact of it to the codebase and overall logic
      Robust Fixes / Best Practices (how to address it properly)


### Output

Write trace files to `devdocs/archaeology/traces/` (create the directory if needed). If the folder already exists, overwrite all trace files completely — rewrite fresh, don't patch.
