#!/usr/bin/env bash
# init-node.sh — Verification and initialization of the Node.js environment
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

# Node.js disponible
if ! command -v node >/dev/null 2>&1; then
  fail "❌ node no está instalado"
  exit 1
fi
ok "node -> $(node --version)"

# npm disponible
if ! command -v npm >/dev/null 2>&1; then
  fail "❌ npm no está instalado"
  exit 1
fi
ok "npm -> $(npm --version)"

echo ""
echo "── 2. Checking harness base files ─────────────────────"

for f in AGENTS.md CHECKPOINTS.md init.sh feature_list.json progress/current.md progress/history.md docs/api-standards.md docs/architecture.md docs/backend-guide.md docs/cicd-pipeline.md docs/conventions.md docs/frontend-guide.md docs/iac-standards.md docs/qa-strategy.md docs/security-audit.md docs/security-hardening.md docs/test-matrix.md docs/ux-ui-guide.md docs/verification.md; do
  if [ ! -f "../$f" ]; then
    fail "❌ Base file missing: $f"
    EXIT_CODE=1
  else
    ok "✅ Exists: $f"
  fi
done

echo ""
echo "── 3. Validating feature_list.json ───────────────────"

node -e '
const fs = require("fs");
try {
    const data = JSON.parse(fs.readFileSync("feature_list.json", "utf8"));
    const valid = new Set(["pending", "in_progress", "done", "blocked"]);
    const inProgress = data.features.filter(f => f.status === "in_progress");
    if (inProgress.length > 1) {
        console.log(`\x1b[0;31m[FAIL]\x1b[0m  There is ${inProgress.length} features en in_progress (max 1)`);
        process.exit(1);
    }
    for (const f of data.features) {
        if (!valid.has(f.status)) {
            console.log(`\x1b[0;31m[FAIL]\x1b[0m  Invalid state in feature ${f.id}: ${f.status}`);
            process.exit(1);
        }
    }
    console.log(`\x1b[0;32m[OK]\x1b[0m    feature_list.json valid (${data.features.length} features)`);
} catch (e) {
    console.log(`\x1b[0;31m[FAIL]\x1b[0m  feature_list.json invalid: ${e.message}`);
    process.exit(1);
}
'

if [ $? -ne 0 ]; then EXIT_CODE=1; fi

echo ""
echo "── 4. Running tests ─────────────────────────────────"

if [ -f "package.json" ]; then
  if ./agent_utils/test-node.sh; then
    ok "✅ All tests passed"
  else
    fail "❌ Some test failed"
    EXIT_CODE=1
  fi
elif [ -d "tests" ]; then
  warn "⚠️ The tests/ folder exists but there is no package.json configured for npm test"
else
  warn "⚠️ No tests were found"
fi

echo ""
echo "── 5. Conclusion ───────────────────────────────────"

if [ $EXIT_CODE -eq 0 ]; then
  ok "✅ Environment ready. You can start working."
else
  fail "❌ The environment is NOT ready. Resolve the errors before proceeding."
fi

exit $EXIT_CODE
