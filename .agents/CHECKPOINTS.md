# CHECKPOINTS — Final State Evaluation

> In multi-agent systems, the path is not evaluated; the destination is.
> These are the objective checkpoints that a judge (human or AI) can use
> to decide if the project is sound.

## C1 — The harness is complete

- [ ] The script `.agents/utils/init.sh` ends with exit code 0

## C2 — The state is consistent

- [ ] At most one feature in `in_progress` in `.agents/feature_list.json`.
- [ ] Every `done` feature has associated tests that pass.
- [ ] `.agents/progress/current.md` is empty or describes the active session (it does not contain garbage from previous sessions).

## C3 — The code adheres to the architecture

- [ ] The project adheres to the base architecture defined in `.agents/docs/architecture.md`.
- [ ] There are no loose terminal returns for debugging, nor are there any contextless TODOs.

## C4 — Verification is successful

- [ ] The test directory has at least one test for each module in the project.
- [ ] The test command return for the framework shows > 0 successful tests.

## C5 — Session closed successfully

- [ ] There are no suspicious untracked files (`*.tmp`, `__pycache__` outside of `.gitignore`).
- [ ] `progress/history.md` has one entry for the last session.
- [ ] The last feature worked on is reflected in its correct state.

---

**How ​​to use this file:** A reviewing agent (`.claude/agents/documentation.md`) iterates through each checkbox, marks `[x]` or `[ ]`, and rejects the logout if there are any empty boxes in C1-C5.