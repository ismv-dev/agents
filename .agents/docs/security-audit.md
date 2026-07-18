# Security Audit — Review Process

> Guide for the security agent. Find the vulnerability before the attacker finds it.

## Code Review Checklist

- [ ] **Inputs**: Are input types, ranges, and lengths validated?
- [ ] **Exceptions**: Are I/O exceptions caught without exposing the full server path or sensitive data in the error?
- [ ] **Paths**: Is direct string concatenation for file paths avoided? (Path Traversal Prevention).
- [ ] **Writing**: Are safe functions used for atomic writing?
- [ ] **Dependencies**: Have external library versions been checked against CVE databases?
- [ ] **Authentication**: Do the endpoints that should require a token (`api-standards.md`) actually require it, without unprotected alternative paths?

## Secret Management

- **Total Prohibition**: No key, password, or token should be in the code or in versioned configuration files.
- **Dynamic Loading**: Secrets are loaded only from environment variables (`os.environ`) or encrypted secret managers.
- **Rotation**: Define a key rotation policy for production environments.

## Vulnerability Reporting

Each finding should be classified according to the CVSS (Common Vulnerability Scoring System) scale or similar:
- **Impact**: Low, Medium, High, Critical.
- **Probability**: Low, Medium, High.
- **Solution**: Propose an immediate technical fix based on the official language documentation.