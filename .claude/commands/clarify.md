# clarify

**Propósito:** Alinear el entendimiento del proyecto entre el usuario y el sistema de agentes antes de iniciar cualquier tarea de desarrollo o arquitectura.

## Instrucciones
1. **Analizar e Interrogar:** Examina la información inicial provista por el usuario.
2. **Estructurar el Alcance:** Genera un resumen ejecutivo que contenga de forma explícita:
   - **Product Goal:** El objetivo central y de negocio del producto.
   - **Épicas:** Bloques grandes de funcionalidad.
   - **Product Backlog Inicial:** Lista priorizada de Historias de Usuario preliminares o features.
   - **Requisitos de Alto Nivel:** Restricciones técnicas, funcionales y de negocio.
3. **Descubrimiento de Dudas:** Formula una lista numerada de preguntas críticas basadas en ambigüedades, dependencias o posibles cuellos de botella técnicos.
4. **Iteración Activa:** Solicita el feedback del usuario. Refina el resumen del alcance en cada iteración basándote en sus respuestas.
5. **Cierre:** Detén la iteración únicamente cuando el usuario declare explícitamente su conformidad o ejecute el tag de aprobación.

## Restricciones
- No asumas reglas de negocio no especificadas; pregunta en su lugar.
- Mantén un tono técnico, conciso y directo al grano.

## Salidas Verificables (Artifacts)
Al finalizar la interacción con el consenso del usuario, debes generar obligatoriamente un archivo en la raíz llamado `PRD_INITIAL.md` con la siguiente estructura exacta:
- `[ ]` Checkbox de aprobación del usuario firmado simbólicamente (e.g., `[x] Aprobado por Usuario`).
- Tabla de Épicas vs Requisitos de Alto Nivel.
- Formato Markdown limpio y parseable por otros agentes sin texto introductorio innecesario.