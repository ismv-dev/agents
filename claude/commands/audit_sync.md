# audit_sync

**Propósito:** Verificar la consistencia transversal entre los artefactos generados por los diferentes agentes para evitar discrepancias técnicas.

## Instrucciones
1. Lee los archivos de configuración y código generados por los demás agentes en el espacio de trabajo.
2. Cruza la definición de la base de datos (`init_schema.sql`), el contrato de API (`openapi.yaml`) y el tipado de componentes frontend para asegurar consistencia de nombres, tipos de datos y estructuras.
3. Identifica campos faltantes, tipos incompatibles o endpoints declarados pero no consumidos.

## Restricciones
- No intentes corregir los archivos directamente. Reporta las inconsistencias detectadas para que el agente responsable las resuelva.

## Salidas Verificables (Artifacts)
- Genera un reporte detallado en `sync_report.log` con formato: `[FECHA][AGENTE][NIVEL: ERROR/WARN] Descripción detallada del desajuste técnico`. Si todo coincide, escribe únicamente: `STATUS: SYNC_OK`.