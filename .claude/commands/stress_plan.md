# stress_plan

**Propósito:** Evaluar y certificar el comportamiento, estabilidad y límites del sistema bajo cargas intensas de tráfico.

## Instrucciones
1. Define escenarios de carga basados en los endpoints críticos definidos en `openapi.yaml` (ej. endpoints de escritura distribuida, transacciones o autenticación).
2. Configura rampas de usuarios concurrentes virtuales ascendentes para identificar el punto de quiebre (*break point*), latencias máximas aceptables y tasas de error de peticiones HTTP.

## Restricciones
- Está terminantemente prohibido ejecutar estos escenarios contra entornos de producción activos; limítate a configuraciones locales aisladas o de staging controladas.

## Salidas Verificables (Artifacts)
- Archivo de configuración de prueba de carga ejecutable (e.g., script de **k6** en `/tests/perf/stress.js` o archivo `.jmx` de JMeter).