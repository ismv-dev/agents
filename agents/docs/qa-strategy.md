# Estrategia de QA — Aseguramiento de Calidad

> Guía para el agente `qa`. El objetivo no es encontrar bugs, sino demostrar que no existen.

## Mentalidad de Testing

1. **El "Camino Infeliz"**: Dedicar el 70% del tiempo a probar qué pasa cuando las cosas fallan (inputs nulos, archivos corruptos, red caída).
2. **Aislamiento Total**: Cada test debe empezar con un entorno limpio. Prohibido compartir estado entre tests.
3. **Evidencia Ejecutable**: Un reporte de QA sin código de test que lo respalde es solo una opinión (ver `verification.md`).

## Niveles de Prueba

- **Unitarios**: Prueba de la lógica más pequeña posible.
- **Integración**: Prueba de la comunicación entre dos capas (ej. `cli` -> `storage`).
- **E2E (End-to-End)**: Simulación de un usuario real desde el inicio hasta el fin del flujo.

## Gestión de Defectos

- **Bug Report**: Debe incluir: `Pasos para reproducir`, `Resultado Actual` y `Resultado Esperado`.
- **Regresión**: Todo bug corregido debe tener un test unitario que evite que vuelva a ocurrir. Ese test se agrega a `test-matrix.md` como caso negativo.
