#!/usr/bin/env bash
# init.sh — Environment Verification and Initialization
#
# This script is executed by the agent at the START of a session and before
# declaring any task as `done`. If it fails, the session should not proceed.
#
# Expected output: clear exit codes and blocks marked with [OK]/[FAIL].

set -u
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

ok()    { printf "${GREEN}[OK]${NC}    %s\n" "$1"; }
warn()  { printf "${YELLOW}[WARN]${NC}  %s\n" "$1"; }
fail()  { printf "${RED}[FAIL]${NC}  %s\n" "$1"; }

EXIT_CODE=0

echo "── 1. Checking environment ─────────────────────────────"

# Python disponible
if ! command -v python3 >/dev/null 2>&1; then
  fail "❌ python3 is not installed"
  exit 1
fi
ok "python3 -> $(python3 --version)"

# Versión mínima 3.9 (dataclasses + typing moderno)
PY_VERSION_OK=$(python3 -c 'import sys; print(int(sys.version_info >= (3, 9)))')
if [ "$PY_VERSION_OK" != "1" ]; then
  fail "❌ Python >= 3.9 required"
  exit 1
fi
ok "✅ Compatible Python version"

echo ""
echo "── 2. Checking harness base files ──────────────"

for f in AGENTS.md CHECKPOINTS.md init.sh feature_list.json progress/current.md progress/history.md docs/api-standards.md docs/architecture.md docs/backend-guide.md docs/cicd-pipeline.md docs/conventions.md docs/frontend-guide.md docs/iac-standards.md docs/qa-strategy.md docs/security-audit.md docs/security-hardening.md docs/test-matrix.md docs/ux-ui-guide.md docs/verification.md; do
  if [ ! -f "$f" ]; then
    fail "❌ Base file missing: $f"
    EXIT_CODE=1
  else
    ok "✅ Exists: $f"
  fi
done

echo ""
echo "── 3. Validating feature_list.json ──────────────────────"

python3 - <<'PY'
import json, sys
try:
    data = json.load(open("feature_list.json"))
    valid = {"pending", "in_progress", "done", "blocked"}
    in_progress = [f for f in data["features"] if f["status"] == "in_progress"]
    if len(in_progress) > 1:
        print(f"[FAIL]  There is {len(in_progress)} features in in_progress (max 1)")
        sys.exit(1)
    for f in data["features"]:
        if f["status"] not in valid:
            print(f"[FAIL]  Invalid state in feature {f['id']}: {f['status']}")
            sys.exit(1)
    print(f"[OK]    feature_list.json valid ({len(data['features'])} features)")
except Exception as e:
    print(f"[FAIL]  feature_list.json invalid: {e}")
    sys.exit(1)
PY

if [ $? -ne 0 ]; then EXIT_CODE=1; fi

echo ""
echo "── 4. Running tests ─────────────────────────────────"

if [ -d "tests" ]; then
  if ./agent_utils/test-python.sh; then
    ok "✅ Tests passed"
  else
    fail "❌ Some test failed"
    EXIT_CODE=1
  fi
else
  warn "⚠️ Tests folder does not exist."
fi

echo ""
echo "── 5. Conclusion ──────────────────────────────────────────"

if [ $EXIT_CODE -eq 0 ]; then
  ok "✅ Environment ready. You can start working."
else
  fail "❌ The environment is NOT ready. Resolve the errors before proceeding."
fi

exit $EXIT_CODE
