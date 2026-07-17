#!/usr/bin/env bash
# test-go.sh — Running tests for Go
#
# Usage: ./test-go.sh [module/package]
# If no module is specified, it runs all tests in the project.

set -u
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

ok()    { printf "${GREEN}[OK]${NC}    %s\n" "$1"; }
fail()  { printf "${RED}[FAIL]${NC}  %s\n" "$1"; }

TARGET=${1:-"./..."}

echo "🚀 Running tests for Go on: $TARGET"

if [ -f "go.mod" ]; then
  if go test "$TARGET"; then
    ok "✅ $TARGET - Tests passed"
    exit 0
  else
    fail "❌ $TARGET - Some test failed"
    exit 1
  fi
else
  fail "❌ No se encontró go.mod. ¿Estás en la raíz del proyecto?"
  exit 1
fi
