# Backend Guide — Server Engineering and Logic

> Standard for the backend agent. The goal is absolute simplicity and robustness.

## Implementation Principles

1. **Pure Logic**: The application core (`domain`) should not be aware of the existence of files, databases, or the console. It only operates on domain objects.
2. **Strict Typing**: All functions must have type annotations. Use `Optional` or equivalents only when the value is truly omittable.
3. **Efficient Loading**: State is loaded only once at the beginning of execution and persisted only once at the end. Repetitive I/O in loops is prohibited.
4. **Separation of Concerns**: Do not mix format validation logic (Syntax) with business validation logic (Semantics). This corresponds to the `400` vs. `422` distinction in `api-standards.md`: invalid syntax = `400`, violated business rule = `422`.

## Error Handling

- **Domain Exceptions**: Define an error hierarchy in the model module. Errors should be informative but not expose internal system details (full file paths, stack traces, table names).
- **Fail-Fast**: Validate inputs at the beginning of the function. If the data is invalid, throw the exception immediately to avoid inconsistent states.
- **Recovery**: The interface layer is solely responsible for deciding whether an error is recoverable or if execution should terminate.

## Data Standards

- **Serialization**: JSON is the preferred format for simple persistence. For binary data, use standardized formats.
- **Structure**: Data should be stored flat or with minimal nesting to facilitate human readability and debugging.
- **Atomicity**: Every write operation must guarantee that, in case of failure, the previous state remains intact (Write-Ahead Logging or temporary files + `os.replace()`, see `architecture.md`).

## Concurrency

- If two processes can write to the same state file, explicitly define
the strategy (file lock, or accept "last to write wins" and document it).
Do not leave it implicit: it is a common cause of silent data corruption.