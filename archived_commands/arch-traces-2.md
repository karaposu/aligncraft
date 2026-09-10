# /arch-traces 


What a trace is: An expert's annotated walkthrough of a specific runtime behavior — execution path, design rationale, risk profile, improvement direction. Behavioral, not definitional. Includes judgment, not just facts.


Here are some meta generic categories which are the sources of traces:

Lifecycle traces — How things are created, used, and destroyed. Sessions, connections, agent runs, cached objects. Anything with a birth-to-death arc. Entry point is the creation event, terminal state is cleanup or expiry.

Data transformation traces — How data changes shape as it moves through layers. Raw input → parsed model → enriched representation → compressed output. Entry point is the raw data, terminal state is the final consumed form. Covers parsing, normalization, enrichment, compression, serialization.

Integration boundary traces — How the system talks to external services and how external events enter the system. API calls to third-party services, webhook receivers, OAuth flows, file I/O. Entry point is the outbound call or inbound event, terminal state is the consumed response or stored result. Covers auth, retries, error translation, credential management.

Decision and routing traces — Where the system chooses between paths based on input, configuration, or state. Engine routing, fill mode selection, storage backend selection, model selection, structural mismatch detection. Entry point is the branch condition, terminal state is the chosen path's outcome. Covers fallbacks, defaults, and the consequences of each choice.

Error and recovery traces — What happens when things fail and how the system responds. Tool failures, API rate limits, dropped connections, corrupted state, token expiry. Entry point is the failure event, terminal state is either successful recovery or terminal failure. Covers retry logic, fallback behavior, error propagation, and silent failures.

Cross-cutting mechanism traces — Patterns that span multiple modules and affect system-wide behavior. Rate limiting, observability/logging, caching, async/sync bridging, progress tracking. Entry point is the first invocation of the mechanism, terminal state is the observable effect across the system. Covers how the mechanism is wired in, what it intercepts, and what breaks when it fails.




Things that don't have runtime behavior : Data type definitions, Configuration and wiring, Dead code,trivial wrappers, Pure UI components, nit files and re-exports



## Additional Input/Instructions

$ARGUMENTS

---


## Instructions

To run traces the context should already have enough level of the understanding of the codebase. If codebase structure is unknown output "to run traces run arch-summary and arch-intro first"


For each of the six trace categories above, identify the traces that belong to it in this codebase. Write the full enumeration as a grouped list (category → trace names with one-line descriptions) before writing any trace files. Then write each trace, documenting the flow at a high level with asked format. 


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

Assessment sections (each must include an ELI15 explanation, an Impact field, and a Robust Fixes / Best Practices field):
  - What feels incomplete
  - What feels vulnerable
  - What feels like bad design

  for each of the three Assessment sections, include these subsections:
      - The issue explation
      - An ELI15 (plain-language or very soft technical explanation)
      - Impact of it to the codebase and overall logic
      - Robust Fixes / Best Practices (how to address it properly)
      - Architectural Fix if it exists (also mention that if this solution is overkill or not for this codebase in the end of the architectural fix. )
      - Speculative defence (if this is a weird error/design use the codebase context to speculate then why not it wasnt solved such way, what was the reason?)
      - is this 


### Output

Write trace files to `devdocs/archaeology/traces/` (create the directory if needed). If the folder already exists, overwrite all trace files completely — rewrite fresh, don't patch.