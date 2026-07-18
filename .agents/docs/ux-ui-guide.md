# UX/UI Guide — Experience and Design

> Guide for the `ux-ui` agent. The design should disappear so the user can achieve their goal.

## Usability Rules

1. **Minimal Cognitive Load**: Don't overwhelm the user with options. One clear main action per screen.
2. **Immediate Feedback**: Any user action (click, submit) should have an immediate visual response (spinner, color change, message). This corresponds to the three states (loading/error/success) in `frontend-guide.md`.
3. **Real Accessibility**: Full keyboard navigation and screen reader support (semantic HTML tags).
4. **Error Prevention**: Design the interface to prevent errors (e.g., disable submit buttons while a request is in progress).

## Visual Design

- **Contrast**: Strictly comply with WCAG AA.
- **Spacing**: Use a modular scale (multiples of 4px or 8px) to maintain visual harmony.
- **Hierarchy**: Font size and weight should clearly indicate the importance of the information.
- **Consistency**: Use the same visual pattern for similar elements across all views (e.g., all primary action buttons should have the same color).

## User Flows

- Each new screen should be accompanied by a simplified flow: `Input` $\rightarrow$ `Action` $\rightarrow$ `Expected Result`.
- Minimize the number of clicks required to complete the main task.