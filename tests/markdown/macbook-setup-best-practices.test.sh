#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

README="$ROOT/README.md"
GUIDE_INDEX="$ROOT/docs/guides/README.md"
GUIDE="$ROOT/docs/guides/macbook-terminal-baseline.md"
VERIFY="$ROOT/docs/verification/macbook-terminal-baseline.md"

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

assert_file() {
  local path="$1"
  [[ -f "$path" ]] || fail "missing file: ${path#$ROOT/}"
}

assert_contains() {
  local path="$1"
  local pattern="$2"
  local description="$3"
  grep -Eiq "$pattern" "$path" || fail "${path#$ROOT/} missing ${description}"
}

assert_not_contains() {
  local path="$1"
  local pattern="$2"
  local description="$3"
  if grep -Eiq "$pattern" "$path"; then
    fail "${path#$ROOT/} contains forbidden ${description}"
  fi
}

assert_file "$README"
assert_file "$GUIDE_INDEX"
assert_file "$GUIDE"
assert_file "$VERIFY"

assert_contains "$README" 'terminal-first-macos-dev' 'companion repository identity'
assert_contains "$README" 'terminal-first-windows-dev' 'Windows repository boundary'
assert_contains "$README" 'docs/guides/macbook-terminal-baseline\.md' 'guide link'
assert_contains "$README" 'docs/verification/macbook-terminal-baseline\.md' 'verification link'

assert_contains "$GUIDE_INDEX" 'macbook-terminal-baseline\.md' 'MacBook baseline guide link'
assert_contains "$GUIDE_INDEX" 'personal developer MacBook' 'first-slice audience'

assert_contains "$GUIDE" '^## Scope$' 'Scope section'
assert_contains "$GUIDE" '^## Traceability$' 'Traceability section'
assert_contains "$GUIDE" '^## Verification status$' 'Verification status section'
assert_contains "$GUIDE" '^## First-slice outline$' 'First-slice outline section'
assert_contains "$GUIDE" 'personal developer MacBook' 'personal MacBook audience'
assert_contains "$GUIDE" 'Apple silicon' 'Apple silicon target'
assert_contains "$GUIDE" 'does not change.*terminal-first-windows-dev' 'Windows repository non-change statement'
assert_contains "$GUIDE" 'proposal.*spec.*plan' 'proposal/spec/plan traceability'
assert_contains "$GUIDE" 'manual verification.*not.*complete|not.*complete.*manual verification' 'unverified manual walkthrough status'

assert_contains "$VERIFY" '^## Required evidence fields$' 'required evidence fields section'
assert_contains "$VERIFY" 'sw_vers' 'sw_vers evidence field'
assert_contains "$VERIFY" 'hardware model' 'hardware model evidence field'
assert_contains "$VERIFY" 'CPU architecture' 'CPU architecture evidence field'
assert_contains "$VERIFY" 'Command Line Tools' 'Command Line Tools evidence field'
assert_contains "$VERIFY" 'Homebrew prefix' 'Homebrew prefix evidence field'
assert_contains "$VERIFY" 'verification date' 'verification date evidence field'
assert_contains "$VERIFY" 'personal or managed' 'ownership context evidence field'
assert_contains "$VERIFY" 'No command-success or compatibility claims are verified yet' 'unverified claims statement'

for path in "$README" "$GUIDE_INDEX" "$GUIDE" "$VERIFY"; do
  assert_not_contains "$path" 'Brewfile|one-command bootstrap|opaque dotfile|generated dotfile|mas install|Mac App Store automation' 'first-slice automation or deferred tooling'
done

printf 'PASS: MacBook setup companion baseline checks passed\n'
