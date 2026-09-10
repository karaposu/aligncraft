# Decomposition — Book Chapter/Section Gap Analysis

## Step 1 — Perceive Coupling Topology

**The whole:** "What chapter/section addition or reorganization would most improve the book?" with sensemaking's preferred direction = *declare Part IV (multi-chapter), foundation chapter first, populate incrementally*.

**Elements in the whole:**
- E1. The book's existing structure (Parts I-III + Appendices)
- E2. The README's promise of Part IV
- E3. The repo's discipline + loop machinery (sense-making, innovate, critique, decompose, explore, comprehend, navigation, MVL, MVL+)
- E4. The discipline reference docs already written in `~/.claude/skills/<name>/references/`
- E5. The six alignment layers (Workspace, Task, Action-Space, Action-Set, Coherence, Outcome)
- E6. The four pillars (Comparison, Measurement, Visibility, Explicitness)
- E7. The patterns in Part III (DevDocs, Anchor, Probe, Fuzzy, Archaeology, Offload, Vibe Testing)
- E8. The inquiry folder mechanic (`_branch.md`, `_state.md`, `finding.md`)
- E9. Existing appendices (especially APPENDIX6 Sense Making)
- E10. Stub completion candidates (Offload, Vibe Testing) — parallel track, not part of Part IV
- E11. The user's effort budget for the next move

**Coupling map (key pairs):**

| Pair | Coupling | Reason |
|---|---|---|
| E1 ↔ E2 | STRONG | The README promise must be reflected in the structure; SUMMARY must match |
| E3 ↔ E4 | STRONG | The disciplines and their reference docs are the source material |
| E5 ↔ E7 | MODERATE | Patterns are organized around alignment layers; Part IV must integrate them |
| E5 ↔ E3 | MODERATE | Disciplines are the engine that operates on the alignment layers |
| E3 ↔ E8 | STRONG | Disciplines run inside the inquiry-folder mechanic |
| E9 ↔ E3 | MODERATE | Promoting Sense Making out of appendix changes Part IV's source material |
| E10 ↔ E1 | NONE | Stub completion is parallel, doesn't affect Part IV structure (per sensemaking) |
| E11 ↔ everything | TERMINAL | Effort budget caps how much Part IV ships first |

**Major clusters:**
- **Cluster A — Structural declaration:** E1, E2 (declaring Part IV in SUMMARY.md so README and TOC match)
- **Cluster B — Method-level frame:** E5, E6, E7 (how the alignment chain, pillars, and patterns relate, abstracted from any specific tool)
- **Cluster C — Cognitive engine:** E3, E4, E8 (disciplines, references, inquiry-folder mechanic)
- **Cluster D — Source material reuse:** E4, E9 (existing reference docs and APPENDIX6 to lift content from)
- **Cluster E — Effort gating:** E11 (which sub-pieces ship first)

**Major boundaries (low-coupling valleys):**
- A is loosely coupled to the rest — declaring Part IV in SUMMARY is a one-line edit that doesn't depend on any chapter content existing yet.
- B and C are moderately coupled but separable into different chapters.
- D supplies B and C; not a separate piece, but a dependency.
- E10 (stub completion) is genuinely separate — parallel track.

---

## Step 2 — Detect Boundaries (Top-Down)

Initial piece set, cut at low-coupling valleys:

- **P1.** Structural declaration — declare Part IV in `src/SUMMARY.md` with placeholder chapter entries.
- **P2.** Foundation chapter — "The AlignCraft Method": frame chapter introducing the method, cognitive loop, disciplines, inquiry-folder mechanic, in one chapter with cross-references forward to chapters that will populate incrementally.
- **P3.** Cognitive Loop chapter — deeper treatment of `MVL` (S→I→C) and `MVL+` (E→S→D→I→C), iteration, when-to-loop, when-to-stop. *Deferrable.*
- **P4.** Thinking Disciplines chapter (or one chapter per discipline) — sense-making, innovation, critique, exploration, decomposition, comprehension, navigation. *Deferrable; existing reference docs supply most content.*
- **P5.** Inquiry Folders chapter — the `_branch.md` / `_state.md` / `finding.md` lifecycle, navigation across inquiries. *Deferrable.*
- **P6.** End-to-End Walkthrough chapter — a single project moves through all six layers using the disciplines and patterns. *Deferrable; depends on P2-P5 vocabulary.*
- **P7.** Parallel-track stub completion — finishing chapter_11 (Offload) and chapter_12 (Vibe Testing). *Independent of Part IV, separate work.*

P1 is *the* immediate deliverable. P2 is the next deliverable. P3-P6 are the populated chapters that fill out Part IV over time. P7 is genuinely parallel.

---

## Step 3 — Validate Boundaries (Bottom-Up)

**Atomic elements check:**
- a1. The README's "Part IV: The AlignCraft Method" phrase
- a2. The current `src/SUMMARY.md` last-line-before-Appendices
- a3. The Cognitive Loop concept
- a4. Each individual thinking discipline (sensemaking, innovation, etc.)
- a5. The `_branch.md` / `_state.md` / `finding.md` triple
- a6. The reference doc for each discipline
- a7. Chapter_11 + Chapter_12 stubs

Do these atoms group into the same clusters as Step 2?
- a1, a2 → P1 (structural declaration) ✅
- a3 → P3 (cognitive loop) ✅
- a4, a6 → P4 (thinking disciplines) ✅
- a5 → P5 (inquiry folders) ✅
- a7 → P7 (parallel-track) ✅

Atomic-level method content (a3, a4, a5 collectively) → P2 (the foundation chapter introduces ALL of these at the abstraction level, deferring depth to P3-P5). The foundation chapter is *not* split across atoms because its job is *integration*, not depth.

**No atom is split across boundaries; no atom is misgrouped. Top-down and bottom-up agree. Confidence: HIGH.**

---

## Step 4 — Express as Question Tree

### P1. How should Part IV be declared in SUMMARY.md?
**Verification criteria:**
- [ ] `src/SUMMARY.md` has a `# Part IV: The AlignCraft Method` (or equivalent name) heading after Part III
- [ ] At minimum, one entry under it pointing to the foundation chapter file (which will be created in P2)
- [ ] Optional: placeholder entries for the deferrable chapters (P3-P6) marked as "(forthcoming)" or similar
- [ ] The README's "Part IV" promise now corresponds to a real entry

### P2. What does the foundation chapter "The AlignCraft Method" contain?
**Verification criteria:**
- [ ] One paragraph: what the method IS (applying the alignment chain via the cognitive loop with thinking disciplines as the engine)
- [ ] One section: introduce the cognitive loop (S→I→C minimum, E→S→D→I→C extended) at the abstraction level
- [ ] One section: introduce the seven thinking disciplines as named tools and the cognitive role each plays (one paragraph per discipline)
- [ ] One section: introduce the inquiry folder mechanic at the abstraction level (`_branch.md` / `_state.md` / `finding.md` — what each does)
- [ ] One section: how the method relates to the six alignment layers (the layers are *where*; the disciplines are *how*)
- [ ] Forward-references to the deferrable chapters (P3-P6) that will treat each topic in depth
- [ ] Length target: 300-500 lines, mid-density (matching chapter_2 style)

### P3. What goes in the Cognitive Loop chapter? *(deferrable)*
**Verification criteria:**
- [ ] Full treatment of MVL classic (S→I→C): when each phase fires, how they feed each other
- [ ] Full treatment of MVL+ extended (E→S→D→I→C): why E and D were added, when to use which
- [ ] Iteration mechanic: what the loop does when the question isn't answered
- [ ] Termination criteria
- [ ] Cross-references to the disciplines in P4

### P4. What goes in the Thinking Disciplines chapter(s)? *(deferrable)*
**Verification criteria:**
- [ ] One section per discipline (sense-making, innovation, critique, exploration, decomposition, comprehension, navigation)
- [ ] For each: what cognitive operation it performs, when to use it, what artifact it produces, common failure modes
- [ ] Lifted-and-edited content from `~/.claude/skills/<name>/references/<name>.md` reference docs
- [ ] Decision: one chapter or seven (treat as DV2 trigger if execution reveals coupling problems)

### P5. What goes in the Inquiry Folders chapter? *(deferrable)*
**Verification criteria:**
- [ ] Anatomy of an inquiry folder
- [ ] The role of `_branch.md`, `_state.md`, `finding.md`
- [ ] How findings link via Relationships
- [ ] How `docarchive/` works
- [ ] When to start a new inquiry vs continue one

### P6. What goes in the End-to-End Walkthrough chapter? *(deferrable, latest)*
**Verification criteria:**
- [ ] One concrete (real or representative) project
- [ ] Move through all six alignment layers
- [ ] Use the patterns from Part III as concrete tools
- [ ] Use the disciplines from P4 as the cognitive engine
- [ ] Show the inquiry folders as artifacts
- [ ] Length target: 400-700 lines

### P7. Stub completion (parallel track)
**Verification criteria:**
- [ ] chapter_11 (Offload) expanded from stub
- [ ] chapter_12 (Vibe Testing) "Not finished yet" header removed and content completed
- [ ] chapter_7_run_probes/ scratch file (`probe_tests_fixed copy.md`) cleaned up
- [ ] *Independent of P1-P6; can be done before, during, or after.*

---

## Step 5 — Map Interfaces

| From → To | Flow type | What flows | Direction |
|---|---|---|---|
| P1 → P2 | Prerequisite | The chapter file path that P1 declares | One-way |
| P2 → P3, P4, P5, P6 | Information | Vocabulary + frame; forward-references that the deferrable chapters resolve | One-way |
| P3 → P4 | Information | The cognitive loop frames where each discipline plugs in | One-way |
| P4 → P5 | Information | Disciplines write into inquiry folders; folders carry their outputs | One-way |
| P4 → P6 | Information | Disciplines are the actors in the walkthrough | One-way |
| P5 → P6 | Information | The walkthrough produces inquiry artifacts | One-way |
| Existing reference docs (`~/.claude/skills/*/references/*.md`) → P4 | Source material | The bulk of P4's content already exists | One-way |
| APPENDIX6 (Sense Making) → P4 | Source material | One discipline's appendix material moves into the body | One-way |
| P7 ↔ all of P1-P6 | NONE | Independent track | — |

**Hidden-coupling check:** P2's job is to introduce P3-P6 at the abstraction level. If P2 introduces something that P3-P6 don't actually deliver, the forward-references break. To prevent this, P2's verification criteria explicitly enumerate the topics it must introduce and bind them to the chapter ranges in P3-P6.

---

## Step 6 — Order by Dependency

**Phase 1 (immediate, low-effort):** **P1** — declare Part IV in SUMMARY.md. One-line edit. Fixes the README/SUMMARY contradiction immediately.

**Phase 2 (first content delivery):** **P2** — write the foundation chapter "The AlignCraft Method." Forward-references everything else. **This is the critical chapter for Part IV to be meaningful at all.**

**Phase 3 (parallelizable, incremental):** **P3, P4, P5** in any order. They are independent given P2's frame. The user can write them when motivated; each is self-contained.

**Phase 4 (terminal):** **P6** — the walkthrough chapter — depends on P2 + at least one of P4/P5 having vocabulary in place.

**Independent track:** **P7** — stub completion. No order constraint relative to P1-P6.

```
P1 (declaration) → P2 (foundation chapter) → [P3 ∥ P4 ∥ P5] → P6 (walkthrough)
                                                                                  
P7 (stub completion) — runs independently, any time
```

Critical path for the **immediate user action**: P1 → P2 (two deliverables, one this week).
Critical path for **full Part IV completion**: P1 → P2 → P3/P4/P5 → P6.

No circular dependencies.

---

## Step 7 — Self-Evaluate

### Minimum 3 dimensions

| Dimension | Check | Result |
|---|---|---|
| **Independence** | Each piece answerable through interfaces only? | PASS — P1 doesn't need any chapter to exist; P2 frames P3-P6 with forward-references; P3/P4/P5 are independent given P2; P6 consumes P2-P5 outputs |
| **Completeness** | Pieces cover the whole? | PASS — P1 fixes the structural promise; P2 delivers the foundation; P3-P6 fill the multi-chapter Part IV; P7 covers the parallel concern |
| **Reassembly** | Pieces + interfaces reconstruct the recommendation? | PASS — execute P1 → P2 → optionally P3-P6 → P6, plus optional P7, and the original recommendation is realized |

### Full 7 dimensions

| Dimension | Result | Notes |
|---|---|---|
| Independence | PASS | See above |
| Completeness | PASS | See above |
| Reassembly | PASS | See above |
| **Tractability** | PASS | P1 is a one-line edit; P2 is one chapter; each of P3-P6 is one chapter |
| **Interface clarity** | PASS | All flows are information / source-material; no hidden state |
| **Balance** | MEDIUM | P2 is heavier than P1; P6 is heavier than the others. Acceptable spread because the criticality matches the weight |
| **Confidence** | PASS | Top-down and bottom-up agree on boundaries |

**Decomposition is good enough to commit. No DV2 needed.**

---

## Final Deliverable

### Coupling Map
Five clusters: A (structural declaration), B (method frame), C (cognitive engine), D (source material reuse), E (effort gating). Major boundaries between A↔rest, B↔C separable, C↔D one-way reuse, P7↔rest fully decoupled.

### Question Tree
Seven pieces, of which P1+P2 are the immediate user action and P3-P6 populate Part IV over time. P7 is parallel-track.

### Interface Map
Eight one-way information flows (no circular). P1 → P2 is prerequisite (chapter file path). P2 → P3-P6 is forward-reference. Existing reference docs and APPENDIX6 supply source material for P4. P7 has no flows to/from the rest.

### Dependency Order
P1 → P2 → (P3 ∥ P4 ∥ P5) → P6, with P7 fully independent. Immediate-action critical path: P1 → P2.

### Self-Evaluation
3/3 minimum dimensions PASS. 7/7 full dimensions PASS (Balance MEDIUM but justified by criticality match).

### Handoff to Innovation
Innovation should now generate candidates for:
- The exact name and structure of Part IV (is it "The AlignCraft Method"? something else?)
- The exact contents of the foundation chapter P2 (which framings, which examples, which forward-references)
- Whether P4 should be one chapter or seven (the one-vs-seven decision is genuinely open)
- Alternate sequences (e.g., should the walkthrough come second instead of last?)

The verdict (P6 of innovation, then critique) is the synthesis target. Upstream pieces are independent generation surfaces.
