# changelog_update

**Propósito:** Registrar de forma cronológica, ordenada y entendible para humanos las modificaciones, mejoras y correcciones del sistema entre versiones.

## Instrucciones
1. Analiza el historial de commits o las entregas de tareas completadas por los agentes desde el último hito.
2. Clasifica estrictamente los cambios bajo los siguientes encabezados estandarizados:
   - `Added` (Para nuevas características).
   - `Changed` (Para cambios en funcionalidades existentes).
   - `Deprecated` (Para características que se eliminarán pronto).
   - `Removed` (Para características eliminadas).
   - `Fixed` (Para corrección de bugs).
   - `Security` (En caso de mejoras de vulnerabilidades).

## Restricciones
- No te limites a volcar los mensajes de los commits en crudo; procesa la información para que sea clara y agregue valor semántico.

## Salidas Verificables (Artifacts)
- Archivo `CHANGELOG.md` actualizado en la raíz del sistema, siguiendo fielmente los lineamientos internacionales de la convención *Keep a Changelog*.