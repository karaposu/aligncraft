# /align — Load Context and Assess Alignment for a Task

Read all relevant context for a task, identify gaps, and prepare to work on it properly. This is the "be a responsible developer" command — load before you build.

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

### Step 1: Identify the Task

Determine which task to align on:
- If a path is given (e.g., `devdocs/scoped/feat_3_auth/`), use it
- If a task name or description is given, find the matching devdocs folder
- If nothing is given, check recent conversation context for the active task
- If still unclear, list active tasks (folders in `devdocs/scoped/` and `devdocs/ideas/`) and ask which one

### Step 2: Load Workspace Context (Layer 1)

Check and read archaeology:
- Read `devdocs/archaeology/small_summary.md` if it exists — note how old it is
- Read `devdocs/archaeology/intro2codebase.md` if it exists — note how old it is
- Scan `devdocs/archaeology/traces/` — read traces relevant to the task's area

If archaeology is missing or stale (summary > 30 days, intro > 15 days, traces > 7 days), note it as a gap.

Read any other workspace context relevant to the task (related devdocs, roadmaps, recent reports).

### Step 3: Load Task Context (Layer 2)

Read everything in the task's folder:
- `desc.md` — is the task well-defined? Are success criteria present and specific?
- `elaboration.md` or `sensemaking.md` — any exploratory context?
- Any other docs in the folder

Assess: is the task intent clear? Is depth understood? Is scope defined?

### Step 4: Check Action-Space and Action-Set (Layers 3-4)

- `step_by_step_impl_plan.md` — does a plan exist? Is it detailed enough?
- `critic.md` or `dynamic_critic_prompt.md` — was the plan critiqued?
- If critic exists, were the issues addressed? Compare critic findings against the plan — are high-severity items still unresolved?

### Step 5: Assess Coherence Risk (Layer 5)

Based on what the task touches:
- Identify which modules/files the task will modify (from the plan, or infer from desc.md)
- Read those modules — understand their current state
- Check archaeology traces for those modules if available
- Note any known fragile areas, undocumented side effects, or tight coupling

### Step 6: Check Outcome Readiness (Layer 6)

- Are success criteria defined in desc.md?
- Do test scenarios exist?
- Is there a way to verify the task is done correctly?

### Step 7: Report

Print a concise alignment report:

```markdown
## Alignment Report: [task name]

### Workspace (Layer 1)
[What was loaded. What's stale or missing.]

### Task (Layer 2)
[Is intent clear? Is scope defined? Are success criteria present?]

### Action-Space / Action-Set (Layers 3-4)
[Does a plan exist? Was it critiqued? Are critic issues addressed?]

### Coherence (Layer 5)
[What modules are affected? Any known risks from traces?]

### Outcome (Layer 6)
[Can we verify success? Are criteria testable?]

### Gaps
[Bulleted list of what's missing or needs attention before proceeding]

### Recommendation
[What to do next — address gaps, proceed to implementation, or ask specific questions]
```

After printing the report, you are now loaded with full context for this task. The user can continue the conversation — ask questions, request implementation, ask you to address gaps, etc.

---

## Rules

1. **Read everything, don't skim.** The whole point is thorough context loading. Read the full desc.md, the full plan, the full critic. Don't summarize what you haven't read.
2. **Be honest about gaps.** If the plan has unaddressed critic issues, say so. If the desc.md is vague, say so. Don't paper over problems.
3. **Don't fix anything yet.** This command loads and reports. It doesn't modify files, create plans, or implement code. The user decides what to do next.
4. **Stay concise in the report.** The report is a summary of what you loaded, not a reproduction of it. You've read everything — the knowledge is in your context now. The report tells the user what state things are in.
