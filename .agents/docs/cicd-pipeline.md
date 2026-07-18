# CI/CD Pipeline — Automation and Delivery

> DevOps Agent Guide: Eliminating Human Error Through Automation

## Promotion Flow

`Feature Branch` $\rightarrow$ `Pull Request` $\rightarrow$ `Main`

1. **Local Validation**: The implementer runs the tests.
2. **Automatic Validation**: The pipeline executes the `.agents/init.sh` script and the complete test suite.
3. **Human/Synthetic Validation**: The reviewer approves the logic and quality.

## Branch Protection

- `main` does not accept direct pushes. All changes are submitted via Pull Request.
- The pipeline (step 2) must be green before merging; it is not optional
and cannot be skipped with administrator privileges except in the case of a documented incident.

## Automation Standards

- **Idempotency**: The deployment script must be able to run 10 times and always leave the system in the same state.
- **Logs**: All pipeline stages must generate clear and structured logs to facilitate debugging server errors.

## Rollback

- Every production deployment must have a rollback path without complex manual intervention: redeploying the previous tag should suffice.
- The post-deployment Health Check (see `iac-standards.md`) triggers the automatic rollback if one exists, or the alert for a manual rollback if it doesn't.

## Version Management

- Use of Semantic Versioning (SemVer): `MAJOR.MINOR.PATCH`.
- Each release must generate a Git tag and an updated `CHANGELOG.md` file.