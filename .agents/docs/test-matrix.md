# Test Case Matrix — Scenario Design

> Guide for the QA agent. Map complexity before writing code.

## Scenario Types

1. **Happy Path**: The user does everything correctly.
2. **Edge Cases**:
- Empty lists.
- 0-byte files.
- File names with special characters.
- Memory or disk limits.
3. **Negative Cases**: Attempting to delete something that doesn't exist, editing a corrupted file.

## Matrix Design

For each feature, create a table:
| Scenario | Input | Expected Result | Priority |
|-----------|---------|-------------------|-----------|
| Create empty note | body="" | Error: "Required body" | High |
| Upload without file | N/A | Return empty list [] | Average |

## Acceptance Criteria

The feature is considered verified only when 100% of the scenarios in the matrix have an associated test and pass (see `verification.md`, Level 1).