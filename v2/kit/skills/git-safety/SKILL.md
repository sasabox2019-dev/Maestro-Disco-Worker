---
name: git-safety
description: >
  Git as a safety and history mechanism during feature work: inspect state
  before changing, protect all pre-existing user work (committed or not),
  coherent checkpoints, recovery before destructive operations, file safety on
  overwrite, and change isolation so every diff is attributable to its task.
  Use whenever touching Git (status, commit, branch, stash, reset, clean) or
  overwriting files. Triggers: "commit", "checkpoint", "git status", "reset",
  "discard changes", "stash", "recover my changes", "haz commit", "deshacer
  cambios". The rule: Git status does not define what belongs to the user.
---

# Git Safety

## When To Use

- Before and during any change to an existing repository.
- Creating commits or checkpoints.
- Any potentially destructive or hard-to-reverse operation.
- Overwriting existing files, or accepting automated tool edits.

## Before Meaningful Changes

- Inspect `git status`; understand the current branch and recent history when relevant; identify existing modifications.
- Uncommitted work may be intentional and must be preserved — never assume uncommitted means disposable.
- Never: reset user work · clean user files · revert user changes · overwrite user modifications · delete untracked user files · stash user work · rewrite history — without explicit authorization.
- A commit does not make pre-existing user work yours to modify.

## Protected Work

All pre-existing user work is protected by default: committed · staged · unstaged · untracked files · local configuration · generated local state · work not yet in Git.

When the task overlaps existing user changes: inspect carefully · preserve them · modify only what is necessary · avoid destructive operations · explain conflicts when they materially affect the implementation. If the requested operation cannot be performed safely, stop and ask.

## Checkpoints

A checkpoint represents a meaningful, recoverable state: initial foundation · working architecture · completed feature · migration · validated milestone.

- Follow the project's existing commit conventions and message style.
- Never commit secrets, temporary files, debug artifacts, or generated files the project excludes.
- No noise commits to increase count; no unrelated changes inside a commit.
- Never amend or rewrite existing user commits without authorization.

## Recovery Before Destructive Operations

Git is version control, not a complete backup. Before a destructive or high-risk operation:

1. Verify the target (what exactly will be affected).
2. Verify the scope (blast radius).
3. Understand rollback (how to undo it).
4. Prefer dry runs or previews when available.
5. Create a recoverable checkpoint when appropriate.

Being tracked by Git does not make something safe to destroy. For important generated or external state, follow the project's existing backup strategy — no random backup copies scattered through the repo; if a local backup is needed, keep it organized and clearly distinct from source-controlled files.

## File Safety

Before overwriting an existing file:

- inspect its relevant contents; understand existing custom logic; preserve unrelated behavior;
- prefer a focused edit over replacing the entire file; never blindly regenerate configuration files.

When automated tools (generators, formatters, codemods, scaffolders) modify files: understand their likely scope before running · restrict scope where possible · review the resulting diff · verify changes are expected · revert accidental unrelated modifications.

## Change Isolation

Keep changes attributable to the current task. Before completion, identify every file created, changed, or deleted — including generated files, migrations, documentation, and configuration. Unexpected changes require investigation, never normalization as "cleanup".

If you make an unintended change:

1. Stop.
2. Identify exactly what changed.
3. Determine whether it overlaps pre-existing user work.
4. Recover only the changes you introduced — no broad reset/revert/clean that could destroy user work.
5. Re-check the diff.

If recovery cannot be performed safely, stop and report rather than risk additional damage.

## Safety

- Never perform destructive Git operations on user work without explicit authorization — this outranks convenience, always.
- Never rewrite public/shared history.
- Never let a "clean working tree" be achieved by destroying or hiding user changes.
