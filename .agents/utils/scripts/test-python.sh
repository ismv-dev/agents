#!/usr/bin/env bash
# test-python.sh — Running Python tests
#
# Usage: ./test-python.sh [module/file]
# If not specified, discovers and runs all tests in the tests/ folder.

set -u
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

ok()    { printf "${GREEN}[OK]${NC}    %s\n" "$1"; }
fail()  { printf "${RED}[FAIL]${NC}  %s\n" "$1"; }

TARGET=$1

echo "🚀 Running tests for Python..."

if [ -d "tests" ] || [ -n "$TARGET" ]; then
  CMD="python3 -m unittest"
  if [ -n "$TARGET" ]; then
    CMD="$CMD $TARGET"
  else
    CMD="$CMD discover -s tests"
  fi

  if $CMD -v 2>&1; then
    ok "✅ Tests passed"
    exit 0
  else
    fail "❌ Some test failed"
    exit 1
  fi
else
  fail "❌ The tests/ folder was not found and no target was specified."
  exit 1
fi
