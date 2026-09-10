# /arch-intro — High-Level Architecture Introduction

Read the codebase and produce an architecture introduction as if you're onboarding a new engineer. Focus on how things are designed, not what features exist.

## Additional Input/Instructions

$ARGUMENTS

## Instructions

1. Read all code files in the codebase fully. Focus on source code — actual implementations, not documentation or comments about intent.

2. Describe the codebase design covering:
   - **Data flow paths** — How data moves through the system. Entry points, transformations, storage, output. Trace the main flows end to end.
   - **Main abstractions** — What are the core building blocks? What concepts does the code organize around? How do they relate to each other?
   - **Top-level design patterns** — What architectural patterns are in use (MVC, event-driven, layered, etc.)? Are they consistent or mixed?

3. Talk about these at a high level. Imagine you're sitting with a new engineer on their first day, walking them through how the project is put together. They're technical but know nothing about this specific codebase.

4. Be honest — if the architecture is inconsistent, messy, or in transition, say so. If patterns are partially applied, note it.

### Output

By default, save the introduction to `devdocs/archaeology/intro2codebase.md` (create the directory if needed) and print it in the conversation.
If that file already exists, overwrite it completely — rewrite fresh, don't patch.

**If `-n` is passed:** print in conversation only, don't write a file.
