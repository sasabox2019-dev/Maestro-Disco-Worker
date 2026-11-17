---
name: code-quality
description: >
  Implementation quality for everyday coding: solve the actual problem with
  standard well-understood constructs, minimal focused change scope,
  readability and honest naming, disciplined abstraction (the wrong
  abstraction costs more than duplication), type safety and validation at
  boundaries, backwards compatibility, and complete UI state coverage
  (loading/empty/error/retry/disabled/offline, keyboard, accessibility). Use
  while writing or reviewing any non-trivial code, or when touching UI forms
  and client applications. Triggers: "implement", "refactor", "clean this up",
  "form", "UI states", "validation", "implementar", "refactorizar",
  "accesibilidad", "formulario".
---

# Code Quality

## When To Use

- Writing or reviewing any non-trivial implementation.
- Touching UI/client code: forms, dialogs, interactive components.
- Deciding how much to change, how to name, when to abstract, where to validate.

## Implementation

Solve the actual problem. Prefer standard, well-understood constructs over clever ones — cleverness is a cost paid by every future reader, including you. Explicit behavior over implicit magic; no action at a distance. Functions and modules stay cohesive: one clear purpose, a name that matches it. Error handling is designed, never accidental — failures get an explicit path. Debug artifacts (logging, temp code, TODO drift) are removed before completion.

## Change Scope

Minimal, focused, reversible. Do not mix drive-by changes into a task: formatting sprees, renames, "while I'm here" fixes. Cosmetic changes only when they serve the task itself. If adjacent code begs for improvement, report it — do not fix it silently (scope discipline lives in the worker contract; this is its implementation-side twin).

## Readability and Naming

Optimize for the reader. Names say what the thing does — honestly, not optimistically. Comments explain **why**, never narrate **what**. Code lives where the project's conventions put it; the reader's expectations are a feature. Delete dead code and commented-out blocks: version control remembers, the working tree should not have to.

## Abstraction

Introduce abstraction when duplication is real AND the abstraction is provably better. A little duplication is cheaper than the wrong abstraction — the wrong one spreads, hardens, and taxes every change after it. Let a pattern repeat honestly a few times before extracting shared code; then extract reluctantly, with a name that earns its place.

## Type Safety

Use the strongest types the language practically supports; `any`/dynamic only at genuine, justified edges. Type at boundaries: functions that receive the outside world declare what they accept. External input is validated before it is trusted — a type is a promise the runtime has not yet kept.

## Validation

Validate at boundaries: user input, external APIs, file and config and environment reads. Fail fast with informative errors that name the offender and the problem. Reject early — the deeper garbage travels, the costlier the crash. Everything that can be wrong (empty, malformed, hostile, missing, too large) gets a decision, not a hope. Validate before persistence: bad data must not reach storage.

## Backwards Compatibility

Preserve externally observable behavior unless changing it is the explicit request. Deprecate before removing. Version breaking changes. Consumers you cannot see still exist — never break them silently.

## UI Behavior

An interactive surface is complete only when its whole state matrix exists: loading · empty · success · error · retry · disabled · offline/network failure. The happy path is half the UI.

- Responsive behavior, keyboard operability, visible focus; focus managed (and trapped) in dialogs; Escape cancels.
- Semantic HTML first; labels and roles that screen readers can use; color never the only signal.
- Forms: every button declares its intent — in HTML, buttons inside a form default to `type="submit"` and silently submit; set `type="button"` unless submitting IS the intent (real-world escape: dead buttons that "existed" but submitted the form). Validation errors are visible, specific, and attached to the field.

## Safety

- No silent changes to observable behavior.
- No debug artifacts or secrets left in delivered code.
- Never weaken validation or error handling to make a test pass.
