name: issue-analysis
description: Build and keep current a human-readable board of a repository's whole open backlog, as one GitHub tracker issue. A cheap overview pass marks every open issue by what exists for it (done-not-closed · open PR · code on a branch · empty branch · not started) and lays the backlog out in three views — by status, by domain and area, by tier (fundamental · peripheral · good to have) — each one table of buckets, counts and marked issue numbers. A one-by-one review, oldest first in batches, answers five questions per issue against today's code and PR history and gives a verdict (KEEP · UPDATE · MERGE · CLOSE · ASK). Groups issues by concept so people can claim work by concept, puts decisions first, posts evidence as comments. Proposes only; never closes, edits or merges an issue without an explicit yes. Needs gh and a GitHub repository.

# /issue-analysis — One Board for the Whole Backlog

Every open issue lives on its own page. Nobody sees the whole picture: what is being
worked on, what stalled, what is quietly done, what waits on a decision, which issues
are about the same thing, and what comes first. This skill produces that picture as
one **tracker issue** — a board people read in a minute and use to share work, share
concepts and decide — and keeps it current.

The AI does the heavy part: it reads every issue, checks it against the code and the
pull requests, and keeps the board updated. People do what only people can: choose,
decide, take work. Nothing here closes, edits, merges or relabels an issue without an
explicit yes.

Needs `gh` (authenticated) and a GitHub repository.

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

### Phase 0: Settle the inputs

Take each from the input when given; otherwise use the default.

| Input | Default |
|---|---|
| Repository | the current checkout (`gh repo view --json nameWithOwner`) |
| Trunk branch | the repository's default branch |
| Domains and areas | **propose** a two-level cut from the issue titles and labels, in the words the owner uses: 2–4 **domains** (the main parts of the product: "Restaurant OS", "voice AI", "platform & engineering"), each holding 2–6 **areas** ("menu & wizard", "kitchen & floor screens", "deploy & operations"). Present it as one tree with counts and confirm it once, before the board is created. One domain and one area per issue. A catch-all area only for what fits nowhere, and say why. |
| Batch size | about 15 issues |

The cut is the only question this phase may ask. It is the owner's cut, not a
technical one: the domains are how the owner thinks of the product, the areas are
where the work lands. View 2 and the review board hang on it.

**One board per repository, for good.** It is a single issue titled exactly
`Issue overview`, labelled `board`, and pinned, so it sits at the top of the Issues
tab whatever its number. GitHub assigns issue numbers in sequence and shares them
with pull requests, so the number cannot be chosen; the pin is what makes it
findable. The title never changes: the count and the dates live in the body.

**Find the board** before anything else:

```
gh issue list --state open --label board --search 'in:title "Issue overview"' --json number,title
```

If one exists, this run is a **refresh** (Phase 5). If none, this is a **first
run**. Never create a second board: a refresh that cannot find the board because
the label or the pin was lost searches by exact title before giving up.

### Phase 1: Overview — mark every issue

One cheap pass over everything. Fetch, then mark each issue three ways: status,
area, tier.

```
gh issue list --state open --limit 1000 --json number,title,body,labels,createdAt,updatedAt
gh pr list --state all --limit 1000 --json number,title,state,headRefName,updatedAt,mergedAt,closingIssuesReferences
git fetch --all --prune
git for-each-ref refs/remotes --format='%(refname:short) %(committerdate:short) %(objectname:short)'
```

Add the project's local work folders when it has them — any folder named after an
issue number (`devdocs/work/32-…`, `devdocs/scoped/…`) and the untracked files
`git status --porcelain` shows. Record the trunk commit the snapshot is taken at.

**Read the signals, and trust each only for what it proves:**

| Signal | Found in | Proves | Does **not** prove |
|---|---|---|---|
| An open PR naming the issue | PR head branch `feat/<n>-…`, closing references | the work reached PR stage | that it continues — check the PR's last update |
| A branch named for the issue | remote branches + last-commit date | work started | progress — a branch can sit on the trunk's own commit (`git rev-list --count trunk..branch` = 0) |
| A recent commit on it | commit date vs today | live work | that it will land |
| A work folder or local bundle | local folders, untracked files | work outside GitHub's view | that anything is pushed |
| Ticked boxes in a status block | the issue body | how far the documented pipeline got | that the boxes are true — verify the artifacts |
| A merged PR whose issue is still open | PRs vs open issues | probably done | that nothing remains |
| "blocked by #n" with #n closed | issue body vs issue states | a stale block | that the block is gone — *not planned* ≠ done |

**Status comes from a combination of signals, never one alone.** "Has a branch" is
the most common false positive.

**Status — what exists for the issue.** One of five, from strongest to weakest:

| Mark | Status | Given when |
|---|---|---|
| ✅ | done, not closed | a merged PR or a release covers it |
| 🔶 | open PR | a PR naming it is open and unmerged |
| 🔷 | code on a branch | a branch has commits ahead of the trunk, no PR |
| ⚪ | branch, no code | a branch exists on the trunk's own commit, or only plan documents |
| *(none)* | not started | nothing exists — the mark is absent, so bare numbers read as untouched |

One flag on top of any status: **⛔ stale block** — the body says "blocked by #n"
and #n is closed.

**Domain and area** — the one domain and, under it, the one area from Phase 0
the issue belongs to.

**Tier** — how much stands on it. From the body's own words (what it depends on,
what depends on it, what breaks without it); the review's question 4 confirms or
moves it.

| Mark | Tier | Meaning |
|---|---|---|
| ★ | fundamental | other work stands on it, or the product does not work right without it; goes first |
| ◆ | peripheral | a real gap at the product's edge — one screen, one path, one role; stands on fundamentals, nothing stands on it |
| ○ | good to have | polish, ideas, future-proofing; nothing breaks without it |

### Phase 2: Create the board (first run)

Write the body to `devdocs/issue_analysis/board.md`, then create, label and pin:

```
gh label create board --description "the issue overview" --color 0E8A16 2>/dev/null
gh issue create --title "Issue overview" --label board --body-file devdocs/issue_analysis/board.md
gh issue pin <board>
```

Every later change to the body goes through the same two commands, on a refresh
and after each batch — pull the live body first, because people claim and edit in
it, and never rewrite a row you did not produce:

```
gh issue view <board> --json body -q .body > devdocs/issue_analysis/board.md
gh issue edit <board> --body-file devdocs/issue_analysis/board.md
```

#### Output format — the board, top to bottom

| Section | Holds | Filled by |
|---|---|---|
| Header + legend | count, last update, the marks | every update |
| 🔍 Review | where the review stands: overview and one-by-one, each **not started · in progress · done**, with dates and the snapshot commit; the batch list folded under it | every update |
| 🔔 Needs a decision | **open** proposals only — closes, merges, rewrites, questions, unfiled findings; a row leaves once decided | the review |
| 🙋 Who's on what | who holds which concept or issues | people, in comments; the AI copies claims in |
| 🗂 **The three views** | the whole backlog as three tables: **by status · by domain and area · by tier** | the overview |
| ⏭ Next up | what hurts now, fundamentals as chains, the rest | the review |
| 🧩 Concepts | concept → issues, fundamental?, owner | the review |
| 📋 Review board | one row per issue; a heading per domain, a fold per area; verdicts fill in | the review |

Decisions first, people second, then the picture. Detail folded. Icons carry state
so the eye scans without reading.

**The board is state, never a log.** It shows what is true now and what is still
open. Nothing on it says "done", "closed on", or "answered": a decided row leaves
Needs a decision, a closed issue leaves the views and the review board, and the
decision itself is written where it lives — on the issue, as a comment, a body
edit or a close. The reasoning stays in the batch comments. A reader who wants
history opens the issue or the thread, never the body.

The header's legend, verbatim:

```markdown
**Marks:** ✅ done, not closed · 🔶 open PR · 🔷 code on a branch · ⚪ branch, no code · bare = not started · ⛔ blocked by something closed
**Tier:** ★ fundamental · ◆ peripheral · ○ good to have
**Verdict:** ✔ keep · ✏️ update · 🔀 merge · 🗑️ close · ❓ ask owner · 📝 file · `·` not reviewed yet
```

#### The three views

The same shape three times: **one row per bucket · a count · the issue numbers in
the cell, each carrying its mark.** Every issue appears exactly once in each view,
so each view's counts sum to the total. The three views are never folded — they are
the picture. The example below is one backlog of 30 issues seen three ways.

**View 1 — by status.** Answers: what is being worked on, what stalled, what is
quietly done. Rows are the five statuses, strongest first. This is the one view
whose cells carry evidence in parentheses — the PR, the commit count, the release,
the date — because the status is only as good as what proves it. A date on a 🔶 or
🔷 cell is how the reader sees *stalled*.

```markdown
### By status

| Status | Count | Issues |
|---|---|---|
| ✅ done, not closed | 3 | #113 (PR #114 merged), #118 (PR #119 merged), #213 (shipped in v0.20.9; owner runs one command) |
| 🔶 open PR | 5 | #9 (PR #57, since 2026-09-12), #40 (PR #71, since 2026-09-12), #72 (PR #121), #91 (PR #126), #133 (PR #194, since 2026-10-04) |
| 🔷 code on a branch | 3 | #12 (4 commits), #160 (31 commits, last 2026-09-24), #272 (10 commits, last 2026-11-06) |
| ⚪ branch, no code | 4 | #22, #35 (opened 2026-11-10), #203 (opened 2026-11-10, work folder locally), #223 (plan documents only) |
| not started | 15 | #4 #15 #18 #21 #23 #27 #31 #44 #49 #64 #313 ⛔ #363 #376 #457 #480 |
```

When the issues carry a status block with a direction (open to implement · waiting
for a person · blocked · parked · untriaged), add one folded table under this view:
direction × count, for the not-started row only.

**View 2 — by domain and area.** Answers: which part of the product carries the
weight, and what is moving inside it. Two levels in one table: a bold row per
domain with its total, then that domain's areas beneath it, largest first. The
domain row carries the count only; the issues sit in the area rows, so area counts
sum to their domain and domain counts sum to the total. Cells carry marks only, no
parentheses: this view is for scanning, not for proof.

```markdown
### By domain and area

| Domain · area | Count | Issues |
|---|---|---|
| **Restaurant OS** | **17** | |
| ‣ kitchen & floor screens | 7 | #15 #23 #27 #223 ⚪ #313 ⛔ #363 #376 |
| ‣ owner panel & menu | 6 | #12 🔷 #18 #35 ⚪ #72 🔶 #213 ✅ #457 |
| ‣ guest page (QR) | 4 | #21 #22 ⚪ #91 🔶 #480 |
| **Voice AI** | **7** | |
| ‣ voice assistant | 7 | #9 🔶 #31 #44 #49 #133 🔶 #160 🔷 #272 🔷 |
| **Platform & engineering** | **6** | |
| ‣ accounts & identity | 4 | #4 #40 🔶 #64 #203 ⚪ |
| ‣ deploy & operations | 2 | #113 ✅ #118 ✅ |
```

**View 3 — by tier.** Answers: what to do first. Rows are the three tiers, top
first. Marks as in view 2. The fundamentals row may say, in parentheses, what each
one unblocks — that is the whole reason it is a fundamental, and it feeds Next up.

```markdown
### By tier

| Tier | Count | Issues |
|---|---|---|
| ★ fundamental | 6 | #4 (unblocks #64), #18, #21 (unblocks #480), #44, #64, #203 ⚪ (unblocks #313, #15) |
| ◆ peripheral | 14 | #9 🔶 #12 🔷 #15 #22 ⚪ #31 #35 ⚪ #40 🔶 #91 🔶 #133 🔶 #160 🔷 #213 ✅ #272 🔷 #313 ⛔ #480 |
| ○ good to have | 10 | #23 #27 #49 #72 🔶 #113 ✅ #118 ✅ #223 ⚪ #363 #376 #457 |
```

**Rules the views keep:**

- **Same shape, three cuts.** Bucket · count · marked numbers. Nothing else in a
  cell except view 1's evidence and view 3's "unblocks".
- **Counts sum to the total** in every view. If they do not, an issue is missing
  or doubled — fix the data, not the table.
- **The mark travels with the number** everywhere on the board, in all three
  views and in the review rows. A bare number is always *not started*.
- **Status refreshes with every overview.** Domain and area change only when the
  owner changes the cut. Tier moves when the review's question 4 says so.

#### The rest of the board

```markdown
# Issue overview — 30 open · updated 2026-11-11 by ada

This issue is the board for every open issue. The AI keeps it current; the decisions are the owner's.

**Mode:** one shared tracker — claim in a comment before taking work; edit only your own rows.
(legend — the three lines above)

## 🔍 Review

| | State | When |
|---|---|---|
| Overview | done | 2026-11-11 at `a189bdab` |
| One-by-one review | in progress · batch 2 of 2 · 15 of 30 reviewed | started 2026-11-10 · last batch 2026-11-11 |
| Owner answers | 4 open | last answered 2026-11-11 |

<details><summary>Batches</summary>

- [x] Batch 1 · #4–#49 · 15 issues · ✔ 3 ✏️ 6 ❓ 4 🗑️ 1 🔀 1
- [ ] Batch 2 · #64–#480 · 15 issues

</details>

## 🔔 Needs a decision

Each row waits for a yes or an answer. A decided row is removed. Most urgent first.

| # | Question | Proposed | Who decides |
|---|---|---|---|
| — | A demo visitor can rewrite the demo restaurant's settings: `PATCH /admin/restaurant` has no visitor check | 📝 file · P0 | owner |
| #113 | PR #114 merged on 2026-09-12 and the file reads v0.19.0. Close? | 🗑️ close | owner |
| #480 | Same problem as #479 in other words. Merge? | 🔀 into #479 | owner |
| #22 | Two months waiting on card format, palette and four flags. Answer or park? | ❓ | owner |
| — | Table QR download answers 404 for an owner with two restaurants: `static/panel.html` never gets the selector | 📝 file · P1 | owner |
| — | The only copy of the stage 3 work is an untracked bundle in the main folder. Back it up before anything cleans the folder? | ❓ · P1 | ada |
| #9 #31 #44 #49 | Voice work is on hold since 2026-11-10. Park these four together, or keep one? | ❓ | owner |

## 🙋 Who's on what

| Who | Concept / lane | Issues |
|---|---|---|
| ada | staff identity | #203 ⚪ · #4 |
| (open) | QR door security | #21 · #22 ⚪ · #480 |

## 🗂 The three views
(By status · By domain and area · By tier — as above)

## ⏭ Next up

1. **Now (P0/P1):** the demo-settings hole (unfiled, above) · #21 QR from anywhere · #203 staff credentials
2. **Fundamentals, as chains:** #203 → #313 with #15 · #21 → #480 · #4 → #64
3. **The rest** by the priority in its row.

## 🧩 Concepts

| Concept | Issues | Fundamental | Owner |
|---|---|---|---|
| staff identity | #4 · #203 ⚪ · #313 ⛔ | ★ | ada |
| set menus | #479 · #480 | — | (open) |

## 📋 Review board — oldest first

### Restaurant OS · 17 open · 3 reviewed

<details><summary><b>owner panel & menu</b> · 6 open · 3 reviewed</summary>

| # | Title | Status | Concept | Verdict | Evidence |
|---|---|---|---|---|---|
| #12 | An owner cannot see any order older than today | 🔷 | order history | ❓ ask | Table bills has Past transactions |
| #18 | An owner whose menu changed cannot add pages to a live menu… | | live menu pages | ✏️ update | unblocked by #323 |
| #35 | The owner adds products and permanently archives them… | ⚪ | dish lifecycle | · | |

</details>

<details><summary><b>kitchen & floor screens</b> · 7 open · 0 reviewed</summary>

…

</details>

### Voice AI · 7 open · 0 reviewed

<details><summary><b>voice assistant</b> · 7 open · 0 reviewed</summary>

…

</details>
```

**Rules the rest keeps:**

- **Decisions on top.** They are the only thing that blocks progress. One line per
  row: the question, not the case — the case is in the batch comment. An unfiled
  finding is a row with `—` for its number and 📝 as the proposal; once filed it
  gets a number and leaves this table for the views.
- **No "done" rows.** When the owner answers, closes or files, the row goes. The
  board never grows a history of what was decided.
- **One decision, one row.** A question that covers several issues (a whole area
  parked, a family of duplicates) is one row listing their numbers, never one row
  each with the same text.
- **The Proposed cell is a mark from the legend, never free text.** A finding
  that needs a hand rather than an issue (an untracked bundle to back up) is a ❓
  row whose question states the action. Priority rides along.
- **Next up is three lines, not a second backlog:** what hurts now (P0/P1), then
  fundamentals as chains (`A → B with C`), then "the rest by the priority in its
  row". Board actions already under Needs a decision are not repeated here.
- **The Review section says where the review stands,** in three rows. Overview:
  `done · date at commit`. One-by-one review: `not started` · `in progress · batch
  N of M · X of Y reviewed` · `done · date · Y issues in M batches`. Owner answers:
  how many rows above still wait. A refresh that brings new issues after a done
  review sets the one-by-one row back to in progress with the new count.
- **The batch list is folded under Review** and carries each batch's range, size
  and verdict mix, nothing else. The mix is the keep-everything check; a batch
  that is all ✔ gets rechecked.
- **People second,** so no work is done twice. **Next up** right after the views,
  so someone looking for work reads no further.
- **Every issue has a review row** from day one, under its domain's heading, in
  its area's fold. Titles cut at
  about 70 characters. Verdict and Evidence fill in as batches land.
- **Evidence in a row is one token** — a commit, a PR, a file, a short clause. The
  reasoning lives in the batch comment.
- **Fold anything longer than a screen** in `<details>` — except the three views.
- **Stamp every update** — date and author in the header; the commit the code
  was checked at in the Review section's Overview row.
- A GitHub issue body holds 65,536 characters. The three views stay in the body
  whatever the size. Past a few hundred issues, move the review board into one
  comment per domain and link them from the body.

### Phase 3: Review, oldest first, in batches

Old issues are the most likely to be stale, fixed or duplicated, so the backlog
shrinks fastest from the bottom. Take the next batch from the Review section. When
the harness allows, split a batch across parallel checkers of about four issues
each; every checker gets the same brief.

**The checker's brief — five questions, one verdict, evidence for each:**

1. **Still relevant?** Yes, partly or no, and why — against today's code and the
   decisions made since. If already fixed, name the commit or PR.
2. **Does the description need an update?** The code moved, numbers changed, the
   understanding changed, the owner decided something. If so, the one to three
   corrections.
3. **What concept is it about?** A short noun phrase: "order history", "QR door
   security", "voice budget".
4. **Where does it sit in the order?** One line in a fixed grammar: `★ unblocks
   #…` · `after #n` · `with #n` (one unit of work) · `independent`. "Before #n"
   is "unblocks #n", and makes it ★. This confirms or moves the overview's tier
   and feeds Next up.
5. **Has a PR already covered part of it?** Number, state, which part.

An issue this review filed itself was written from verified evidence at the
snapshot commit, so it needs only concept and order. Everything else gets all five
questions however new it is: a filing date proves nothing about relevance.

**Verdict**, one of:

| Verdict | When |
|---|---|
| ✔ **KEEP** | right as written; give it a priority |
| ✏️ **UPDATE** | still wanted; the description must change — list the corrections; give it a priority. Say when the stale text would mislead a picker (a closed blocker named, a wrong status): those go first |
| 🔀 **MERGE INTO #n** | the same problem as another issue, in other words |
| 🗑️ **CLOSE** | done or obsolete — name the commit or PR that makes it so |
| ❓ **ASK OWNER** | needs a decision only a person can make — state the question |

"Looks done" is not a verdict. Every claim carries `file:line`, a commit or a PR. An
all-KEEP batch is a signal to recheck the batch, not a result.

**Priority** (KEEP and UPDATE only) — how much it costs to leave the issue undone.
Keep it apart from tier (what stands on it), readiness (can anyone start?) and weight
(how hard is it?). A P0 can be parked; a heavy issue can be P3; a fundamental can be
P2.

| Level | Meaning | Typical |
|---|---|---|
| **P0** | active harm now; drop everything | data exposed across customers, money wrong, production down, an exploitable hole |
| **P1** | hurts users in normal operation, or a fundamental that P1 work stands on | a defect on ordinary days; the base of a planned feature |
| **P2** | real but bounded: rare trigger, a workaround exists, small reach | an unusual sequence; an admin-only rough edge |
| **P3** | backlog | polish, ideas, future-proofing |

Adjust: a fundamental takes the highest priority of anything waiting on it; an open
time window (a launch, a demo, a contract) raises it while open; a tiny fix for a
real harm moves up a little, no further; a risk never reproduced keeps its level and
says so.

**The record** — one per issue, folded, in the batch comment:

```markdown
## Batch 2 evidence: #64–#480 (15 issues) · checked at `a189bdab`

Nothing on GitHub or in the repository was changed. One-line summaries are on the board.

<details><summary><b>#35</b> The owner adds products and permanently archives them… — <b>UPDATE · P2</b></summary>

- **Area:** Restaurant OS · owner panel & menu
- **Relevant:** partly — the archive path still deletes; the "products" half landed in #395.
- **Update:** yes — (1) drop the products half; (2) the archive call is now `menu/lifecycle.py:88`; (3) the example dish no longer exists.
- **Concept:** dish lifecycle
- **Order:** ◆ after #395; nothing stands on it.
- **PRs:** none for #35. #396 merged — covered the products half.
- **Verdict:** UPDATE · P2 — still wanted for the archive half; rewrite around it.
- **Evidence:** `menu/lifecycle.py:88`; PR #396; commit `c41e0f2`.

</details>
```

Save it as `devdocs/issue_analysis/batch_<N>.md`, post it, then update the board:

```
gh issue comment <board> --body-file devdocs/issue_analysis/batch_2.md
```

**After each batch:**

1. Fill the batch's review rows: Concept · Verdict · Evidence.
2. Move any issue whose tier changed (question 4) between the rows of view 3.
3. Add every CLOSE, MERGE, UPDATE and ASK as one row in **Needs a decision**, and
   anything found but unfiled as a `—` row with 📝. Search all titles, open and
   closed, before calling anything unfiled.
4. **Group by concept.** Issues sharing a concept are often duplicates or parts of
   one piece of work — propose the merge. A concept many issues depend on is a
   fundamental: mark it ★. Refresh the Concepts table.
5. Refresh **Next up** from the tiers, the order lines and the priorities.
6. Tick the batch in the Review section with its verdict mix, set the one-by-one
   row's state (and `done · date` after the last batch), and stamp the header.

### Phase 4: Act, only on a yes

The AI proposes; people decide. Closing, editing a description, merging, relabelling
and filing wait for an explicit yes per item, from the Needs-a-decision table or the
comment thread. On a yes:

- **CLOSE** → `gh issue close <n> --comment "<the record's verdict line>"`
- **MERGE INTO #n** → comment the link on both; close the duplicate.
- **UPDATE** → correct the stale lines in place and add one dated line at the top
  of the body saying what changed. GitHub keeps the edit history; do not fold the
  original into the body.
- **ASK, answered** → write the answer as a comment on the issue (and into its
  body when it changes the scope). The answer lives there, not on the board.
- **Found, not filed** → `gh issue create` with the evidence.

Before acting, check the code has not moved past the snapshot
(`git log <snapshot>..<trunk> --oneline`); if it has, re-check that issue first.
Then **remove the row** from Needs a decision, drop the issue from the three views
and the review board if it closed, add the new number to the views if one was
filed, and stamp the header. No row is ever marked done; it is gone.

### Phase 5: Refresh — the skill run again, a week or a month later

The board is the same issue; a refresh brings it up to date in place. Nothing in
it is rebuilt from scratch except what the overview derives: status marks and the
three views. Everything people and the review put in — verdicts, tiers, concepts,
claims — is kept.

1. **Pull the live body** (Phase 2's first command). Note its "updated" date: that
   is the last-run date every comparison below uses.
2. **Rerun Phase 1** on today's backlog, at today's trunk commit.
3. **Diff against the board** and apply, in this order:

   | Change since the last run | What the board does |
   |---|---|
   | an issue closed | drops out of the three views and the review board; its Needs-a-decision row goes (the decision was taken on the issue) |
   | an issue filed | enters the three views with its marks and gets a review row with `·`; the one-by-one row goes back to *in progress* with the new count; these form the next batch |
   | a status moved (a PR opened or merged, a branch gained commits) | the mark changes everywhere the number appears |
   | an issue's body edited after its batch | its verdict is kept but the issue joins the next batch for a re-check |
   | a Needs-a-decision row's issue has a comment from the owner newer than the last run | read it; if it answers the row, do Phase 4 for it and remove the row |
   | the owner changed the domains or areas | re-cut view 2 and the review board; nothing else |

4. **Rebuild what derives from the rest:** the three views' counts, Next up,
   the Concepts table (closed issues leave their concept; a concept with no open
   issue leaves the table).
5. **Set the Review section:** Overview row to today's date and commit; the
   one-by-one row to *in progress* if new issues arrived, otherwise unchanged;
   Owner answers to the rows still open.
6. **Post the body back,** stamp the header, and leave one comment on the board:
   `Refresh <date>: <n> closed · <n> new · <n> status changes · <n> decisions
   taken.` One line, so people watching the issue learn that it moved; the detail
   is in the body.
7. **Review the new issues** as the next batch (Phase 3).

A refresh never re-opens a decision the owner already made: parked stays parked,
a verdict stands until the issue's body changes, and someone else's in-progress
work is reported, not taken over.

---

## Guardrails

- **One board, kept for good.** Title `Issue overview`, label `board`, pinned. A
  refresh updates it in place; nothing ever creates a second one or renames it.
- **Evidence for every claim.** A verdict without a commit, PR or `file:line` is an
  opinion.
- **Date the snapshot.** State the commit; re-verify before acting if the code moved.
- **Respect decisions and other people's work.** Edit only your own rows; pull the
  live body before each edit.
- **Never re-file what exists.** Search every title, open and closed, first.
- **Security findings** describe the class of weakness and its preconditions, never
  an exploit.

## Failure modes

| Failure | Looks like | Guard |
|---|---|---|
| Branch = progress | 🔷 given to empty branches | commits ahead of trunk, or it is ⚪ |
| Closing on the title | closed because the title "sounds done" | question 1 requires a commit or PR |
| Keep-everything | every verdict is KEEP | track the verdict mix; recheck an all-KEEP batch |
| Everything fundamental | half the backlog is ★ | ★ needs a named issue that stands on it |
| Stale snapshot | verdicts on code that has since moved | stamp the commit; re-check before acting |
| Duplicates missed | one problem, two issues, different words | the concept column; group after each batch |
| Priority by loudness | recent or emotional issues ranked first | the priority rule: leverage and evidence |
| A board nobody reads | a wall of text | decisions and people first; the three views; detail folded |
| Board as log | rows annotated "✅ answered", "closed on …" piling up under the decisions | a decided row leaves; the decision is written on the issue; history lives in the thread |
| Work done twice | two people on the same issue | claim in a comment; the Who's-on-what lane |
| A second board | a new overview issue because the old one was not found, or a title that carries the count | fixed title, label and pin; search by exact title before creating |

## What this skill is not

- Not triage of one issue. It reads the whole backlog, and its unit is the batch.
- Not a project board. GitHub Projects can render the same rows as columns; the
  tracker issue stays where the reasoning and evidence live.
- Not an executor. It never closes, edits, merges or files without a yes.
