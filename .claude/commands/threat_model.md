# threat_model

**Propósito:** Identificar vulnerabilidades arquitectónicas y vectores de ataque potenciales en las etapas tempranas del ciclo de vida del desarrollo.

## Instrucciones
1. Evalúa el diagrama de flujo (`USER_FLOW.md`) y el esquema de datos (`init_schema.sql`) buscando fallas comunes descritas en clasificaciones de la industria (OWASP Top 10, CWE).
2. Determina riesgos asociados a inyección de dependencias, control de accesos roto, sanitización de entradas de datos y exposición de datos sensibles.
3. Asigna niveles de criticidad utilizando metodologías estándar (como el framework CVSS o una matriz cualitativa Impacto vs Probabilidad).

## Restricciones
- No asumas que los frameworks protegen de todo por defecto; valida que las configuraciones explícitas mitiguen activamente los ataques.

## Salidas Verificables (Artifacts)
- Archivo `/security/THREAT_MODEL.md` conteniendo la matriz detallada de riesgos identificados con sus correspondientes contramedidas y estrategias técnicas de mitigación.