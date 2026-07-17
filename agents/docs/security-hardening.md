# Seguridad y Hardening — Blindaje de la Aplicación

> Guía para el agente `security`. La seguridad no es una feature, es una propiedad del sistema.

## Principios de Seguridad

1. **Confianza Cero (Zero Trust)**: No confiar en ningún dato que venga de fuera del núcleo del programa, incluso si viene de otro módulo interno.
2. **Menor Privilegio**: La aplicación solo debe tener los permisos estrictamente necesarios sobre el sistema de archivos.
3. **Superficie de Ataque Mínima**: No instalar dependencias innecesarias. Cada línea de código externo es un riesgo potencial (ver `architecture.md`, "Sin dependencias externas").

## Vectores de Ataque y Mitigación

- **Inyección**: Sanitizar cualquier input que se use para construir rutas de archivos o comandos de sistema.
- **Fuga de Datos**: Asegurar que los logs no impriman secretos, tokens o información sensible del usuario.
- **Denegación de Servicio (DoS)**: Limitar la lectura de archivos excesivamente grandes que puedan agotar la RAM. Complementar con el rate limiting de `api-standards.md` para DoS a nivel de tráfico.

## Auditoría

- Revisión obligatoria de todas las funciones que realizan IO.
- Análisis de dependencias mediante herramientas de escaneo de vulnerabilidades (CVE).
