# Infrastructure as Code (IaC) — Environment Definition

> Guide for the DevOps agent. The environment is code, not a manual configuration.

## Environment Principles

1. **Reproducibility**: Any developer should be able to launch the exact environment with a single command.
2. **Immutability**: No manual changes are made to the servers. Any changes must be made through the IaC repository.
3. **Environment Separation**:

- `Dev`: Experimentation and rapid testing.
- `Staging`: Production mirror for final validation.
- `Prod`: Stable and restricted environment.

## Technical Standards

- **Resource Definition**: Use of declarative configuration files (YAML/JSON).
- **State Management**: The infrastructure state must be persisted outside the deployment server to prevent data loss.
- **Secrets**: IaC files never contain plaintext secrets.
(See `security-audit.md`, Secret Management). Reference the name of the environment variable or managed secret, not its value.

## Infrastructure Verification

- Run a "Dry-run" or "Plan" before applying any changes to production.
- Implement automatic Health Checks to verify that the service is live after deployment.
- A red Health Check after deployment triggers the rollback defined in `cicd-pipeline.md`.