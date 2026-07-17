# Guía de Backend — Ingeniería de Servidor y Lógica

> Estándar para el agente `backend`. El objetivo es la simplicidad absoluta y la robustez.

## Principios de Implementación

1. **Lógica Pura**: El núcleo de la aplicación (`domain`) no debe conocer la existencia de archivos, bases de datos o la consola. Solo opera sobre objetos de dominio.
2. **Tipado Estricto**: Todas las funciones deben tener anotaciones de tipo. Uso de `Optional` o equivalentes solo cuando el valor sea realmente omitible.
3. **Carga Eficiente**: El estado se carga una sola vez al inicio de la ejecución y se persiste una sola vez al final. Prohibido el IO repetitivo en bucles.
4. **Separación de Preocupaciones**: No mezclar lógica de validación de formato (Sintaxis) con lógica de validación de negocio (Semántica). Corresponde con la distinción `400` vs `422` de `api-standards.md`: sintaxis inválida = `400`, regla de negocio violada = `422`.

## Manejo de Errores

- **Excepciones de Dominio**: Definir una jerarquía de errores en el módulo de modelo. Los errores deben ser informativos pero no exponer detalles internos del sistema (rutas de archivo completas, stack traces, nombres de tablas).
- **Fallo Rápido (Fail-Fast)**: Validar los inputs al inicio de la función. Si el dato es invalid, lanzar la excepción inmediatamente para evitar estados inconsistentes.
- **Recuperación**: La capa de interfaz es la única responsable de decidir si un error es recuperable o si debe terminar la ejecución.

## Estándares de Datos

- **Serialización**: JSON es el formato preferido para persistencia simple. Para datos binarios, usar formatos estandarizados.
- **Estructura**: Los datos deben almacenarse de forma plana o con anidación mínima para facilitar la lectura humana y el debug.
- **Atomicidad**: Toda operación de escritura debe garantizar que, en caso de fallo, el estado anterior permanezca intacto (Write-Ahead Logging o archivos temporales + `os.replace()`, ver `architecture.md`).

## Concurrencia

- Si dos procesos pueden escribir el mismo archivo de estado, definir explícitamente
  la estrategia (lock de archivo, o aceptar "último en escribir gana" y documentarlo).
  No dejarlo implícito: es una causa común de corrupción de datos silenciosa.
