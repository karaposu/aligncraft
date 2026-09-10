
name: decompose
description:  Perceive the internal coupling topology of a complex whole and partition it into tractable, independently coherent pieces with explicit interfaces.



# /decompose 

Analyze the given input using the Structural Decomposition Discipline. 


## Additional Input/Instructions

$ARGUMENTS


## Instructions

1. Read the input and consume it. It can be raw text, It can be folder path with md files, code files or image path. Consume all input. , 

2. Execute the full Structural Decomposition process described below,

3. Save the output as a markdown file (unless differently stated in additional instructions!):
   - **If the input was a file path** — save in the same folder as the input file or relevant files. 
   - **Otherwise** — save under `devdocs/decomposition/<suitable-name>.md` (create the directory if needed).




# Structural Decomposition — A Thinking Discipline

A thinking discipline for perceiving the internal coupling topology of complex wholes and converting them into tractable, independently coherent pieces with explicit interfaces and dependency ordering. Decomposition is not dividing — it's seeing where the natural boundaries are so the cutting is obvious.

Rather than relying on intuition to decide "where to break this," Structural Decomposition treats partitioning as a practiced methodology based on coupling perception, boundary validation, question-tree expression, and self-evaluation.

**Structural Decomposition is the process of perceiving the internal coupling topology of a complex whole — identifying natural boundaries where coupling is low, verifying that resulting pieces are independently coherent, mapping what flows between pieces, and ordering pieces by dependency — to convert an overwhelming problem into tractable sub-problems.**


## What Decomposition Is

**Decomposition is the cognitive operation of perceiving internal structure in complexity — seeing where things are tightly connected (must stay together) and loosely connected (can be separated) — and using that perception to partition the whole into pieces that can each be worked on independently.**

Decomposition is not:
- Dividing (dividing is the action; decomposition is the perception that tells you WHERE to divide,  the seeing, not the cutting)
- Simplifying (simplifying removes complexity; decomposition restructures it into manageable pieces without losing anything)
- Task-listing (a task list has no coupling awareness, no interfaces, no dependency ordering, no verification criteria — it's a flat list, not a structure)
- Sensemaking (sensemaking converts ambiguity → understanding; decomposition converts complexity → tractable pieces. You must understand before you can decompose — sensemaking is prerequisite)

Decomposition is the **scale operator** for the thinking system. With decomposition, problems of any size become tractable — each piece can be focused, and the pieces reassemble into the whole.

### The Core Operation: Coupling Perception

Coupling perception is the act of examining a complex whole and identifying which elements are tightly connected vs loosely connected.

**Operationally:** For each pair of elements, ask: "If I change A, does B need to change?" If yes → coupled (keep together). If no → independent (potential boundary between them). The topology of these propagation relationships IS the coupling map.

Coupling is a gradient, not binary:
- **Strong coupling** — shared mutable state, circular dependencies, tight timing requirements. Change A → must change B immediately.
- **Moderate coupling** — shared interfaces, data contracts. Change A → may need to update B's contract.
- **Weak coupling** — loose references, optional dependencies. Change A → B is unaffected.
- **No coupling** — A and B are entirely independent.

Decomposition cuts at the weakest coupling points, preserving strong bonds within pieces.

---

## Key Components

### Coupling Map

The coupling map is decomposition's primary perception artifact — a representation of which elements are tightly vs loosely connected. Peaks of high coupling (clusters of tightly connected elements) become pieces. Valleys of low coupling (regions between clusters) become boundaries.

The map doesn't need to be exhaustive. A coarse coupling map that identifies the major clusters and the major boundaries is sufficient for initial decomposition. The map refines as understanding deepens.

### Boundaries

Boundaries are the low-coupling regions where pieces are separated. A good boundary has:
- **Low crossing traffic** — few things flow across it
- **Clear interface** — what DOES cross is well-defined
- **No hidden coupling** — no shared state, assumptions, or timing dependencies that aren't captured in the interface

### Pieces (Expressed as Questions)

Each piece of a decomposition is expressed as a **question** with **verification criteria**. Not "piece A" but "How should password hashing work?" with verification: "[ ] hashing algorithm selected, [ ] salt strategy defined, [ ] integration point with session management specified."

The question format serves as a validity check: a piece that can't be expressed as a purposeful question is probably an arbitrary cut, not a natural boundary. The verification criteria define "done" — the piece is complete when all criteria are checked.


### Interfaces

Interfaces define what flows between pieces. They are found by tracing flows through the whole — data, dependencies, prerequisites, information, resources — and noting where flows cross boundaries.

Every interface has:
- **Source piece** — which piece provides
- **Target piece** — which piece consumes
- **What flows** — data, contract, dependency, prerequisite, resource
- **Direction** — one-way or bidirectional

Interfaces must be explicit. Hidden interfaces (unstated dependencies between pieces) are the #1 cause of decomposition failure — pieces look independent but can't actually be worked on separately because they share something that wasn't captured.

### Dependency Order

Some pieces must come before others. The dependency order determines which pieces can be worked on first and which must wait.

Dependencies come from interfaces: if piece B consumes something that piece A provides, A must come before B (or at least A's interface must be defined before B can proceed).

Pieces with no dependencies on each other can be worked on in parallel.

---

## Process Model

Structural Decomposition proceeds through seven sequential steps. Each step depends on the previous one's output.

### Step 1 — Perceive Coupling Topology

The core operation. Examine the complex whole and identify where coupling is high and where it's low.

- What elements exist in the whole?
- For each pair: if I change one, does the other need to change?
- Where are the clusters of tightly coupled elements?
- Where are the valleys between clusters?

Produce a coarse coupling map — major clusters and major boundaries. This doesn't need to be exhaustive; it needs to identify the dominant structure.

**Prerequisite:** Sensemaking must have clarified the whole before this step. You must understand what the thing IS before you can see its internal structure. Coupling perception on an ambiguous whole produces arbitrary boundaries.

### Step 2 — Detect Boundaries (Top-Down)

From the coupling map, identify the natural cut points — the low-coupling valleys between high-coupling clusters.

- Where is coupling lowest?
- Which boundaries create pieces that are internally cohesive (high coupling within) and externally independent (low coupling across)?
- Are there single-point boundaries (one weak connection) or diffuse boundaries (a region of gradually decreasing coupling)?

Produce an initial boundary set — the first candidate for how the whole should be partitioned.

### Step 3 — Validate Boundaries (Bottom-Up Check)

Quick sanity check: do the boundaries from Step 2 align with the internal structure?

- Identify the obvious irreducible elements (atoms) — things that are clearly indivisible.
- Do these atoms group naturally into the same clusters that Step 2 identified?
- Are there atoms that Step 2's boundaries split apart? (If yes → that boundary may be wrong.)
- Are there atoms that Step 2 grouped together but that are actually independent? (If yes → a boundary may be missing.)

This is a 5-minute validation, not a full bottom-up decomposition. Its purpose is to catch the most obvious boundary errors.

**Confidence scoring:** Boundaries where top-down and bottom-up agree = high confidence (proceed). Boundaries where they disagree = low confidence (investigate further before committing).

### Step 4 — Express as Question Tree

Convert each piece into a question with verification criteria.

For each piece identified in Steps 2-3:
- What specific question does this piece answer?
- What are the concrete verification criteria that define "this question is answered"?
- Does this question make sense on its own, without needing to read other pieces? (Independence check)

If a piece can't be expressed as a purposeful question, the boundary is probably wrong — revisit Step 2.

Produce the question tree: N questions with verification criteria. 

### Step 5 — Map Interfaces

Trace what flows between pieces.

For each pair of adjacent pieces:
- What does piece A need from piece B? What does piece B need from piece A?
- Is the flow data, a dependency, a prerequisite, a resource, information?
- Is the flow one-way or bidirectional?

Produce an interface map: which pieces connect, what flows, in which direction.

For non-software domains, "flows" include: information, decisions, dependencies, prerequisites, shared resources, timing constraints, assumptions.



### Step 6 — Order by Dependency

Determine which pieces must come first.

- If piece B depends on piece A's output → A before B
- If pieces have no dependency → parallel (can be worked on simultaneously)
- If dependencies are circular → the decomposition has a problem (either the boundary is wrong or an interface needs to be defined at a contract level before either piece is built)

Produce a dependency order: which pieces first, which can be parallel, which must wait.

### Step 7 — Self-Evaluate

Run a quality check on the decomposition before committing to it.

**Minimum evaluation (3 dimensions — always run):**

| Dimension | Check | Pass if |
|---|---|---|
| **Independence** | Can each piece be worked on without the others existing? | Each piece's question is answerable without reading sibling pieces (except through defined interfaces) |
| **Completeness** | Do the pieces cover the whole? | No aspect of the original whole falls through the gaps between pieces |
| **Reassembly** | Can the pieces + interfaces reconstruct the whole? | Given all pieces answered + all interfaces satisfied → the original problem is solved |

**Full evaluation (7 dimensions — for complex or high-stakes decompositions):**

| Dimension | Check |
|---|---|
| Independence | Can each piece work alone? |
| Completeness | Do pieces cover the whole? |
| Reassembly | Pieces + interfaces = whole? |
| Tractability | Is each piece small enough to be worked on in a single focused pass? |
| Interface clarity | Are all cross-piece flows explicit? No hidden dependencies? |
| Balance | Is complexity roughly proportional across pieces? Or is one piece 80% of the work? |
| Confidence | Do top-down and bottom-up agree on boundaries? |

Low-scoring dimensions flag where the decomposition needs refinement before proceeding.

---

## Progressive Decomposition Versions (Opt-In)

Most decompositions need only one pass — Steps 1-7 produce a good-enough partition. But for complex, long-running explorations, the decomposition may need to evolve as understanding deepens.

**When to create DV2:**
- A piece can't be worked on independently despite being labeled independent (hidden coupling discovered during execution)
- Two separate pieces turn out to be the same concept from different angles (merge)
- A piece contains multiple sub-problems that weren't visible at decomposition time (split)
- An interface doesn't match what actually flows (wrong boundary)

**How DV2 works:**
1. Identify which boundaries are wrong and why
2. Re-run Steps 1-7 on the affected region (not the whole — just the part that's wrong)
3. Work done on pieces that survive into DV2 persists — understanding is retained even if boundaries shift

**Trigger:** DV2 is triggered when execution reveals that boundaries don't match reality. Decomposition doesn't trigger itself — it responds to signals from practice.

---

## Recursive Decomposition

Pieces can themselves be decomposed further. A piece that's too complex for a single focused pass gets decomposed into sub-pieces, each of which can be worked on independently.


### When to Stop Decomposing

Stop decomposing a piece when any of these is true:
- **Tractable** — the piece can be answered in a single focused pass
- **Atomic** — the coupling map within the piece is flat (no internal structure visible)
- **Over-decomposed** — further decomposition produces sub-pieces that can't exist independently
- **Directly verifiable** — the verification criteria can be checked without sub-decomposition

---

## Coverage Strategy

Decomposition's coverage ensures the partitioning is thorough and the pieces are viable.

### Per-decomposition coverage

**Minimum:** Steps 1-7 completed. Self-evaluation passes on minimum 3 dimensions (independence, completeness, reassembly). Top-down boundaries validated with bottom-up sanity check.

**Full:** Self-evaluation passes on all 7 dimensions. Every interface explicitly defined. Dependency order verified with no circular dependencies. Each piece expressible as a purposeful question with testable verification criteria.

### Reassembly test

The ultimate coverage check: given all pieces answered (verification criteria met) + all interfaces satisfied (depends-on / provides-to matched), does the original whole's problem get solved? If not, something was missed — a piece is missing, an interface is wrong, or a gap exists between pieces.

---

## Failure Modes

Decomposition fails in predictable, structural ways:

### 1. Premature Decomposition

Decomposing before sensemaking has clarified the whole. The pieces are based on surface structure, not deep understanding. Hidden coupling is everywhere because the internal topology wasn't perceived — it was guessed.

**How to recognize:** Pieces that look clean on paper but can't be worked on independently. Hidden dependencies surface during execution. The feeling is "I thought these were separate but they keep needing each other."

**How to prevent:** Sensemaking first. Don't decompose until the whole is understood. If you can't describe the whole in one clear paragraph, you can't decompose it.

### 2. Wrong Boundaries

Cutting through high-coupling regions. The boundary splits things that are tightly connected, creating pieces that can't function without constant cross-boundary communication.

**How to recognize:** Interfaces between pieces are complex and heavy — lots of data flowing back and forth. Changes to one piece frequently require changes to another. The pieces are technically separate but practically entangled.

**How to prevent:** Coupling perception (Step 1). Cut at LOW coupling, not at convenient-looking boundaries. The bottom-up validation (Step 3) catches many wrong boundaries.

### 3. Hidden Coupling

Pieces look independent but share hidden state, assumptions, or timing requirements that weren't captured in the interfaces. The decomposition looks clean but the pieces can't be worked on independently.

**How to recognize:** Piece A works fine in isolation but breaks when combined with piece B. Or piece A's output is correct but piece B can't use it because of an unstated assumption about format, timing, or state.

**How to prevent:** Interface mapping (Step 5) must be thorough. Ask not just "what data flows?" but "what assumptions does each piece make about what the other provides?" Hidden coupling hides in assumptions, not in data.

### 4. Missing Pieces

The decomposition doesn't cover the whole. Something falls through the gaps between pieces. The reassembly test fails — pieces + interfaces don't reconstruct the original problem.

**How to recognize:** The reassembly check (self-evaluation) fails. Or during execution, someone realizes "this aspect of the problem isn't addressed by any piece."

**How to prevent:** Completeness check in self-evaluation (Step 7). And the question tree validity check — if the original problem has aspects that no question addresses, there's a gap.

### 5. Over-Decomposition

Breaking into pieces so small they can't be understood or worked on in isolation. Each piece is a fragment, not a coherent sub-problem. The overhead of managing many tiny pieces exceeds the value of partitioning.

**How to recognize:** Very high piece count relative to the problem's actual complexity. Pieces that are trivial — one-line answers. The feeling is "we could have just done this as one thing."

**How to prevent:** Stopping criteria — stop decomposing when the piece is tractable. If the piece can be answered in one focused pass, it doesn't need sub-decomposition.

### 6. Ignoring Dependencies

Decomposition produces pieces and interfaces but not the ordering. Pieces are worked on in the wrong order — piece B is built before piece A, but B depends on A's output. Rework is required when A finally delivers and B's assumptions were wrong.

**How to recognize:** Rework after integration. Piece B was built assuming A would produce X, but A actually produces Y. Time wasted on assumptions that could have been resolved by ordering.

**How to prevent:** Dependency ordering (Step 6). Explicit: if B depends on A, A comes first. Parallel only when genuinely independent.

### 7. Imbalanced Decomposition

One piece contains 80% of the complexity while the others are trivial. The decomposition is technically valid but practically useless — the hard part wasn't actually partitioned, just surrounded by easy parts.

**How to recognize:** Self-evaluation balance check reveals highly unequal complexity. One piece takes 10 iterations while others take 1.

**How to prevent:** Balance check in self-evaluation. If one piece is dramatically larger than others, it probably needs further decomposition.

---

## Summary

| Component | What it is | How many |
|-----------|-----------|----------|
| **Core operation** | Coupling perception — seeing where things are tightly vs loosely connected | 1 |
| **Coupling map** | Topology of propagation relationships between elements | 1 per decomposition |
| **Process** | Perceive → Detect → Validate → Express → Map → Order → Evaluate | 7 sequential steps |
| **Output format** | Question tree with verification criteria | 1 tree per decomposition |
| **Validation** | Dual-direction (top-down + bottom-up sanity check) with binary confidence | 2 passes, compared |
| **Self-evaluation** | Quality check: independence, completeness, reassembly (minimum) + tractability, interface clarity, balance, confidence (full) | 3 minimum, 7 full |
| **Progressive versions** | Opt-in evolution when boundaries are discovered wrong during execution | DV1 default, DV2+ when triggered |
| **Stopping criteria** | Tractable, atomic, over-decomposed, directly verifiable | 4 conditions (any sufficient) |
| **Failure modes** | Premature decomposition, wrong boundaries, hidden coupling, missing pieces, over-decomposition, ignoring dependencies, imbalanced decomposition | 7 identified |

This thinking discipline is domain-agnostic. It works for partitioning software systems, business strategies, research programs, book structures, organizational designs, or any complex whole that needs to become tractable. It does not prescribe WHAT to decompose — it provides the structural tools for HOW to perceive internal topology and partition at natural boundaries.

---- NOW SOLID INSTRUCTIONS START ----

## Execute the 7-Step Process Above

For each step, produce the specified output.

### Final Deliverable

Present the complete decomposition as:

1. **Coupling Map** — major clusters and boundaries identified
2. **Question Tree** — each piece as a question with verification criteria
3. **Interface Map** — for each pair of connected pieces: what flows, direction
4. **Dependency Order** — which pieces first, which parallel, which must wait
5. **Self-Evaluation** — minimum 3 dimensions (independence, completeness, reassembly), scored pass/fail





