# Arquitectura — Qué significa "hacer un buen trabajo"

> Este documento define el estándar de calidad. Los agentes revisores
> evalúan código contra este archivo. Si no está aquí, no es un requisito.

## Principios

1. **Capas claras.** El proyecto tiene tres capas y solo tres:
   - `storage` — persistencia (almacenamiento físico).
   - `domain` — modelo de negocio y lógica central.
   - `interface` — interfaz de usuario o punto de entrada (CLI, Web, API).
   No introducir capas adicionales (servicios, repositorios, ORMs) hasta que
   haya una razón concreta documentada en `.agents/feature_list.json`.

2. **Sin dependencias externas.** Solo librerías estándar del lenguaje. Si una feature
   requiere una dependencia externa, primero se discute (estado `blocked`).

3. **Errores explícitos.** Las funciones que pueden fallar (id no existe,
   archivo corrupto) lanzan excepciones nombradas, no devuelven `None`.
   La jerarquía de excepciones se define en `domain` (ver `backend-guide.md`).

4. **Inmutabilidad por defecto.** Los objetos de dominio deben ser inmutables.
   Modificar = crear una nueva instancia.

5. **Atomicidad en disco.** Toda escritura a `notes.json` se hace primero
   en un archivo temporal y luego `os.replace()`. Nunca dejar el archivo
   a medio escribir.

## Regla de dependencia entre capas

El flujo de dependencia va en una sola dirección: `interface → domain → storage`.
`domain` nunca importa nada de `interface` ni de `storage` directamente —
recibe datos ya cargados o expone funciones que `storage` invoca, pero no al
revés. Si te encontrás importando `storage` desde `domain`, es una señal de
que la capa se está mezclando y hay que revisar el diseño.

## Flujo de datos

```
usuario  ─→  Interface (CLI/Web/API)
              │
              ├─ construye Objeto de Dominio
              │
              └─→  Storage Layer
                       │
                       └─→  Persistencia Física
```

## Qué NO hacer

- No usar `print()` para errores. Usa `sys.stderr` y exit code != 0.
- No mezclar IO con lógica de dominio dentro de `notes.py`.
- No leer/escribir el archivo en cada operación dentro de un bucle.
  Carga al inicio, modifica en memoria, guarda al final.
- No añadir un sistema de configuración. La ruta del archivo se pasa
  explícitamente o usa la constante por defecto.
- No importar `storage` ni `interface` desde `domain` (ver regla de dependencia arriba).
