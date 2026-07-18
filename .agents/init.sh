#!/bin/zsh
#
# init.sh - Universal entry point for framework initialization
# This script detects the project framework and calls the corresponding init script.

FRAMEWORK=$(scripts/get-framework.sh)

if [[ $? -ne 0 ]]; then
    echo "❌ Error: No supported framework detected."
    echo "Looking for: go.mod (Go), package.json (Node), requirements.txt/pyproject.toml (Python), or pom.xml/build.gradle (Spring)."
    exit 1
fi

INIT_SCRIPT="./init-$FRAMEWORK.sh"

if [[ -f "$INIT_SCRIPT" ]]; then
    echo "✅ Detected $FRAMEWORK project. Running $INIT_SCRIPT..."
    chmod +x "agent_utils/init-$INIT_SCRIPT.sh"
    exec "agent_utils/init-$INIT_SCRIPT.sh"
else
    echo "❌ Error: Detection suggested $FRAMEWORK, but $INIT_SCRIPT not found."
    exit 1
fi