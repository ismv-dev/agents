# Pipeline de CI/CD — Automatización y Entrega

> Guía para el agente `devops`. Eliminar el error humano mediante la automatización.

## Flujo de Promoción

`Feature Branch` $\rightarrow$ `Pull Request` $\rightarrow$ `Main`

1. **Validación Local**: El implementador corre los tests.
2. **Validación Automática**: El pipeline ejecuta el script `.agents/init.sh` y la suite de tests completa.
3. **Validación Humana/Sintética**: El revisor aprueba la lógica y la calidad.

## Protección de Rama

- `main` no acepta pushes directos. Todo cambio entra por Pull Request.
- El pipeline (paso 2) debe estar en verde antes de poder mergear; no es opcional
  ni se puede saltar con permisos de administrador salvo incidente documentado.

## Estándares de Automatización

- **Idempotencia**: El script de despliegue debe poder ejecutarse 10 veces y dejar el sistema siempre en el mismo estado.
- **Logs**: Todas las etapas del pipeline deben generar logs claros y estructurados para facilitar el debug de fallos en el servidor.

## Rollback

- Todo despliegue a producción debe tener un camino de vuelta atrás sin intervención
  manual compleja: re-desplegar el tag anterior debe bastar.
- El Health Check post-despliegue (ver `iac-standards.md`) es lo que dispara el
  rollback automático si existe, o la alerta para rollback manual si no.

## Gestión de Versiones

- Uso de Semantic Versioning (SemVer): `MAJOR.MINOR.PATCH`.
- Cada release debe generar un tag en Git y un archivo de `CHANGELOG.md` actualizado.
