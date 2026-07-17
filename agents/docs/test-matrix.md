# Matriz de Casos de Prueba — Diseño de Escenarios

> Guía para el agente `qa`. Mapear la complejidad antes de escribir el código.

## Tipos de Escenarios

1. **Camino Feliz (Happy Path)**: El usuario hace todo correctamente.
2. **Casos de Borde (Edge Cases)**:
   - Listas vacías.
   - Archivos de 0 bytes.
   - Nombres de archivos con caracteres especiales.
   - Límites de memoria o disco.
3. **Casos Negativos**: Intentar borrar algo que no existe, editar un archivo corrupto.

## Diseño de la Matriz

Para cada feature, crear una tabla:
| Escenario | Entrada | Resultado Esperado | Prioridad |
|-----------|---------|-------------------|-----------|
| Crear nota vacía | body="" | Error: "Cuerpo obligatorio" | Alta |
| Cargar sin archivo | N/A | Retornar lista vacía [] | Media |

## Criterio de Aceptación

La feature se considera verificada solo cuando el 100% de los escenarios de la matriz tienen un test asociado y pasan en verde (ver `verification.md`, Nivel 1).
