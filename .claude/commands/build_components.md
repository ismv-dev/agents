# build_components

**Propósito:** Construir los bloques visuales atómicos e interactivos de la aplicación basándose en las especificaciones de UI/UX.

## Instrucciones
1. Consume los tokens de diseño de `/ui/theme_tokens.json` para dar estilo a los componentes.
2. Desarrolla componentes modulares, con un único principio de responsabilidad, tipados de forma estricta y accesibles.
3. Prepara los componentes para recibir datos dinámicos mediante propiedades (*props*) claras.

## Restricciones
- No acoples los componentes directamente a llamadas de red o lógica de servidores de producción en esta etapa; usa propiedades parametrizables o estados locales simulados.

## Salidas Verificables (Artifacts)
- Componentes de interfaz implementados en la carpeta correspondiente (`/frontend/components/*`) con tipado estricto (e.g., archivos `.tsx`) que compilen sin advertencias ni errores.