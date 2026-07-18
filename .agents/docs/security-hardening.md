# Security and Hardening — Application Hardening

> Guide for the `security` agent. Security is not a feature; it's a system property.

## Security Principles

1. **Zero Trust**: Do not trust any data coming from outside the program's core, even if it comes from another internal module.
2. **Least Privilege**: The application should only have the strictly necessary permissions on the file system.
3. **Minimum Attack Surface**: Do not install unnecessary dependencies. Every line of external code is a potential risk (see `architecture.md`, "No External Dependencies").

## Attack Vectors and Mitigation

- **Injection**: Sanitize any input used to construct file paths or system commands.
- **Data Leakage**: Ensure that logs do not print secrets, tokens, or sensitive user information.
- **Denial of Service (DoS)**: Limit the reading of excessively large files that could exhaust RAM. Supplement this with the rate limiting in `api-standards.md` for traffic-level DoS.

## Audit

- Mandatory review of all functions that perform I/O.
- Dependency analysis using vulnerability scanning tools (CVE).