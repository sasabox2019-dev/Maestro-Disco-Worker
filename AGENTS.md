# AGENTS.md — Maestro-Disco-Worker

<!--
  The toolkit repository itself, indexed by its own template
  (v2/plantillas/AGENTS.md): an operational index, not documentation.
-->

## Overview

The "Master → Disk → Worker" system for building software with AI agents: a bootstrap nucleus, a continuation worker, 12 Agent Skills, and mechanical-verification templates — usable from any chat app with file access.

## Map

- `v2/1-nucleo/` — master boot card + nucleus (new projects)
- `v2/2-worker/` — worker boot card + contract (continuation sessions)
- `v2/kit/skills/` — the 12 Agent Skills (copied into projects at bootstrap F4)
- `v2/plantillas/` — AGENTS / DECISIONS-ADR / SPEC templates, `verificar.sh`, `pre-commit`
- `v2/Manual-v2.md` — field manual, EN + ES (day-one flows, tours, rotation, tags)
- `v2/LEDGER.md` — error ledger (escapes → checks)

## Commands

- Syntax-check the shell templates:
  `sh -n v2/plantillas/verificar.sh && sh -n v2/plantillas/pre-commit`
- This repository is documents + templates: no build and no test suite of its own.

## Rules

- Agent-facing contracts and skills are English; human-facing docs are bilingual (EN + ES).
- Never edit history in place: changes land as commits on neutral branches (`docs/…`, `fix/…`, `limpieza/…`), merged by pull request; `main` is protected.
- Commit messages describe the work, never the tool that made it (Manual § Branches and commits).
- The skills are the system's knowledge: keep each under 500 lines, keep the frontmatter contract (name = folder name, description with triggers), and justify any change — every downstream project inherits it.
- Markdown uses UTF-8; shell templates stay boring-POSIX (no unicode in logic lines).

## Deeper

Read `v2/Manual-v2.md` before making non-trivial changes to this repository.
