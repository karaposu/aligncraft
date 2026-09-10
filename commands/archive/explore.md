---
name: explore
description: Map unknown territory through iterative scan-signal-probe cycles at managed resolution levels, tracking the frontier between known and unknown, and assessing confidence across the map.
---

# /explore — Structural Exploration

Map unknown territory to produce a structural map with confidence levels. Works for codebases, solution spaces, business landscapes, research fields, or any unknown territory.

## Additional Input/Instructions

$ARGUMENTS

## Instructions

1. Read the input and consume it. It can be raw text, a folder path with md files, code files, or image path. Consume all input.

2. Determine the exploration mode:
   - **Artifact exploration** — if the territory has concrete objects to find (codebases, literature, existing solutions)
   - **Possibility exploration** — if the territory is conceptual and candidates must be generated (solution spaces, design options, strategic directions)

3. Determine the entry point:
   - **Frontier-first** (default) — no prior signal, start with broad scan
   - **Signal-first** — a specific question or hunch exists, start by probing it

4. Execute the full Structural Exploration process described below, running iterative cycles until convergence.

5. Save the output as a markdown file (unless differently stated in additional instructions!):
   - **If the input was a file path** — save in the same folder as the input file or relevant files.
   - **Otherwise** — save under `devdocs/exploration/<suitable-name>.md` (create the directory if needed).


# Structural Exploration — A Thinking Discipline

A thinking discipline for mapping unknown territory through iterative scanning, signal detection, and probing — tracking the frontier between known and unknown and assessing confidence across the map. Exploration is not understanding — it's finding what exists so that understanding can follow.

Rather than relying on intuition to decide "where to look," Structural Exploration treats territory mapping as a practiced methodology based on scan-signal-probe cycles, resolution management, frontier tracking, and confidence assessment.

> **Structural Exploration is the process of mapping unknown territory through iterative scan-signal-probe cycles at managed resolution levels, tracking the frontier between known and unknown, and assessing confidence across the map — to produce a structural map that reveals what exists, what's absent, where the gaps are, and where to look next.**

---

## What Exploration Is

**Exploration is the cognitive operation of engaging with the unknown — systematically discovering what exists in unfamiliar territory, where it is, what's absent, and how confident we are about each region — to produce a map that enables action.**

Exploration is not:
- Sensemaking (sensemaking converts ambiguity → understanding; exploration converts the unknown → a map of what exists. You explore first, then sense-make on what you found. Exploration discovers WHAT and WHERE. Sensemaking discovers WHY and HOW.)
- Innovation (innovation creates what doesn't exist; exploration maps what does exist — or in possibility exploration, enumerates what COULD exist. Innovation's success is novelty. Exploration's success is completeness.)
- Research (research tests hypotheses; exploration precedes hypothesis formation — you can't form a hypothesis about territory you haven't seen)
- Browsing (browsing is undirected; exploration is systematic with coverage awareness and frontier tracking)

Exploration is the **upstream discipline** in the thinking system. It produces the raw material — the map of territory — that other disciplines operate on. Without exploration, sensemaking operates on whatever happens to be in front of it. With exploration, sensemaking operates on deliberately mapped territory.

---

## Two Exploration Modes

Not all territory is the same. Exploration has two distinct modes based on whether the territory contains concrete artifacts or abstract possibilities.

### Artifact Exploration

The territory has concrete objects that exist independently of the explorer. You find them.

**Examples:** Codebases (files, functions, patterns), existing literature, competitor products, market data, historical records.

**How scan works:** Read, list, index. The objects are there — you traverse and catalog them.

**How probe works:** Read deeper into a specific artifact. Examine its internals, trace its connections.

### Possibility Exploration

The territory is conceptual. The objects don't exist yet — they must be generated to be placed on the map. You enumerate what COULD exist.

**Examples:** Solution spaces (what approaches could solve this?), design options (what architectures are possible?), strategic directions (what paths could we take?), research frontiers (what questions could be asked?).

**How scan works:** Generate candidates at surface level. Use diverse generation techniques to ensure breadth. Each candidate is a 1-2 sentence description, not a developed idea. The goal is a complete landscape of directions, including obvious and non-obvious ones.

**How probe works:** Take a candidate from the scan and examine it more closely. What would this approach look like? What does it enable? What does it block? Still mapping, not developing — probe produces a more detailed description, not a solution.

**Key difference from innovation:** Possibility exploration generates candidates for completeness. Innovation generates ideas for novelty. Exploration must include the boring obvious approach on the map because completeness matters. Innovation would skip it because it's not novel. Different success criteria, different outputs.

---

## Key Components

### Scan

Breadth-first pass at the current resolution level. The goal is a surface-level inventory of what exists (artifact mode) or what could exist (possibility mode) in the territory.

A good scan:
- Covers the territory's breadth, not its depth
- Produces an inventory, not understanding
- Is resolution-appropriate — doesn't go deeper than the current resolution level warrants
- Is unweighted on the first pass — don't pre-judge what's important before you know what's there

After the first scan, subsequent scans can be importance-weighted: focus scanning effort where importance is high and confidence is low. Skip low-importance regions.

### Signal Detection

Within scanned territory, identify what stands out — what deserves deeper investigation.

Signals come from:
- **Density** — regions with unusually many or few items
- **Novelty** — things that don't match expectations
- **Relevance** — things that connect to the current purpose
- **Tension** — things that seem to contradict each other
- **Absence** — regions where something should exist but doesn't

Signal detection prioritizes: which regions should be probed first?

### Probe

Depth pass on detected signals. Take one signal and investigate it at higher resolution.

A good probe:
- Goes deeper on one specific region, not broader across many
- Produces detailed structural knowledge about that region
- Identifies sub-features that weren't visible at scan resolution
- May generate new signals (things discovered during the probe that need further investigation)

Probing is not sensemaking. A probe produces "here's what's in this region in detail." Sensemaking produces "here's what this region means."

### Resolution Management

The mechanism for choosing and changing the resolution level — when to zoom in, when to zoom out, what triggers a resolution change.

**Zoom in** when:
- A signal is detected that can't be assessed at current resolution
- The current region has high importance and low confidence
- A probe revealed sub-structure that needs further exploration

**Zoom out** when:
- The current region is well-mapped at this resolution (frontier stable locally)
- Probing is producing diminishing returns
- The purpose requires a broader view before going deeper

Resolution management connects scan (coarse) to probe (fine). It's the decision function that prevents both premature depth (zooming in before scanning broadly) and surface-only scanning (never zooming in at all).

### Frontier Tracking

Track the boundary between known and unknown territory. The frontier is the active work surface of exploration.

**Frontier states:**
- **Advancing** — new scans are pushing the frontier outward, discovering new territory
- **Stable** — new scans are not finding new structural features at the current resolution. The territory's rough boundaries are known.
- **Closed** — all reachable territory has been reached at the current resolution. No frontier remains.

Frontier tracking is what makes exploration systematic rather than random. You can see where you've been, where you haven't, and where the boundary is.

### Confidence Mapping

Assess what's known well, what's known partially, and what's not known at all. The map has confidence levels, not just content.

**Confidence levels:**
- **Confirmed** — scanned and probed. High confidence this region is accurately mapped.
- **Scanned** — surface-level pass completed. The major features are known but details may be wrong.
- **Inferred** — not directly scanned but surrounded by explored territory. Interpolated from neighbors.
- **Unknown** — not scanned, not inferred. Genuine gap in the map.
- **Confirmed absent** — scanned thoroughly and verified empty. This is knowledge, not a gap.

The map should explicitly show confirmed absences — "this region was explored and contains nothing." This prevents others from re-exploring dead regions.

---

## Process Model

Structural Exploration proceeds through iterative cycles, not linear phases. Each cycle advances the frontier.

### Entry Point

Exploration can start two ways:

**Frontier-first** (default) — "I know nothing about this territory. Scan broadly."
Start with a broad scan at coarse resolution. No prior hypotheses.

**Signal-first** — "I have a specific question or hunch about this territory."
Start by probing the signal. Scan outward from what the probe reveals. Useful when you already have a direction but need to map the surrounding territory.

### The Exploration Cycle

```
1. Scan — breadth-first pass at current resolution
2. Detect signals — what stands out? what deserves deeper look?
3. Manage resolution — should we zoom in on a signal or zoom out for more breadth?
4. Probe — depth pass on highest-priority signal (if zooming in)
   OR Scan — broader pass at current resolution (if zooming out)
5. Update frontier — where is the boundary now? advancing? stable?
6. Update confidence map — what do we know well, partially, not at all?
7. Assess convergence — has the frontier stabilized? is the discovery rate declining?
   → If not converged: back to step 1 (new cycle)
   → If converged: exploration complete, produce the map
```

### Resolution Progression

A typical exploration follows a resolution progression:

1. **Coarse scan** — what major regions exist? (unweighted)
2. **Signal detection** — which regions matter most?
3. **Targeted probes** — go deeper on high-importance, low-confidence regions
4. **Fine scan** — within probed regions, scan at higher resolution
5. **Repeat** — until the frontier stabilizes at a resolution appropriate for the purpose

The progression is adaptive, not fixed. Some explorations stay coarse (just need a landscape overview). Others go very deep in specific regions. Resolution management decides.

---

## Coverage Strategy

Exploration can't cover the unknown exhaustively. Its coverage is **surprise-based** — you explore until remaining unknowns are unlikely to contain structural surprises.

### Convergence Criteria (all three must hold)

- **Frontier stability** — new scans stop pushing the frontier outward. The territory's rough boundaries are known at the current resolution.
- **Declining discovery rate** — each new scan produces fewer new structural features. Diminishing returns signal that the major structure has been captured.
- **Bounded gaps** — remaining unknowns are between explored areas (interpolatable from neighbors) not beyond them (uncharted voids with no surrounding context).

### Per-cycle coverage

**Minimum:** Each cycle must advance the frontier or increase confidence in at least one region. A cycle that produces no new information and no confidence increase is a signal to change resolution or shift region.

**Full:** All major regions scanned at least once. All detected signals probed or deliberately deferred with reasoning. Confidence map has no "unknown" regions adjacent to "confirmed" regions (gaps are bounded, not adjacent to explored territory).

### When to stop

- **Stop scanning** when the frontier is stable and discovery rate is declining
- **Stop probing** when probes are producing diminishing returns (the signal has been investigated enough)
- **Stop exploring** when all three convergence criteria are met — the map is sufficient for the next discipline to operate on
- **Never stop because it "feels like enough"** — stop because the frontier state and discovery rate say so

---

## Failure Modes

Exploration fails in predictable, structural ways:

### 1. Premature Depth

Going deep on the first interesting signal before scanning broadly. The explorer finds one region, gets fascinated, and probes it extensively — while entire other regions remain unscanned.

**How to recognize:** The map has one very detailed region and large "unknown" voids. The frontier advanced in one direction but not others.

**How to prevent:** Complete at least one coarse scan before probing. The first scan should be broad and unweighted. Signals detected during the first scan get queued, not immediately probed.

### 2. Surface-Only Scanning

Scanning broadly but never probing. The map has uniform low confidence everywhere — everything is surface-level, nothing is understood in detail.

**How to recognize:** Confidence map is all "scanned," nothing "confirmed." No probes have been conducted. The map is a list without structure.

**How to prevent:** After each scan, detect signals and probe at least one. Don't start another broad scan until the highest-priority signal from the previous scan has been probed.

### 3. False Confidence

Believing the map is complete when it isn't. Stopping exploration because the discovery rate dropped — but the drop was caused by scanning the wrong region, not by the territory being fully mapped.

**How to recognize:** Convergence criteria appear met, but later work reveals large surprises. Retrospectively, the "stable" frontier was stable because scanning stopped pushing it, not because there was nothing beyond it.

**How to prevent:** Before declaring convergence, do one deliberate scan in a completely different direction than previous scans. If it produces surprises, the frontier isn't stable — it was just not being pushed. This is the "jump scan" — a distant check for uncharted voids.

### 4. Premature Termination

Stopping exploration because it "feels like enough" rather than because convergence criteria are met. The explorer has a sense of the territory and wants to move on to sensemaking or innovation — but the map has unbounded gaps.

**How to recognize:** Convergence criteria are NOT all met (frontier still advancing, discovery rate still high, or gaps are unbounded) but the explorer declares exploration complete.

**How to prevent:** Explicit convergence check before termination. All three criteria must hold. If they don't, the exploration isn't done — even if it feels like it is.

### 5. Re-Exploration

Scanning regions that have already been scanned without realizing it. Without frontier tracking, the explorer revisits known territory, wastes effort, and makes no progress.

**How to recognize:** The frontier isn't advancing despite active scanning. The "discoveries" are things already on the map.

**How to prevent:** Frontier tracking. Before scanning a region, check: has this been scanned before? At what resolution? If already scanned at the current resolution, move on.

### 6. Completeness Bias in Possibility Mode

In possibility exploration, generating only "creative" or "novel" candidates and missing the obvious ones. The map has interesting possibilities but lacks the standard, boring approaches that should also be listed.

**How to recognize:** The map looks creative but a domain expert would say "you missed the most obvious approach." The map is innovation-biased rather than exploration-complete.

**How to prevent:** In possibility mode, explicitly scan for: (a) the obvious standard approach, (b) what most practitioners would do, (c) what exists in adjacent domains. THEN scan for novel and creative possibilities. Completeness before novelty.

---

## Summary

| Component | What it is | How many |
|-----------|-----------|----------|
| **Core operation** | Mapping unknown territory through scan-signal-probe cycles at managed resolution | 1 |
| **Modes** | Artifact exploration (find concrete things) + Possibility exploration (generate candidates for the map) | 2 |
| **Components** | Scan, Signal Detection, Probe, Resolution Management, Frontier Tracking, Confidence Mapping | 6 |
| **Process** | Iterative cycles: scan → detect → manage resolution → probe/scan → update frontier → update confidence → assess convergence | 7 steps per cycle |
| **Entry points** | Frontier-first (default, start from ignorance) + Signal-first (start from a hypothesis) | 2 |
| **Coverage** | Surprise-based: frontier stability + declining discovery rate + bounded gaps | 3 convergence criteria |
| **Confidence levels** | Confirmed, scanned, inferred, unknown, confirmed absent | 5 levels |
| **Failure modes** | Premature depth, surface-only scanning, false confidence, premature termination, re-exploration, completeness bias | 6 identified |

This thinking discipline is domain-agnostic. It works for mapping codebases, solution spaces, business landscapes, research fields, organizational structures, or any unknown territory that needs to become known before other cognitive operations can engage with it. It does not prescribe WHAT to explore — it provides the structural tools for HOW to systematically map the unknown with managed resolution, tracked frontiers, and confidence-aware coverage.

---- NOW SOLID INSTRUCTIONS START ----

## Execute the Exploration Process

### 1. State Mode and Entry Point

Declare: artifact or possibility mode? Frontier-first or signal-first?

### 2. Run Exploration Cycles

Execute the 7-step cycle described above. For each cycle, produce:
- What was scanned and what was found
- What signals were detected
- Resolution decision (zoom in or out) and why
- What was probed (if zooming in)
- Frontier state after this cycle
- Confidence map update

### 3. Assess Convergence

After each cycle, check the three convergence criteria:
- Frontier stability
- Declining discovery rate
- Bounded gaps

If not converged, run another cycle. If converged, proceed to final deliverable.

Before declaring convergence, perform one **jump scan** — a deliberate scan in a completely different direction to check for uncharted voids.

### 4. Final Deliverable — The Structural Map

Present the complete exploration output as:

1. **Territory Overview** — what major regions exist, at what resolution they were explored
2. **Inventory** — what was found in each region (artifact mode) or what candidates exist (possibility mode)
3. **Signal Log** — what signals were detected, which were probed, which were deferred
4. **Confidence Map** — each region tagged: confirmed / scanned / inferred / unknown / confirmed absent
5. **Frontier State** — where the boundary between known and unknown stands
6. **Gaps and Recommendations** — what remains unknown, what should be explored next if further exploration is warranted



