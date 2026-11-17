---
name: architecture-design
description: >
  Architectural reasoning for features and projects: requirement analysis,
  priorities on conflict, acceptance criteria before implementation, matching
  complexity to the actual problem, dependency direction, technology research
  and dependency policy, project structure, configuration and secrets, API and
  contract design, data modeling, and database migrations. Use when designing
  or significantly changing architecture, choosing technologies, modeling data,
  designing APIs, or writing migrations. Triggers: "architecture", "how should
  I structure", "which database", "data model", "API design", "migration",
  "arquitectura", "diseño de datos", "migración de BD".
---

# Architecture Design

## When To Use

- Designing the architecture of a new project or a major feature.
- Choosing technologies, dependencies, or structural patterns.
- Modeling data, designing APIs/contracts, or writing migrations.
- Evaluating an existing architecture before extending it.

## Requirement Analysis

Before implementation, establish a concrete understanding: what exactly is requested · what problem is solved · who consumes the result · current vs expected behavior · what must change and what must remain unchanged · affected components · acceptance criteria · regression risks · constraints.

Translate vague requirements into concrete behavior. Never invent requirements. Classify ambiguity: low-impact → resolve by convention and proceed; high-impact → ask. Do not ask questions whose answers would not materially change the result.

## Priorities When Requirements Conflict

1. Explicit user requirements
2. Security and data integrity
3. Correctness
4. Preservation of existing behavior
5. Project-specific architecture and conventions
6. Backwards compatibility
7. Maintainability and simplicity
8. Reliability and observability
9. Performance
10. Cosmetic or stylistic preferences

Never sacrifice a higher priority for a lower one. When a trade-off is made, state it explicitly.

## Acceptance Criteria Before Implementation

Establish concrete, measurable acceptance criteria before building: observable behaviors, constraints, boundaries, security and compatibility requirements. "Works" is not a criterion. In v2 projects, this materializes as SPEC.md (see `skills/spec-writing/SKILL.md`); implementation is verified against those ACs, by ID.

## Architectural Reasoning

For each significant decision: identify the reasonable alternatives → evaluate against requirements and constraints (complexity, maintainability, performance, security, operational cost, familiarity) → prefer the **simplest viable option** → justify with evidence → record the important ones (decision, context, rationale, alternatives, consequences — the ADR format).

## Complexity Matches the Problem

A script is not a microservice. Start with the simplest architecture that honestly serves the requirements; add complexity only when evidence demands it. Design clean seams where the architecture will likely evolve — that is evolutionary architecture: simple start, cheap future change. Complexity is never the default; it is always a justified purchase.

## Dependency Direction

Dependencies point toward stability: high-level policy must not depend on volatile details. Keep infrastructure, UI, and delivery mechanisms pluggable at the domain boundary through stable interfaces. No circular dependencies. The domain owns its contracts; adapters conform to them.

## Technology Research and External Information

Before committing to an unfamiliar or critical technology, investigate its capabilities and limitations — before building on it. Source quality order: **official documentation > source code > tests > technical articles > model memory.** Never fabricate APIs, commands, flags, or paths; when a claim is critical, verify against an authoritative source or a small experiment. Check version and date on external information — stale docs teach yesterday's API.

## Dependency Policy

Preference order: standard library > established dependency > new dependency. Adding a dependency is a commitment: evaluate maintenance health, security record, license, transitive dependencies, size, and compatibility. Pin versions and respect lockfiles. Never upgrade merely because a newer version exists; upgrades are deliberate decisions with a reason and a check.

## Project Structure

Organize around the project's natural architecture and domain; group by feature or domain when it aids navigation, keep related things together, and let structure communicate intent. Separate the concerns that are actually distinct in the project: UI, business logic, data access, infrastructure. Extract shared modules deliberately — when the sharing is real, not preemptively.

Establish the basic skeleton (directories, modules, entry points, key files) before writing substantial code: enough structure to accommodate foreseeable evolution without over-engineering. If the structure fights the work, fix the structure early — restructuring after is far more expensive.

## Configuration, Secrets, Environments

- Separate configuration from code; explicit config with sensible defaults; document every required variable.
- Validate configuration at startup with clear errors that name the offending key — not deep runtime crashes.
- Never hardcode environment-specific values in logic; distinguish build-time from runtime configuration.
- **Secrets never enter version control**: no keys, credentials, or tokens in code, commits, logs, or issues. Use ignored env files or secret managers; document required secrets without their values; fail fast with a clear message when one is missing; rotate anything accidentally exposed.
- Target environments explicitly (dev/test/prod): differences explicit and documented, environment-specific values via environment, no "works on my machine". Document assumptions: OS, versions, services.

## API and Contract Design

Design APIs deliberately: consistency and clarity across endpoints · explicit, informative errors that do not leak internals · validation at boundaries · a versioning strategy for external contracts · backward compatibility unless breaking is the explicit decision · idempotency where retries will occur · documented contracts (OpenAPI or equivalent when useful). Never silently change externally observable behavior.

## Data Modeling

Model the domain explicitly: entities, relationships, constraints, invariants — the schema captures business rules, it is not a bag of columns. Normalization appropriate to usage. Required vs optional is an explicit decision per field. Index for the actual access patterns. Consider the migration path from day one: data that will exist must be able to arrive there.

## Database and Migrations

Treat schema as code: versioned, reviewable, reversible. Forward-only changes with a rollback strategy. Test migrations against representative data, not empty tables. Destructive migrations (drop, rename, truncate, type-narrowing) get extreme care: backup first, dry-run where possible, staged rollout. Never run an irreversible operation against production data without explicit authorization and a fresh backup. Each migration documents its intent.

## Safety

- Never commit secrets or environment-specific credentials.
- Never run destructive migrations without authorization, backup, and dry-run.
- Never silently break an external contract.
- Never add complexity or dependencies without a justification you can state in one sentence.
