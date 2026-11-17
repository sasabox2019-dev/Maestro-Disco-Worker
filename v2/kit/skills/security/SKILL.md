---
name: security
description: >
  Security applied to real changes: identifying trust boundaries, the concrete
  attack surfaces (injection, XSS, CSRF, SSRF, path traversal, privilege
  escalation, sensitive data exposure), protecting data and production state,
  and never weakening controls for convenience. Use when the change touches
  user input, authentication, authorization, data storage, external requests,
  file paths, or secrets. Triggers: "auth", "login", "password", "secrets",
  "API key", "upload", "user input", "token", "seguridad", "autenticación",
  "inyección". NOT for inventing security theater on local single-user tools.
---

# Security

## When To Use

- The change touches user input, data storage, external requests, files/paths, or credentials.
- Adding or modifying authentication, authorization, or any trust decision.
- Reviewing a diff for the risks it introduces.

## Trust Boundaries

First identify where data crosses a trust line: user input · external APIs and services · files and uploads · environment and configuration · network responses · inter-process messages. Everything crossing a boundary is **untrusted until validated** — validated at the boundary, in one place, before the data travels inward.

## Data Protection

User data, production state, databases, files, credentials, secrets, and persistent state are sensitive by default.

- Destructive or irreversible operations against important data require authorization AND verification: target, scope, recovery path.
- Prefer the reversible instruments: previews, dry runs, backups, transactions, reversible migrations, staged changes.
- Never destroy, truncate, overwrite, or irreversibly transform important data merely for convenience.

## Never Weaken Controls

Never weaken — for an easier implementation or a greener test: tests · authentication · authorization · input validation · security controls · error handling · data integrity · API contracts.

Do not introduce obvious vulnerabilities. Do not disable a security mechanism because it makes development inconvenient. Convenience never buys down security.

## Attack Surface Checklist

When the change touches an exposed surface, run this list:

- **Injection** — SQL: parameterized queries, never string-built. Command: no shell concatenation of untrusted data; argument arrays. Header/template/HTML injection: escape by context.
- **XSS** — escape output by default; treat any raw HTML render of untrusted data as a defect until proven otherwise.
- **CSRF** — state-changing endpoints require an anti-CSRF token or same-origin guarantee.
- **SSRF** — outbound URLs from user input: validate scheme and host against an allowlist; no arbitrary internal fetches.
- **Path traversal** — normalize paths and confine them to an allowed root; reject `..` escapes.
- **Privilege escalation** — authorization is enforced server-side on every access, never only in the UI; check what the request may do, not what the UI offered.
- **Sensitive data exposure** — secrets and personal data stay out of logs, error messages, stack traces, and API responses; errors inform without leaking internals.
- **Abuse** — exposed endpoints get rate limiting or backpressure appropriate to their blast radius.

## Secrets

Secrets never enter version control, logs, or error messages. Required secrets are documented without values; missing secrets fail fast with a clear message; anything accidentally exposed is rotated immediately. (Cross-reference: `skills/architecture-design/SKILL.md` — Configuration and Secrets.)

## Proportionality

Do not invent security requirements the project does not have — but **flag significant risks the implementation introduces**, every time. Security scales with real exposure: a public web app and a local single-user CLI are different threat models — yet validation at boundaries and secrets hygiene never drop to zero, in any project.

## Safety

- Never commit, log, or echo secrets.
- Never weaken a control to unblock work — escalate instead.
- Never run destructive operations against real data without authorization, backup, and verification.
