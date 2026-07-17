#!/bin/zsh
#
# Project framework detection script
# Detects current project framework

echo "🔍 Detecting project framework..."

if [[ -f "go.mod" ]]; then
    echo "go"
elif [[ -f "package.json" ]]; then
    echo "node"
elif [[ -f "requirements.txt" || -f "pyproject.toml" || -f "setup.py" ]]; then
    echo "python"
elif [[ -f "pom.xml" || -f "build.gradle" || -f "build.gradle.kts" ]]; then
    echo "spring"
else
    echo "Error: No supported framework detected." >&2
    exit 1
fi

exit 0