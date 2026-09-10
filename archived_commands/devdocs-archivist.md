# /devdocs-archivist — DevDocs Archive Collector

Scan all devdocs, compare each folder and file against the codebase and current context, and determine what should be archived. The archivist is conservative — it only archives work that is done, understanding documents that have already been consumed into plans, and alternative approaches that were not chosen.

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

### Step 1: Scan

Read every folder and file under `devdocs/`, excluding:
- `devdocs/archive/` — already archived
- `devdocs/*/future/` — planned work, never archive candidates
- `devdocs/roadmaps/` — always active reference material
- `devdocs/archaeology/` — always active (unless explicitly told to archive old traces)

For each folder and file, build an understanding of:
- What work or understanding does this document describe?
- What is the current state of that work in the codebase?
- Does any other active (non-archive) devdoc reference this document?

### Step 2: Classify Each Item

For each folder/file, determine one of three verdicts:

**ARCHIVE** — The work described is done (reflected in the codebase) OR the document's understanding has been consumed into a plan/implementation and is no longer needed in active context.

**KEEP** — The work is not done, OR the document contains knowledge still relevant to active work, OR another active document references it.

**KEEP (reference hold)** — The work is done, but another active document references it. It stays until the referencing document is also ready to archive. Then both move together.

### Step 3: Handle Edge Cases

**Archive as a unit, not per-file.** When a folder's work is done, archive the ENTIRE folder — desc.md, plan, critic, sensemaking, all of it. They form a coherent unit of completed work and should stay together.

**Exception — orphaned alternatives.** Sometimes multiple approaches are explored for the same work (e.g., two different sensemaking analyses, two plan versions). If only one was used and the others are alternatives for the SAME completed work, archive them together with the used one. However, if an unused alternative is actually a separate idea/enhancement that could still be relevant independently, it stays.

**Cross-reference integrity.** Before archiving any item, check: does any ACTIVE (non-archive candidate) document reference it? If yes, the item stays until the referencing document is also an archive candidate.

### Step 4: Determine Archive Paths

Each archive run creates its own folder using a timestamp:

```
devdocs/archive/run_YYYY_MM_DD_HH_MM_SS/
```

Inside this run folder, each archived item gets a dated folder with its origin path:

```
devdocs/archive/run_2026_04_01_15_38_12/
├── 2026-04-01_scoped_feat_12_auth/       ← was devdocs/scoped/feat_12_auth/
├── 2026-04-01_ideas_scorer_model/        ← was devdocs/ideas/scorer_model/
└── 2026-04-01_clarifications_oauth2/     ← was devdocs/clarifications/oauth2.md
```

The naming convention: `{date}_{origin_path_underscored}/`. This makes each archived item searchable by date and traceable back to where it came from. No collisions, fully recoverable.

### Step 5: Execute or Document

**Default behavior (no flags):** Present the full archive plan to the user — list every item with its verdict (ARCHIVE/KEEP), reasoning, and destination path. Ask for confirmation before moving anything.

**With `-doc` flag:** Do NOT move any files. Instead, create a markdown report at `devdocs/archive_report_YYYY_MM_DD.md` documenting the full analysis:

For each folder/file in devdocs:

```markdown
### devdocs/scoped/feat_12_auth/

**Verdict:** ARCHIVE
**Reason:** All described changes are reflected in the codebase. Auth token refresh, session management, and OAuth2 integration are implemented and tested. No active documents reference this folder.
**Archive path:** devdocs/archive/run_2026_04_01_15_38_12/2026-04-01_scoped_feat_12_auth/

---

### devdocs/ideas/event_driven_architecture/

**Verdict:** KEEP
**Reason:** The exploration is ongoing. No implementation exists in the codebase. The sensemaking analysis is still being referenced by devdocs/roadmaps/system_redesign/map.md.

---

### devdocs/clarifications/oauth2_grant_types.md

**Verdict:** ARCHIVE
**Reason:** This understanding was consumed into devdocs/scoped/feat_12_auth/desc.md and step_by_step_impl_plan.md. The auth feature is complete. No other active document references this clarification.
**Archive path:** devdocs/archive/run_2026_04_01_15_38_12/2026-04-01_clarifications_oauth2_grant_types/
```

---

## Rules

1. **Staleness is inferred, not declared.** Check the codebase — "does the code reflect what this doc describes?" Do NOT rely on manual status fields or metadata tags.

2. **Archive as a unit.** When a folder's work is done, move the entire folder. Don't cherry-pick files from inside a folder unless they are genuinely unrelated to the folder's main work.

3. **Cross-references block archiving.** If an active doc references a done doc, the done doc stays. Both move together when both are ready.

4. **Be conservative.** When uncertain whether work is truly done, verdict is KEEP. False negatives (keeping something stale) are better than false positives (archiving something still needed).

5. **Never touch future/.** Items in any `future/` subfolder are planned work and are never archive candidates.

6. **Never touch roadmaps/ or archaeology/.** These are always-active reference material. Only archive old archaeology traces if explicitly told to.

7. **Each run is isolated.** Every archive execution creates a new `run_YYYY_MM_DD_HH_MM_SS/` folder. This means multiple runs don't collide, and each run is a recoverable unit — you can undo an entire run by moving its folder back.

---

## Output

**Without `-doc`:** Print the archive plan in the conversation. For each item: verdict, reasoning, archive path. Ask for confirmation, then move files.

**With `-doc`:** Create `devdocs/archive_report_YYYY_MM_DD.md` with the full analysis. Do NOT move any files. Print a summary in the conversation (how many items analyzed, how many ARCHIVE, how many KEEP, how many reference-held).
