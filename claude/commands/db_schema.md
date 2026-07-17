# db_schema

**Propósito:** Generar el diseño y modelo físico de persistencia de datos enfocado en la integridad, consistencia y rendimiento.

## Instrucciones
1. Convierte las entidades de negocio en estructuras de base de datos relacionales o no relacionales según la pila técnica definida.
2. Aplica reglas de normalización (hasta 3NF idealmente para relacionales) y define explícitamente llaves primarias, foráneas, restricciones de unicidad e índices críticos.
3. Configura tipos de datos precisos para optimizar el almacenamiento.

## Restricciones
- No insertes datos semilla (*seed data*) a menos que sean tablas maestras indispensables para el arranque del sistema.

## Salidas Verificables (Artifacts)
- Genera el archivo `/database/init_schema.sql` (o el equivalente correspondiente como `schema.prisma`) totalmente ejecutable y sin errores de sintaxis DDL.