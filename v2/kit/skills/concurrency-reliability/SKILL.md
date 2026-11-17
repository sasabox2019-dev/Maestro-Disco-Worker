---
name: concurrency-reliability
description: >
  Concurrency discipline and failure-aware design: race conditions, shared
  mutable state, ordering and cancellation, retries with backoff and
  idempotency, timeouts, duplicate execution, resource cleanup — plus the
  edge-case sweep (empty/unicode/boundaries/timezones) that catches what the
  happy path misses. Use when code is or becomes concurrent, makes network or
  I/O calls, retries anything, persists state, or handles external input of
  unbounded shape. Triggers: "async", "concurrent", "race condition", "retry",
  "timeout", "idempotent", "edge cases", "concurrencia", "reintentos",
  "casos límite", "timezone".
---

# Concurrency and Reliability

## When To Use

- Writing or reviewing async/concurrent code, or code that may become concurrent implicitly (queues, watchers, servers, retries).
- Making network, filesystem, or subprocess calls that can fail, hang, or repeat.
- Handling external input whose shape is not fully controlled (the edge-case sweep).

## Concurrency Discipline

- Do not introduce concurrency merely because it looks faster — parallelism buys latency at the price of correctness risk; justify it.
- Identify every piece of **shared mutable state**; give it a declared strategy (lock, queue, single-writer, immutable snapshot, versioning) — undeclared shared state is a latent race.
- Make ordering explicit where it matters; do not rely on scheduling accidents.
- Cancellation must propagate: cancelled work stops, releases resources, and leaves state consistent — cleanup runs on every path (`finally`/`defer`/context managers).
- Concurrent writes to the same target (file, record, counter) get one owner or an arbiter — last-write-wins is a decision, not an accident.

## Races and Invariants

A check-then-act sequence is a race unless the check and the act are atomic (lock, transaction, atomic primitive). On files: creation/open/write races yield to atomic patterns — temp file + atomic rename, lockfiles, or single-writer ownership. Ask of every invariant: **does it hold under every interleaving?** — not "under the one I tested".

## Reliability

Everything that can fail, will: network, disk, time, the process itself.

- **Timeouts on every external call** — an explicit one, never the default forever.
- **Retries**: bounded (max attempts), with exponential backoff and jitter; retry only idempotent operations — or make the operation idempotent first (idempotency keys, natural keys, dedup).
- **Duplicate execution is expected**: at-least-once delivery and user retries mean handlers tolerate the same event arriving twice.
- **Partial failure has an answer**: define what stays consistent when step 3 of 5 dies (transaction, compensating action, or declared tolerance).
- **Degrade gracefully or fail fast — deliberately**: a reduced answer beats a hang; a clean error beats silent corruption. Choose per case, don't drift into one.
- Circuit breakers and bulkheads where the blast radius justifies the machinery — not by default.

## Edge-Case Sweep

Before calling input-handling code done, sweep:

- **Empty, null, missing** — the empty string, the absent field, the zero-item list.
- **Numbers at the edges** — zero, negative, float drift, overflow, off-by-one boundaries.
- **Unicode** — emoji, combining characters, normalization forms, RTL text; lengths in bytes vs characters.
- **Very large** — inputs, counts, files, pages: what degrades first, and does it degrade or die?
- **Duplicates and ordering** — same key twice; ordering stable vs unspecified; insertion vs sort order.
- **Time** — timezones, DST transitions, midnight boundaries, "today" defined where?, clock skew between systems.
- **Locale** — decimal separators, date formats, casing rules that shift with language.
- **The same event twice** — a retry, a double-click, a re-delivered message.

## Safety

- No unbounded retries; no missing timeout on any external call.
- No shared mutable state without a declared strategy.
- No retry of a non-idempotent operation "just this once".
