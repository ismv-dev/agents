# Architecture — What does "doing a good job" mean?

> This document defines the quality standard. Review agents
> evaluate code against this file. If it's not here, it's not a requirement.

## Principles

1. **Clear Layers.** The project has three layers and only three:
- `storage` — persistence (physical storage).
- `domain` — business model and core logic.
- `interface` — user interface or entry point (CLI, Web, API).
Do not introduce additional layers (services, repositories, ORMs) until
there is a concrete reason documented in `.agents/feature_list.json`.

2. **No External Dependencies.** Only standard language libraries. If a feature
requires an external dependency, it is discussed first (status `blocked`).

3. **Explicit Errors.** Functions that can fail (id does not exist, corrupt file) throw named exceptions, not `None`.
The exception hierarchy is defined in `domain` (see `backend-guide.md`).

4. **Immutability by Default.** Domain objects must be immutable.
Modifying = creating a new instance.

5. **Disk Atomicity.** All writes to `notes.json` are first done to a temporary file and then `os.replace()`. Never leave the file half-written.

## Dependency Rule Between Layers

The dependency flow is unidirectional: `interface → domain → storage`.

`domain` never imports anything directly from `interface` or `storage` — it receives pre-loaded data or exposes functions that `storage` invokes, but not vice versa. If you find yourself importing `storage` from `domain`, it's a sign that the layers are being mixed up and the design needs to be reviewed.

## Data Flow

```
user ─→ Interface (CLI/Web/API)
├─ construct Domain Object
└─→ Storage Layer
└─→ Physical Persistence
```

## What NOT to Do

- Don't use `print()` for errors. Use `sys.stderr` and `exit code != 0`.
- Don't mix I/O with domain logic inside `notes.py`.
- Don't read/write the file in every operation within a loop.
Load at the beginning, modify in memory, save at the end.
- Don't add a configuration system. The file path is passed explicitly or the default constant is used.
- Do not import `storage` or `interface` from `domain` (see dependency rule above).