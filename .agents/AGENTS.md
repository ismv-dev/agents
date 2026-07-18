# AGENTS.md — Navigation Map for AI Agents

> This file is the **entry point** for any agent working in this
> repository. It is NOT a rulebook: it is a **map**. Read only what
> you need, when you need it (progressive disclosure).

---

## 1. Before You Start (Required)

1. Run `.agents/init.sh` and verify that it finishes without errors. If it fails, **stop** and resolve the environment before touching any code.
2. Read `.agents/progress/current.md` to understand the state of the last session.
3. Read `.agents/feature_list.json` and choose **one** task with a `pending` status. Do not work on more than one at a time.

## 2. Agent Architecture Map

| File / Folder | What it Contains | When to Read It |
|------------------------------|-----------------------------------------------------------|---------------|
| `.agents/feature_list.json` | List of tasks with status (pending / in_progress / done) | Always, at startup |
| `.agents/progress/current.md` | Current session status | Always, at startup |
| `.agents/progress/history.md` | Append-only log of previous sessions | If you need historical context |
| `.agents/docs/architecture.md` | Overview and design principles | Before implementation |
| `.agents/docs/conventions.md` | Style rules, naming conventions, and structure | Before writing code |
| `.agents/docs/verification.md` | Acceptance and validation criteria | Before declaring a task as `done` |
| `.agents/docs/backend-guide.md` | Backend Patterns and Error Handling | Backend Agents |
| `.agents/docs/api-standards.md` | REST API Design Standards | Backend Agents |
| `.agents/docs/frontend-guide.md` | Frontend State and Component Management | Frontend Agents |
| `.agents/docs/ux-ui-guide.md` | Accessibility and Responsive Design | UX/UI Agents |
| `.agents/docs/qa-strategy.md` | Test Types and Bug Reporting | QA Agents |
| `.agents/docs/test-matrix.md` | Defining Test Scenarios | QA Agents |
| `.agents/docs/security-hardening.md` | Secret Management and Input Validation | Security Agents |
| `.agents/docs/security-audit.md` | Vulnerability Analysis and Auditing | Security Agents |
| `.agents/docs/cicd-pipeline.md` | Git Flow and Deployment Automation | DevOps Agents |
| `.agents/docs/iac-standards.md` | Infrastructure as Code Standards | DevOps Agents |
| `.agents/CHECKPOINTS.md` | Objective Criteria for a "Good End State" | For Self-Assessment |
| `.claude/agents/` | Sub-Agent Definitions (Leader, Implementer, Reviewer) | If You Orchestrate Work |
| `.agents/scripts/demo_orchestration.py` | Demo of the Leader-Worker Pattern with Disk Writing | To Understand the Anti-Telephone Rule |

## 3. Hard Rules (Non-Negotiable)

- **Only one feature at a time.** Don't mix changes from multiple tasks in the same session.
- **Don't declare a task `done` without green tests.** Run `.agents/init.sh` and ensure the test block passes 100%.
- **Document what you do** in `.agents/progress/current.md` as you work, not at the end.
- **Clean up the repository** before closing the session (see §5).
- **If you don't know something, look it up in `.agents/docs/`** before inventing it.

## 4. How to Choose a Task

```
1. Open feature_list.json
2. Filter by status == "pending"
3. Select the task with the lowest "id"
4. Change its status to "in_progress" and save
5. Note the following in progress/current.md: feature, start time, brief plan
```

## 5. Log Out (Lifecycle)

Before finishing:

1. Run `.agents/init.sh` — everything is green.
2. If the task is finished: mark `status: "done"` in `.agents/feature_list.json`.
3. Move the summary from `.agents/progress/current.md` to the end of `.agents/progress/history.md`.
4. Empty `.agents/progress/current.md`, leaving only the template.
5. Do not leave temporary files, debug messages, or TODOs without context.

## 6. If you get stuck

- Reread the relevant section of `.agents/docs/`.
- If the tool is not doing what you expect, **do not create a workaround**:
document the stuck issue in `.agents/progress/current.md` and close the session.