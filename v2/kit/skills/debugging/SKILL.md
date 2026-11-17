---
name: debugging
description: >
  The debugging protocol: observe (read the real error) → localize (where it
  originates) → classify (your change / pre-existing / environment / tool) →
  hypothesize (concrete and testable) → verify → smallest correction →
  re-validate. Covers tool failures, pre-existing failures and baseline
  discipline, recovery from your own mistakes without panic-fixing, and
  "impossible" states (re-verify bytes before theorizing). Use whenever
  anything fails: tests, builds, runtime errors, tool errors. Triggers:
  "fails", "error", "bug", "traceback", "crash", "no funciona", "falla",
  "se rompió", "tests rojos".
---

# Debugging

## When To Use

- Any failure: test red, build broken, runtime error, tool error, unexpected behavior.
- Deciding whether a failure is yours, pre-existing, or environmental.
- Recovering after your own change broke something.

## The Protocol

1. **Observe** — read the actual error output. All of it. The real message, not the summary you expect.
2. **Localize** — identify where the failure originates: which component, which line, which interaction.
3. **Classify** — caused by your changes · pre-existing · environment · transient · tool.
4. **Hypothesize** — one concrete, testable hypothesis. "Maybe something somewhere" is not a hypothesis.
5. **Verify** — prove or kill the hypothesis with evidence (repro, probe, log, bisect) before touching code.
6. **Correct** — the smallest appropriate correction.
7. **Re-validate** — re-run the relevant validation; confirm the fix causes the expected change and nothing else.

Core rules: never randomly change code until the error disappears — that is not debugging, it is dice. If a fix does not work, the diagnosis was wrong: stop, re-examine, do not stack fixes on a dead hypothesis.

## Classify the Failure

- **Your changes**: failure appears in code you touched or its direct blast radius. Establish this with evidence — diff, bisect, before/after — not with hope.
- **Pre-existing**: it failed before your work. When state is unclear, establish a baseline: run the relevant checks before changing anything.
- **Environment / transient**: missing tooling, network, permissions, stale caches (a stale `__pycache__` once made broken code pass tests — purge caches before trusting a green run), flaky timing.
- **Tool failure**: see below.

## Pre-Existing Failures

Report pre-existing failures clearly and distinguish them from yours — never let them hide inside "the suite passes". Do not fix unrelated failing code merely to obtain a green result: report it and continue. If work must proceed around it, document what is failing, why, and what was verified anyway.

## Tool Failures

When a tool fails: read the actual error before theorizing about cause. If the output is opaque, re-run with more verbosity or a smaller reproduction. If the tool writes to disk (compiler, formatter, generator), verify the result **on disk** — never trust the tool's self-report of success; compare what it claims against what exists. Persistent environment failures get reported with everything attempted — never silently retried into oblivion.

## Recovery From Your Own Mistakes

When your change breaks something:

1. Stop. Do not pile a second speculative change onto a broken first one.
2. Understand what happened: read the error, compare before/after, identify the exact regression.
3. If needed, revert to the last known good state and re-approach deliberately.
4. Recover only your own changes — never a broad reset/revert/clean that could sweep user work (see `skills/git-safety/SKILL.md`).
5. Document the lesson — an escape that no check caught becomes a check (v2: it goes to the Ledger).

## Impossible States

When the system reports something "impossible" — the file on disk differs from what was written, an edit appears applied but the behavior says otherwise — **re-verify the bytes before theorizing**. Read the file fresh, check for corruption literals (`undefined` identifiers, truncated lines, NUL bytes), verify you are looking at the path you think you are. Real-world escapes: corrupted writes that passed several reviews, and stale bytecode masks that hid broken code. The disk is the truth; the conversation's memory of writing is not.

## Safety

- Never panic-fix; never stack speculative changes.
- Never weaken a test or check to escape a red.
- Never hide or bury a pre-existing failure inside a passing summary.
