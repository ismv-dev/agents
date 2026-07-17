# CHECKPOINTS — Evaluación del estado final

> En sistemas multi-agente no se evalúa el camino, se evalúa el destino.
> Estos son los checkpoints objetivos que un juez (humano o IA) puede usar
> para decidir si el proyecto está sano.

## C1 — El arnés está completo

- [ ] El script `.agents/utils/init.sh` termina con exit code 0

## C2 — El estado es coherente

- [ ] Como mucho una feature en `in_progress` en `.agents/feature_list.json`.
- [ ] Toda feature `done` tiene tests asociados que pasan.
- [ ] `.agents/progress/current.md` está vacío o describe la sesión activa (no contiene basura de sesiones anteriores).

## C3 — El código respeta la arquitectura

- [ ] El proyecto es fiel a la arquitectura base definida en `.agents/docs/architecture.md`.
- [ ] No hay retornos en terminal sueltos para debug, ni TODOs sin contexto.

## C4 — La verificación es real

- [ ] El directorio de tests tiene al menos un test por cada módulo del proyecto.
- [ ] El retorno del comando de test para el framework muestra > 0 test correctos.

## C5 — La sesión se cerró bien

- [ ] No hay archivos sin trackear sospechosos (`*.tmp`, `__pycache__`
      fuera del `.gitignore`).
- [ ] `progress/history.md` tiene una entrada por la última sesión.
- [ ] La última feature trabajada está reflejada en su estado correcto.

---

**Cómo usar este archivo:** un agente revisor (`.claude/agents/documentation.md`) recorre cada checkbox, marca `[x]` o `[ ]`, y rechaza el cierre de sesión si quedan boxes vacíos en C1-C5.
