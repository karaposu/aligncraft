# Small Summary

## What this project is about

This repository is mainly a writing-and-workflow project for AI-assisted software development. The code shows two connected things:

1. A book called **AlignCraft**, built as a website from Markdown chapters.
2. A reusable pack of commands, skills, and file conventions meant to guide tools like Codex or Claude through structured software work.

So this is less a traditional app and more a method: it teaches a way of working with AI, and it also ships the actual prompts and scripts needed to use that method.

## What it currently does

From the files that are actually wired together today, the project already does a few concrete things:

- It builds a static documentation/book site from the `src/` folder using `mdBook`.
- It deploys that site to GitHub Pages through the GitHub Actions workflow.
- It provides installer scripts that download or transform the command set into formats usable by Claude Code and Codex.
- It includes a hook that automatically adds metadata to files written under `devdocs/`.
- It includes a structural checking script that validates whether discipline outputs contain the expected sections.

The command set itself is substantial. It defines repeatable workflows for:

- clarifying a task
- planning work
- critiquing plans
- understanding existing codebases
- creating project documentation
- running inquiry loops across multiple thinking steps
- producing summaries, roadmaps, traces, and improvement reports

In practice, this means the repo already works as a **playbook plus installable prompt toolkit** for people doing software work with AI assistants.

## What it appears to be trying to do

The code also shows a larger ambition that is only partly complete.

It is trying to become a full operating system for AI-assisted development work: not just single prompts, but a structured loop where AI can explore a problem, make sense of it, break it apart, generate ideas, critique them, save the outputs into folders, and resume later.

There are clear signs this bigger system is still in progress:

- some chapters are explicitly marked unfinished
- some loop components are described as first drafts or primitive versions
- several disciplines are listed as planned rather than built
- a large amount of repo content is exploratory notes, inquiries, and evolving design material rather than settled product behavior

So the working core exists, but the broader self-improving loop the project points toward is still under active design.

## Who would use this and why

This looks aimed at:

- developers who use AI coding assistants heavily
- teams that want more structure around AI-generated work
- people writing internal prompt systems, command packs, or AI working methods
- readers who want a methodology for keeping AI work understandable, traceable, and reviewable

They would use it to reduce confusion, create shared working artifacts, and make AI-driven development feel less ad hoc.

## General shape of the project

This is **not** primarily a web app, API, or library.

Its current shape is:

- a publishable book/documentation site
- a command and skill pack for AI coding tools
- a small set of helper scripts and hooks
- a large working knowledge base of experiments, inquiries, and methodology drafts

The most honest plain-language description is:

**a methodology product with working installation scripts and reusable AI workflow commands, plus a book that explains the system and a large amount of in-progress thinking around where it should go next.**
