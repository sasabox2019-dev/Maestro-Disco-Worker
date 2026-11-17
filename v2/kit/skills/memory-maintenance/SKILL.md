---
name: memory-maintenance
description: >
  Keeping project memory alive and true: what counts as durable knowledge,
  when memory must be updated (the seven-question list), in-place editing with
  one authoritative location per fact, DECISIONS.md with lifecycle
  (active/superseded ADRs), detecting and curing staleness (documentation that
  contradicts code), progressive reading discipline, and the AGENTS.md-as-
  entry-point contract. Use after meaningful changes, when documentation drifts
  from code, when updating AGENTS.md or DECISIONS.md, or when auditing project
  memory. Triggers: "update the docs", "AGENTS.md", "DECISIONS.md", "stale
  docs", "ADR", "documenta", "actualiza la memoria", "sincronizar docs".
---

# Memory Maintenance

## When To Use

- After a meaningful change: deciding whether project memory needs updating, and what.
- Documentation and code disagree — someone must be fixed.
- Updating AGENTS.md, DECISIONS.md, or deeper docs; auditing memory health.

## What Memory Is For

The conversation is temporary; the disk is durable. Project memory = `AGENTS.md` (the door) + `DECISIONS.md` (the why) + deeper docs + Git history. The bar: **the project must be continuable — by another conversation, another model, another engineer, months later — without any past chat.** If essential knowledge lives only in a conversation, it does not exist.

## The Update Question

After each meaningful change, ask:

1. Did architecture change?
2. Did project structure change?
3. Did commands change?
4. Did an important technical decision change?
5. Did public/observable behavior change?
6. Did deployment change?
7. Did an important operational procedure change?

Any **yes** → update the corresponding memory **in the same change**, before the commit. All no → write nothing: documentation for ceremony is noise that rots.

## In-Place, Single Source

- Update in place. Never append historical layers — history belongs to Git, not to the working file.
- Remove obsolete instructions; preserve useful decisions (ADR state carries the history).
- **One authoritative location per piece of knowledge**; link, don't duplicate — copies diverge and become lies.
- Documentation must never become a second, conflicting implementation of the project.

## DECISIONS.md with Lifecycle

Each decision is an ADR: **Estado** (activa · superada por D-XX · obsoleta) · fecha · contexto · decisión · alternativas · consecuencias.

- Superseding a decision edits the old one in place — marks its Estado and links to the successor — and writes the new ADR. Never append a contradicting decision while the old one still claims to be active.
- Two active decisions that contradict each other are a defect: resolve it the moment you find it.
- Trivial implementation choices are not ADRs; decisions with consequences are.

## Detecting and Curing Staleness

AGENTS.md is the first source to consult — not an oracle. Use it as an index; follow its links; verify against repository evidence.

- When documentation contradicts the code: investigate which reflects reality, fix the stale side, and record what changed. Never obey stale documentation over current evidence — and never "fix" the code to match stale docs without confirming intent.
- Staleness tells: documented commands that fail · cited paths that don't exist · decisions contradicting each other or the code · docs describing behavior the project no longer has.
- In v2 projects, `scripts/verificar.sh --full` runs the memory doctor: cited paths exist, cited commands run, ADR format valid, staleness warnings (source changed without memory changes in recent commits). Red doctor = fix memory, not silence the check.

## Progressive Reading

Load memory in the order of cheapness: `AGENTS.md` → Git state → task scope → the specific relevant docs → relevant source and tests → deeper investigation only when evidence requires it.

A button change does not need the migration docs. A migration needs architecture, schema, and decisions. Sufficient understanding is the goal — not maximum reading, and not reading nothing.

## What Not to Store

No conversation debris, no private context, no hidden reasoning, no model-specific instructions, no restatement of what the code already says. The double test before writing any memory entry: **(1)** can the agent find this by reading the code? **(2)** would it go looking there? Both yes → it does not go in memory. Memory holds what the repository cannot say about itself: commands, constraints, gotchas, decisions and their reasons, where-to-look-next.

## Safety

- Never leave documentation contradicting code at handoff — fix the stale side in the same change.
- Never append historical layers to working documents; never delete a decision's history — retire it with Estado.
- Never let a superseded decision keep operating as if active.
