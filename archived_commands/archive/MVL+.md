name: MVL+
description: Run the Extended Cognitive Loop (Exploration → Sensemaking → Decomposition → Innovation → Critique) on any question. Always the full pipeline. If the question isn't answered, loop again.

# /MVL+ — The Extended Cognitive Loop

Run Exploration → Sensemaking → Decomposition → Innovation → Critique on any question. Always the full pipeline. No classification. No variable pipelines. Each step feeds the next. If the question isn't answered after C, loop again with a refined focus.

This is the extended form of the cognitive loop. `/mvl` (classic) runs only S → I → C. `/mvl+` adds Exploration (map territory) and Decomposition (partition complexity) to the first phase. Use `/mvl+` as the default for new inquiries; use `/mvl` classic for simple well-defined problems when speed matters.

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

### If NEW (input is a question or description):

1. Read the question fully. Restate it clearly in one sentence.

2. Create the inquiry folder: `devdocs/inquiries/<slugified_name>/`

3. Write `_branch.md`:
   ```markdown
   # Branch: [name]
   ## Question
   [the question, stated clearly in one sentence]
   ## Goal
   [what would a good answer look like? what would the user be able to DO with the answer?]
   ## Scope Check
   [compare the question's scope to the goal's requirements. Does the question, if answered perfectly, cover everything the goal asks for? If YES: "Question covers goal." If NO: "Question covers goal: NO — goal includes [X, Y] but question only addresses [Z]. Consider widening to: [proposed wider question]."]
   ```
   If the scope check flags a gap, present the proposed wider question to the user before proceeding. The user decides whether to widen or keep the original scope.

4. Write `_state.md`:
   ```markdown
   # State: [name]
   ## Flow-type
   extended
   ## Pipeline
   E → S → D → I → C (always)
   ## Progress
   - [ ] Exploration
   - [ ] Sensemaking
   - [ ] Decomposition
   - [ ] Innovation
   - [ ] Critique
   ## Iteration
   1
   ## Status
   ACTIVE
   ## Next Discipline
   Exploration
   ## Relationships
   [Add if applicable. Omit section if standalone.
   - CONTINUES FROM: folder_name (context)
   - SUPERSEDED BY: folder_name (reason)
   - RELATED: folder_name (connection)]
   ## History
   - [date]: Created. Question: [one-line summary]
   ```

5. Present briefly:
   ```
   Extended loop created: devdocs/inquiries/[name]/
   Pipeline: E → S → D → I → C
   Question: [restated clearly]
   Goal: [what a good answer looks like]
   ```

6. **Immediately begin the pipeline** — proceed to EXECUTE PIPELINE below. Do not wait for user input.

---

### If RESUME (input is a folder path):

1. Read `_state.md` and `_branch.md` from the folder.

2. Verify `flow-type: extended` in `_state.md`. If the field is `classic` or absent, this inquiry belongs to `/mvl`, not `/mvl+` — flag to the user and stop.

3. Determine where the pipeline left off by checking which files exist. Proceed to EXECUTE PIPELINE below, starting from the first incomplete discipline.

---

### EXECUTE PIPELINE

Run disciplines sequentially: E → S → D → I → C. For each discipline that hasn't produced its output file yet, execute it using the Discipline Transition Protocol below. Continue through all remaining disciplines without pausing — do not wait for user input between disciplines. The user can interrupt at any time to redirect.

**For each discipline in sequence:**

1. **Display checkpoint** (except before the first discipline of the session):
   ```
   ── Checkpoint ──────────────────────────────────
   [Previous discipline] complete.
     [2-3 key telemetry metrics from the output just saved]
     Structural: N/M checks passed
   Proceeding to [Next discipline]...
   ────────────────────────────────────────────────
   ```
   If any structural checks failed, list them: `[FAIL: label1, label2]`

2. **Load the discipline spec via Skill tool:**
   - Invoke `Skill(skill: "<discipline-skill-name>", args: "devdocs/inquiries/[name]/_branch.md")`
   - If the Skill tool fails → fall back to `Read` on the discipline's command file, then execute
   - If Read also fails → HALT and tell the user: "Could not load spec for [discipline]. Run manually: /[discipline] devdocs/inquiries/[name]/_branch.md"
   - **Never execute a discipline from memory alone.**

3. **Execute the loaded spec** at full depth. The discipline saves its output to the inquiry folder.

4. **Run structural check** on the saved output:
   ```
   bash tools/structural_check.sh devdocs/inquiries/[name]/[output_file] [discipline_name]
   ```
   Discipline-to-name mapping: `exploration.md → exploration`, `sensemaking.md → sensemaking`, `decomposition.md → decomposition`, `innovation.md → innovation`, `critique.md → critique`.
   If any `[FAIL]` lines appear, fix the missing sections in the output and re-save. Re-run the check to confirm. Include the results in the next checkpoint display.

5. **Update `_state.md`:** check off the completed discipline, set next discipline.

6. **Continue immediately** to the next discipline in E → S → D → I → C.

**Skill-to-command mapping:**

| Discipline | Skill name | Output file |
|---|---|---|
| Exploration | `explore` | `exploration.md` |
| Sensemaking | `sense-making` | `sensemaking.md` |
| Decomposition | `decompose` | `decomposition.md` |
| Innovation | `innovate` | `innovation.md` |
| Critique | `td_critique` | `critique.md` |

**When all five are complete** → proceed to ITERATION COMPLETE below.

---

### If ITERATION COMPLETE (all five files exist):

Read the critique output. Answer three questions:

**1. What survived?**
List the surviving ideas/approaches from critique's verdicts. What was killed? What was refined?

**2. Is the original question answered?**
Re-read `_branch.md`'s question and goal. Does a clear survivor exist that addresses the question and meets the goal? Be honest — a partial answer is not a full answer.

- **YES — the question is answered:**

  Write `finding.md` in the inquiry folder. Read all six files (`_branch.md`, `exploration.md`, `sensemaking.md`, `decomposition.md`, `innovation.md`, `critique.md`) and produce the finding as a single argumentative document.

  Write for a reader who has NOT seen the loop output — someone who just joined the project and needs to understand: what was the question, what's the answer, why this answer over the alternatives, and what's still open. Do not compress. Explain fully even if finding is long. The test: can someone read ONLY `finding.md` and understand the complete decision?

  **Non-ambiguity principle (applies to every sentence).** Each sentence must be understandable to a reader with no prior exposure to this inquiry. The failure mode to prevent is **internally-referential shorthand** — sentences that make sense to the author (who's been living with the inquiry's vocabulary) but fail for an outside reader. Define niche terms briefly on first use; give project-specific references (e.g., `/MVL+`, `enes/`, specific disciplines) a parenthetical context the first time each appears in the finding.

  Example of the failure mode and its correction:
  - ❌ *"Template extends from 4 sections to 6"* — which template? in what context?
  - ✅ *"Our existing finding.md template (defined in the `value_extraction_design` inquiry) has 4 sections; this audit adds 2 more for a total of 6."*

  Use this structure:

  ```markdown
  ---
  status: active
  refines: devdocs/inquiries/X/finding.md         [only when refining/superseding a prior finding]
  ---
  # Finding: [inquiry name]

  ## Changes from Prior                           [optional; only when frontmatter has refines/supersedes/corrects]
  **What's preserved:** ...
  **What's changed:** ...
  **What's new:** ...
  **Migration:** ...

  ## Question
  [From _branch.md — the question and the goal. Comes first so the
   reader has context before the answer.]

  ## Finding Summary
  [The specific answer as 3-7 bullet points. Each bullet is a complete
   claim satisfying the non-ambiguity principle (readable standalone
   by someone with no prior exposure to this inquiry). Bold key terms.
   Bullets preferred over prose for scannability. WRITE THIS BEFORE
   THE FINDING BODY — it becomes a commitment the Finding elaborates;
   revise if the body reveals the summary needs updating.]

  ## Finding
  [The full answer. Base on critique's "The Answer" or assembly
   verdict. Enrich with innovation's Assembly design, sensemaking's
   SV6 understanding, exploration's territorial map, decomposition's
   coupling structure. Complete, self-contained, non-compact. Use
   numbered subsections when length exceeds ~100 lines.]

  ## Next Actions                                  [required when finding proposes changes; otherwise omit]

  ### MUST
  [Items required for the finding's value to be realized. Per-item format:
    - **What:** specific action
    - **Who:** discipline / agent / file / person
    - **Gate:** time-bound OR condition-bound OR observable trigger
    - **Why:** expected impact — what this action produces or prevents]

  ### COULD
  [Items worth considering but not required. Same per-item format as MUST.]

  ### DEFERRED
  [Items deliberately postponed. Per-item format:
    - **What:** specific action
    - **Gate:** revival trigger (time-bound / condition-bound / observable)
    - **Why (if revived):** expected impact]

  ## Reasoning
  [Why this finding over alternatives. Include:
   - Every KILL from critique with prosecution reasoning
   - Every KILL from innovation with rejection reasoning
   - Every SURVIVE with why it held
   - Contradictions reconciled across exploration/sensemaking/
     decomposition (and how they were resolved)
   Significant kills: full explanation of what was proposed
   and why it was rejected. Trivial kills: brief mention.
   Show the full field of what was considered.]

  ## Open Questions
  [Four typed subsections — populate the ones that apply; the rest may be omitted.]

  ### Monitoring
  [Observable after N inquiries / when Y completes.]

  ### Blocked
  [Cannot be answered until X ships / Y happens.]

  ### Research Frontiers
  [No known path; requires new investigation.]

  ### Refinement Triggers
  [Specific conditions (time-bound / condition-bound / observable) under
   which a locked decision in this finding re-opens.]
  ```

  **Three style rules** (apply throughout the finding):

  1. **Hedging specificity.** A hedge is a phrase that softens a claim ("mostly works," "generally sound," "with caveats"). Any hedge must name WHAT is specifically uncertain and WHY. Vague hedges are defects.
  2. **Cross-reference format.** First reference to another finding uses the full path (`devdocs/inquiries/X/finding.md`); subsequent references use the bare inquiry name (`X`). Add a relationship label when applicable — `REFINES: X (what specifically is load-bearing)`. In frontmatter, use the full path in `refines:` / `supersedes:` / `corrects:` / `impacted_by:` fields.
  3. **Gate specificity.** Triggers, deferred conditions, and revival criteria must be time-bound ("after 30 inquiries"), condition-bound ("when /intuit Phase β ships"), or observable ("if calibration N ≥ 30"). "Eventually," "when appropriate," "as needed" are defects.

  **Size-adaptive application.** Short findings (≤100 lines) may skip optional sections — Changes from Prior (unless refining a prior finding), Next Actions (unless proposing changes), and Open Questions subsections may flat-list when only one category applies. Long findings (>100 lines) must include the applicable optional sections.

  For multi-iteration inquiries: Finding reflects the FINAL iteration's answer. Prior iterations' lessons go in Reasoning as context.

  Then:
  - Archive: move `exploration.md`, `sensemaking.md`, `decomposition.md`, `innovation.md`, `critique.md` to `docarchive/` subfolder
  - Update `_state.md`: Status → COMPLETE, append to History
  - Print in conversation: brief summary (the question + one-sentence answer + file path). Not the full finding.
  - Check `_state.md` for `## Relationships` and print post-completion pointers:
    - If CONTINUES FROM exists: `"This finding is ready for [parent_name] ([context]). Finding: [one-sentence answer]. Resume: /MVL+ devdocs/inquiries/[parent_name]/"` (use `/MVL` if parent's flow-type is classic)
    - If RELATED exists: `"Related: [name] ([context]) — this finding may affect it."`
    - If no relationships: nothing additional.

- **NO — the question is not fully answered:**
  ```
  ## Iteration [N] Complete — Not yet answered

  ### What we learned
  [What this iteration revealed — what survived, what was killed, what gaps remain]

  ### The gap
  [What specific aspect of the question remains unanswered?
   What did critique reveal is missing?]

  ### Next iteration focus
  [Restate the question with a NARROWER focus based on the gap.
   This becomes the seed for the next E → S → D → I → C pass.]
  ```

  Update `_state.md`:
  - Increment iteration
  - Reset progress checkboxes (all 5)
  - Set next discipline: Exploration
  - Append to History: what happened this iteration, what the gap is, what the next focus is

  Print briefly:
  ```
  Iteration [N] complete. Question not fully answered.
  Gap: [what's missing]
  Next iteration focus: [refined question]
  ```

  Then immediately begin the next iteration — proceed to EXECUTE PIPELINE with the refined focus.

  If this iteration produced multiple survivors, frontier questions, or branching possibilities, suggest:
  ```
  Multiple directions emerged. For a full possibility map, run:
  /navigate devdocs/inquiries/[name]/
  ```

**3. Does the answer advance the goal?**
If the question IS answered but the answer doesn't advance the goal stated in `_branch.md` — note this. The answer might be technically correct but practically useless. Flag it for the user.

**4. Observation (optional)**
```
Any observation about this run? (optional — skip if nothing comes to mind)
```
If the user provides one, append to `devdocs/improvement_observations.md`:
```
## [date] | [problem from _branch.md] | [iteration count]
[the user's observation]
```
If the user skips, move on. No gate. No requirement. Observations accumulate over time. When patterns emerge across multiple observations, the user can run `/MVL+ "review improvement observations and propose spec changes"` — the loop on the system's own feedback.

---

## Cross-Session Resume

```
/MVL+ devdocs/inquiries/[name]/
  → Reads _state.md (verifies flow-type: extended)
  → Sees where you left off
  → Loads the next discipline's spec via Skill tool
  → Continues the pipeline from where it stopped
```

`_state.md` has everything needed to resume. Any session, any AI. The Skill tool invocation ensures the discipline spec is freshly loaded even in a cold session.

---

## Rules

1. **Always E → S → D → I → C.** Every question gets the full loop. No shortcuts. No variable pipelines. Strict sequence in the first phase (Exploration, then Sensemaking, then Decomposition) before Innovation and Critique.
2. **Each step saves to the inquiry folder.** Point discipline commands at files in the folder — output saves alongside with the discipline's canonical name (`exploration.md`, `sensemaking.md`, `decomposition.md`, `innovation.md`, `critique.md`).
3. **`_state.md` is the source of truth.** Progress, iteration count, history, next command, flow-type.
4. **If the question isn't answered, loop again.** Each iteration narrows the focus based on what the previous iteration revealed.
5. **The human can redirect at any point.** The pipeline runs continuously without pausing. The human can interrupt mid-response to redirect, re-run, or override. Checkpoints display telemetry between disciplines for visibility — they are informational, not gates.
6. **Failures are data.** If the loop produces a bad answer, the WHERE and WHY of the failure is valuable — it reveals what needs to improve in the discipline configurations (the specs).
7. **Classic `/mvl` is UNCHANGED.** This command (`/mvl+`) is separate and coexists with classic. Existing classic inquiries resume with `/mvl`, not `/mvl+`. The `flow-type` field in `_state.md` distinguishes them.
