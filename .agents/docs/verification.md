# Verification — How to prove that the work works

> Golden rule: **the agent doesn't say "it works," it proves it**.
> Every feature ends with executable evidence, not just assertions.

## Verification Levels

### Level 1 — Unit Tests (mandatory)

Every public function in `src/` has at least one test in `tests/` that:

1. Covers the successful path.
2. Covers at least one failure path if the function can fail.

Run the project's unit test suite.

### Level 2 — Interface Integration Test (mandatory for UI features)

Features that add commands or endpoints are verified by running the
real interface against a temporary environment:

```
// Temporary environment setup
// Command/request execution
// Verification of expected output
```

## What DOES NOT count as verification

- ❌ A test that only verifies that the function doesn't throw an exception. → You must check the actual result.
- ❌ A filesystem mock. → Use the real `tempfile.TemporaryDirectory()`.
- ❌ Marking the feature as `done` without passing `.agents/init.sh`.
- ❌ An agent assertion ("should work") without command output
or attached test as evidence.

## Final Check Before Closing

```bash
./init.sh # must end with [OK] Environment Ready
```

If `.agents/init.sh` is red, **do not** mark anything as `done`. Note the block
in `.agents/progress/current.md` with a status of `blocked` in `.agents/feature_list.json`.