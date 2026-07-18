# route

**Propósito:** Descomponer los requisitos aprobados en subtareas específicas y asignarlas a los agentes correspondientes siguiendo una secuencia lógica.

## Instrucciones
1. Toma como entrada obligatoria el archivo `PRD_INITIAL.md`.
2. Mapea qué componentes requieren atención de Backend, Frontend, DevOps, UI/UX, Security o QA.
3. Establece una cadena de dependencia lógica (e.g., UI/UX debe definir componentes antes de que Frontend construya).
4. Asigna un identificador único a cada subtarea.

## Restricciones
- No generes código fuente; tu única tarea es la planeación y delegación.
- Asegúrate de que ninguna tarea quede huérfana de agente responsable.

## Salidas Verificables (Artifacts)
- Genera un archivo JSON en la raíz llamado `pipeline.json` que liste el array de tareas, el agente asignado, las dependencias de la tarea y el estado inicial (`PENDING`).