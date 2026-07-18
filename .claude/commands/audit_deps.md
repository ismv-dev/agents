# audit_deps

**Propósito:** Analizar la cadena de dependencias y librerías externas para interceptar componentes comprometidos o desactualizados.

## Instrucciones
1. Escanea los manifiestos de dependencias del proyecto (e.g., `package.json`, `go.mod`, `requirements.txt`).
2. Cruza las versiones utilizadas contra bases de datos públicas de vulnerabilidades conocidas (CVEs, GitHub Advisory Database).
3. Clasifica los riesgos y provee la ruta exacta de actualización para subsanar los fallos.

## Restricciones
- No rompas compatibilidades mayores de librerías sin alertar al Orchestrator previamente sobre posibles fallos de compilación (*breaking changes*).

## Salidas Verificables (Artifacts)
- Un reporte estructurado en `/security/dep_audit_report.json` con las vulnerabilidades encontradas, criticidad, CVE asignado y la versión segura de actualización sugerida.