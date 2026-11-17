# SPEC — <name>

<!--
  Template: plantillas/SPEC.md (system v2.0).
  Coherent with skills/spec-writing/SKILL.md -- the skill is the authority:
  - Every AC is an observable behavior paired with the check that proves it.
  - IDs are stable forever: AC-1 is AC-1; new criteria append, never renumber.
  - The SPEC wins conflicts: drift is fixed or the SPEC is amended EXPLICITLY.
  - Open questions always carry the default used if they stay unanswered.
-->

## Goal

<One paragraph: what this is, for whom, and the problem it solves.
No implementation language here -- the goal survives a stack change.>

## Non-goals

<What we deliberately will NOT build. The anti-scope contract:
"name the temptations so they are refused on sight.">

## Acceptance Criteria

<!-- Each AC: observable behavior - verify: the exact command or inspection. -->

- AC-1: <observable behavior> — verify: <command or inspection>
- AC-2: <observable behavior, including a failure path> — verify: <command or inspection>
- AC-3: ...

## Open questions

<!-- Each with the default that will be used if it stays unanswered. -->

- <question that materially affects the design>? — default: <the assumption to build on>
