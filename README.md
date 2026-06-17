# terminal-first-macos-dev

Concise, auditable setup guidance for a terminal-first personal developer MacBook.

This repository is the macOS companion surface for MacBook setup guidance. It does not change the `terminal-first-windows-dev` repository vision, and it does not add macOS guide content to that Windows-first repository by default.

## Current scope

- First slice: a personal developer MacBook terminal baseline.
- Primary verified target: Apple silicon, after manual verification evidence is recorded.
- Current status: baseline guide content, verification location, and validation checks are established; manual verification evidence is still downstream work.

## Start here

- Guide index: [docs/guides/README.md](docs/guides/README.md)
- MacBook terminal baseline: [docs/guides/macbook-terminal-baseline.md](docs/guides/macbook-terminal-baseline.md)
- Verification template: [docs/verification/macbook-terminal-baseline.md](docs/verification/macbook-terminal-baseline.md)

## Validation

Run the static baseline check from this repository:

```bash
bash tests/markdown/macbook-setup-best-practices.test.sh
```

The check validates repository structure, companion-surface boundary wording, traceability, and verification-template fields. It does not execute setup commands.

## Traceability

This companion baseline follows the approved MacBook setup best-practices proposal, spec, test spec, and plan in `../20260524-terminal-dev`.

## License

Licensed under Apache-2.0.
