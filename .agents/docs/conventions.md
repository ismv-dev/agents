# Code Conventions

> Extreme homogeneity. AI predicts better when the repository looks
> like itself throughout.

## Code Style

- **Version:** Use the latest stable version of the language.
- **Format:** Follow the official language style guide. Lines max 100 characters.
- **Imports:** Standard libraries first, then local ones. One line per module.
- **Strings:** Use a consistent style of quotes throughout the project.
- **Interpolation:** Use the language's native string template syntax.

## Names

| Type | Convention | Example |
|-------------------------|-------------------|-----------------------|
| Modules | `snake_case` | `notes.py` |
| Classes | `PascalCase` | `Note` |
| Functions / Variables | `snake_case` | `load_notes` |
| Constants | `UPPER_SNAKE` | `DEFAULT_NOTES_PATH` |
| Private | prefix `_` | `_atomic_write` |

## File Structure

Each code file must begin with:

```
/* Comment describing the purpose of the module. */
// Standard imports
// Local imports
```

## Tests

- One test file per module: `tests/test_<module>.py`.
- One `Test<Thing>(unittest.TestCase)` class per logical unit.
- Each test uses `tempfile.TemporaryDirectory()` and cleans up after itself.
- Descriptive test names: `test_load_returns_empty_when_file_missing`.

## Error Handling

Domain exceptions must be defined in the corresponding model module:

```
// Base domain error
// Specific error (e.g., ResourceNotFound)
```

The interface layer catches domain exceptions, prints the error message to the standard error channel (`stderr`), and terminates with a non-zero exit code. Error traces (stack traces) should never be exposed to the end user. See `backend-guide.md` for the complete error hierarchy and `verification.md` for how this is tested.

## Comments

By default, comments are not written. They are only allowed when they explain a non-obvious reason (e.g., documented workaround, subtle invariant). Names should do the rest.

## Version Control (Commits)

- Commit messages should be in imperative mode and on a single line whenever possible:

`Add empty body validation in add_note`.

- One commit = one logical change. Do not mix refactors with new features.
- Do not commit code that fails `.agents/init.sh` (see `verification.md`).