# /elaborate — Rephrase for Alignment Verification

Take the input below and rephrase it,  clearer, more structured, more understandable. Use your understanding of the already developed context (can be about codebase workspace, or past conversation regarding this topic etc) to interpret what the input material means and fill in obvious gaps to make it more explicit. 

If you dont have any developed relevant context output that the elaboration will be done without relevant context in pure way in terminal as a warning. 

## Input

$ARGUMENTS

## Instructions

1. Consume the input fully and correctly. It can be markdown, file path with code or text files, image paths, MCP links. if file path is given 

   - if file path is given read the files fully. .
   - if file image or image paths are given consume the images
   - additional text or commands should be respected as well. 

2. If relevant, use codebase context to understand what the content is referring to (existing modules, patterns, terminology).
3. Rephrase the input in clear, precise language. Make it structured and easy to follow — organize scattered thoughts, group related ideas, clarify vague phrasing. Keep the content's intent intact, don't reshape it into a format they didn't ask for.
4. After the rephrased version, add:
   - **Ambiguities Section**: Anything that is unclear for you, has multiple interpretations, or needs a decision to make sense of the rest of the material — list these explicitly in form of questions 

### Output

output this in devdocs as elaboration.md where the input source material is located in devdocs already. If input was not in devdocs then you can use mkdir command to create a subfolder with relevant name and create it there

if the input covers distinct topics or is large enough to warrant it split into multiple files. But this is only needed if material is really huge and long. if this is the case under devdocs and relevant folder you can create elaboration folder and under it you can create multiple markdown files (use a short descriptive name based on the content).. But again, this is rare case. 

## Purpose

The primary goal is to take messy, scattered input and make it tidy — structured, clear, and easy to read. As a side effect, this also serves as an alignment check: if the rephrased version doesn't match intent, it gets caught here rather than three steps later. Only flag ambiguities that actually matter for moving forward — don't nitpick.


