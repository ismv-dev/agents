# Convenciones de código

> Homogeneidad extrema. La IA predice mejor cuando el repositorio se parece
> a sí mismo en todas partes.

## Estilo de Código

- **Versión:** Usar la versión estable más reciente del lenguaje.
- **Formato:** Seguir la guía de estilo oficial del lenguaje. Líneas max 100 caracteres.
- **Imports:** Librerías estándar primero, luego locales. Una línea por módulo.
- **Cadenas de texto:** Usar un estilo consistente de comillas en todo el proyecto.
- **Interpolación:** Usar la sintaxis nativa de plantillas de strings del lenguaje.

## Nombres

| Tipo                    | Convención        | Ejemplo               |
|-------------------------|-------------------|-----------------------|
| Módulos                 | `snake_case`      | `notes.py`            |
| Clases                  | `PascalCase`      | `Note`                |
| Funciones / variables   | `snake_case`      | `load_notes`          |
| Constantes              | `UPPER_SNAKE`     | `DEFAULT_NOTES_PATH`  |
| Privadas                | prefijo `_`       | `_atomic_write`       |

## Estructura de archivo

Cada archivo de código debe empezar con:

```
/* Comentario describiendo el propósito del módulo. */
// Imports estándar
// Imports locales
```

## Tests

- Un archivo de test por módulo: `tests/test_<módulo>.py`.
- Una clase `Test<Cosa>(unittest.TestCase)` por unidad lógica.
- Cada test usa un `tempfile.TemporaryDirectory()` y limpia tras de sí.
- Nombres de test descriptivos: `test_load_returns_empty_when_file_missing`.

## Manejo de errores

Las excepciones de dominio deben definirse en el módulo de modelo correspondiente:

```
// Error base del dominio
// Error específico (ej. RecursoNoEncontrado)
```

La capa de interfaz captura excepciones del dominio, imprime el mensaje de
error en el canal de errores estándar (`stderr`) y finaliza con un código de
salida no cero. Nunca se deben exponer trazas de error (stack traces) al
usuario final. Ver `backend-guide.md` para la jerarquía completa de errores
y `verification.md` para cómo se prueba esto.

## Comentarios

Por defecto **no** se escriben. Solo se permiten cuando explican un *por qué*
no obvio (p. ej. workaround documentado, invariante sutil). Los nombres deben
hacer el resto.

## Control de versiones (commits)

- Mensajes de commit en imperativo y en una sola línea cuando sea posible:
  `Añade validación de body vacío en add_note`.
- Un commit = un cambio lógico. No mezclar refactors con features nuevas.
- No commitear código que no pasa `.agents/init.sh` (ver `verification.md`).
