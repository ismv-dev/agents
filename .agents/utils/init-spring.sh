#!/usr/bin/env bash
# init-spring.sh — Spring Boot Environment Verification and Initialization (Java)
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

if ! command -v java >/dev/null 2>&1; then
  fail "❌ java no está instalado"
  exit 1
fi
ok "✅ java -> $(java -version 2>&1 | head -n 1)"

if ! command -v mvn >/dev/null 2>&1; then
  warn "⚠️ mvn no está instalado (se recomienda para Spring)"
else
  ok "✅ mvn -> $(mvn -version | head -n 1)"
fi

if ! command -v gradle >/dev/null 2>&1; then
  :
else
  ok "✅ gradle -> $(gradle -version | head -n 1)"
fi

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

if command -v python3 >/dev/null 2>&1; then
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
else
  warn "⚠️ Python 3 was not found to automatically validate feature_list.json"
fi

echo ""
echo "── 4. Running tests ─────────────────────────────────"

if [ -f "pom.xml" ] || [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then
  if ./agent_utils/test-spring.sh; then
    ok "✅ Test passed"
  else
    fail "❌ Some test failed"
    EXIT_CODE=1
  fi
else
    EXIT_CODE=1
  fi
else
  warn "⚠️ pom.xml and build.gradle were not found, skipping tests"
fi

echo ""
echo "── 5. Conclusion ──────────────────────────────────────────"

if [ $EXIT_CODE -eq 0 ]; then
  ok "✅ Environment ready. You can start working."
else
  fail "❌ The environment is NOT ready. Resolve the errors before proceeding."
fi

exit $EXIT_CODE
