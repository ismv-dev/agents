# API Standards — Communication Interface

> Guide to designing data contracts. Consistency is more important than sophistication.

## Contract Design

1. **Simplicity**: Fewer endpoints are better. Group related functionalities into a single resource.

2. **Response Format**:
- Success: JSON object with the requested data and pagination metadata, if applicable.
- Error: Object with `{"error": "error_code", "message": "human_description"}`.

3. **Idempotency**: Write operations (PUT/DELETE) must be idempotent; executing the same request multiple times should not alter the final result.

## Exchange Rules

- **Immutability**: API responses must be treated as read-only by the consumer.
- **Loading**: Do not return unnecessary fields. If the client needs the details, they must make a specific request for each ID.
- **Field Typing**: Maintain consistency in data types (e.g., always use ISO 8601 for dates).

## Versioning

- The version is located in the path: `/v1/notes`, never in a custom header or query string.
- An incompatible change (breaking a field type, deleting a field, changing the semantics of an endpoint) requires incrementing the major version (`/v2`). Adding a new optional field is not an incompatible change.
- Do not maintain more than two active versions simultaneously except in documented cases.

## Authentication and Authorization

- All authenticated requests use the standard header `Authorization: Bearer <token>`.
- The interface layer validates the token before invoking any domain logic;
the domain should never know the authentication mechanism (see `architecture.md`).
- An invalid or missing token returns `401`. A valid token without sufficient permissions returns `403`. Filtering which of the two applies in the error message should not reveal sensitive information about the resource.

## HTTP Status Codes

| Code | Usage |
|--------|-----|
| 200 | Read or write successful |
| 201 | Resource created |
| 400 | Malformed request (invalid JSON, incorrect data type) |
| 401 | Not authenticated |
| 403 | Authenticated but without permission |
| 404 | Resource does not exist |
| 409 | Conflict (e.g., concurrent edit, resource already exists) |
| 422 | Syntax valid but semantically invalid (business rule fails) |
| 429 | Rate limit exceeded |
| 500 | Unhandled Server Error |

The distinction between `400` and `422` matters: `400` means "I couldn't even parse this,"
`422` means "I parsed it, but it violates a business rule" (see `backend-guide.md`,
separation between syntactic and semantic validation).

## Pagination

- Standard parameters: `limit` (default and max explicitly documented)
and `cursor` or `offset` — choose one and be consistent throughout the API.
- The paginated response always includes `has_more` or an explicit `next_cursor`; don't force the client to infer it from the page size.

## Rate Limiting

- Define a rate limit per client/token and return `429` with a `Retry-After` header when it's exceeded. Don't fail silently or degrade the response without warning.

## API Validation

- Each endpoint must have a test that verifies the structure of the returned JSON (contract).
- Verification of correct HTTP status codes, including error cases (401/403/404/409/422/429), not just successful paths.
- Basic load testing to identify bottlenecks in data serialization.