# AGENTS.md — <project name>

<!--
  Template: plantillas/AGENTS.md (system v2.0). Instantiated at bootstrap F4.
  Laws of this file:
  - Under 150 lines once instantiated. It is an operational INDEX, not documentation.
  - Double test before adding any line: (1) can the agent find this by reading the
    code? (2) would it go looking there? Both yes -> it does not belong here.
  - Commands must be real: executed at least once, never invented.
  - Edit in place. When structure changes, the map changes in the same commit.
-->

## Overview

<One line: what this project is and for whom.>

## Commands (exact, verified)

- Setup: `<command>`
- Run: `<command>`
- Fast check (after each edit): `./scripts/verificar.sh --fast`
- Full verification (before every commit): `./scripts/verificar.sh --full`
- <other project commands: build, lint, data export...>

## Non-deducible rules

<Rules an agent cannot derive from the code and would not guess. Examples of the kind
(not to keep verbatim): data files are user data, never commit or truncate them;
deployment is manual via X and never runs without explicit authorization; project
decisions live in DECISIONS.md and breaking one requires the user's explicit call.>

## Gotchas (paid-for lessons)

<Surprises that cost time once, so they never cost it again. Examples of the kind:
buttons inside HTML forms default to type=submit and die silently; a stale
__pycache__ once made broken code pass tests; "today" is ambiguous across
timezones. Keep the ones that apply to this stack.>

## Memory

- Decisions (ADR, edited in place): `DECISIONS.md`
- Product contract: `SPEC.md`
- Project error ledger (if it exists): `<path>`

## Skills (trigger: condition -> read `skills/<name>/SKILL.md` first)

| Condition | Skill |
|---|---|
| Ownership rules of the repo; how this project is run | bootstrap-foundation |
| Large task needing a mini-SPEC; acceptance criteria | spec-writing |
| Data model, API contracts, migrations, structure | architecture-design |
| Implementation, naming, UI states, forms | code-quality |
| Adding or updating tests; validation depth | testing |
| Anything fails; impossible states; tool errors | debugging |
| Commits, checkpoints, destructive operations | git-safety |
| User input, auth, secrets, paths, outbound calls | security |
| Async work, retries, timeouts, edge cases | concurrency-reliability |
| Updating this file, DECISIONS.md, or any project doc | memory-maintenance |
| Declaring done; final checklist; report evidence | verification-reporting |
| Big change ready to merge (fresh chat only) | code-reviewer |

## Working protocol

One edit per step, verifying the touched file before continuing · `--fast` after
each edit, `--full` before every commit (the pre-commit hook enforces it) · on an
"impossible" error, re-verify the bytes before theorizing · memory updates land in
the same change that alters durable facts · reports carry pasted evidence:
command + exit code + numeric summary.
