# Guía de UX/UI — Experiencia y Diseño

> Guía para el agente `ux-ui`. El diseño debe desaparecer para que el usuario logre su objetivo.

## Reglas de Usabilidad

1. **Carga Cognitiva Mínima**: No abrumar al usuario con opciones. Una acción principal clara por pantalla.
2. **Feedback Inmediato**: Cualquier acción del usuario (clic, submit) debe tener una respuesta visual inmediata (spinner, cambio de color, mensaje). Corresponde con los tres estados (cargando/error/éxito) de `frontend-guide.md`.
3. **Accesibilidad Real**: Navegación completa por teclado y soporte de lectores de pantalla (etiquetas HTML semánticas).
4. **Prevención de Errores**: Diseñar la interfaz para evitar errores (ej. deshabilitar botones de submit mientras hay una petición en curso).

## Diseño Visual

- **Contraste**: Cumplir estrictamente con WCAG AA.
- **Espaciado**: Uso de una escala modular (múltiplos de 4px u 8px) para mantener la armonía visual.
- **Jerarquía**: El tamaño y el peso de la fuente deben indicar claramente la importancia de la información.
- **Consistencia**: Usar el mismo patrón visual para elementos similares en todas las vistas (ej. todos los botones de acción primaria deben tener el mismo color).

## Flujos de Usuario (User Flows)

- Cada nueva pantalla debe acompañarse de un flujo simplificado: `Entrada` $\rightarrow$ `Acción` $\rightarrow$ `Resultado Esperado`.
- Minimizar el número de clics necesarios para completar la tarea principal.
