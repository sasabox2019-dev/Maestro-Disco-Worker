---
name: verification-reporting
description: >
  The language and standard of verification: Verified/Assumed/Unknown/Blocked,
  matching each claim to evidence that can actually prove it, bounded pasted
  evidence (command + exit code + numeric summary), blocked-work protocol, the
  completion standard, and the final checklist before declaring a task done.
  Use whenever reporting results, declaring work complete, or evaluating someone
  else's claims (including your own past statements). Triggers: "verified",
  "done", "reporte final", "checklist final", "is it complete?", "evidencia".
  The rule: a claim without pasted evidence is an opinion.
---

# Verification and Reporting

## When To Use

- Before declaring any task complete — small or large.
- When writing any report: what counts as Verified, and what evidence accompanies it.
- When evaluating claims (yours or another agent's) against what was actually executed.

## Verification Language

Four terms, used precisely:

- **Verified** — directly checked through execution, inspection, or authoritative evidence.
- **Assumed** — a working assumption, not directly verified.
- **Unknown** — available evidence is insufficient to determine the truth.
- **Blocked** — verification could not be performed: missing information, access, tooling, or authorization.

Never use "verified", "tested", "works", "passes", "built", "deployed" or equivalent unless the action actually occurred. Do not infer successful execution from correct-looking code. If a command was not run, it did not pass. If verification was blocked, say exactly why.

## Confidence Scale

Classify important uncertain conclusions: **High** (directly verified) · **Moderate** (strongly supported, not fully verified) · **Low** (plausible, materially uncertain) · **Blocked** (cannot be safely determined).

For Low or Blocked conclusions that carry real risk: investigate further, reduce scope, choose the reversible option, or ask. Never silently convert uncertainty into fact.

## A Check Must Match Its Claim

A check is meaningful only when its evidence is relevant to the claim:

| Claim | Not proven by | Proven by |
|---|---|---|
| "It works at runtime" | reading the code | executing the scenario |
| "Business logic is correct" | type check passing | tests on observable behavior |
| "Deploys fine" | unit tests passing | the deployment itself |
| "Behaves in production" | successful build | production-verified behavior |
| "The code runs" | code review | execution |

Match the strength of every claim to the strength of its evidence. A narrower true claim beats a broader false one.

## Bounded Pasted Evidence

Every Verified claim carries its evidence, bounded — never full logs:

```
command run (exact) — exit code — numeric summary
./scripts/verificar.sh --full — exit 0 — 244 passed, 2 skipped
```

- Paste the exact command, its exit code, and a one-line numeric summary.
- One pasted command per claim; group related claims under one run when they share it.
- No truncated mega-logs, no screenshots of text, no "output looks good".

## Blocked Work

When meaningful work is blocked: identify exactly what is missing · why it matters · what has already been verified · the safest next action. Never fabricate results to look complete. Never silently substitute a materially different implementation for the blocked one.

## Completion Standard

Done is not "files changed". A meaningful task is complete when:

- the requested behavior exists and the root problem is addressed;
- relevant behavior is verified (evidence pasted);
- important regression risks are considered;
- the final diff is clean;
- project knowledge is synchronized when durable facts changed;
- remaining uncertainty is communicated.

## Final Checklist

Run before declaring a meaningful task complete:

- [ ] Requested behavior implemented; root problem addressed.
- [ ] Acceptance criteria satisfied (each one, by ID).
- [ ] Existing behavior preserved unless intentionally changed.
- [ ] Relevant tests / verification executed — evidence pasted.
- [ ] Static checks run where relevant.
- [ ] Final diff reviewed: only relevant files, no accidental deletions or formatting-only noise.
- [ ] No debug code, no temporary files, no secrets or credentials.
- [ ] API/contracts and data/migration safety considered where relevant.
- [ ] Documentation synchronized where necessary.
- [ ] Remaining risks and uncertainty stated.

## Reporting

Reports state Found / Changed / Verified / Remaining. The Verified section contains only claims with pasted evidence; everything else is labeled Assumed / Unknown / Blocked. When something could not be verified: what, why, what was verified instead, and what would complete the verification.

## Safety

- Never present an assumption as a fact.
- Never widen a claim beyond its evidence to satisfy the reader.
- Never bury a failing check inside a passing summary — each failed check is reported.
