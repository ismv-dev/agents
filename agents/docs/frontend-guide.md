# Guía de Frontend — Interfaces de Usuario

> Estándar para el agente `frontend`. Menos es más. El UI debe ser una representación directa del estado.

## Filosofía de UI

1. **Estado Declarativo**: La vista debe ser una función del estado. No manipular el DOM/UI manualmente; actualizar el estado y dejar que la vista se refresque.
2. **Cero Lógica de Negocio**: El frontend no decide cómo se guardan los datos ni cómo se procesan; solo llama a la API y renderiza el resultado.
3. **Rendimiento**: Evitar renders innecesarios. Uso de memorización solo en componentes complejos.

## Estructura de Componentes

- **Componentes Tontos (Presentacionales)**: Reciben props, renderizan HTML. No tienen estado interno complejo.
- **Componentes Contenedores**: Gestionan el estado y la comunicación con la API.

## Manejo de Estados de Carga y Error

- Todo componente que llama a la API debe modelar explícitamente tres estados:
  cargando, error, éxito. No asumir que la respuesta siempre llega bien.
- Los errores de la API (`api-standards.md`) se traducen a mensajes legibles
  para el usuario; nunca se muestra el `codigo_error` crudo en la UI.
- Ver `ux-ui-guide.md` para el feedback visual esperado en cada estado.

## Estilo y Consistencia

- Uso de variables CSS/Tokens para colores y espaciados.
- Cada componente debe ser probado en al menos dos resoluciones (Mobile y Desktop).
