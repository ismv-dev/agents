#!/usr/bin/env bash
# test-spring.sh — Running tests for Spring Boot (Java)
#
# Usage: ./test-spring.sh [class/package]
# If not specified, runs all tests using Maven or Gradle.

set -u
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

ok()    { printf "${GREEN}[OK]${NC}    %s\n" "$1"; }
fail()  { printf "${RED}[FAIL]${NC}  %s\n" "$1"; }

TARGET=$1

echo "🚀 Running tests for Spring Boot..."

if [ -f "pom.xml" ]; then
  if [ -z "$TARGET" ]; then
    if mvn test; then
      ok "✅ All Maven test passed"
      exit 0
    else
      fail "❌ Some Maven tests failed"
      exit 1
    fi
  else
    echo "🔍 Running tests for: $TARGET"
    if mvn test -Dtest="$TARGET"; then
      ok "✅ Tests from $TARGET passed"
      exit 0
    else
      fail "❌ Some tests from $TARGET failed"
      exit 1
    fi
  fi
elif [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then
  if [ -z "$TARGET" ]; then
    if gradle test; then
      ok "✅ All Gradle tests passed"
      exit 0
    else
      fail "❌ Some Gradle test failed"
      exit 1
    fi
  else
    echo "🔍 Running tests para: $TARGET"
    if gradle test --tests "$TARGET"; then
      ok "✅ $TARGET - Tests passed"
      exit 0
    else
      fail "❌ $TARGET - Some tests failed"
      exit 1
    fi
  fi
else
  fail "❌ Pom.xml and build.gradle were not found. Are you in the project root?"
  exit 1
fi
