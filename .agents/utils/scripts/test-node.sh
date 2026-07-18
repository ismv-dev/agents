#!/usr/bin/env bash
# test-node.sh — Running tests for Node.js
#
# Usage: ./test-node.sh [file/directory/filter]
# If not specified, runs the test script defined in package.json.

set -u
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

ok()    { printf "${GREEN}[OK]${NC}    %s\n" "$1"; }
fail()  { printf "${RED}[FAIL]${NC}  %s\n" "$1"; }

TARGET=$1

echo "🚀 Running tests for Node.js..."

if [ -f "package.json" ]; then
  if [ -z "$TARGET" ]; then
    if npm test; then
      ok "✅ Tests passed"
      exit 0
    else
      fail "❌ Some test failed"
      exit 1
    fi
  else
    echo "🔍 Running specific tests for: $TARGET"
    if npm test -- "$TARGET"; then
      ok "✅ $TARGET - Tests passed"
      exit 0
    else
      fail "❌ $TARGET - Some tests failed"
      exit 1
    fi
  fi
else
  fail "❌ No se encontró package.json. ¿Estás en la raíz del proyecto?"
  exit 1
fi
