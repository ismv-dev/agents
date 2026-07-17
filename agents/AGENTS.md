# AGENTS.md — Mapa de navegación para agentes de IA

> Este archivo es el **punto de entrada** para cualquier agente que trabaje en este
> repositorio. NO es una biblia de reglas: es un **mapa**. Lee solo lo que
> necesites cuando lo necesites (divulgación progresiva).

---

## 1. Antes de empezar (obligatorio)

1. Ejecuta `.agents/init.sh` y verifica que termina sin errores. Si falla, **para** y resuelve el entorno antes de tocar código.
2. Lee `.agents/progress/current.md` para entender en qué estado quedó la última sesión.
3. Lee `.agents/feature_list.json` y elige **una** tarea con estado `pending`. No
   trabajes en más de una a la vez.

## 2. Mapa del repositorio

| Archivo / carpeta            | Qué contiene                                              | Cuándo leerlo |
|------------------------------|-----------------------------------------------------------|---------------|
| `.agents/feature_list.json`          | Lista de tareas con estado (pending / in_progress / done) | Siempre, al empezar |
| `.agents/progress/current.md`        | Estado de la sesión actual                                | Siempre, al empezar |
| `.agents/progress/history.md`        | Bitácora append-only de sesiones anteriores               | Si necesitas contexto histórico |
| `.agents/docs/architecture.md`       | Visión general y principios de diseño                      | Antes de implementar |
| `.agents/docs/conventions.md`        | Reglas de estilo, nombres y estructura                      | Antes de escribir código |
| `.agents/docs/verification.md`       | Criterios de aceptación y validación                          | Antes de declarar una tarea como `done` |
| `.agents/docs/backend-guide.md`       | Patrones y manejo de errores de backend                      | Agentes Backend |
| `.agents/docs/api-standards.md`      | Estándares de diseño de APIs REST                            | Agentes Backend |
| `.agents/docs/frontend-guide.md`      | Gestión de estado y componentes frontend                     | Agentes Frontend |
| `.agents/docs/ux-ui-guide.md`         | Accesibilidad y diseño responsivo                            | Agentes UX/UI |
| `.agents/docs/qa-strategy.md`         | Tipos de pruebas y reporte de bugs                           | Agentes QA |
| `.agents/docs/test-matrix.md`         | Definición de escenarios de prueba                             | Agentes QA |
| `.agents/docs/security-hardening.md` | Gestión de secretos y validación de inputs                 | Agentes Security |
| `.agents/docs/security-audit.md`      | Análisis de vulnerabilidades y auditoría                    | Agentes Security |
| `.agents/docs/cicd-pipeline.md`       | Flujo de Git y automatización de despliegue                 | Agentes DevOps |
| `.agents/docs/iac-standards.md`       | Estándares de Infraestructura como Código                     | Agentes DevOps |
| `.agents/CHECKPOINTS.md`             | Criterios objetivos de "estado final correcto"            | Para auto-evaluarte |
| `.claude/agents/`            | Definiciones de subagentes (líder, implementador, revisor) | Si orquestas trabajo |
| `.agents/scripts/demo_orchestration.py` | Demo del patrón Líder-Trabajador con escritura en disco | Para entender la regla anti-teléfono-descompuesto |

## 3. Reglas duras (no negociables)

- **Una sola feature a la vez.** No mezcles cambios de varias tareas en la misma sesión.
- **No declares una tarea `done` sin pruebas verdes.** Ejecuta `.agents/init.sh` y
  asegúrate de que el bloque de tests pasa al 100%.
- **Documenta lo que haces** en `.agents/progress/current.md` mientras trabajas, no al final.
- **Deja el repositorio limpio** antes de cerrar la sesión (ver §5).
- **Si no sabes algo, busca en `.agents/docs/`** antes de inventarlo.

## 4. Cómo elegir una tarea

```
1. Abre feature_list.json
2. Filtra por status == "pending"
3. Coge la de menor "id"
4. Cambia su status a "in_progress" y guarda
5. Anota en progress/current.md: feature, hora de inicio, plan breve
```

## 5. Cierre de sesión (lifecycle)

Antes de terminar:

1. Ejecuta `.agents/init.sh` — todo verde.
2. Si la tarea está acabada: marca `status: "done"` en `.agents/feature_list.json`.
3. Mueve el resumen de `.agents/progress/current.md` al final de `.agents/progress/history.md`.
4. Vacía `.agents/progress/current.md` dejando solo la plantilla.
5. No dejes archivos temporales, ni mensajes de debug, ni TODOs sin contexto.

## 6. Si te bloqueas

- Relee la sección relevante de `.agents/docs/`.
- Si la herramienta no hace lo que esperas, **no inventes un workaround**:
  documenta el bloqueo en `.agents/progress/current.md` y para la sesión.
