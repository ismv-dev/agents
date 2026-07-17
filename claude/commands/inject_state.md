# inject_state

**Propósito:** Implementar el manejo del estado global de la aplicación y la sincronización de datos con los servicios del backend.

## Instrucciones
1. Diseña e implementa almacenes de estado (*stores*) para manejar la sesión del usuario, cachés de datos y estados globales de la interfaz.
2. Integra el cliente de red que consuma los endpoints expuestos en `openapi.yaml`.
3. Maneja los estados de carga (*loading*), éxito, y captura de errores de red de manera elegante para el usuario.

## Restricciones
- No dejes mutaciones de estado descontroladas ni efectos secundarios (*side effects*) que puedan causar fugas de memoria o re-renders infinitos.

## Salidas Verificables (Artifacts)
- Archivos de gestión de estado y servicios (`/frontend/store/*` y `/frontend/services/*`) conectados a la interfaz y listos para interactuar con APIs reales.