---
name: spec-writing
description: >
  Write SPEC.md contracts: goal, non-goals, and acceptance criteria with stable
  IDs (AC-1..N) where each criterion is an observable, testable behavior paired
  with the check that proves it. Converts requirements into a verification
  contract before implementation. Use when bootstrapping a project (SPEC.md of
  the product), when starting a large multi-step task (mini-SPEC in the task
  message), or when acceptance criteria are requested. Triggers: "write the
  spec", "acceptance criteria", "SPEC.md", "especificación", "criterios de
  aceptación", "tarea grande". NOT for small single-file tasks — a clear task
  message is its own spec.
---

# Spec Writing

A SPEC is a contract, not documentation: it defines what "done" means before work starts, in terms that can be verified mechanically or by inspection.

## When To Use

- Bootstrap of a new project: write the product SPEC.md after discovery, before architecture.
- A large task (feature, redesign, multi-step change): a mini-SPEC in the task message — goal + 3-5 acceptance criteria.
- Whenever the user asks for acceptance criteria or a specification.
- NOT for small tasks: if the change is single-purpose and obvious, the task message is the spec.

## SPEC.md Structure

```markdown
# SPEC — <name>

## Goal
One paragraph: what this is, for whom, and the problem it solves.
No implementation language here — the goal survives a stack change.

## Non-goals
What we deliberately will NOT build, stated explicitly.
Non-goals are the anti-scope contract: they kill feature creep and
over-engineering before it starts. ("No multi-user. No sync. No theming.")

## Acceptance Criteria
AC-1: <observable behavior> — verify: <command or inspection>
AC-2: ...

## Open questions
Unresolved decisions that materially affect the design, each with the
default that will be used if it stays unanswered.
```

## Writing Acceptance Criteria

- Each AC describes **observable behavior**: what the user can do, what an API returns, what is persisted, how errors behave, what happens at the edge. Never implementation details — unless the detail IS the requirement.
- Each AC is **testable as written**: pair it with its check (command, test, or inspection step). An AC without a check is a wish, not a criterion.
- **IDs are stable**: AC-1 is AC-1 forever. New criteria append (AC-N+1); never renumber — other documents, commits, and reports reference these IDs.
- Cover the failure paths, not only the happy path: error behavior, empty input, and rollback/degradation where relevant. A SPEC that only specifies success is half a spec.
- Size to the work: a personal CLI tool needs 3-6 ACs; a product pilot 8-15. If the list exceeds ~15, the scope is probably several tasks — split them.

## Discipline

- One task per prompt: a SPEC defines one coherent deliverable. If work needs multiple sessions, each session's task maps to specific ACs.
- The SPEC wins conflicts: if mid-work the implementation and the SPEC disagree, either the code is wrong or the SPEC must be **amended explicitly** (declare the amendment and why — never drift silently).
- Do not spec the deducible: anything the repository already establishes (stack, conventions) is referenced, not restated.
- Open questions carry defaults: each unanswered question states the assumption that will be used, so work never blocks on it.

## Verification of the SPEC Itself

Before implementation begins, the SPEC passes:

1. Every AC has a verify step. (Unverifiable AC → rewrite it or move it to non-goals.)
2. Goal and non-goals are separable from any specific implementation.
3. No two ACs contradict each other.
4. The set of ACs, if all verified, actually means "done" for the goal.

## Safety

- Never declare a task complete while an AC is unverified — report which ACs pass, which fail, which are blocked, with evidence per AC.
- Never weaken an AC to make it pass; amend the SPEC explicitly if the requirement genuinely changed.
- A SPEC amendment mid-work is declared in the report, with the reason.
