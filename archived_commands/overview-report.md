# /overview-report — Period Overview Report

Generate a structured report of what happened in the project over a given time period. Combines git history, devdocs artifacts, and codebase changes into a readable summary.

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

### Step 0: Determine Time Period

Parse the time period from the input. Accepted formats:
- `24h` — last 24 hours
- `1d` — last 1 day
- `7d` — last 7 days
- `30d` — last 30 days

If no period is given, default to `7d`.

Calculate the cutoff date from the period.

### Step 1: Gather Sources

Collect information from these sources for the given period:

**Git history:**
- Run `git log --since="<cutoff>" --oneline` to get all commits
- Run `git diff --stat HEAD~N` or date-based diff to understand scope of code changes
- Identify files added, modified, deleted

---VERY IMPORTANT---

actually inspecting what changed in each modified file, No just reported on things you already have context.. your context is not full.     RUN and an actual investigation of the diff. The right process is to git diff HEAD -- <file> for every file in the stat output and document what each change ...                                                                                     

**Devdocs artifacts** — scan `devdocs/` for files created or modified within the period:
- `devdocs/scoped/` — any step_by_step_plan.md, desc.md, critic.md files
- `devdocs/archaeology/` — traces, summaries, dead code indexes
- `devdocs/roadmaps/` — any roadmap activity
- `devdocs/ideas/` — any fix documentation
- Any other devdocs subfolders that have recent activity

**Conversation context** — if relevant context from recent conversation is available, incorporate it.

### Step 2: Generate Report

Structure the report as follows:

```markdown
# Overview Report — [period description, e.g. "Mar 24–30, 2026"]

## What Was Done

For each distinct piece of work (group by feature/fix/enhancement, not by commit):

### [Work item title]

**Why:** What motivated this work — the problem, request, or goal behind it.

**How:** What was actually done — technical summary, key decisions, approach taken.

**Impact:** What changed as a result — what's better, what's unblocked, what's different.

---

## Direction

Where is the project heading based on the work done? What patterns emerge from the changes? What axes is the project moving along? This section connects the individual work items into a narrative — not just what happened, but what it means for the project trajectory.

---

## By the Numbers

| Metric | Before | After |
|--------|--------|-------|
| [relevant metrics derived from the actual changes] | | |

Choose metrics that are meaningful for this specific period. Examples:
- Test count
- Files changed
- Features added
- Bugs fixed
- New modules/services
- Documentation files created
- Plans created/completed

Only include metrics where you have concrete numbers. Do not fabricate.
```

### Step 3: Save

Save the report to `devdocs/reports/overview_<period>_<end_date>.md` (e.g., `overview_7d_2026-03-30.md`). Create the directory if needed.

Print the full report in the conversation as well.

---

## Rules

1. **Group by work, not by commit.** Multiple commits that serve one purpose should be one entry. Don't list commits — synthesize them.

2. **Why/How/Impact is mandatory for each item.** If you can't determine the "why," state that it's unclear from the available sources.

3. **Be honest about what you can't see.** If the git history shows changes but there's no devdocs context, say so. Don't invent motivations.

4. **Direction must be substantive.** Don't just restate what was done. Identify the trajectory — what themes emerge, what's the project moving toward.

5. **Numbers must be real.** Only include metrics you can actually measure from git and devdocs. If you can't count it, don't include it.


DONT ASSUME, CHECK AND VALIDATE always. 
