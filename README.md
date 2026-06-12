# agents

Repositorio para definiciones y coordinación de agentes

## Resumen

Este proyecto contiene definiciones de agentes en `.claude/agents/` para desarrollo de software

## Uso rápido

1. Importar este fuente a cualquier proyecto con cd "proyecto" && git clone --depth=1 https://github.com/ismv-dev/agents.git . && rm -rf .git
2. ejecutar claude code (por defecto usa ollama con modelos gemma4, se puede cambiar en .claude/agents/\*.md o cambiando todas las entradas en .claude que digan "gemma4:31b-cloud" por el modelo de claude)
3. ejecutar en una terminal en la base del proyecto "ollama launch claude" o "claude" y dentro de la sesión usar "/agents" dónde se recomienda seleccionar el agente "orchestrator" para mejor rendimiento

## Contribuir

Lee `CONTRIBUTING.md` para normas de colaboración y plantilla de PR/issue.

## Licencia

Ver `LICENSE`.
