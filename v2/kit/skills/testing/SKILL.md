---
name: testing
description: >
  Test strategy for behavioral changes: add appropriate tests in the project's
  existing style, coverage proportional to risk (not 100% dogma, not zero),
  absolute test integrity (never weaken or delete an assertion to make a suite
  pass), and progressive validation from narrowest check to broadest. Use when
  implementing meaningful behavior, fixing bugs, or when tests fail. Triggers:
  "tests", "add tests", "test coverage", "the suite fails", "unit test",
  "regression", "cobertura", "suite de tests". NOT for pure docs or config
  changes with no behavioral surface.
---

# Testing

## When To Use

- Implementing a meaningful behavioral change (feature, bug fix, data handling).
- A test suite exists and the task touches covered behavior.
- Deciding how much to test and what kind of validation to run.

## What Gets Tested

For meaningful behavioral changes, add or update appropriate tests:

- Follow the project's existing testing style, framework, and conventions.
- Test **observable behavior**: inputs → outputs, API contracts, CLI exit codes, persisted state, error responses — not implementation internals, unless the internal detail is itself the contract.
- Cover the important edge cases: empty/null input, boundaries, duplicates, ordering, state transitions.
- Cover failure paths where relevant: invalid input, missing resources, network/data errors, rollback behavior.

## Coverage Proportional to Risk

Testing is not distributed uniformly. Priority order:

1. Core domain logic and business rules
2. Security-relevant behavior (auth, validation, injection surfaces)
3. Data integrity (persistence, migrations, destructive operations)
4. Tricky foundations: dates, money, timezones, unicode, concurrency
5. Regression-prone integrations and recently broken areas

Lower value: trivial accessors, generated code, pure cosmetics — do not manufacture tests for ceremony. Neither "100% coverage" dogma nor zero tests for meaningful behavior. If the project has no test infrastructure, bootstrap the minimum the stack makes idiomatic — never import a heavyweight framework the project does not use.

## Test Integrity

- **Never weaken, delete, or skip an assertion to make a suite pass.** A red test is information about the system, not an obstacle to green.
- A legitimately obsolete test (behavior intentionally changed) is replaced with an equivalent-coverage test, deliberately and declared in the report.
- When a requirement changes, its tests change in the same task — tests document intent; drifting tests document lies.
- Never "fix" the test by matching it to broken code: decide which side is wrong (spec/test vs implementation) with evidence.

## Progressive Validation

Validate in widening circles, cheapest evidence first:

1. The narrowest relevant test (the one covering the touched behavior).
2. The related suite (module, feature, domain).
3. Static checks: type check, lint, format, build — as the project defines them.
4. Broader validation (integration, E2E, full suite) when the risk justifies it.

In a project with `scripts/verificar.sh`: `--fast` after each edit, `--full` before every commit — the pre-commit hook enforces it anyway. Do not run expensive validation blindly; do not skip it blindly either — risk decides.

## On Failures

Tool failures, pre-existing failures, and the debugging protocol (observe → localize → classify → hypothesize → verify) live in `skills/debugging/SKILL.md` — read it when something is red.

## Safety

- Never weaken a test to pass it; never delete a failing test; never skip without declaring it and why.
- A suite that is red at handoff is reported with the failure and its diagnosis — never silenced.
