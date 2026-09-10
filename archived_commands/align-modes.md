# /align-modes — Multi-Modal Task Assessment

For a given task, assess what is needed across all seven intent modes and all six alignment layers. This produces a complete picture of what the task requires — not just what to build, but what to explore, what to innovate, what might break, what to maintain, and what to reflect on.

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

### Step 1: Identify the Task

Determine which task to assess:
- If a path is given (e.g., `devdocs/scoped/feat_3_auth/`), read its docs
- If a task description is given, use it directly
- If nothing is given, check recent conversation context
- If still unclear, ask

Read the task's desc.md, plan, critic, and any related docs. Understand what the task is trying to achieve.

### Step 2: Assess Each Mode

For the given task, analyze what is needed across each mode. Read relevant codebase files and devdocs to ground each assessment in reality — do not speculate without checking.

#### Exploration — "What do we need to understand first?"

| Layer | What needs exploring? |
|-------|----------------------|
| Workspace | What codebase areas need reading before starting? What context is missing? |
| Task | What about the task is unclear or ambiguous? What assumptions haven't been validated? |
| Action-Space | What approaches exist for this? What has been tried before in this codebase? |
| Action-Set | What implementation patterns does this codebase use for similar work? |
| Coherence | What existing systems does this task touch? What are their current states? |
| Outcome | What does success look like? Are the criteria measurable and testable? |

#### Alignment — "What needs to be correct?"

| Layer | What alignment is needed? |
|-------|--------------------------|
| Workspace | Is the right context loaded? Are archaeology docs fresh for the relevant areas? |
| Task | Is intent clear? Is scope bounded? Are success criteria specific enough to verify? |
| Action-Space | Are the viable approaches identified and evaluated? Is the chosen approach justified? |
| Action-Set | Does a plan exist? Is it sequenced correctly? Are dependencies explicit? |
| Coherence | What existing features, modules, or contracts must not break? What needs checking after implementation? |
| Outcome | How will we verify the result matches the intent? What tests or probes are needed? |

#### Innovation — "Where might we need novel approaches?"

| Layer | Where might innovation be needed? |
|-------|-----------------------------------|
| Workspace | Does the task require new tooling, environments, or context structures? |
| Task | Is the task framing correct, or might the real problem be different from what's stated? |
| Action-Space | Are existing approaches sufficient, or does this task require something that doesn't exist yet? |
| Action-Set | Can this be built with standard patterns, or does it need novel combinations? |
| Coherence | Does this task require deliberately breaking existing patterns to establish better ones? |
| Outcome | Should the success criteria be redefined? Is the original goal still the right goal? |

#### Diagnostic — "What could go wrong?"

| Layer | What should we watch for? |
|-------|--------------------------|
| Workspace | What context could be stale or misleading? |
| Task | Where is the task description most likely to be misunderstood? |
| Action-Space | What approach pitfalls exist? What has failed before in similar tasks? |
| Action-Set | What plan steps are most likely to fail? Where is the plan weakest? |
| Coherence | What is most likely to break? What are the fragile points in affected modules? |
| Outcome | What's the most likely way the result could look correct but be wrong? |

#### Maintenance — "What needs upkeep?"

| Layer | What maintenance is relevant? |
|-------|------------------------------|
| Workspace | Are archaeology docs fresh for the areas this task touches? |
| Task | Are there stale or superseded task docs that should be archived? |
| Action-Space | Are previous approach evaluations still valid? |
| Action-Set | Do existing plans for related work still match the codebase? |
| Coherence | Has anything drifted since the task was planned? |
| Outcome | Are previous verification results still valid? |

#### Recovery — "What's the fallback?"

| Layer | What recovery options exist? |
|-------|----------------------------|
| Workspace | Can we restore context if something goes wrong? |
| Task | If the task needs re-scoping mid-implementation, what's the rollback point? |
| Action-Space | If the chosen approach fails, what's the next best alternative? |
| Action-Set | If implementation breaks things, what's the minimal revert? |
| Coherence | What's the known-good state we'd restore to? |
| Outcome | If the result doesn't match intent, what's the recovery path? |

#### Reflection — "What should we learn from this?"

| Layer | What's worth reflecting on? |
|-------|---------------------------|
| Workspace | Did the context setup work well? What would make it better next time? |
| Task | Did the task description capture the real need? What was missing? |
| Action-Space | Were the right approaches considered? Did we miss better options? |
| Action-Set | Did the plan hold up during implementation? Where did it deviate? |
| Coherence | Did we anticipate the right risks? What surprised us? |
| Outcome | Did success criteria actually capture what mattered? |

### Step 3: Synthesize

After the per-mode assessment, produce a synthesis:

```markdown
## Synthesis

### Critical items before starting
[What MUST be done before implementation — missing exploration, unresolved alignment gaps, potential innovation needs]

### Highest risk areas
[Where things are most likely to go wrong — from diagnostic assessment]

### Mode sequence recommendation
[Suggested order of modes for this task. E.g., "Exploration first (modules X and Y need reading), then Alignment (plan needs critique), then proceed to implementation. Diagnostic focus on auth middleware during implementation."]

### Maintenance actions
[Any housekeeping needed before or after this task]

### Recovery plan
[If things go wrong, here's the fallback]
```

---

## Rules

1. **Check reality, don't speculate.** Read the actual codebase files and devdocs for each assessment. "This module might be fragile" is weak. "This module has 3 undocumented side effects (from traces)" is useful.
2. **Be concise per cell.** Each mode × layer cell should be 1-3 sentences. The synthesis is where you elaborate.
3. **Skip cells that don't apply.** If innovation is clearly not needed for this task, say "Not applicable — standard approaches are sufficient" and move on. Don't force novelty.
4. **The synthesis is the most valuable part.** The tables are the analysis. The synthesis is the actionable output — what to do, in what order, watching for what.

---

## Output

Full multi-modal assessment printed in conversation. Not saved to file by default — this is a working assessment, not an artifact. The user can save it if they want.
