# Frontend Guide — User Interfaces

> Standard for the frontend agent. Less is more. The UI should be a direct representation of the state.

## UI Philosophy

1. **Declarative State**: The view should be a function of the state. Do not manually manipulate the DOM/UI; update the state and let the view refresh.
2. **Zero Business Logic**: The frontend does not decide how data is stored or processed; it only calls the API and renders the result.
3. **Performance**: Avoid unnecessary renders. Use memory only in complex components.

## Component Structure

- **Presentational Components**: Receive props and render HTML. They do not have complex internal state.
- **Container Components**: Manage state and communication with the API.

## Handling Loading and Error States

- Every component that calls the API must explicitly model three states: loading, error, and success. Do not assume that the response will always be successful.
- API errors (`api-standards.md`) are translated into user-readable messages; the raw `error_code` is never displayed in the UI.
- See `ux-ui-guide.md` for the expected visual feedback in each state.

## Style and Consistency

- Use CSS variables/tokens for colors and spacing.
- Each component must be tested on at least two screen resolutions (mobile and desktop).