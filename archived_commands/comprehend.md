name: comprehend
description: Structural Comprehension is the process of transforming an observable-but-opaque artifact into an internal working model with predictive power through progressive construction, causal tracing, perturbation testing, and adversarial self-verification.

# /comprehend — Structural Comprehension Analysis

Analyze the given input using the Structural Comprehension Framework. This transforms observable-but-opaque artifacts into tested, transferable working models through progressive model construction, perturbation testing, and adversarial self-verification.

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

1. Read the input and consume it. It can be raw text, a folder path with md files, code files, or image path. Consume all input.

2. Determine the comprehension aspect:
   - **Mechanistic** (default) — "How does this work?" Build a model of mechanism.
   - **Intent** — "Why was this built this way?" Build a model of the design space.
   - If the user specifies an aspect, use it. Otherwise default to mechanistic, blending intent naturally as it arises.

3. Determine the target depth:
   - If the user specifies a depth target, stop there.
   - If no target is specified, aim for Predictive (CV3-CV4) for code and systems, Structural (CV1) for quick orientation tasks.

4. Use codebase context where relevant. For code artifacts, prefer execution-based perturbation testing (actually run the code, modify inputs, observe outputs). For non-code artifacts, use scenario-based or reasoning-based perturbation.

5. Execute the full Structural Comprehension process described below, producing all Comprehension Versions up to the target depth.

6. Save the output as a markdown file (unless differently stated in additional instructions!):
   - **If the input was a file path** — save in the same folder as the input file.
   - **Otherwise** — save under `devdocs/comprehension/<suitable-name>.md` (create the directory if needed).

7. Print the output in the conversation as well.

8. Record the user's input at the top of the output file: `## User Input` followed by the $ARGUMENTS that were passed to this command. This allows the Reflect step (R) to see what the human asked for alongside what the discipline produced.

---


---- NOW SOLID INSTRUCTIONS START----

## Execute the Following Process

### Comprehension Version 1 (CV1 — Structural Model)

**Phase: Static (Structural Mapping)**

Map the artifact's structure:

* Components — what parts exist?
* Relationships — how do they connect?
* Boundaries — where does this artifact end and its environment begin?

Write down your **prior assumptions** explicitly:
* "I assume this works like X because it resembles Y"
* "I expect this component is responsible for Z"
* These priors are your starting model. Making them explicit allows testing them later.

**Depth test:** Can you predict which component a given responsibility lives in? State a prediction and verify.

**Frontier questions:** List the questions that structural mapping RAISED but didn't answer — behavioral and causal questions you can now formulate because you see the structure. Format each as:

> **Q:** [The question — naturally phrased]
> **Why it matters:** [What answering this would unlock or what risk it addresses]
> **Depth needed:** [Which CV level would answer this]

Present CV1: the structural model, your explicit priors, and the frontier questions.

---

### Comprehension Version 2 (CV2 — Behavioral Model)

**Phase: Dynamic (Behavioral Tracing)**

Trace behavior through the structure:

* Follow execution / data flow / state changes / logical progression for at least 2 different inputs or scenarios
* Note where behavior matches your prior assumptions and where it diverges

Generate **explicit predictions** — write each BEFORE checking:

For each prediction, use this format:

**Prediction:**
[What you predict will happen]

**Reasoning:**
[Why your current model predicts this — which components, which flow]

**Status:**
[UNTESTED — to be verified in CV3]

Generate at least 5 predictions that cover different parts of the artifact. Include at least 1 prediction you're uncertain about.

**Depth test:** Can you trace the execution path for an input you haven't traced before? Attempt it.

**Frontier questions:** List the causal and dependency questions that tracing RAISED but didn't answer — questions about what depends on what, what would change if conditions differed.

Present CV2: the behavioral model, the untested prediction set, and the frontier questions.

---

### Comprehension Version 3 (CV3 — Causal Model)

**Phase: Differential (Perturbation Testing)**

Test your predictions. For each prediction from CV2:

1. Perturb the relevant input/parameter/condition (use the strongest form available: execute > scenario > reasoning)
2. Observe the result
3. Compare predicted vs. actual

For each tested prediction:

**Prediction:**
[Restated from CV2]

**Test method:**
[Execution-based / Scenario-based / Reasoning-based — what you actually did]

**Result:**
[What actually happened]

**Verdict:**
[CONFIRMED — model is correct here / FAILED — model needs correction]

**Model correction (if FAILED):**
[What was wrong in the model and how it's now revised]

After testing all predictions, build the **causal dependency map**: for each major component, what does it depend on? What depends on it? This comes from observing what changed when you perturbed things.

**Depth test:** Can you predict behavior for edge cases you specifically DID NOT trace? Generate 2 new predictions for untested conditions and test them.

**Frontier questions:** List adversarial questions — conditions or scenarios that MIGHT break the model. These become the input for CV4.

Present CV3: the causal model, prediction results, model corrections, causal dependency map, and frontier questions.

---

### Comprehension Version 4 (CV4 — Hardened Model)

**Phase: Adversarial (Model-Breaking)**

Attack your own model. The goal is NOT to confirm — it's to BREAK.

Generate 3 adversarial cases:
* Each should target a DIFFERENT weak point in your model
* Each should be designed to produce a result your model might get wrong
* Include cases where the accommodation trigger might fire (systematic failures)
* If the artifact involves measurement or assessment: include a case that tests whether the metric actually captures what it claims to (paradigm projection check)

For each adversarial case:

**Challenge:**
[The case designed to break the model]

**Why this might break:**
[What assumption it tests, what weakness it targets]

**Prediction (from current model):**
[What your model predicts]

**Result:**
[What actually happened]

**Verdict:**
[MODEL SURVIVES — the model handled this correctly / MODEL BREAKS — revision needed]

**Revision (if MODEL BREAKS):**
[How the model is updated. Check: is this failure systematic? Does the accommodation trigger fire? If yes — rebuild, don't patch.]

If all 3 cases survive: try 3 more from a completely different angle. If those also survive, the model is genuinely robust at this depth.

Build the **confidence map**: for each major area of the artifact, rate your model's confidence as HIGH (tested and survived adversarial challenge), MEDIUM (tested but not adversarially challenged), or LOW (not directly tested, inferred from adjacent areas).

**Frontier questions:** List generative questions — questions about design principles, rationale, and the "why" behind the artifact that adversarial testing raised but didn't resolve.

Present CV4: adversarial results, model revisions, confidence map, and frontier questions.

---

### Comprehension Version 5 (CV5 — Generative Model)

**Phase: Stabilization (Synthesis & Transfer)**

Synthesize the surviving model into a transferable artifact.

**Principle extraction:** Identify the N minimal rules or design decisions from which all observed behavior follows. State them clearly:
* "Everything else follows from these N decisions: [list]"
* For each principle: what does it explain? What would change if it were different?

**Transferable comprehension document:** Write a document that someone who has NEVER seen this artifact could use to:
* Predict its behavior for novel inputs
* Modify it safely
* Explain its design rationale

Structure the document as:
1. **What it is** (1-2 sentences — Descriptive level)
2. **How it's organized** (components + relationships — Structural level)
3. **How it works** (key behavioral flows — Causal level)
4. **What depends on what** (causal dependencies — Predictive level)
5. **The generating principles** (minimal rules that explain everything — Generative level)
6. **Known unknowns** (what ISN'T comprehended — explicit gaps)

**Depth test:** Could someone else act correctly on this artifact using only your document? If not, what's missing?

**Frontier questions:** List beyond-scope questions — questions about the system around the artifact, about contexts you haven't tested, about future evolution. These are the questions that would drive the NEXT comprehension session or a different discipline entirely.

Present CV5: the generating principles, the transferable document, explicit remaining unknowns, and frontier questions.

---

### Final Summary

After the last CV, present:

1. **Aspect** — Mechanistic / Intent / Both
2. **Depth reached** — which level, with evidence (which tests passed)
3. **Prediction scorecard** — total predictions made, confirmed, failed, model revisions triggered
4. **Confidence map** — HIGH / MEDIUM / LOW areas
5. **Key surprises** — where the model was wrong and what was learned from the correction
6. **Remaining unknowns** — what is NOT comprehended
7. **Accumulated frontier** — the full set of unanswered questions from all CVs, deduplicated. These are the direction signals for next steps — what to investigate next, what to test, where the model's boundaries are. Group by depth level (Structural / Causal / Predictive / Generative / Beyond-scope).















# Structural Comprehension — A Thinking Discipline

A thinking discipline for building internal working models of observable-but-opaque artifacts through progressive model construction, causal tracing, and falsifiable prediction testing. Comprehension is not reading — it's constructing a model that can predict behavior you haven't observed yet.

Rather than relying on intuition to decide "do I understand this?", Structural Comprehension treats understanding as a practiced methodology based on model construction, perturbation testing, adversarial self-challenge, and depth-calibrated verification.

> **Structural Comprehension is the process of transforming an observable-but-opaque artifact into an internal working model with predictive power — through progressive construction, causal tracing, perturbation testing, and adversarial self-verification — producing understanding that is testable, transferable, and depth-aware.**

---

## What Comprehension Is

**Comprehension is the cognitive operation of building an internal model of something that is visible but not understood — constructing a representation that can predict behavior, explain design rationale, and identify what would break if conditions changed.**

Comprehension is not:
- Reading (reading traverses the artifact; comprehension builds a model OF the artifact that exists independently of it — you can close the book and still predict what happens)
- Sensemaking (sensemaking resolves ambiguity — choosing among competing interpretations. Comprehension builds models of things that aren't ambiguous, just opaque. A complex algorithm isn't ambiguous — it does exactly one thing. You just can't see what.)
- Exploration (exploration maps what exists — an inventory of territory. Comprehension builds models of how the mapped things work. You explore first, then comprehend what you found.)
- Memorization (memorization replays what was observed. Comprehension predicts what was NOT observed. If you can only repeat traced paths but can't predict novel ones, you memorized — you didn't comprehend.)
- Analysis (analysis takes apart. Comprehension constructs a model that can put back together. Analysis is a technique within comprehension, not comprehension itself.)

Comprehension has two structural operations:

1. **Construction** — building the internal model through structural mapping, behavioral tracing, and causal discovery
2. **Verification** — testing the model through prediction, perturbation, and adversarial self-challenge

Construction without verification = a model that feels right but might be wrong. The most dangerous cognitive state — false confidence.
Verification without construction = testing nothing. You need a model before you can test it.
Both together = the full comprehension process.

| | Construction | Verification |
|---|---|---|
| **Primary role** | Build the internal model | Test whether the model is correct |
| **Activities** | Structural mapping, behavioral tracing, causal discovery | Prediction testing, perturbation, adversarial challenge |
| **Produces** | A candidate model | Confidence levels + model corrections |
| **When it fails** | Wrong model built → all downstream work is based on false understanding | Weak testing → false confidence survives |

### The Core Insight

Comprehension's unique structural contribution is that **understanding advances through testing, not despite it.** In most cognitive work, testing is separate from production — you build something, then test it. In comprehension, the testing IS the building. Every prediction that fails teaches you something the artifact does that your model doesn't capture. Every perturbation that produces unexpected results reveals a causal dependency you missed. The model gets better BECAUSE you attack it.

This is why verification is not a phase that comes "after" construction — it's woven through the entire process. You construct, then immediately test, then correct, then construct further, then test again. The construction-verification cycle IS comprehension.

---

## Two Primary Aspects

Not all comprehension asks the same question. Comprehension has two primary aspects — different targets for the same model-building process.

### Mechanistic Comprehension

**Question:** "How does this work?"

Build a model of the artifact's internal mechanism — what components exist, how they interact, what causes what, what would change if you perturbed something.

**Examples:** Understanding a sorting algorithm, a distributed system's consensus protocol, a chemical reaction pathway, a legal contract's clause interactions.

**What the model predicts:** Behavior. "Given input X, the output is Y because Z." The model is correct if predictions match reality.

### Intent Comprehension

**Question:** "Why was this built this way?"

Build a model of the design space — what decisions were made, what alternatives existed, what constraints shaped the choices, what would change if constraints changed.

**Examples:** Understanding why a codebase uses eventual consistency instead of strong consistency, why a building has a particular structural design, why a law was written with a specific exception.

**What the model predicts:** Design decisions. "If constraint X were relaxed, the design would shift to Y." The model is correct if the predicted design-space relationship holds.

### Why Two Aspects

Mechanistic and intent comprehension are tightly coupled in practice. You discover intent BY tracing mechanism ("this async pipeline exists because of the latency constraint"). Mechanism makes sense only when you grasp intent ("oh, THAT'S why they used a hash map — they needed O(1) lookups for the hot path"). A comprehension session naturally blends both.

The distinction matters because they produce different outputs (behavior predictions vs. design-space predictions) and fail in different ways (wrong mechanism model vs. wrong rationale model). Making the aspects explicit ensures both are addressed.

### Extended Modes

Comprehension can also target contextual understanding ("what role does this play in the larger system?") and temporal understanding ("how did this evolve and where is it heading?"). These are legitimate comprehension targets but live at the border with other cognitive operations — exploration and reflection, respectively. The comprehension process can serve them, but they are not its primary territory.

---

## Key Components

### Model Construction

The progressive building of an internal representation of the artifact. Construction proceeds through layers of increasing depth.

**Structural mapping** — identifying components, relationships, and boundaries. The skeleton of the model. "These are the parts, and this is how they connect."

**Behavioral tracing** — following execution, data flow, state changes, or logical progression through the structure. "When input arrives here, this happens, then this, then this."

**Causal discovery** — identifying what depends on what. Not "A happens before B" (sequence) but "A CAUSES B" (dependency). The difference matters: sequence can be coincidental; causality is structural.

### Perturbation Testing

The mechanism for discovering causal relationships — change one thing, observe what changes.

Perturbation is comprehension's highest-value technique because it produces **causal knowledge**: not "what does the system do?" but "what depends on what, and how strongly?" This is the difference between knowing the output for a specific input (tracing) and knowing WHY that output occurs (causality).

**Execution-based perturbation** (strongest) — actually change the input/parameter/condition and observe the result. For code: modify one variable, run the system, compare output. For physical systems: change one condition, measure the effect.

**Scenario-based perturbation** (moderate) — construct a realistic scenario where one element differs, and reason about the outcome using the current model. Validate against documentation, tests, or domain experts when possible.

**Reasoning-based perturbation** (weakest but valid) — thought experiments. "If this constraint didn't exist, what would follow?" Valid when execution is impossible (read-only systems, historical artifacts, abstract concepts). Physics uses thought experiments extensively; they are legitimate but require extra scrutiny.

The testing hierarchy matters: use the strongest available form. Default to execution-based whenever possible. Fall back to scenario-based or reasoning-based only when the artifact cannot be directly perturbed.

### Prediction Testing

Explicit, falsifiable predictions generated from the current model and tested against reality.

A prediction is not "I think I understand this." A prediction is: "Based on my current model, I predict that if input X is provided, the output will be Y, because the flow goes through component Z." The prediction must be specific enough to be wrong.

Prediction testing is what separates comprehension from the feeling of comprehension. Without it, surface fluency (being able to describe the artifact eloquently without actually modeling it) goes undetected. With it, every gap in the model becomes visible as a failed prediction.

### Adversarial Self-Challenge

Deliberately seeking the case that would BREAK the current model. Not "test more predictions from my model" (which tends to confirm) but "find the input/condition where my model fails" (which tends to break).

The self-challenge protocol: after constructing and testing a model, generate 3 cases specifically chosen to challenge the model's weakest points. If all 3 confirm the model, it's genuinely robust (or you're not trying hard enough — try 3 more from a different angle). If any break it, revise the model and re-test.

Adversarial self-challenge is the component that prevents **false comprehension** — the most dangerous cognitive state. Sensemaking can detect ambiguity. Exploration can detect gaps. Only comprehension's self-challenge detects confident-but-wrong models.

### Design Rationale Extraction

Identifying WHY choices were made, not just WHAT they are. This component serves the intent aspect primarily but also enriches mechanistic comprehension.

**Tradeoff mapping** — for each identified design decision, what alternatives existed? What was gained and what was lost? Under what constraints was this the right choice?

**Constraint identification** — what constraints (performance, compatibility, regulatory, team skill, timeline) shaped the artifact? Which constraints still hold? Which may have expired?

**Counterfactual testing** — "If constraint X didn't exist, how would the design differ?" This is perturbation testing applied to the design space rather than to the artifact's behavior.

### Accommodation Trigger

Borrowed from cognitive science (Piaget): the mechanism for recognizing when the current model needs structural replacement, not just correction.

**Assimilation** — new information fits the existing model. The model absorbs it. This is normal and efficient.

**Accommodation** — new information VIOLATES the existing model. The model must be restructured, not patched. This is rarer but critical.

Most comprehension failures occur when people assimilate (force-fit the artifact into familiar patterns) when they should accommodate (recognize the artifact uses unfamiliar patterns). The accommodation trigger fires when: prediction failures are SYSTEMATIC (not random), failures cluster around specific features of the artifact, and patching the model keeps producing new failures elsewhere.

When the trigger fires: stop patching. Step back. Ask: "Is my entire model wrong, or just this prediction?" If the failures are systematic, rebuild the model from the structural layer rather than adding exceptions to the existing one.

---

## The Depth Hierarchy

Comprehension is not binary (understand / don't understand). It has measurable levels. The depth hierarchy describes these levels, each with a concrete test.

| Level | What you can do | Test |
|-------|----------------|------|
| **Descriptive** | Describe what the artifact does in 1-2 sentences | Can you correctly predict its PURPOSE in a larger system? |
| **Structural** | Describe how it's organized — components, relationships, boundaries | Can you correctly predict which component a given responsibility lives in? |
| **Causal** | Trace causality — follow what happens for a given input through the mechanism | Can you correctly trace the execution path for an input you haven't traced before? |
| **Predictive** | Predict behavior under conditions you haven't observed | Can you correctly predict the output for edge cases, error conditions, or unusual inputs you specifically DID NOT trace? |
| **Generative** | State the minimal principles from which all behavior follows | Can you explain WHY a design decision was made, predict what would change if constraints changed, and reconstruct the architecture from principles alone? |

### Depth as Measure

The depth hierarchy is a MEASURE of comprehension, not a METHOD. It tells you WHERE YOU ARE, not what to do next. You might reach Causal depth during behavioral tracing, or during perturbation testing, or during adversarial challenge. The method that gets you there varies; the level you've reached is what the hierarchy measures.

### Depth as Target

Not every task requires Generative depth. A quick bug fix might need Causal. A major refactoring needs Predictive. Understanding a new codebase well enough to maintain it needs at least Structural. The depth TARGET is set by what you need to DO next — comprehend to the depth the downstream task requires.

### Level Tests Are Mandatory

You cannot claim a depth level without passing its test. The feeling of understanding is unreliable (surface fluency feels like understanding). The test is the evidence. This is comprehension's most important rule: **depth is demonstrated, not declared.**

---

## Process Model

Structural Comprehension proceeds through five phases organized in three functional layers. The phases are a recommended order, not a rigid sequence — they adapt to context. The depth-level tests are mandatory checkpoints regardless of phase order.

### Functional Layers

```
ACQUISITION        Build the model
VERIFICATION       Test the model
CRYSTALLIZATION    Extract principles and transfer
```

### The Five Phases

#### Phase 1 — Static (Structural Mapping)

Map the artifact's components, relationships, and boundaries without tracing behavior. Read the structure. Identify the parts.

Simultaneously: write down your **prior assumptions**. Everyone approaches an artifact with existing mental models — pattern recognition, experience, expectations from the name or documentation. These priors are your starting model, whether you acknowledge them or not. Making them explicit is what allows testing them later.

**Produces:**
- Component inventory (what parts exist)
- Relationship map (how they connect)
- Explicit prior model ("I assume this works like X because it resembles Y")
- Frontier questions — behavioral questions that structural mapping raised but didn't answer

**Depth reached:** Descriptive → Structural

**Exit test:** Can you predict which component a given responsibility lives in?

#### Phase 2 — Dynamic (Behavioral Tracing)

Trace execution, data flow, state changes, or logical progression through the structure mapped in Phase 1. Follow what happens when inputs arrive, when conditions trigger, when state changes propagate.

As you trace, generate **explicit predictions**: "Based on my current model, I predict that for input A, the output will be B, because the flow goes through C." Write these down BEFORE checking. The prediction must exist before the observation.

**Produces:**
- Traced behavioral flows
- State transition sequences
- Prediction set (untested)
- Frontier questions — causal and dependency questions that tracing raised but didn't answer

**Depth reached:** Causal

**Exit test:** Can you correctly trace the execution path for an input you haven't traced before?

#### Phase 3 — Differential (Perturbation Testing)

Change one input, parameter, or condition. Observe what changes. Test your predictions against reality.

This is the phase where comprehension deepens most rapidly because perturbation reveals CAUSAL relationships — not "what happens?" but "what depends on what?" Every prediction that fails identifies a gap in your model. Every unexpected propagation reveals a hidden dependency.

Use the strongest perturbation form available: execution-based → scenario-based → reasoning-based.

**Produces:**
- Prediction results (predicted vs. actual for each)
- Causal dependency map (what actually propagates to what)
- Model corrections (where predictions failed → where your model was wrong)
- Frontier questions — adversarial questions about what could break the model

**Depth reached:** Predictive

**Exit test:** Can you correctly predict behavior for untested edge cases with accuracy above your target threshold?

#### Phase 4 — Adversarial (Model-Breaking)

Deliberately seek the case that would break your model. Not "test more predictions" but "find the prediction my model CAN'T make."

Generate 3 cases specifically designed to challenge the model's weakest points. Test them. If all 3 confirm: either the model is genuinely robust, or you're not challenging hard enough — try 3 more from a completely different angle. If any break: revise the model and return to Phase 3 to re-test.

Check for the accommodation trigger: are prediction failures systematic? Do they cluster around specific features? If yes — don't patch. Rebuild from the structural layer.

**Produces:**
- Contradiction attempts and results
- Model revisions (if contradictions found)
- Confidence map (where the model is strong vs. fragile)
- Frontier questions — generative questions about design principles and rationale

**Depth reached:** Predictive (hardened)

**Exit test:** 3 adversarial cases attempted, all either survived or triggered model revision + successful re-test.

#### Phase 5 — Stabilization (Synthesis & Transfer)

Synthesize the surviving model into a transferable artifact. Extract the minimal generating principles — the smallest set of rules or decisions from which all observed behavior follows.

The transfer test: could someone who has never seen the artifact read your output and act correctly? Not "could they understand the artifact?" — could they modify it safely, predict its behavior, and explain its design rationale?

**Produces:**
- Transferable comprehension document
- Principle extraction ("the N design decisions that explain everything else")
- Explicit remaining unknowns (what ISN'T comprehended)
- Frontier questions — beyond-scope questions about the system around the artifact

**Depth reached:** Generative

**Exit test:** The output is usable by someone who hasn't seen the original artifact.

### Phase Order Flexibility

The recommended order (Static → Dynamic → Differential → Adversarial → Stabilization) works for **white-box artifacts** — things whose internals are readable (source code, documents, diagrams).

For **black-box artifacts** — things whose internals are not directly readable (compiled binaries, live systems, opaque APIs) — the natural starting point is Differential: poke the system and observe responses. Then Static (infer structure from observed behavior). Then Dynamic (trace the inferred paths).

The phase order adapts. The depth-level tests do not. Regardless of which path you take, you cannot claim a depth level without passing its test.

### Comprehension Versions

Each phase produces a Comprehension Version (CV) — a snapshot of the current model at the current depth.

```
CV1  (after Static)        Structural model + explicit priors
CV2  (after Dynamic)       Behavioral model + untested predictions
CV3  (after Differential)  Causal model + tested predictions + corrections
CV4  (after Adversarial)   Hardened model + confidence map
CV5  (after Stabilization) Generative model + transfer artifact
```

CVs are persistent artifacts, not conversation state. They are saved so that comprehension can resume across sessions. If context is lost, the last-saved CV is the resume point.

CVs can regress: if new information at CV4 invalidates assumptions from CV1, the structural model must be rebuilt. Regression is not failure — it's the accommodation trigger working correctly.

### Frontier Questions

Each phase produces not only a model but also **frontier questions** — questions the comprehender can now formulate but hasn't answered. These emerge naturally: every phase answers questions at its depth level while revealing questions at the next level. Phase 1 answers "what are the parts?" and raises "what happens when input arrives?" Phase 3 answers "what depends on what?" and raises "what would break under conditions I haven't tested?"

Frontier questions are the most valuable single output of a comprehension session. Knowing precisely what you DON'T know is often more actionable than knowing what you do. An unanswered question like "What happens under concurrent writes to this shared state?" does three things:

- **Direction** — tells the next person or session exactly where to point effort. No scanning, no guessing, no re-exploring covered territory.
- **Boundary** — maps the edge of the current model. Everything inside is tested. Everything outside is explicitly marked unknown. No false confidence.
- **Depth signal** — the question EXISTS because comprehension got deep enough to see it. At shallow depth, you can't even formulate the question. The frontier set grows as comprehension deepens — not because understanding is failing, but because deeper models reveal more structure to question.

Each CV includes its frontier questions alongside its model output:

```
CV1  frontier:  behavioral questions (what happens when...?)
CV2  frontier:  causal questions (what depends on what? what if X changed?)
CV3  frontier:  adversarial questions (what would break this model?)
CV4  frontier:  generative questions (why this design? what are the principles?)
CV5  frontier:  beyond-scope questions (what about the system around this artifact?)
```

Frontier questions persist across sessions. When resuming from a saved CV, the frontier tells you exactly where to continue — no need to re-discover what you didn't know.

---

## Coverage Strategy

Comprehension can't cover everything. Its coverage is **prediction-based** — you've comprehended enough when your model predicts correctly at the target depth level and adversarial challenge fails to break it.

### Convergence Criteria

- **Prediction accuracy** — at the target depth level, predictions succeed at or above the threshold set by the downstream task. Critical tasks demand higher accuracy; exploratory tasks accept lower.
- **Adversarial stability** — the self-challenge protocol fails to break the model after a full round (3+ cases from the model's weakest angles).
- **Coverage of the artifact** — all major components identified in the structural phase have been traced and tested. No major component is at a lower depth level than the target.

### When to Stop

- **Stop at the target depth.** Not every task needs CV5. A bug fix might stop at CV3 (Causal + tested predictions around the bug). A major refactoring needs CV4 (hardened model). Full documentation needs CV5 (transferable artifact).
- **Stop when adversarial challenge stabilizes.** If 3 cases fail to break the model and you've tried from multiple angles, the model is robust at the current depth.
- **Never stop because it "feels like enough."** Stop because the depth-level test passes and the adversarial challenge stabilizes. The feeling of understanding is not evidence of understanding.

---

## Failure Modes

Comprehension fails in predictable, structural ways:

### 1. Surface Fluency

Being able to DESCRIBE the artifact eloquently without actually modeling its mechanism. The words sound right, the summary is accurate, but the internal model is wrong or missing. The comprehender can talk about the artifact but can't predict its behavior.

**How to recognize:** Predictions fail on novel cases despite eloquent descriptions. The comprehender can explain WHAT but not predict WHAT IF.

**How to prevent:** Falsifiable predictions at every CV level. Cannot advance past CV2 without tested predictions.

### 2. Premature Model Closure

Settling on a model too early and interpreting everything through it. Confirmation bias applied to comprehension. The model explains most cases; the exceptions are rationalized away rather than forcing model revision.

**How to recognize:** Prediction failures are explained away ("that's an edge case," "that's a bug in the artifact") rather than triggering model revision.

**How to prevent:** Adversarial self-challenge (Phase 4). Actively seek model-breaking cases. Treat systematic prediction failures as model failures, not artifact failures.

### 3. Assimilation Error

Force-fitting the artifact into a familiar pattern when it's actually structured differently. "This looks like a factory pattern" when it isn't. The comprehender's prior experience becomes a trap — everything looks like patterns they've seen before.

**How to recognize:** The model matches a known pattern but fails on the artifact's distinctive features. Predictions succeed on the parts that match the familiar pattern but fail on the parts that don't.

**How to prevent:** The accommodation trigger. When prediction failures are systematic and cluster around specific features, don't patch — rebuild. Ask: "Is my entire model wrong, or just this prediction?"

### 4. Trace Without Model

Following every causal chain but never synthesizing into a general model. The comprehender can replay any specific execution path but can't predict what happens on a path they haven't traced. Memorization, not comprehension.

**How to recognize:** Can trace traced paths perfectly but fails on novel paths. Stuck at Causal depth — can't reach Predictive.

**How to prevent:** The depth hierarchy makes this explicit — Causal is not Predictive. The Differential phase forces prediction of UNTESTED cases, which requires a model, not just memories of traces.

### 5. Wrong Abstraction Level

Building a model at the wrong resolution. Too detailed: can trace every variable but can't see the design pattern. Too abstract: can name the architecture but can't explain specific choices.

**How to recognize:** The model is accurate at one resolution but useless at another. Asked about a different level, the comprehender produces errors.

**How to prevent:** The depth hierarchy spans all levels. Resolution management — if you're stuck at one level, zoom out (can you state the pattern?) or zoom in (can you trace the details?).

### 6. Intent-Mechanism Confusion

Confusing what the artifact was DESIGNED to do with what it ACTUALLY does. Documentation says one thing; the artifact does another. The comprehender takes documentation at face value without verifying against behavior.

**How to recognize:** The model predicts documented behavior, not actual behavior. Tests against documentation pass; tests against execution fail.

**How to prevent:** The Dynamic and Differential phases work from actual behavior, not documentation. Predictions are tested against what HAPPENS, not what's WRITTEN. When intent and mechanism diverge, flag explicitly — the gap is valuable information (bug, evolved requirements, or compromise).

### 7. Fragile Model

A model that works for all tested cases but is based on a coincidence or superficial correlation. Predicts THAT something happens but not WHY. Works within the tested range but breaks outside it.

**How to recognize:** The model can't explain its own predictions. "I predict X" but "I don't know why X." Predictions are interpolations, not causal explanations.

**How to prevent:** Differential analysis reveals whether a pattern is causal or coincidental (perturbation that breaks a coincidence doesn't break a causal relationship). The Generative depth level requires stating WHY, not just THAT.

### 8. Paradigm Projection

Assuming the artifact's quality is measurable because Comprehend's own quality IS measurable. Comprehend builds models through prediction testing and measurement — when it encounters an artifact whose quality involves meaning, significance, or judgment (not just mechanism), it projects its measurement paradigm onto it. The model is internally consistent but evaluates the wrong thing.

This is a specific form of Assimilation Error (FM#3) that occurs when comprehending measurement systems, assessment frameworks, or quality criteria for meaning-producing processes (sensemaking, innovation). The model captures HOW the mechanism works but never questions WHETHER it measures what it claims to measure.

**How to recognize:** The comprehension produces confident predictions about a measurement system without ever questioning the validity of what's being measured. "This trend detection catches regression" sounds right — but it assumed counts capture quality, which they don't for meaning-producing disciplines.

**How to prevent:** When comprehending any artifact that measures, assesses, evaluates, or scores something, generate this frontier question explicitly: "Does this mechanism measure what it claims to measure, or does it measure a proxy? What would a valid measurement look like for the thing that actually matters?" This is a sensemaking question, not a comprehension question — flag it as such and direct to `/sense-making` if the answer matters for the comprehension's conclusions.

---

## Summary

| Component | What it is | How many |
|-----------|-----------|----------|
| **Core operation** | Model construction + falsifiable verification | 2 structural operations |
| **Primary aspects** | Mechanistic (how it works) + Intent (why it was built this way) | 2 primary, 2 extended |
| **Components** | Model construction, perturbation testing, prediction testing, adversarial self-challenge, design rationale extraction, accommodation trigger | 6 |
| **Depth hierarchy** | Descriptive → Structural → Causal → Predictive → Generative | 5 levels with concrete tests |
| **Functional layers** | Acquisition (build) → Verification (test) → Crystallization (transfer) | 3 layers |
| **Process** | Static → Dynamic → Differential → Adversarial → Stabilization | 5 phases, flexible order |
| **Comprehension versions** | CV1 (structural) → CV2 (behavioral) → CV3 (causal) → CV4 (hardened) → CV5 (generative) | 5 progressive versions |
| **Testing hierarchy** | Execution-based (strongest) → Scenario-based (moderate) → Reasoning-based (valid but weakest) | 3 tiers |
| **Coverage** | Prediction accuracy at target depth + adversarial stability + artifact coverage | 3 convergence criteria |
| **Failure modes** | Surface fluency, premature closure, assimilation error, trace without model, wrong abstraction, intent-mechanism confusion, fragile model, paradigm projection | 8 identified |

This thinking discipline is domain-agnostic. It works for comprehending codebases, mathematical proofs, legal contracts, business systems, mechanical systems, organizational structures, or any artifact that is observable but not yet understood. It does not prescribe WHAT to comprehend — it provides the structural tools for HOW to build, test, and transfer understanding with measurable depth and falsifiable verification.

