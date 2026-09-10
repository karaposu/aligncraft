name: inquiry
description: CONFIGURE new inquiries, track state, run wayfinding checkpoints. Disciplines are invoked separately via their own slash commands.

# /inquiry — Inquiry Manager

Manages inquiry state and steering. For NEW inquiries: classifies the problem and designs the pipeline. For RESUME: checks progress and tells you what to run next. When a pipeline iteration is complete: runs the wayfinding checkpoint.

**This command does NOT run disciplines.** It tells you which discipline command to type next. The disciplines run at full depth via their own commands (`/sense-making`, `/innovate`, `/critic`, `/decompose`).

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

### If NEW (input is a question or description):

Run CONFIGURE:

1. Read the problem fully.

2. Classify the problem type (primary + secondary if applicable):
   - **Ambiguous** — needs clarification
   - **Complex** — needs decomposition
   - **Broken** — needs diagnosis
   - **Novel** — needs creative solutions
   - **Clear** — needs options evaluated

3. Select disciplines and sequence into a pipeline:

   | Type | Pipeline |
   |---|---|
   | Ambiguous | S only |
   | Ambiguous + novel | S → I → C |
   | Complex | S → Decompose → [per branch: pipeline] |
   | Broken | S → [Diagnosis when built] |
   | Novel | I → C |
   | Clear | I → C |

4. Set termination criteria.

5. Create the inquiry folder: `devdocs/inquiries/<slugified_name>/`

6. Write `_branch.md`:
   ```markdown
   # Branch: [name]
   ## Question
   [question stated clearly]
   ## Parent
   Root
   ## Depends on
   None
   ## Provides to
   None
   ## Tags
   [keywords]
   ## Verification
   - [ ] [criteria]
   ```

7. Write `_state.md`:
   ```markdown
   # State: [name]
   ## Status
   ACTIVE
   ## Configuration
   Problem type: [type]
   Pipeline: [sequence]
   Reasoning: [why]
   ## Pipeline Progress
   - [ ] Sensemaking
   - [ ] Innovation
   - [ ] Critique
   ## Next Command
   /sense-making devdocs/inquiries/[name]/_branch.md
   ## History
   - [date]: CONFIGURE — [pipeline]
   ## Iteration
   1
   ## Kill Record
   (none yet)
   ```

8. Present the CONFIGURE result:
   ```
   Inquiry created: devdocs/inquiries/[name]/
   Pipeline: [sequence]
   Reasoning: [why]

   Next, run:
   /sense-making devdocs/inquiries/[name]/_branch.md
   ```

**Done. Wait for user to run the discipline command.**

---

### If RESUME (input is a folder path):

1. Read `_state.md` from the folder.

2. Read `_branch.md` for context.

3. Check which pipeline steps are complete AND their quality:

   For each expected discipline output file (sensemaking.md, innovation.md, critique.md, comprehension.md, etc.):

   **a. Does the file exist?** If no → this step is not done yet. Skip to step 4.

   **b. If yes → read the file and find the telemetry section.** Each discipline uses a specific header:
   - Sensemaking: `## Saturation Indicators (Telemetry)`
   - Innovation: `## Mechanism Coverage (Telemetry)`
   - Critique: `### Convergence Telemetry`
   - Comprehend: `### Final Summary` (telemetry is embedded in the summary fields)
   - Exploration: convergence criteria at the end of the output
   - Decomposition: self-evaluation section at the end of the output

   **c. Read the telemetry measurements and check against thresholds:**

   | Discipline | Key thresholds |
   |---|---|
   | Sensemaking | Perspectives with new anchors ≥ 3. Ambiguity resolution ratio ≥ 70%. SV delta shows structural change from SV1. |
   | Innovation | Generators applied ≥ 1. Framers applied ≥ 1. At least one survivor tested for novelty and scrutiny survival. |
   | Critique | All critical-weight dimensions evaluated. Adversarial strength not "weak." At least one candidate has a verdict. |
   | Comprehend | Depth test passed at target level. Prediction accuracy meets target threshold. |
   | Exploration | Frontier stable. Discovery rate declining. Gaps bounded. |
   | Decomposition | Independence, completeness, and reassembly checks pass. |

   **d. Route based on telemetry:**

   - **PROCEED** — all thresholds met → this step is done with sufficient quality. Mark complete and move to step 4.
   - **FLAG** — some measurements below threshold → present the specific shortfall to the user with guidance:
     ```
     Inquiry: [name]
     Status: [discipline] complete but telemetry flagged

     Telemetry concern: [specific measurement] is below threshold.
     [e.g., "Anchor diversity is low — 2 types from 1 perspective. 
      Consider re-running /sense-making with additional perspectives."]

     Options:
     1. Re-run /[discipline] with the guidance above
     2. Accept and proceed to next step (override)
     ```
     **Wait for user decision.**
   - **RE-RUN** — critical metric missing or clearly failed → recommend re-running with targeted feedback.
   - **No telemetry section found** → treat as PROCEED. (Backward-compatible with older outputs or standalone discipline runs that don't include telemetry.)

4. Determine next action:

   **If the next pipeline step is a discipline (sensemaking, innovation, critique, decomposition):**

   Update `_state.md` Pipeline Progress (check off completed steps). Set the Next Command. Present:

   ```
   Inquiry: [name]
   Status: [iteration N, step X of Y complete]

   Next, run:
   /[command] devdocs/inquiries/[name]/[input_file]
   ```

   The input file depends on the discipline:
   - Sensemaking → `_branch.md` (the question)
   - Innovation → `sensemaking.md` (the sensemaking output as seed)
   - Critique → the exploration folder path (reads both sensemaking + innovation)
   - Decomposition → `sensemaking.md`

   **Done. Wait for user to run the discipline command.**

   **If ALL pipeline steps for this iteration are complete → run META-SEARCH CHECKPOINT:**

   Read the discipline outputs from this iteration. Assess:

   - **Present layer:** What survived critique? What was killed? What was refined? Any coverage gaps?
   - **Trend layer:** (Iteration 2+) Is this iteration producing more or less value than the previous? Velocity? Acceleration?
   - **Memory layer:** Do any kill conditions from previous iterations conflict with new information from this iteration?

   Produce a move:

   | Move | When | What to tell user |
   |---|---|---|
   | **NARROW** | Strong survivor | "Refine the survivor. Run: /sense-making on [specific aspect]" |
   | **BROADEN** | All killed or clustering | "Try different angle. Run: /sense-making on [new perspective]" |
   | **SHIFT** | Dimension exhausted | "Change focus. Run: /sense-making on [different dimension]" |
   | **DIAGNOSE** | Oscillating/stalling | "Problem understanding incomplete. Run: /sense-making on [the gap]" |
   | **TERMINATE** | Converged + clean survive | "Exploration complete. Survivors: [list]. Run SYNTHESIZE." |
   | **RECONSIDER** | Kill condition invalidated | "Reconsider [killed idea]. Run: /sense-making on [reconsidered angle]" |

   Update `_state.md`:
   - Increment iteration
   - Reset Pipeline Progress checkboxes for the new iteration
   - Update Next Command based on the move
   - Append to History (what happened this iteration, what the move is)
   - Update Kill Record / Survival Record from critique verdicts

   Present:
   ```
   ## Iteration [N] Complete

   ### Results
   [What survived, what was killed, what was refined]

   ### Meta-Search
   Present: [position/heading]
   Trend: [velocity — iteration 2+ only]
   Memory: [any RECONSIDER signals]

   ### Move: [MOVE]
   [Reasoning]

   ### Next
   /[command] devdocs/inquiries/[name]/[input]
   ```

---

## How the User Runs a Full SIC Cycle

```
/inquiry "How should we redesign the payment flow?"
  → CONFIGURE. "Next: /sense-making devdocs/inquiries/payment_flow/_branch.md"

/sense-making devdocs/inquiries/payment_flow/_branch.md
  → Full SV1-SV6. Saved as sensemaking.md in the inquiry folder.

/inquiry devdocs/inquiries/payment_flow/
  → Sees sensemaking done. "Next: /innovate devdocs/inquiries/payment_flow/sensemaking.md"

/innovate devdocs/inquiries/payment_flow/sensemaking.md
  → Full 7×3 innovation. Saved as innovation.md.

/inquiry devdocs/inquiries/payment_flow/
  → Sees innovation done. "Next: /critic devdocs/inquiries/payment_flow/"

/critic devdocs/inquiries/payment_flow/
  → Full adversarial critique. Saved as critique.md.

/inquiry devdocs/inquiries/payment_flow/
  → All steps done → META-SEARCH CHECKPOINT
  → "Move: NARROW on tokenization. Next: /sense-making ..."
```

Pattern: **discipline → inquiry → discipline → inquiry → ... → wayfinding → discipline → ...**

Each discipline runs at full depth via its own proven command. `/inquiry` just manages state and runs wayfinding.

---

## SYNTHESIZE — After TERMINATE

When wayfinding produces TERMINATE, the inquiry's thinking is done. But the inquiry's ARTIFACTS are scattered across discipline outputs, iteration folders, and conversation history. SYNTHESIZE compiles them into a coherent deliverable.

**What SYNTHESIZE does:**

1. Read all surviving ideas, decisions, and refinements from the inquiry tree
2. Compile into a single, top-down document written for someone who wasn't in the conversation
3. Resolve inconsistencies (earlier sections should reflect later decisions)
4. Save the deliverable to the appropriate project location (not the inquiry folder — the actual project)

**The deliverable format depends on the problem type:**

| Problem type | Deliverable |
|---|---|
| Format/architecture design | Specification document |
| Feature design | Implementation plan |
| Strategy question | Decision document with reasoning |
| Research/analysis | Report with findings |
| Debugging | Root cause analysis + fix plan |

**SYNTHESIZE is NOT a thinking discipline.** It doesn't transform understanding. It transforms PRESENTATION — taking bottom-up exploration outputs and rewriting them top-down for a reader. The decisions are already made. SYNTHESIZE just makes them coherent and accessible.

**What to tell the user:**

```
Inquiry complete. Survivors: [list]

SYNTHESIZE: Compile the inquiry's decisions into a deliverable.
Save to: [project path, not inquiry folder]
Format: [spec / plan / report / analysis — based on problem type]
```

The user can run SYNTHESIZE immediately or defer it. The inquiry tree persists either way — SYNTHESIZE adds a deliverable, it doesn't replace the inquiry.

---

## Cross-Session Resume

```
/inquiry devdocs/inquiries/payment_flow/
  → Reads _state.md
  → "Inquiry: payment_flow. Iteration 2, sensemaking complete.
     Next: /innovate devdocs/inquiries/payment_flow/sensemaking.md"
```

`_state.md` has everything: where you are, what's been done, what to do next. Any session, any AI.

---

## Rules

1. **CONFIGURE first.** New inquiries start with classification and pipeline.
2. **`/inquiry` does NOT run disciplines.** It tells you which command to type. The disciplines run themselves.
3. **`_state.md` is the source of truth.** Pipeline progress, next command, history, kill record.
4. **Discipline commands save to the inquiry folder.** Point them at `_branch.md` or the relevant output file — they save alongside it.
5. **Dead branches persist.** Kill conditions as falsifiable predicates in `_state.md`.
6. **Wayfinding runs when the pipeline iteration is complete.** Not between disciplines — only after all pipeline steps are done.
7. **Circuit breaker.** Zero/negative velocity for 2+ iterations → force-pause with diagnosis.
8. **SYNTHESIZE after TERMINATE.** Don't end with scattered artifacts. Compile the inquiry's decisions into a coherent deliverable for the actual project. The inquiry tree is the thinking history. The deliverable is the product.

