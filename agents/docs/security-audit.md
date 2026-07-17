# Auditoría de Seguridad — Proceso de Revisión

> Guía para el agente `security`. Buscar el fallo antes de que lo encuentre el atacante.

## Checklist de Revisión de Código

- [ ] **Inputs**: ¿Se validan los tipos, rangos y longitud de los inputs?
- [ ] **Excepciones**: ¿Se capturan las excepciones de IO sin exponer la ruta completa del servidor o datos sensibles en el error?
- [ ] **Paths**: ¿Se evita la concatenación directa de strings para rutas de archivos? (Prevención de Path Traversal).
- [ ] **Escritura**: ¿Se utilizan funciones seguras para la escritura atómica?
- [ ] **Dependencias**: ¿Se han verificado las versiones de las librerías externas contra bases de datos de CVE?
- [ ] **Autenticación**: ¿Los endpoints que deberían requerir token (`api-standards.md`) lo exigen realmente, sin rutas alternativas sin proteger?

## Gestión de Secretos

- **Prohibición Total**: Ninguna clave, contraseña o token debe estar en el código o en archivos de configuración versionados.
- **Carga Dinámica**: Los secretos se cargan únicamente desde variables de entorno (`os.environ`) o gestores de secretos cifrados.
- **Rotación**: Definir una política de rotación de claves para entornos de producción.

## Reporte de Vulnerabilidad

Cada hallazgo debe clasificarse según la escala CVSS (Common Vulnerability Scoring System) o similar:
- **Impacto**: Bajo, Medio, Alto, Crítico.
- **Probabilidad**: Baja, Media, Alta.
- **Solución**: Proponer una corrección técnica inmediata basada en la documentación oficial del lenguaje.
