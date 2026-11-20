# Error Ledger — Maestro-Disco-Worker

Every escape of the system (a bug no check caught) is recorded here and converted into a mechanical check or a new mechanism. Entries are never deleted; they are corrected in place only for factual errors, with the correction declared.

This is the toolkit repository's own ledger. Projects built with this system keep their own. The mechanism — when to record, how to convert an escape into a check — is documented in the Manual (§ The Error Ledger).

---

## Entry 1 — Premature merge of main from the web interface

- **Date:** November 2026.
- **What slipped through:** while a branch was under construction, a person with write access merged it into `main` from the GitHub web interface — the "Compare & pull request" banner, one green click — with the branch only half-built. No mechanism of the system stopped it.
- **What rule existed and failed to stop it:** none. The control was procedural only ("merging `main` is the maintainer's exclusive decision, taken at the final gate"): no mechanical guard in the repository, no branch protection on GitHub.
- **Lesson:** the green button on the banner really merges. Merging `main` is the exclusive ceremony of the final gate — never a side effect of browsing.
- **Resolution:** `main` was restored with an anchored force-push (`git push --force-with-lease`, explicitly authorized). Zero loss — the branch's content lived intact on its own ref. The pull request remains in the history as an accepted scar.
- **Converted into:**
  1. Verify `git ls-remote origin main` against the expected commit when opening each phase — standing practice.
  2. Branch protection on `main` (require pull request before merging) — recommended for every repository, enabled the day the repo exists.
  3. The Manual documents the operating rule: `main` is touched only at the final gate.
