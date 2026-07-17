# Infraestructura como Código (IaC) — Definición del Entorno

> Guía para el agente `devops`. El entorno es código, no una configuración manual.

## Principios de Entorno

1. **Reproducibilidad**: Cualquier desarrollador debe poder levantar el entorno exacto con un solo comando.
2. **Inmutabilidad**: No se hacen cambios manuales en los servidores. Cualquier cambio pasa por el repositorio de IaC.
3. **Separación de Entornos**:
   - `Dev`: Experimentación y tests rápidos.
   - `Staging`: Espejo de producción para validación final.
   - `Prod`: Entorno estable y restringido.

## Estándares Técnicos

- **Definición de Recursos**: Uso de archivos de configuración declarativos (YAML/JSON).
- **Gestión de Estado**: El estado de la infraestructura debe persistirse fuera del servidor de despliegue para evitar la pérdida de datos.
- **Secretos**: Los archivos de IaC nunca contienen secretos en texto plano
  (ver `security-audit.md`, Gestión de Secretos). Referenciar el nombre de la
  variable de entorno o del secreto gestionado, no su valor.

## Verificación de Infraestructura

- Ejecutar "Dry-run" o "Plan" antes de aplicar cualquier cambio en producción.
- Implementar Health Checks automáticos para verificar que el servicio está vivo tras el despliegue.
- Un Health Check en rojo tras un despliegue dispara el rollback definido en `cicd-pipeline.md`.
