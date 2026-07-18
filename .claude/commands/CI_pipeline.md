# CI_pipeline

**Propósito:** Definir el flujo automatizado de integración continua que valide la calidad del código antes de cualquier fusión en la rama principal.

## Instrucciones
1. Configura un pipeline automatizado que se dispare ante eventos de `push` o `pull_request`.
2. Integra etapas secuenciales: Instalación de dependencias -> Linters/Formatters -> Pruebas Unitarias -> Pruebas de Integración -> Build de Verificación.
3. Administra el almacenamiento de caché para optimizar los tiempos de ejecución del pipeline.

## Restricciones
- No agregues pasos de despliegue (CD) a menos que la etapa de integración pase con un estado de éxito del 100%.

## Salidas Verificables (Artifacts)
- Archivo de configuración del proveedor de CI seleccionado (e.g., `.github/workflows/ci.yml` o `.gitlab-ci.yml`) sintácticamente valid.