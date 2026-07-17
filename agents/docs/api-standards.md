# Estándares de API — Interfaz de Comunicación

> Guía para el diseño de contratos de datos. La consistencia es más importante que la sofisticación.

## Diseño de Contratos

1. **Sencillez**: Menos endpoints es mejor. Agrupar funcionalidades relacionadas en un único recurso.
2. **Formato de Respuesta**:
   - Éxito: Objeto JSON con los datos solicitados y metadatos de paginación si aplica.
   - Error: Objeto con `{"error": "codigo_error", "message": "descripcion_humana"}`.
3. **Idempotencia**: Las operaciones de escritura (PUT/DELETE) deben ser idempotentes; ejecutar la misma petición múltiples veces no debe alterar el resultado final.

## Reglas de Intercambio

- **Inmutabilidad**: Las respuestas de la API deben ser tratadas como read-only por el consumidor.
- **Carga**: No devolver campos innecesarios. Si el cliente necesita el detalle, debe hacer una petición específica por ID.
- **Tipado de Campos**: Mantener la consistencia en los tipos de datos (ej. siempre usar ISO 8601 para fechas).

## Versionado

- La versión va en la ruta: `/v1/notes`, nunca en un header custom ni en query string.
- Un cambio incompatible (romper un tipo de campo, eliminar un campo, cambiar
  semántica de un endpoint) obliga a incrementar la versión mayor (`/v2`).
  Añadir un campo opcional nuevo no es un cambio incompatible.
- No mantener más de dos versiones activas en simultáneo salvo excepción documentada.

## Autenticación y Autorización

- Toda petición autenticada usa el header estándar `Authorization: Bearer <token>`.
- La capa de interfaz valida el token antes de invocar cualquier lógica de dominio;
  el dominio nunca debe conocer el mecanismo de autenticación (ver `architecture.md`).
- Un token invalid o ausente responde `401`. Un token valid sin permisos
  suficientes responde `403`. No se debe filtrar cuál de los dos casos aplica
  en el mensaje de error si eso revela información sensible sobre el recurso.

## Códigos de Estado HTTP

| Código | Uso |
|--------|-----|
| 200 | Éxito en lectura o escritura |
| 201 | Recurso creado |
| 400 | Petición malformada (JSON invalid, tipo de dato incorrecto) |
| 401 | No autenticado |
| 403 | Autenticado pero sin permiso |
| 404 | Recurso no existe |
| 409 | Conflicto (ej. edición concurrente, recurso ya existe) |
| 422 | Sintaxis válida pero semánticamente inválida (falla una regla de negocio) |
| 429 | Rate limit excedido |
| 500 | Error no controlado del servidor |

La distinción entre `400` y `422` importa: `400` es "no pude ni parsear esto",
`422` es "lo parseé pero viola una regla de negocio" (ver `backend-guide.md`,
separación entre validación sintáctica y semántica).

## Paginación

- Parámetros estándar: `limit` (default y max documentados explícitamente)
  y `cursor` u `offset` — elegir uno y ser consistente en toda la API.
- La respuesta paginada incluye siempre `has_more` o un `next_cursor` explícito;
  no forzar al cliente a inferirlo del tamaño de la página.

## Rate Limiting

- Definir un límite por cliente/token y devolver `429` con header `Retry-After`
  cuando se excede. No fallar en silencio ni degradar la respuesta sin avisar.

## Validación de API

- Cada endpoint debe tener un test que verifique la estructura del JSON devuelto (contrato).
- Verificación de códigos de estado HTTP correctos, incluyendo los casos de error (401/403/404/409/422/429), no solo el camino feliz.
- Pruebas de carga básica para identificar cuellos de botella en la serialización de datos.
