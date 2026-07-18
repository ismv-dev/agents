# QA Strategy — Quality Assurance

> Guide for the QA agent. The goal is not to find bugs, but to prove they don't exist.

## Testing Mindset

1. **The "Unhappy Path"**: Spend 70% of your time testing what happens when things fail (null inputs, corrupted files, network outages).
2. **Total Isolation**: Every test must start with a clean environment. Sharing state between tests is prohibited.
3. **Executable Evidence**: A QA report without supporting test code is just an opinion (see `verification.md`).

## Test Levels

- **Unit Tests**: Test the smallest possible logic.
- **Integration Tests**: Test the communication between two layers (e.g., `cli` -> `storage`).
- **E2E (End-to-End)**: Simulation of a real user from the beginning to the end of the flow.

## Defect Management

- **Bug Report**: Must include: `Steps to reproduce`, `Actual Result`, and `Expected Result`.
- **Regression**: Every fixed bug must have a unit test that prevents it from recurring. This test is added to `test-matrix.md` as a negative case.