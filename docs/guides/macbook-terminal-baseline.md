# MacBook Terminal Baseline

## Scope

This guide is the first-slice scaffold for a personal developer MacBook terminal baseline. The primary verified target is Apple silicon, but manual verification is not complete yet.

The guide does not change the `terminal-first-windows-dev` repository vision and does not add macOS guide content to that Windows-first repository by default.

## Traceability

This scaffold traces to the approved MacBook setup best-practices proposal, spec, test spec, and plan in `../20260524-terminal-dev`.

Authoritative source artifacts:

- Proposal: `../20260524-terminal-dev/docs/proposals/2026-06-17-macbook-setup-best-practices.md`
- Spec: `../20260524-terminal-dev/specs/macbook-setup-best-practices.md`
- Test spec: `../20260524-terminal-dev/specs/macbook-setup-best-practices.test.md`
- Plan: `../20260524-terminal-dev/docs/plans/2026-06-17-macbook-setup-best-practices.md`

## Verification status

Manual verification is not complete. Command-success, setup-completion, Intel compatibility, and managed-Mac compatibility claims remain unverified until recorded evidence exists in [../verification/macbook-terminal-baseline.md](../verification/macbook-terminal-baseline.md).

## First-slice outline

The later guide content will cover the approved terminal-baseline sequence:

1. Ownership context and managed-Mac routing.
2. Hardware model and CPU architecture identification.
3. Backup posture before persistent setup changes.
4. Stable macOS update path and Apple-owned system setup checks.
5. Apple developer tooling before third-party package management.
6. Third-party CLI package-manager boundaries and trust assumptions.
7. Conservative shell, Git, SSH, credential, and minimal editor readiness.
8. Terminal verification evidence and claim boundaries.

## Current milestone

M1 establishes the companion surface, guide location, verification location, and static proof script. Full setup guidance is intentionally left for later milestones after this baseline is reviewed.
