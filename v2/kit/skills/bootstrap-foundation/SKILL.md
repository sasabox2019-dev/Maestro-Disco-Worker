---
name: bootstrap-foundation
description: >
  Complete operating flow for bootstrapping a new project: discovery conversation,
  technology selection with justification, decision authority, project foundation
  (structure, Git, safety checkpoints), knowledge materialization on disk, and the
  completion test that leaves the repository continuation-ready without the
  conversation. Use when starting a project from an empty or partially populated
  workspace, or when taking ownership of a project with no established engineering
  context. Triggers: "new project", "start from scratch", "bootstrap" — Usar
  cuando: proyecto nuevo, arrancar desde cero, empezar un proyecto. NOT for
  feature work or bug fixes on an established project (that is the worker flow).
---

# Bootstrap Foundation

Turn a user idea into an implementation-ready repository whose knowledge lives on disk, not in the conversation.

## When To Use

- Starting a new project from an empty or partially populated workspace.
- Taking ownership of a project whose engineering context was never established (no AGENTS.md, no documented decisions).
- NOT for feature work, bug fixes, or refactoring on an established project — that is the continuation-worker flow.

## Objective

Bootstrap Mode transforms: user idea → understood requirements → technical decisions → project foundation → persistent project knowledge → implementation-ready repository.

Two responsibilities, always both:

1. **Discover and establish the project** — what is being built, for whom, under which constraints, with which technologies, structure, and verification.
2. **Materialize project knowledge** — the project must never depend on this conversation to remember architecture, decisions, commands, constraints, integrations, or structure.

Do not start writing application code just because the workspace is empty. Do not turn bootstrap into an endless interview either: when a reasonable low-risk default exists, propose it instead of asking.

## Discovery Conversation

Understand the product before any technical direction. Ask progressively — the smallest set of questions needed to establish direction, then expand only when the answers make details relevant. Never dump a full technical questionnaire.

A useful initial sequence:

1. What are we building?
2. Who is it for?
3. What should the first useful version do?
4. Which platform(s)? (web, backend, desktop, mobile, CLI, library, API, automation, infrastructure — never assume the platform from the opening description)
5. Any mandatory technologies or constraints?
6. Important integrations, data, security, or deployment requirements?
7. Anything explicitly out of scope?

Only ask what materially affects scope, platform, architecture, technology, data model, security, deployment, cost, compatibility, or core UX. If the user says "you decide", take the decision and own it — do not return repeatedly for confirmation of routine choices. Ask once, explicitly, about future requirements that would materially change today's architecture.

Before substantial code exists, determine (as applicable): purpose, users, primary use cases, functional and non-functional requirements, deployment target, platforms and runtime, language, framework, package manager, database, external services, auth model, testing strategy, build/CI, infrastructure, observability, security constraints, data sensitivity, expected scale. Never invent requirements. Keep source discipline: distinguish user-supplied requirements / environment facts / assumptions / recommendations / unresolved decisions.

Progressive discovery never means myopic discovery: for a new project, build enough global context to make architectural decisions responsibly.

If the workspace is not empty, discover it before treating it as a project: what exists, is it a partially initialized project, unrelated files, existing Git, work to preserve. Inspect before creating or replacing anything. Never assume an empty-looking directory is disposable. Understand existing code before replacing it; preserve working behavior, user changes, and conventions; avoid unnecessary migrations.

## Decision Authority

Hierarchy — higher wins; a lower-level preference never overrides a higher-level requirement:

1. Explicit user requirements
2. Security and data integrity
3. Actual repository state
4. Documented project constraints
5. Established project conventions
6. Authoritative technical documentation
7. Engineering best practices
8. Personal preference

Split decisions by owner:

- **User decides**: product behavior, target users, required platforms, mandatory technologies, budget, compatibility, business rules.
- **Agent decides** (low-risk, unspecified): folder structure, internal naming, test tooling, internal module boundaries, helper organization, implementation patterns.
- **Shared** (material consequences — present recommendation + rationale before proceeding): major architecture, database technology, authentication model, cloud architecture, public API design, expensive infrastructure, irreversible migrations, major framework choice.

Act as the technical expert: never ask the user to decide technical details they have no reason to care about.

## Technology Selection

When the user has not specified a technology, select autonomously when the risk is low and the choice is justifiable. Base decisions on actual requirements, project type, ecosystem maturity, maintainability, security, deployment constraints, developer experience, testing capability, and long-term viability.

Never select for fashion or impressiveness. Never introduce unnecessary infrastructure. Among reasonable options, prefer the best balance of simplicity + reliability + maintainability + ecosystem support. When one recommendation is clearly superior, recommend it and explain briefly instead of presenting an overwhelming list. For consequential choices, state what / why / alternatives / trade-offs / risks before committing.

## Technical Proposal and Checkpoint

After sufficient discovery, formulate a concise proposal: project type, recommended stack, runtime, architecture, major components, data storage, external integrations, testing approach, development workflow, deployment direction, important constraints.

Scale ceremony to the project: a small obvious project needs no approval theater; a substantial one gets its major architectural decisions presented before implementation. Never demand approval for trivial engineering decisions; never pass silently through a major irreversible one.

The user should come away understanding: what is being built, with what technology, the general architecture, what gets built first, the key assumptions, and the key trade-offs. Once the direction is established, proceed autonomously with routine implementation — do not relitigate settled decisions.

## Project Foundation

Create the minimum coherent foundation the selected stack actually needs: source structure, package/runtime/environment configuration, test infrastructure, lint/format/type checking, development scripts, documentation, ignore rules, CI only when appropriate. Every foundational component must have a reason to exist — no template filler.

For a genuinely empty workspace: coherent foundation, only the structure the project needs, no speculative complexity. For an existing project: understand it, preserve it, follow its conventions — never treat it as a blank canvas.

## Git, Safety, and Recovery

- Init Git when appropriate; establish a sensible `.gitignore`; make coherent checkpoints; avoid meaningless commit noise.
- Before touching an existing project: inspect `git status`, understand pre-existing changes, preserve them.
- Never assume an uncommitted file is disposable. Never use Git operations that destroy or hide user work without authorization. Never rewrite history without explicit authorization.
- A local Git repository is sufficient for history, recovery, checkpoints, and coding agents. A remote is a separate decision: never create or publish one without authorization.
- Git is version control, not a universal backup. Scale recovery mechanisms to risk (commits, tags, branches, database backups, snapshots, migration rollback strategies) — no pointless duplicate copies. Establish a recovery point before destructive or hard-to-reverse operations, when practical.
- Before substantial autonomous implementation: inspect Git state, establish a recoverable baseline, verify the intended project directory, verify that no unrelated user work will be overwritten. Never force a clean working tree by destroying or hiding user changes.

## Implementation Start

Prefer a sequence that creates confidence early:

1. Repository and project identity
2. Runtime and tooling
3. Minimal architecture
4. Test/validation infrastructure
5. Smallest meaningful vertical slice (end-to-end: UI → API → logic → persistence, or the project's equivalent)
6. Validation run
7. Incremental expansion
8. Project knowledge updated as durable decisions emerge

The slice validates architecture, tooling, integration points, data flow, deployment assumptions, and testing strategy all at once — but do not force one where the architecture does not benefit. Never build an enormous foundation before validating the core product idea.

Working style: think before acting; communicate decisions, evidence, risks, and actions — not inner monologue. Small task: investigate → decide → implement → verify. Substantial task: discover → analyze → propose → implement → verify → document. Disciplined execution, not performative planning.

## Knowledge Materialization

The conversation is temporary; the repository is the memory. Minimum durable artifacts: `AGENTS.md` and `README.md`. Deeper documents only when they provide real value — never all by default:

| Document | Create when | Contents |
|---|---|---|
| AGENTS.md | always | Operational index for agents: project identity, important boundaries, project map, real commands, project-specific rules, where to look deeper, what to check before changing important areas. An index and guide — never a copy of the universal prompt, never generic advice. |
| README.md | always | For humans: purpose, capabilities, prerequisites, install, development, testing, deployment basics. Useful to a first-time visitor — not an architecture manual. |
| ARCHITECTURE.md | complexity warrants it | Major components, boundaries, dependency direction, data flows, integrations, deployment topology — only what is hard to infer from code. |
| DECISIONS.md | meaningful decisions exist | Decision, context, rationale, important alternatives, consequences. No trivial implementation choices. |
| DEVELOPMENT.md | workflow is complex | Environment setup, dev services, database, migrations, debugging, maintenance — executable commands, not vague prose. |

AGENTS.md carries a concise project map: the locations that help an engineer navigate efficiently, not every file — adapted to the actual project, and updated when important structure changes.

AGENTS.md is the door for future agents: read it first, then Git state, then what the task affects, then only the relevant documentation and code — expand on evidence. Never require reading the whole documentation tree or the whole repository; the objective is sufficient understanding, not maximum reading.

Record after major decisions, before they can be forgotten: selected stack and relevant versions, architecture, project boundaries, important constraints, development commands, testing strategy, significant technology decisions, known assumptions, unresolved questions that materially affect future work. Record durable knowledge, not conversational debris.

Model independence: store facts, decisions, constraints, architecture, commands, conventions, procedures, durable assumptions — never private conversational context, hidden reasoning, or model-specific instructions. The AI is not the project's memory; the AI works on the project's memory.

Consistency: when architecture, commands, structure, or important behavior change, update the knowledge files in the same change — remove obsolete information, preserve useful historical decisions, never let documentation become a second, conflicting implementation. When documentation and code disagree, investigate and correct the stale source.

If a user-provided context section conflicts with repository evidence: detect → investigate → determine whether it is stale → prefer the most authoritative current evidence → ask the user when the conflict materially affects the project.

## Source of Truth

For project-specific facts:

1. Current user requirements — what the project should do
2. Current repository behavior — what currently exists
3. Tests and executable specifications
4. Current project documentation
5. Installed dependency versions and sources
6. Authoritative external documentation
7. Other reliable external information
8. Assumptions

The user defines the desired outcome; the repository defines what currently exists. On conflict, never pick a side silently — understand the conflict and resolve it explicitly.

## Completion Test and Handoff

Bootstrap is complete ONLY when the project can be understood and continued without this conversation:

> Could a competent engineer — given the repository and the continuation prompt — understand what this project is, how it works, how to validate it, and where to continue, without needing this chat?

The project must remain understandable if the conversation disappears, the model changes, the tool changes, another engineer joins, or the project is opened months later. If essential knowledge exists only in the conversation, it has not been materialized yet.

Handoff checklist before exiting Bootstrap Mode: AGENTS.md exists and is useful · README is accurate · deeper documentation exists only where justified · documented commands are real (executed) · architecture documentation matches implementation · important decisions are recorded · Git state is understood · validation has been performed · no secrets or accidental files were introduced.

## Bootstrap Report

Report concisely:

- **Established** — project purpose, selected platform, selected stack, architecture, important constraints.
- **Created or changed** — important files, project structure, tooling, documentation, Git state.
- **Verified** — commands actually executed, tests actually run, builds actually completed. Evidence, not claims.
- **Remaining** — unresolved decisions, known limitations, blocked validation, genuinely relevant future work.

Never claim the project is production-ready merely because the initial foundation exists. Use precise language about what was actually validated.

## Safety

- Never destroy, overwrite, reset, or hide pre-existing user work — committed or not.
- Never create or publish a remote repository without explicit authorization.
- Never commit secrets, credentials, or accidental files.
- Never proceed silently through a major irreversible architectural decision.
- Never let documentation contradict code: fix the stale side in the same change.
