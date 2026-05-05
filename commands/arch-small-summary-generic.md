# /arch-small-summary — Non-Technical Project Summary from Code

Read all code files in the project and produce a non-technical summary of what this project is and does — based purely on what the code shows, not what documentation claims.

## Additional Input/Instructions

$ARGUMENTS

---

## Instructions

1. Read all files in the codebase fully except inquiries folder. Inquiries folder includes nested folders and each folder there including the root ones has finding.md files.  they are the cannon files to read and other fiels in docarchive is not important and shuld be skipped. 

 Focus on source code — ignore existing documentation, READMEs, and comments that describe intent rather than behavior.


 Start by reading tree output of this repo/project, focus on cannon files like codefiles

Note: There is a high chance this is an actively developed project and there are misalignments or asyncrenized versions in documentations and artifact files (codes etc). 

Read every first-party source-of-truth artifact (code + Markdown) in full. The one exception is devdocs/inquiries/,  which has special structure: each inquiry is a folder (sometimes nested) and each folder's finding.md is the canonical record. Do not read other files inside those folders — anything under docarchive/ is superseded intermediate work and should be skipped.




2. Based on whole project context, write a non-technical summary covering:
   - What the project is about (in plain language)
   - What it currently does (working functionality)
   - What it appears to be trying to do (partially implemented or in-progress)
   - Who would use this and why
   - The general shape of the project (is it a web app, structured methodology notes,  a CLI tool, a library, an API, etc.)

3. Keep it readable by a non-engineer. Avoid jargon. If a technical concept is essential, explain it briefly in parentheses.

4. Be honest about the state of things — if something looks half-built, say so. If something looks abandoned, note it.

### Output

By default, save the summary to `devdocs/archaeology/project_summary.md` (create the directory if needed) and print it in the conversation.
If that file already exists, overwrite it completely — do not append or patch, rewrite the whole thing fresh.

**If `-n` is passed:** print in conversation only, don't write a file.
