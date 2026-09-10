# /critic — Identify Errors, Risks, and Conflicts

Analyze an implementation plan and identify everything that could go wrong. This is the safety net before execution begins.

## Input

$ARGUMENTS

## Instructions

### Step 0: Resolve Which Plan to Critique

Before doing any analysis, determine which implementation plan you'll be working with:

1. **If the input is a file path** — use that plan directly.
2. **If the input is ambiguous or empty** — look at the project's existing `devdocs/` folder structure and scan for `step_by_step_plan.md` files. List every plan found with its feature name and path.
3. **If multiple plans exist** — present them as a numbered list and ask the user to confirm which one to critique. Do NOT proceed until the user confirms.
4. **If only one plan exists** — show the user which plan you found and ask for a quick confirmation before proceeding.

**Only after the user confirms**, continue to Step 1.

### Step 1: Read and Analyze

1. Read the confirmed plan file fully.
2. Read all relevant code files — module interfaces, implementations, configs, tests.

### Mode Selection

**If `--d` flag is present:** Run in **dynamic mode**. Instead of using the generic checklist below, first analyze the specific implementation plan and codebase context, then generate a tailored critic that asks the questions that actually matter for *this particular plan*. The dynamic critic should focus on the real risks given the specific technologies, architecture, and changes involved — not generic boilerplate.

**Otherwise:** Run in **generic mode** using the standard checklist below.

---

## Generic Mode

Think deeply before writing. Identify ERRORs, compatibility ISSUES, RISKS, and CONFLICTS with respect to the whole codebase. Check if this implementation plan causes:

- Existing features that might break
- Performance implications
- API contract changes
- Database schema impacts
- Security considerations

### Output Format

Create a `critic.md` file in the same directory as the implementation plan.

For each identified risk item, document:

| Field | Description |
|-------|-------------|
| **Risk** | What could go wrong |
| **Category** | Breaking change / Performance / Security / API contract / Schema / Compatibility |
| **Severity** | Low / Medium / High |
| **Impact** | Possible effects if this risk materializes |
| **ELI5** | Non-technical explanation anyone can understand |
| **Affected areas** | Which existing features, modules, or endpoints are affected |
| **Mitigation** (Medium/High only) | Three levels: quick fix, robust fix, long-term fix |

### Checklist

Document findings across these categories:
- Potential conflicts, breaking changes, or errors
- API contract changes required
- Which existing features might be affected
- Database schema impacts
- Security considerations
- Required refactoring before implementation
- Performance implications (latency, memory, storage)

---

## Dynamic Mode (`--d`)

When `--d` is passed:

1. Read the implementation plan fully.
2. Read all relevant codebase files referenced in or affected by the plan.
3. Based on the specific context — the technologies used, the architecture, the exact changes proposed — generate a **tailored critic prompt** that targets the real risks for this particular plan.
4. Execute that tailored prompt and write the results to `critic.md`.

The dynamic critic should go beyond the generic checklist. It should:
- Ask questions specific to the frameworks and libraries in use
- Check for patterns in the existing codebase that the plan might violate
- Identify integration points that are unique to this project
- Surface risks that a generic checklist would miss

Use the same output format (risk items with Severity, Impact, ELI5, Mitigation) but with risks that are specific and actionable, not generic.

---

## Guidelines

- Be specific. "This might cause performance issues" is useless. "Adding a full table scan in `getUsers()` on a table with 100k+ rows will degrade response time from ~50ms to ~2s" is useful.
- Only flag real risks. Don't pad the document with low-severity noise that obscures actual problems.
- Every Medium/High risk must have actionable mitigation — not just "be careful."
