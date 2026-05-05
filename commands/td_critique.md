---
name: td-critique
description: Evaluate candidates by constructing multi-dimensional fitness landscapes, positioning candidates through adversarial testing (prosecution + defense + collision), and producing verdicts (SURVIVE / REFINE / KILL) with constructive output.
---

# /td-critique — Structural Critique

Evaluate ideas, plans, approaches, or outputs using the Structural Critique discipline. Constructs evaluation dimensions from the understood problem, builds a fitness landscape, conducts adversarial testing on each candidate, and produces verdicts with constructive output.

## Additional Input/Instructions

$ARGUMENTS

## Instructions

1. Read the input and consume it. It can be raw text, a folder path with md files, code files, or image path. Consume all input. The input should contain both the problem context (sensemaking output or equivalent) and the candidates to evaluate (innovation output or equivalent).

2. Execute the full Structural Critique process described below, producing all five phases.

3. Save the output as a markdown file (unless differently stated in additional instructions!):
   - **If the input was a file path** — save in the same folder as the input file or relevant files.
   - **Otherwise** — save under `devdocs/critique/<suitable-name>.md` (create the directory if needed).

4. Record the user's input at the top of the output file: `## User Input` followed by the $ARGUMENTS that were passed to this command. This allows the Reflect step (R) to see what the human asked for alongside what the discipline produced.

---

---- NOW SOLID INSTRUCTIONS START ----

## Execute the Full Critique Process

### Phase 0 — Dimension Construction

1. Read the problem context (sensemaking output or equivalent)
2. Extract and list evaluation dimensions with weights
3. Validate: are these the right dimensions for this problem?
4. Define success criteria per dimension

### Phases 1-3 — For Each Candidate

For each candidate, produce:

1. **Landscape position preview** — where is this candidate likely to land based on initial assessment?
2. **Prosecution** — the strongest possible case against. The killer objection. The weakest dimension.
3. **Defense** — the strongest possible case for. The core strength. The strongest dimension.
4. **Collision** — prosecution vs defense. What survives?
5. **Verdict** — SURVIVE / REFINE / KILL with:
   - SURVIVE: which dimensions passed, any caveats
   - REFINE: which dimensions failed, what "right" looks like on those dimensions
   - KILL: which dimension killed it, seed extracted from failure

6. **Assembly check** — After all individual verdicts, examine SURVIVE and REFINE candidates together. Ask: "Do any of these candidates combine into something emergent and possibly powerful that none of them are individually?" If yes, evaluate the assembly as a new candidate against the same dimensions.

### Phase 4 — Coverage + Convergence

1. **Accumulator update** — log all verdicts
2. **Coverage assessment** — what regions of the solution space have been evaluated? What gaps remain?
3. **Convergence signal** — ITERATE or TERMINATE, with reasoning

### Final Deliverable

Present the complete critique output as:

1. **Dimensions** — the evaluation framework used, with weights
2. **Fitness Landscape** — viable regions, dead regions, boundary regions, unexplored regions
3. **Candidate Verdicts** — each candidate with its adversarial test results and verdict
4. **Coverage Map** — what's been evaluated, what hasn't
5. **Signal** — ITERATE (with direction) or TERMINATE (with ranked survivors)

---

### Convergence Telemetry

After producing the critique output, assess the quality of this critique run:

* **Dimension coverage** — Were all critical-weight dimensions evaluated for every candidate? Any dimensions skipped or applied superficially?
* **Adversarial strength** — For each candidate: was prosecution genuinely the STRONGEST possible case against? Would the candidate's strongest advocate pause at the prosecution argument?
* **Landscape stability** — Did this critique pass change the landscape significantly, or confirm the existing shape? (Significant change = more iterations needed. Confirmation = approaching convergence.)
* **Clean SURVIVE existence** — Does at least one candidate have a SURVIVE verdict with no caveats on critical dimensions?
* **Failure mode check** — Did any of the 7 failure modes visibly occur? (Wrong dimensions, rubber-stamping, nitpicking, dimension blindness, false convergence, evaluation drift, self-reference collapse)

Report:
* Dimensions evaluated: [count] / [total], all critical covered: [YES/NO]
* Adversarial strength: [STRONG — prosecution would give advocates pause / WEAK — prosecution was surface-level]
* Landscape stability: [CHANGED — new regions discovered / STABLE — confirmed existing shape]
* Clean SURVIVE: [YES — candidate X / NO — all survivors have caveats]
* Failure modes observed: [none / list]
* **Overall: PROCEED** (dimensions covered + adversarial strong + at least one clean SURVIVE) / **FLAG** (weak prosecution or missing dimensions) / **RE-RUN** (failure mode detected or no candidates evaluated)













# Structural Critique — A Thinking Discipline

A thinking discipline for evaluating competing candidates — ideas, plans, and approaches — by constructing multi-dimensional fitness landscapes, positioning them through adversarial testing, and producing verdicts. Critique is not nitpicking — it's the contraction force that turns divergent thinking into convergent results.

Rather than relying on gut-feel judgment, Structural Critique treats evaluation as a practiced methodology based on dimension construction, landscape mapping, adversarial collision, and coverage-aware convergence detection.

> **Structural Critique is the process of reducing a solution space by constructing evaluation landscapes from extracted success criteria, positioning candidates through adversarial testing, and tracking coverage until convergence is reached.**

---

## What Critique Is

**Critique is the process of taking a set of competing candidates — ideas, plans, approaches — and systematically determining which survive, which need refinement, and which die, across dimensions extracted from the understood problem, while tracking what has been evaluated and signaling when evaluation is sufficient.**

Critique is not:
- Nitpicking (nitpicking finds surface flaws without assessing whether they matter; critique evaluates across weighted dimensions with severity awareness)
- Judgment (judgment is a single verdict from a single perspective; critique is structured adversarial testing across multiple dimensions)
- Validation (validation confirms something works; critique determines whether something is the *right* thing, not just a *working* thing)
- Reviewing (reviewing checks for errors; critique constructs the fitness landscape that reveals viability — errors are one dimension, not the whole picture)
- Pessimism (critique includes defense, not just prosecution — it finds what's strong, not only what's weak)

Critique has two structural operations:

1. **Extraction** — pulling evaluation criteria from the already-understood problem. Critique does not generate what "right" looks like (that's innovation's job). It extracts success criteria that are implicit in the sensemaking output — constraints that must be satisfied, principles that can't be violated, meaning-nodes that must be addressed.

2. **Evaluation** — positioning candidates against the extracted criteria through adversarial testing and producing verdicts.

Extraction without evaluation = knowing what matters but never checking anything against it.
Evaluation without extraction = checking rigorously against the wrong criteria (false confidence).
Both together = the full critique process.

| | Extraction | Evaluation |
|---|---|---|
| **Primary role** | Build the evaluation framework | Apply it to candidates |
| **Source** | Sensemaking output (anchors, constraints, principles) | Innovation output (ideas, plans, approaches) |
| **Produces** | Evaluation dimensions + success criteria | Fitness landscape + positioned candidates + verdicts |
| **When it fails** | Wrong dimensions → entire evaluation is misleading | Weak adversarial testing → false survivors |

---

## Critique's Role in the SIC Loop

Critique exists at the intersection of sensemaking and innovation. It reads backward to sensemaking (what was understood about the problem?) and evaluates forward from innovation (which proposed solutions actually match?).

```
Sensemaking                    Innovation                     Critique
"What IS the problem?"    →    "What COULD solve it?"    →    "Which solutions MATCH the problem?"
                                                               │
Produces: stable understanding  Produces: novel ideas          │ Extracts criteria from sensemaking
  (anchors, constraints,          (mechanisms, seeds,          │ Evaluates ideas from innovation
   principles, meaning-nodes)      tested outputs)             │ Produces: landscape + verdicts
                                                               │
                                                               ├→ SURVIVE → develop further
                                                               ├→ REFINE → back to innovation with direction
                                                               ├→ KILL → extract seed, back to sensemaking
                                                               └→ ITERATE or TERMINATE (coverage signal)
```

Sensemaking is expansion (ambiguity → structured understanding). Innovation is expansion (seed → multiple novel ideas). Critique is **contraction** (many candidates → fewer, better-positioned survivors). Without critique, expansion compounds without bound.

Critique does not generate new ideas. It does not clarify ambiguity. It measures the distance between what was understood (sensemaking) and what was proposed (innovation), and renders verdicts based on that distance.

---

## Key Components

### Evaluation Dimensions

Evaluation dimensions are the axes along which candidates are assessed. They are not universal — they are **extracted** from the specific problem's sensemaking output. Different problems demand different dimensions.

**Default dimensions** (starting set, modified per problem):

| Dimension | What it asks | Extracted from |
|-----------|-------------|----------------|
| **Correctness** | Does this actually solve the stated problem? | Sensemaking: meaning-nodes, structural points |
| **Coherence** | Does this fit with what already exists without breaking it? | Sensemaking: constraints, structural points |
| **Feasibility** | Can this actually be done with available resources? | Sensemaking: constraints, foundational principles |
| **Completeness** | Does this address the full problem or only part? | Sensemaking: meaning-nodes, key insights |
| **Robustness** | Does this survive edge cases, adversarial conditions, and change? | Sensemaking: constraints, key insights |
| **Elegance** | Is this the simplest sufficient solution, or is it over-engineered? | Foundational principle: minimum complexity for maximum coverage |

Dimensions are weighted. Not all matter equally for every problem. A prototype needs high feasibility and low completeness concern. A production system needs high robustness and high coherence. The weights come from the problem context, not from the critique framework.

**Dimension validation:** Before applying any dimension, verify it is relevant to this specific problem. Applying irrelevant dimensions produces false confidence — an idea "passes" on axes that don't matter while failing on unchecked axes that do. This validation is Phase 0 of the process.

### The Fitness Landscape

The fitness landscape is critique's primary output — not a list of verdicts but a map of the evaluation space.

**Structure:**
- **Axes:** The evaluation dimensions (weighted)
- **Regions:** Viable (high fitness across weighted dimensions), dead (fails on one or more critical dimensions), boundary (partially viable, needs refinement), unexplored (not yet evaluated)
- **Positions:** Each candidate idea is placed on the landscape based on how it scores across dimensions
- **Topology:** The shape reveals where viable solutions cluster, where dead zones are, and where gaps exist

The landscape subsumes the verdict list. Every risk item from a traditional critique is a region on the landscape. But the landscape also shows what *hasn't* been checked — which is information a verdict list can never provide.

**Why a landscape, not a list:** A list of risks treats each finding independently. A landscape reveals relationships — an idea that's weak on feasibility but strong on correctness lands in a different region than one that's strong on feasibility but weak on correctness. The landscape shows whether refinement should push toward feasibility or toward correctness. A list can't do this.

### Adversarial Structure

Critique uses adversarial testing — not a single evaluation perspective but two opposing ones:

**Prosecution** — construct the strongest possible case AGAINST the candidate:
- What's the killer objection?
- Under what conditions does this fail catastrophically?
- What assumption, if wrong, destroys the entire approach?
- What's the worst realistic outcome?

**Defense** — construct the strongest possible case FOR the candidate:
- What's the deepest structural strength?
- Under what conditions does this become the obvious right answer?
- What does this enable that no alternative does?
- Why would someone fight to keep this approach?

**Collision** — the verdict emerges from the collision of maximally strong prosecution and maximally strong defense. If the defense survives the strongest prosecution, the idea is genuinely viable. If the prosecution destroys the defense, the idea is genuinely dead. If both are strong but unresolved, the idea needs refinement on the specific dimension where prosecution wins.

**Burden of proof** shifts based on stakes:
- **Low stakes** (easily reversible, small scope): innocent until proven guilty. The prosecution must demonstrate a clear problem. Default: let it through.
- **High stakes** (hard to reverse, large scope, touches many systems): guilty until proven innocent. The defense must demonstrate clear viability. Default: block it.

The adversarial structure prevents two of critique's worst failure modes: rubber-stamping (prosecution too weak — everything passes) and nitpicking (defense absent — everything fails on minor issues).

### Verdicts

Every candidate receives a verdict. Verdicts are not binary (pass/fail) — they are positional (where on the landscape) with an action attached:

| Verdict | Position | Action | Output |
|---------|----------|--------|--------|
| **SURVIVE** | Viable region — passes critical dimensions | Develop further | Candidate advances as-is |
| **REFINE** | Boundary region — strong core, specific weaknesses | Direct back to innovation with targeted feedback | Which dimensions failed + what "right" looks like on those dimensions |
| **KILL** | Dead region — fails on critical dimensions, defense cannot overcome prosecution | Remove from candidate set | The specific dimension that killed it + a seed extracted from the failure ("this didn't work because X, but what if Y?") |

**Constructive requirement:** Every KILL and REFINE verdict must include constructive output. A KILL must extract a seed — what can be learned from the failure that informs the next iteration? A REFINE must specify what needs to change and in what direction. Critique that only says "this is bad" without saying "here's what would make it better" is incomplete.

### The Accumulator

The accumulator is critique's persistent memory across iterations of the SIC loop. Without it, each critique pass starts fresh — amnesic, unable to detect convergence, unable to avoid re-evaluating what was already evaluated.

**The accumulator tracks:**

| Field | What it records | Why it matters |
|-------|----------------|----------------|
| **Evaluation log** | Which candidates were evaluated, against which dimensions, with what verdicts | Prevents re-evaluation of already-assessed candidates |
| **Kill record** | What was killed, by which dimension, with what reasoning | Prevents resurrecting ideas that were already tested and failed (unless conditions changed) |
| **Refinement record** | What was sent for refinement, what the refinement target was, whether the refinement succeeded | Tracks whether refinement is converging or oscillating |
| **Coverage map** | Which regions of the solution space have been evaluated, which remain unexplored | Prevents the "random travel" problem — ensures systematic coverage |
| **Convergence trend** | Are new candidates landing in already-mapped regions? Is the rate of new information decreasing? | Provides the termination signal — when new iterations produce diminishing new information, the loop has converged |

The accumulator is what makes critique loop-aware rather than one-shot. It transforms "evaluate this idea" into "evaluate this idea in the context of everything we've already evaluated."

---

## Process Model

Structural Critique proceeds through five phases. Phases 0-3 execute per critique pass. Phase 4 operates at the loop level — assessing whether to iterate or terminate.

### Phase 0 — Dimension Construction

Before evaluating anything, construct the evaluation framework itself.

1. **Read sensemaking output** — extract constraints, principles, structural points, meaning-nodes that define the problem
2. **Derive evaluation dimensions** — what properties must a solution have? What can it not violate? What must it address?
3. **Validate dimensions** — are these the right axes for this problem? Is anything missing? Is anything irrelevant?
4. **Weight dimensions** — which matter most given the context? (Risk-averse contexts weight robustness higher. Speed-critical contexts weight feasibility higher.)
5. **Define success criteria per dimension** — what does "passing" look like on each axis? This is extraction from sensemaking, not generation.

Phase 0 is the meta-critique component. It evaluates the evaluation framework before the evaluation framework is applied. This prevents the failure mode of evaluating confidently on irrelevant dimensions.

**When to re-run Phase 0:** If the sensemaking output changes (problem was re-understood), or if critique reveals that a dimension is producing only noise (no candidates fail or pass meaningfully on it — the dimension isn't discriminating).

### Phase 1 — Landscape Construction

Build the fitness landscape from the dimensions established in Phase 0.

1. **Map viable regions** — given the dimensions and success criteria, what does the viable region of the solution space look like? Where do all critical dimensions intersect positively?
2. **Map dead regions** — what combinations of dimension failures are fatal? Which single-dimension failures are fatal regardless of other dimensions?
3. **Map boundary regions** — where does viability depend on trade-offs between dimensions? (High correctness but low feasibility is a boundary — the idea is right but hard to build.)
4. **Identify unexplored regions** — given what innovation has produced so far, what parts of the solution space haven't been represented by any candidate?

The landscape is the frame. Candidates will be placed on it in Phase 2.

### Phase 2 — Adversarial Evaluation

For each candidate from innovation's output, conduct adversarial testing:

1. **Prosecution** — construct the strongest case against this candidate. Find the killer objection. Identify the weakest dimension. Push until you find the breaking point or confirm there isn't one.

2. **Defense** — construct the strongest case for this candidate. Find the core strength. Identify the strongest dimension. Articulate why this approach is worth keeping even if it has weaknesses.

3. **Collision** — put prosecution and defense in direct confrontation. Does the defense survive the killer objection? Does the prosecution overcome the core strength? Where is the balance?

4. **Position** — based on the adversarial result, place the candidate on the fitness landscape. Which dimensions does it pass? Which does it fail? Where does it land — viable, dead, or boundary?

### Phase 3 — Verdict + Constructive Output

For each positioned candidate, render a verdict with constructive output:

**SURVIVE:**
- Document which dimensions this candidate passes and with what strength
- Note any caveats (dimensions where it passes but barely)
- This candidate advances to the next stage

**REFINE:**
- Document which dimensions this candidate fails on
- Extract from sensemaking output what "right" looks like on those specific dimensions
- Send back to innovation with a targeted refinement brief: "this idea needs to improve on dimension X, where success looks like Y"

**KILL:**
- Document the specific dimension that killed this candidate and why defense could not overcome prosecution
- Extract a seed from the failure: "this approach died because of X. What if an approach existed that didn't have X? What conditions would avoid X entirely?"
- Failed seeds feed back to sensemaking for re-examination or to innovation for new generation

### Phase 3.5 — Assembly Check

After all individual candidates are evaluated, examine the SURVIVE and REFINE candidates together. Ask: "Do any of these candidates combine into something emergent and possibly powerful that none of them are individually?" Individual candidates are components. Assemblies are architectures. The most valuable innovation often lives at the intersection of components, not in any single one.

If an assembly emerges, evaluate it as a new candidate against the same dimensions from Phase 0. It gets its own prosecution, defense, collision, and verdict. An assembly that survives is ranked alongside (or above) individual survivors in the final output.

### Phase 4 — Coverage + Convergence Assessment

After all candidates in this iteration are evaluated, assess the loop state:

1. **Update the accumulator** — log all evaluations, verdicts, reasoning, and landscape changes from this pass

2. **Assess coverage:**
   - What regions of the solution space have been evaluated across all iterations?
   - What regions remain unexplored?
   - Are the unexplored regions likely to contain viable candidates? (Based on the landscape topology — if all surrounding regions are dead, an unexplored region in the middle is probably also dead.)

3. **Assess convergence:**
   - Are new candidates from innovation landing in already-mapped regions?
   - Is the rate of new information from each iteration decreasing?
   - Has the landscape stabilized — are new iterations changing the landscape or just confirming it?

4. **Signal:**
   - **ITERATE** — coverage is insufficient, or new candidates are still producing new information. Feed surviving and refined candidates back to sensemaking. Feed extracted seeds to innovation. Run the SIC loop again.
   - **TERMINATE** — coverage is sufficient AND convergence is reached AND at least one candidate has a SURVIVE verdict. The loop is done. Output the survivors ranked by fitness landscape position.

**Convergence criteria (all must be met):**
- At least one candidate has SURVIVE verdict with no caveats on critical dimensions
- Two consecutive iterations have not produced candidates that land in new regions of the landscape
- No unexplored regions remain that are topologically likely to contain viable candidates
- The accumulator shows a decreasing rate of new information per iteration

---

## Coverage Strategy

Critique's coverage operates at two levels: **per-candidate** (did we check this idea thoroughly?) and **per-solution-space** (did we check enough ideas?).

### Per-candidate coverage

**Minimum:** Adversarial test against all critical-weight dimensions. Every candidate must face prosecution on its weakest dimension and defense on its strongest.

**Full:** Adversarial test against all dimensions, including non-critical ones. Compare prosecution and defense on each. This produces the full landscape position, not just a pass/fail.

**When to do full vs minimum:** Minimum for early iterations when many candidates are being screened. Full for late iterations when a small number of survivors are being compared.

### Per-solution-space coverage

**Minimum:** All candidates from the current innovation pass have been evaluated. The coverage map shows no large unexplored regions adjacent to viable regions.

**Full:** The landscape has stabilized across two consecutive iterations. No unexplored regions remain. Convergence criteria are met.

### When to stop

- **Stop evaluating a candidate** when prosecution finds a fatal dimension failure that defense cannot address (early KILL — don't waste evaluation effort on dead candidates)
- **Stop the iteration** when all candidates are evaluated and the coverage map is updated
- **Stop the loop** when convergence criteria are met

### Coverage anti-pattern

**Over-evaluation:** Applying full adversarial testing to every candidate in early iterations when most will be killed quickly. This wastes evaluation effort. Screen with critical dimensions first, then do full adversarial testing only on candidates that survive the screen.

---

## Failure Modes

Critique fails in predictable, structural ways:

### 1. Wrong Dimensions

Evaluation dimensions don't match the actual problem. The critique runs rigorously but against criteria that don't matter, producing false confidence.

**How to recognize:** Candidates "pass" critique but fail in practice. The critique document looks thorough but somehow the real risks were missed. Retrospectively, the risks that materialized were on dimensions that weren't checked.

**How to prevent:** Phase 0 (Dimension Construction). Validate dimensions against the sensemaking output before evaluating anything. Ask: "If a candidate passed all these dimensions perfectly, would it actually solve the problem?"

### 2. Rubber-Stamping

Prosecution is too weak. Everything passes because the adversarial testing wasn't genuinely adversarial. The critic finds only minor issues and declares success.

**How to recognize:** Every candidate gets a SURVIVE verdict. No kills, no refinements. The critique reads like a review, not an adversarial test. The feeling is "this all looks fine."

**How to prevent:** Require prosecution to construct the *strongest possible* objection, not just any objection. If prosecution can't find a killer objection, that's meaningful — but only if prosecution genuinely tried. Quality check: is the prosecution argument something that would make the candidate's strongest advocate pause?

### 3. Nitpicking

Every candidate gets killed on minor issues. Defense is absent or too weak. The critique produces an impressive list of problems, but none are evaluated for actual severity. The forest is missed for the trees.

**How to recognize:** Many KILLs, no SURVIVEs. Every risk is treated as critical. The critique document is long and detailed but doesn't distinguish between "this will cause a data breach" and "this variable name is unclear."

**How to prevent:** Require defense for every candidate. Require severity-weighted dimensions. A candidate should only be KILLed if prosecution wins on a *critical-weight* dimension, not just any dimension.

### 4. Dimension Blindness

A critical dimension is missing entirely. The critique evaluates thoroughly on the dimensions it has, but a category of risk is completely invisible because no dimension covers it.

**How to recognize:** Hard to recognize during critique (by definition, you don't check what you don't check). Recognized retrospectively when a failure occurs on an axis that critique never considered. In the accumulator, recognized when the landscape has a region that feels "thin" — coverage is technically complete but something seems unexamined.

**How to prevent:** Phase 0 dimension validation against multiple perspectives (from sensemaking). Cross-reference dimensions against the sensemaking perspectives: if sensemaking checked a technical perspective, a human perspective, and a risk perspective, critique dimensions should cover all three. If a sensemaking perspective has no corresponding critique dimension, something is missing.

### 5. False Convergence

The loop terminates too early. Convergence is declared because recent iterations didn't produce new information — but the real reason is that innovation exhausted its mechanisms too early, not that the solution space was actually explored.

**How to recognize:** Convergence criteria are technically met, but the surviving candidate feels unsatisfying. The coverage map shows "explored" regions that were only lightly tested. The accumulator shows few total iterations.

**How to prevent:** Convergence requires both stabilization (no new landscape changes) AND sufficiency (at least one SURVIVE with no critical-dimension caveats). If stabilization is reached but no clean SURVIVE exists, the signal is not "terminate" but "the current candidates are exhausted — generate new ones from a different seed."

### 6. Evaluation Drift

Dimensions or weights shift silently between iterations. What counted as a KILL in iteration 1 would pass in iteration 3 because the evaluator's standards relaxed. Or the opposite — standards tighten as fatigue sets in, killing candidates that would have survived earlier.

**How to recognize:** Comparing accumulator records across iterations reveals inconsistent verdicts on similar candidates. A candidate refined and resubmitted gets a different verdict than expected based on the refinement changes.

**How to prevent:** Dimension definitions and weights are fixed in Phase 0 and persist across iterations via the accumulator. If dimensions need to change (because sensemaking updated the problem understanding), this is an explicit Phase 0 re-run, not a silent drift.

### 7. Self-Reference Collapse

When critique is used to evaluate critique itself (self-improvement, discipline development), the evaluation can become circular. The criteria for evaluating critique are produced by critique, leading to a system that validates itself regardless of quality.

**How to recognize:** The discipline "passes" its own evaluation trivially. Every self-critique produces minor refinements but no structural challenges. The feeling is "this is good because it says it's good."

**How to prevent:** When critiquing critique, bring in external reference points: empirical evidence (did the critique's verdicts predict real outcomes?), cross-discipline evaluation (does the critique discipline have the same structural rigor as sensemaking and innovation?), and human judgment (does the output of critique actually help a human make better decisions?). Self-reference is valuable but must be grounded in external validation.

---

## Summary

| Component | What it is | How many |
|-----------|-----------|----------|
| **Operations** | Extraction (build the framework from sensemaking) + Evaluation (apply it to innovation output) | 2 |
| **Dimensions** | Axes of evaluation, extracted from the problem — correctness, coherence, feasibility, completeness, robustness, elegance | 6 default, modified per problem |
| **Landscape** | Multi-dimensional fitness map where candidates are positioned | 1 per critique pass, evolves across iterations |
| **Adversarial structure** | Prosecution (strongest case against) + Defense (strongest case for) + Collision (what survives?) | 3 roles per candidate |
| **Verdicts** | SURVIVE / REFINE / KILL — positional, with constructive output | 3 types |
| **Process** | Phase 0 (dimensions) → Phase 1 (landscape) → Phase 2 (adversarial) → Phase 3 (verdict) → Phase 4 (coverage + convergence) | 5 phases |
| **Accumulator** | Persistent memory across SIC loop iterations — evaluations, verdicts, coverage, convergence trend | 1, grows over iterations |
| **Coverage** | Per-candidate (all critical dimensions tested) + Per-solution-space (landscape sufficiently mapped) | 2 levels |
| **Failure modes** | Wrong dimensions, rubber-stamping, nitpicking, dimension blindness, false convergence, evaluation drift, self-reference collapse | 7 identified |

This thinking discipline is domain-agnostic. It works for evaluating business strategies, software architectures, research hypotheses, design proposals, or any set of candidates that need systematic evaluation. It does not prescribe WHAT to evaluate — it provides the structural tools for HOW to evaluate systematically, with coverage awareness and convergence detection.




