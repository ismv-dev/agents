# generate_tests

**Propósito:** Diseñar y codificar la suite de pruebas automatizadas funcionales que garanticen que el software no sufra regresiones.

## Instrucciones
1. Analiza el `PRD_INITIAL.md` y las especificaciones de la API para extraer los criterios de aceptación técnicos.
2. Desarrolla casos de prueba unitarios para las funciones y componentes core del sistema.
3. Escribe pruebas de integración enfocadas en validar los flujos críticos de la aplicación simulando las interacciones del usuario final.

## Restricciones
- Cada aserción (*assertion*) debe ser explícita y probar un único comportamiento. Evita pruebas genéricas que den falsos positivos.

## Salidas Verificables (Artifacts)
- Scripts de prueba ejecutables localizados en la carpeta `/tests` (e.g., usando Jest, Vitest, Playwright) que arrojen un reporte limpio al ejecutarse mediante consola.