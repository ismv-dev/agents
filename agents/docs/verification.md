# Verificación — Cómo demostrar que el trabajo funciona

> Regla de oro: **el agente no dice "funciona", lo demuestra**.
> Toda feature termina con evidencia ejecutable, no con afirmaciones.

## Niveles de verificación

### Nivel 1 — Tests unitarios (obligatorio)

Toda función pública en `src/` tiene al menos un test en `tests/` que:

1. Cubre el camino feliz.
2. Cubre al menos un camino de error si la función puede fallar.

Ejecutar la suite de tests unitarios del proyecto.

### Nivel 2 — Test de integración de Interfaz (obligatorio para features de UI)

Las features que añaden comandos o endpoints se verifican ejecutando la
interfaz real contra un entorno temporal:

```
// Setup de entorno temporal
// Ejecución de comando/petición
// Verificación de salida esperada
```

## Qué NO cuenta como verificación

- ❌ Un test que solo verifica que la función no lanza excepción.
  → tiene que comprobar el resultado concreto.
- ❌ `mock` del filesystem. → usa `tempfile.TemporaryDirectory()` real.
- ❌ Marcar la feature como `done` sin pasar `.agents/init.sh`.
- ❌ Una afirmación del agente ("debería funcionar") sin salida de comando
  o test adjunta como evidencia.

## Verificación final antes de cerrar

```bash
./init.sh           # debe terminar con [OK] Entorno listo
```

Si `.agents/init.sh` está rojo, **no** marques nada como `done`. Anota el bloqueo
en `.agents/progress/current.md` con estado `blocked` en `.agents/feature_list.json`.
