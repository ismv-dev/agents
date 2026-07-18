# scaffold_api

**Propósito:** Diseñar y estructurar los contratos de API y endpoints del sistema basándose en las necesidades del negocio.

## Instrucciones
1. Analiza el `PRD_INITIAL.md` para identificar los recursos y entidades del sistema.
2. Define los métodos HTTP correctos (`GET`, `POST`, `PUT`, `DELETE`, `PATCH`), códigos de estado estándar (200, 201, 400, 401, 403, 404, 500) y estructuras de payload (Request/Response).
3. Asegura el cumplimiento de principios RESTful o convenciones RPC según corresponda.

## Restricciones
- No escribas lógica interna ni controladores, concéntrate estrictamente en la definición de la interfaz de comunicación.

## Salidas Verificables (Artifacts)
- Crea un archivo OpenAPI 3.0 estándar llamado `openapi.yaml` (o `swagger.json`) en la carpeta `/docs` que pase cualquier validación de linter sintáctico.