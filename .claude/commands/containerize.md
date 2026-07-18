# containerize

**Propósito:** Automatizar la creación de entornos de desarrollo y producción aislados, reproducibles y eficientes.

## Instrucciones
1. Analiza los entornos de ejecución requeridos por los agentes de Backend y Frontend.
2. Crea directivas de construcción optimizadas utilizando *multi-stage builds* para reducir la superficie de ataque y el tamaño de las imágenes finales.
3. Define variables de entorno por defecto y asienta mecanismos de persistencia (volúmenes) y redes internas.

## Restricciones
- Está estrictamente prohibido usar la etiqueta `latest` para las imágenes base; especifica siempre versiones fijas y estables.
- No dejes credenciales o secretos en texto plano dentro de los archivos de configuración.

## Salidas Verificables (Artifacts)
- Archivos `Dockerfile` específicos en las raíces de cada servicio y un archivo unificado `docker-compose.yml` en la raíz del proyecto que incluya `healthcheck` funcionales para cada contenedor.