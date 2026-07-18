#!/usr/bin/env bash
# init-go.sh — Go environment verification and initialization
#
# This script is run by the agent at the START of a session and before
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

if ! command -v go >/dev/null 2>&1; then
  fail "❌ Go is not installed"
  exit 1
fi
ok "✅ go -> $(go version)"

echo ""
echo "── 2. Checking harness base files ──────────────"

for f in AGENTS.md CHECKPOINTS.md init.sh feature_list.json progress/current.md progress/history.md docs/api-standards.md docs/architecture.md docs/backend-guide.md docs/cicd-pipeline.md docs/conventions.md docs/frontend-guide.md docs/iac-standards.md docs/qa-strategy.md docs/security-audit.md docs/security-hardening.md docs/test-matrix.md docs/ux-ui-guide.md docs/verification.md; do
  if [ ! -f "../$f" ]; then
    fail "❌ Base file missing: $f"
    EXIT_CODE=1
  else
    ok "✅ Exists: $f"
  fi
done

echo ""
echo "── 3. Validating feature_list.json ──────────────────────"

go run - <<'GO'
package main
import (
	"encoding/json"
	"fmt"
	"os"
)
type Feature struct {
	ID     int    `json:"id"`
	Status string `json:"status"`
}
type FeatureList struct {
	Features []Feature `json:"features"`
}
func main() {
	file, err := os.ReadFile("feature_list.json")
	if err != nil {
		fmt.Printf("\x1b[0;31m[FAIL]\x1b[0m  Couldn't read feature_list.json: %v\n", err)
		os.Exit(1)
	}
	var list FeatureList
	if err := json.Unmarshal(file, &list); err != nil {
		fmt.Printf("\x1b[0;31m[FAIL]\x1b[0m  feature_list.json invalid: %v\n", err)
		os.Exit(1)
	}
	valid := map[string]bool{"pending": true, "in_progress": true, "done": true, "blocked": true}
	inProgressCount := 0
	for _, f := range list.Features {
		if f.Status == "in_progress" {
			inProgressCount++
		}
		if !valid[f.Status] {
			fmt.Printf("\x1b[0;31m[FAIL]\x1b[0m  Invalid state in feature %d: %s\n", f.ID, f.Status)
			os.Exit(1)
		}
	}
	if inProgressCount > 1 {
		fmt.Printf("\x1b[0;31m[FAIL]\x1b[0m  There is %d features in in_progress (max 1)\n", inProgressCount)
		os.Exit(1)
	}
	fmt.Printf("\x1b[0;32m[OK]\x1b[0m    feature_list.json valid (%d features)\n", len(list.Features))
}
GO

if [ $? -ne 0 ]; then EXIT_CODE=1; fi

echo ""
echo "── 4. Running tests ─────────────────────────────────"

if [ -f "go.mod" ]; then
  if ./agent_utils/test-go.sh; then
    ok "✅ All tests passed"
  else
    fail "❌ Some test failed"
    EXIT_CODE=1
  fi
else
  warn "⚠️ go.mod not found, skipping tests"
fi

echo ""
echo "── 5. Conclusion ──────────────────────────────────────────"

if [ $EXIT_CODE -eq 0 ]; then
  ok "✅ Environment ready. You can start working."
else
  fail "❌ The environment is NOT ready. Resolve the errors before proceeding."
fi

exit $EXIT_CODE
