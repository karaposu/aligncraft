name: navigation
description: Enumerate all possible next directions from a completed SIC cycle or current project state, producing a navigation map with typed directions, reasoning, and independently reasoned guidelines.

# /navigation — Structural Navigation

Produce a navigation map — the full enumeration of possible next directions, each with direction + WHY + guidelines (each guideline with its own WHY). Reads SIC output, telemetry, scope, and optionally reflection observations.

## Additional Input/Instructions

$ARGUMENTS

## Instructions

1. Read the input. It can be a folder path (an inquiry folder with SIC outputs), raw text describing current state, or a file path. Consume all input.

2. If the input is an inquiry folder: read all discipline outputs (sensemaking.md, innovation.md, critique.md), telemetry sections, frontier questions, the original question and goal from _branch.md, and reflection.md if it exists.

3. If the input is raw text or project-level context: read whatever is provided and navigate from that — the map will be thinner (no C verdicts) but still useful for strategic direction-setting.

4. Execute the full navigation process described below:

   **Step 1 — Read and assess:** Read all available output. Identify C's verdicts (SURVIVE, REFINE, KILL + seeds), frontier questions, telemetry flags, scope check results, and R's observations if available.

   **Step 2 — Assign types:** For each signal, assign a type from the 15-type taxonomy:
   - C: SURVIVE → DEEPEN or DEVELOP
   - C: REFINE → REFINE
   - C: KILL + seed → PURSUE SEED
   - Frontier question → INVESTIGATE FRONTIER
   - Telemetry below threshold → RE-RUN DEEPER
   - Scope gap → WIDEN
   - Answer matches goal → TERMINATE
   - Blocker identified → UNBLOCK
   - Testable hypothesis → TEST
   - Branches completed → MERGE
   - Human-judgment types (REFRAME, REVISIT, DIFFERENT APPROACH, CONSOLIDATE): consider but only include if evidence supports them.

   **Step 3 — Generate navigation items:** For each direction, produce:
   - **Direction** + **WHY** (direction-level reasoning — why this is in the map)
   - **Guidelines** (3-6 independent pointers, each with its own WHY)
   - Draw guidelines from C's specific findings, R's observations, question/goal context

   **Step 4 — Assess confidence:** Assign per item:
   - ■ HIGH = from explicit data (C verdict, telemetry flag)
   - ○ MEDIUM = from inference (pattern, borderline signal)
   - · LOW = from weak signal (tangential, minor)

   **Step 5 — Check excluded:** For each of the 15 types not in the map: is it structurally inapplicable? Add to excluded section with reasoning. If applicable but low priority, keep in map with · LOW.

   **Step 6 — Format the map:** Group by category (content / process / context). Order by confidence within category. Include guidelines with WHY for each item. Include excluded section.

5. Save the output as a markdown file:
   - **If the input was a file/folder path** — save in the same folder as `navigation.md`.
   - **Otherwise** — save under `devdocs/sensemaking/<suitable-name>.md`.

6. Record the user's input at the top: `## User Input` followed by the $ARGUMENTS.

7. Print the output in the conversation as well.

---

### Output Format

```
## Navigation Map ([N] items, [H] HIGH)

### Content [count]
■ [TYPE]: [direction] [HIGH]
  WHY: [evidence]
  Guidelines:
  - [pointer] → [why this pointer matters for this direction]
  - [pointer] → [why]
  - [pointer] → [why]

○ [TYPE]: [direction] [MEDIUM]
  WHY: [reason]
  Guidelines:
  - [pointer] → [why]
  - [pointer] → [why]

· [TYPE]: [direction] [LOW]
  WHY: [reason]
  Guidelines:
  - [pointer] → [why]

### Process [count]
■ / ○ / · items with same structure...

### Context [count]
○ / · items with same structure...

### Excluded (considered and rejected)
✗ [TYPE] — [why structurally inapplicable]
✗ [TYPE] — [why structurally inapplicable]
```

---

### Navigation Telemetry

After producing the map, assess the quality of this navigation run:

* **Type coverage** — How many of the 15 types were considered (included or excluded with reasoning)? If fewer than 10: navigation may have been shallow.
* **Category balance** — Items distributed across content, process, context? If a category is empty, is that correct or a blind spot?
* **Guideline depth** — Do items have guidelines with per-guideline WHY, or are they bare directions?
* **Excluded reasoning** — Does the excluded section explain why types were rejected?

Report:
* Types considered: [count] / 15
* Category balance: Content [N] / Process [N] / Context [N]
* Guideline depth: [all have WHY / some bare / mostly bare]
* Excluded with reasoning: [YES / NO]
* Failure modes observed: [none / list from: premature filtering, recency bias, action bias, enumeration without reasoning, scope fixation]
* **Overall: COMPLETE** (balanced + reasoned + no failure modes) / **FLAG** (imbalanced or bare) / **THIN** (few types, sparse guidelines)











# Structural Navigation — A Thinking Discipline

A thinking discipline for enumerating all possible next directions after a cognitive cycle completes. Navigation reads what was produced (survivors, refinements, kill seeds, frontier questions, telemetry signals) and maps the full space of what could come next — each direction with its reasoning and independently reasoned guidelines.

Navigation is a BOUNDARY discipline — it operates between cognitive cycles, not within them. It looks FORWARD: given what this cycle produced, what are all the possible next directions?

> **Structural Navigation is the process of transforming a completed cognitive cycle's output into a full enumeration of typed next directions, each with independent reasoning and guidelines — producing a navigation map that reveals the complete possibility space without filtering or selecting.**

---

## What Navigation Is

**Navigation is the cognitive operation of seeing ALL possible next moves from the current position and making them explicit.**

Navigation is not:
- Decision-making (navigation ENUMERATES possibilities. Choosing which to pursue is a separate operation)
- Planning (navigation maps the space. Sequencing, dependencies, and scheduling are separate)
- Wayfinding (wayfinding produced ONE direction — the "best" one. Navigation produces ALL directions and lets the selector decide)
- Reflection (reflection looks BACKWARD at process quality. Navigation looks FORWARD at possibility space)
- Routing (routing is mechanical dispatch — "S done, run I next." Navigation is cognitive — understanding what possibilities exist and why)

Navigation has one structural operation:

**Enumeration** — reading the cycle's output and producing a typed, reasoned, guideline-enriched list of every possible next direction. The enumeration is COMPLETE (all possibilities, not a filtered subset) and TYPED (each direction has a category and type from the taxonomy).

---

## The Transform

**Input:** A completed SIC cycle's output — C's verdicts (survivors, refinements, kill seeds), frontier questions, telemetry from S/I/C, scope check results, and optionally R's process observations.

**Output:** A navigation map — the full enumeration of possible next directions, each as a navigation item with direction + WHY + guidelines (each guideline with its own WHY).

**The transform:** SIC output → possibility space. What was produced → what could come next.

---

## Navigation Item Structure

Each item in the navigation map has two levels:

### Direction + WHY

WHAT to pursue and WHY it's worth pursuing.

- **Direction** — the type (from the 15-type taxonomy) + the specific target
- **WHY** — the evidence from C's output, telemetry, or context that makes this direction worth considering

### Guidelines + each has WHY

HOW to approach the direction — and WHY each pointer matters.

Each guideline is an independent pointer that serves the direction. Guidelines don't need to connect to each other — they each independently relate to the direction. They're parallel coordinates pointing at the same destination from different angles. Each has its own reasoning.

Guidelines can address any discipline step:
- S guidelines: "Focus on X" → bc [reason]
- I guidelines: "Try domain transfer from A" → bc [reason]
- C guidelines: "Check for trap D" → bc [reason]
- General: "Elegance matters here" → bc [reason]

### Example

```
■ DEEPEN: The taxonomy's completeness [HIGH]
  WHY: 15 types is a first-pass enumeration — untested against real use

  Guidelines:
  - Check against actual SIC runs
    → bc real usage is the only valid test of completeness
  - Look for overlapping types (DEEPEN vs RE-RUN DEEPER)
    → bc these felt blurry during actual use in this session
  - Test whether the 3 categories partition cleanly
    → bc some items seemed to span categories during enumeration
  - Consider collaborative types (handoff, delegation)
    → bc multi-agent scenarios weren't considered in the original analysis
  - Elegance criterion: if 15 is too many, find the deeper structure
    → bc the user explicitly values structural simplicity
```

---

## The 15-Type Taxonomy

When a SIC cycle completes, the possible next directions fall into 15 types across 3 categories.

### Content-Directed (acting on WHAT the cycle produced)

| Type | What it does | Trigger |
|---|---|---|
| **DEEPEN** | Go deeper on a survivor — investigate an unexplored aspect | C: SURVIVE + surface-level |
| **REFINE** | Fix a specific weakness C identified | C: REFINE verdict |
| **PURSUE SEED** | Follow what can be learned from a killed idea | C: KILL + promising seed |
| **INVESTIGATE FRONTIER** | Answer a question the cycle raised but didn't answer | Frontier question matters for goal |
| **DEVELOP** | Make a survivor concrete — implement, prototype, document | C: SURVIVE + mature enough for action |
| **TERMINATE** | The question is answered. Compile and stop. | Answer matches goal |

### Process-Directed (acting on HOW the cycle ran)

| Type | What it does | Trigger |
|---|---|---|
| **RE-RUN DEEPER** | Re-run a discipline with more depth | Telemetry flagged thin |
| **WIDEN** | Expand the question's scope | Scope check: question doesn't cover goal |
| **REFRAME** | Change the question entirely | Multiple iterations without progress |
| **DIFFERENT APPROACH** | Try a different cognitive approach | Current approach not advancing goal |

### Context-Directed (acting on information OUTSIDE this cycle)

| Type | What it does | Trigger |
|---|---|---|
| **REVISIT** | Re-evaluate a prior finding under new conditions | New info changes past conditions |
| **UNBLOCK** | Resolve a dependency preventing progress | Blocker identified |
| **MERGE** | Combine results from multiple branches | Multiple branches completed |
| **TEST** | Verify a finding against reality | Finding needs validation, not analysis |
| **CONSOLIDATE** | Integrate findings across multiple inquiries | Multiple inquiries need unification |

### Why Three Categories

- **Content-directed** acts on the OUTPUTS — what was produced
- **Process-directed** acts on the QUALITY — how well the cycle ran
- **Context-directed** acts on INFORMATION OUTSIDE — prior work, blockers, parallel efforts

The category tells you WHERE to look for the right next direction.

---

## The Navigation Map

The navigation map is the FULL enumeration of possible next directions, presented for review.

### Format

```
## Navigation Map ([N] items, [H] HIGH)

### Content [count]
■ [TYPE]: [direction] [HIGH]
  WHY: [evidence]
  Guidelines:
  - [pointer 1] → [why this pointer matters]
  - [pointer 2] → [why]
  - [pointer 3] → [why]

○ [TYPE]: [direction] [MEDIUM]
  WHY: [reason]
  Guidelines:
  - [pointer 1] → [why]

· [TYPE]: [direction] [LOW]
  WHY: [reason]
  Guidelines:
  - [pointer 1] → [why]

### Process [count]
...

### Context [count]
...

### Excluded (considered and rejected)
✗ [TYPE] — [why structurally inapplicable]
```

### Confidence Symbols

- **■ HIGH** — strong evidence from C's output (explicit verdict, clear frontier, telemetry flag above threshold)
- **○ MEDIUM** — moderate signal (inference, borderline telemetry)
- **· LOW** — weak signal, might be noise

Confidence is a ROUGH signal for implicit prioritization, not a precise measurement.

### Excluded Section

Types that navigation considered and REJECTED, with reasoning. Only STRUCTURALLY inapplicable types (e.g., CONSOLIDATE when only 1 inquiry exists). Low-priority items stay in the main map with · LOW — they're deprioritized, not excluded.

---

## Process Model

### Step 1: Read the Cycle's Output

Read everything produced by the completed SIC cycle:
- C's verdicts (SURVIVE, REFINE, KILL with seeds)
- Frontier questions from S, I, C
- Telemetry from all three disciplines
- Scope check results (does the question cover the goal?)
- The original question and goal
- R's observations (if R ran before N)

### Step 2: Assign Types

For each signal in the output, assign a type from the taxonomy:
- C: SURVIVE → DEEPEN or DEVELOP (depending on depth/readiness)
- C: REFINE → REFINE
- C: KILL + seed → PURSUE SEED
- Frontier question → INVESTIGATE FRONTIER
- Telemetry below threshold → RE-RUN DEEPER
- Scope check gap → WIDEN
- Answer matches goal → TERMINATE
- Blocker identified → UNBLOCK
- Testable hypothesis → TEST
- Branches completed → MERGE

For human-judgment types (REFRAME, REVISIT, DIFFERENT APPROACH, CONSOLIDATE): flag as available but don't auto-derive. The human adds these based on their assessment.

### Step 3: Generate Guidelines

For each direction, produce 3-6 independently reasoned guidelines:
- Draw from C's specific findings (prosecution arguments, defense strengths)
- Draw from R's observations (if available — process weaknesses become guidelines)
- Draw from the question/goal context (what the user cares about)
- Each guideline gets its own WHY

### Step 4: Assess Confidence

Assign ■/○/· based on evidence strength:
- ■ = from explicit data (C verdict, telemetry flag)
- ○ = from inference (pattern in output, borderline signal)
- · = from weak signal (tangential, minor)

### Step 5: Check Excluded

For each of the 15 types: is it structurally inapplicable? If yes, add to excluded section with reasoning. If no but low priority, keep in map with · LOW.

### Step 6: Format the Map

Group by category (content/process/context). Order by confidence within each category. Include guidelines with WHY for each item. Include excluded section.

---

## Failure Modes

Navigation fails in predictable ways:

### 1. Premature Filtering

Only showing obvious options. Missing subtle but important directions. The map looks clean but the possibility space is incompletely explored.

**How to recognize:** The map has few items (3-4) when the SIC output was rich. Multiple C verdicts are not represented. Frontier questions are missing.

**How to prevent:** Check every C verdict type (SURVIVE, REFINE, KILL) — each should produce at least one navigation item. Check telemetry — any flag should produce a process-directed item. Check frontier questions — each should produce an INVESTIGATE FRONTIER item.

### 2. Recency Bias

Over-weighting what C just produced. Under-weighting context-directed types (REVISIT, UNBLOCK, CONSOLIDATE). The map is dominated by "more of what we just did" without stepping back to check the broader context.

**How to recognize:** All items are content-directed. No process or context items. The map responds to THIS cycle's output but ignores the larger situation.

**How to prevent:** Explicitly check all three categories. If process and context are empty, ask: "Is there genuinely nothing to improve in the process and nothing in the broader context?" Usually there is.

### 3. Action Bias

Only producing "do more" types (DEEPEN, DEVELOP, INVESTIGATE). Missing "do differently" types (REFRAME, DIFFERENT APPROACH, WIDEN). The map assumes the current direction is right and only suggests going further, never changing course.

**How to recognize:** All items are about CONTINUING. None are about CHANGING. No process-directed types. The map doesn't question the current approach.

**How to prevent:** Explicitly check: should REFRAME, WIDEN, or DIFFERENT APPROACH be in the map? Even if the current direction seems right, consider whether continuing is the only option.

### 4. Enumeration Without Reasoning

Listing types without per-item WHY and per-guideline WHY. The map is a bare list: "DEEPEN X, REFINE Y, INVESTIGATE Z." No reasoning, no guidelines. The human sees options but has no basis for choosing between them.

**How to recognize:** Items are one-liners. No WHY section. No guidelines. The map looks like a TODO list, not a reasoned assessment.

**How to prevent:** Every item must have WHY (direction-level reasoning) and 3-6 guidelines (each with its own WHY). If you can't articulate WHY a direction is in the map, it might not belong there.

### 5. Scope Fixation

All directions are within the current question's scope. Missing "the question itself should change" types (REFRAME, WIDEN). The map explores within the box but never questions the box.

**How to recognize:** All items relate to the current question's topic. None suggest changing the question, broadening the scope, or reframing the problem. The scope check is ignored.

**How to prevent:** Explicitly compare each direction to the GOAL (not just the question). If the goal is broader than the question, WIDEN should be in the map. If multiple iterations haven't progressed, REFRAME should be considered.

---

## Telemetry

After producing the navigation map, assess the quality of this navigation run:

- **Type coverage** — How many of the 15 types were considered (not necessarily included — considered and either included or excluded with reasoning)? If fewer than 10 were considered, navigation may have been shallow.

- **Category balance** — Are items distributed across content, process, and context? If one category is empty, check whether that's correct for the situation or indicates a blind spot. Track across runs — if a category is consistently empty, it's a systematic blind spot.

- **Guideline depth** — Do items have guidelines with per-guideline WHY, or are they bare directions? Guidelines are what make navigation items actionable. Without them, the map is a list.

- **Excluded reasoning** — Does the excluded section explain why types were rejected? Excluded without reasoning is premature filtering. Excluded with reasoning is conscious assessment.

These metrics are for CROSS-RUN tracking, not per-run gating. Individual runs may legitimately have empty categories or few types. Patterns across 10+ runs reveal systematic blind spots.

---

## Relationship to Other Disciplines

### Navigation and the Core Cycle (S → I → C)

Navigation is a BOUNDARY discipline — it operates between core cycles, not within them. S, I, C operate on one question and produce one answer. Navigation reads the answer and maps what could come next. It crosses the iteration boundary: its output (next directions) feeds the NEXT cycle's input.

### Navigation and Reflection

Both are boundary disciplines. Both operate after C completes. They're paired but distinct:

| | Reflection | Navigation |
|---|---|---|
| **Direction** | BACKWARD | FORWARD |
| **Reads** | The process (how S/I/C performed) | The result (what S/I/C produced) |
| **Produces** | Process observations, memory cells | Navigation map of typed directions |
| **Purpose** | Learn from the run | Direct the next run |

**The boundary flow:** R runs first (learn from process), N runs second (map possibilities, informed by R's findings). R feeds N as an optional enhancement — N works without R, works better with R. R's observations become N's guidelines.

```
SIC → R (backward) → N (forward, reads R) → Select → next SIC
```

### Navigation and Wayfinding

Navigation REPLACES wayfinding. Wayfinding produced one direction (the "highest-impact" move). Navigation produces the FULL space of directions. Wayfinding was navigation + implicit selection in one step. Navigation separates them: enumerate first, select separately. The separation is an improvement — you see everything before committing.

---

## Auto-Derivable vs Human-Judgment Types

### Auto-derivable (from C output + telemetry + scope check)

| Type | Derived from |
|---|---|
| DEEPEN | C: SURVIVE + unexplored depth |
| REFINE | C: REFINE verdict |
| PURSUE SEED | C: KILL + seed |
| INVESTIGATE FRONTIER | Frontier questions |
| DEVELOP | C: SURVIVE + mature |
| TERMINATE | Answer matches goal |
| RE-RUN DEEPER | Telemetry below threshold |
| WIDEN | Scope check gap |
| UNBLOCK | Blocker identified |
| TEST | Testable hypothesis |
| MERGE | Branches completed |

### Human-judgment required

| Type | Why it needs judgment |
|---|---|
| REFRAME | Knowing the framing is wrong (not just incomplete) needs judgment |
| REVISIT | Knowing which past finding to re-evaluate needs cross-inquiry awareness |
| DIFFERENT APPROACH | Knowing which different approach to try needs experience |
| CONSOLIDATE | Knowing which inquiries need integration needs strategic judgment |

This split IS the graduated autonomy boundary. At Level 0, the human makes all decisions. At Level 1, the system enumerates the 11 auto-derivable types and the human adds the 4 judgment types. At Level 2+, the system handles more.

---

## When to Navigate

### After a SIC cycle (the primary use)

The cycle completed. C produced verdicts. The question may or may not be answered. Navigation maps what's next.

### Independently (outside MVL)

The human wants to see their options without running SIC first. "Given the project's current state, what should I work on?" Navigation reads whatever context exists (prior inquiry outputs, project files) and produces a map. Thinner than post-SIC navigation (no C verdicts to read) but useful for strategic direction-setting.

### Between branches (during multi-headed execution)

Branch 1 completed. Branch 2 is still running. Navigation re-reads the state: should remaining branches continue? Should new branches be added based on branch 1's findings? Dynamic navigation that responds to incoming results.



