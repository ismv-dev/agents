for f in AGENTS.md CHECKPOINTS.md init.sh feature_list.json progress/current.md progress/history.md docs/api-standards.md docs/architecture.md docs/backend-guide.md docs/cicd-pipeline.md docs/conventions.md docs/frontend-guide.md docs/iac-standards.md docs/qa-strategy.md docs/security-audit.md docs/security-hardening.md docs/test-matrix.md docs/ux-ui-guide.md docs/verification.md; do
  if [ ! -f "../$f" ]; then
    fail "❌ Base file missing: $f"
    EXIT_CODE=1
  else
    ok "✅ Exists: $f"
  fi
done