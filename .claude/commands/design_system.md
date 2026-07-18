# design_system

**Propósito:** Establecer los fundamentos visuales y de accesibilidad que gobernarán la consistencia estética de la interfaz de usuario.

## Instrucciones
1. Define la paleta de colores (primarios, secundarios, semánticos de éxito/error, neutros) con sus respectivos códigos HEX/RGBA.
2. Modela la escala tipográfica (pesos, tamaños de fuente y alturas de línea) y los tokens de espaciado/radios de borde.
3. Asegura que las combinaciones de color cumplan con el estándar de accesibilidad **WCAG AAA** o al menos **AA** para contraste de texto.

## Restricciones
- No utilices descripciones ambiguas como "un azul bonito"; sé matemáticamente preciso con los valores CSS/JSON.

## Salidas Verificables (Artifacts)
- Genera el archivo `/ui/theme_tokens.json` estructurado de forma jerárquica para ser consumido directamente por frameworks de CSS-in-JS, Tailwind, o variables nativas.