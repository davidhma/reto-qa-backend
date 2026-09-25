# QA Automation Backend - ServeRest

Proyecto de automatización de pruebas Backend desarrollado como parte del reto técnico de QA Automation.

La solución automatiza los principales escenarios CRUD de la API de usuarios de ServeRest utilizando Karate DSL, Maven y Java.

## API utilizada

ServeRest

Base URL:

https://serverest.dev

## Tecnologías

- Java 21
- Karate DSL 1.5.1
- JUnit 5
- Maven 3.9.16
- JavaScript para generación dinámica de datos
- Git / GitHub

## Objetivo

Automatizar las pruebas de la API de usuarios de ServeRest, cubriendo las operaciones principales de gestión de usuarios:

- Listar usuarios
- Registrar usuarios
- Buscar usuarios por ID
- Actualizar usuarios
- Eliminar usuarios

También se incluyen escenarios positivos y negativos, validaciones de respuestas JSON y generación dinámica de datos de prueba.

## Endpoints automatizados

| Método | Endpoint | Descripción |
|---|---|---|
| GET | `/usuarios` | Listar todos los usuarios |
| POST | `/usuarios` | Registrar un nuevo usuario |
| GET | `/usuarios/{_id}` | Buscar usuario por ID |
| PUT | `/usuarios/{_id}` | Actualizar un usuario |
| DELETE | `/usuarios/{_id}` | Eliminar un usuario |

## Estructura del proyecto

```text
reto-qa-backend
├── src
│   └── test
│       └── java
│           ├── helpers
│           │   └── generarDatos.js
│           ├── usuarios
│           │   ├── actualizar-usuario.feature
│           │   ├── buscar-usuario.feature
│           │   ├── eliminar-usuario.feature
│           │   ├── listar-usuarios.feature
│           │   ├── registrar-usuario.feature
│           │   └── UsuariosTest.java
│           └── karate-config.js
├── .gitignore
├── pom.xml
└── README.md
```

## Estrategia de automatización

La solución fue organizada por endpoint para facilitar el mantenimiento y la lectura de los escenarios.

Cada archivo `.feature` contiene los escenarios relacionados con una operación específica de la API.

Se utilizaron las siguientes prácticas:

- Separación de escenarios por endpoint.
- Generación dinámica de usuarios para evitar conflictos de datos.
- Validación de códigos de estado HTTP.
- Validación de tipos y estructuras de respuestas JSON.
- Escenarios positivos y negativos.
- Validación posterior de operaciones de actualización y eliminación.
- Limpieza de datos creados durante las pruebas.
- Configuración centralizada de la URL base.
- Ejecución mediante Maven y JUnit 5.

## Datos de prueba

Los datos de usuario son generados dinámicamente mediante:

```text
src/test/java/helpers/generarDatos.js
```

Se utiliza un timestamp para generar correos electrónicos únicos y evitar conflictos con usuarios existentes en ServeRest.

Ejemplo:

```javascript
function fn() {

  var timestamp = new Date().getTime();

  var usuario = {
    nome: 'Usuario QA ' + timestamp,
    email: 'qa' + timestamp + '@test.com',
    password: 'teste123',
    administrador: 'true'
  };

  return usuario;
}
```

## Escenarios automatizados

La suite contiene 7 escenarios automatizados.

### GET /usuarios

- Listar todos los usuarios correctamente.

### POST /usuarios

- Registrar un usuario con datos válidos.
- Validar el registro de un usuario con email ya existente.

### GET /usuarios/{_id}

- Buscar un usuario existente por ID.
- Validar la búsqueda utilizando un ID inexistente.

### PUT /usuarios/{_id}

- Actualizar correctamente un usuario existente.
- Verificar mediante GET que los datos fueron actualizados.

### DELETE /usuarios/{_id}

- Eliminar correctamente un usuario existente.
- Verificar que el usuario eliminado ya no pueda ser consultado.

## Requisitos previos

Antes de ejecutar el proyecto es necesario tener instalado:

- Java JDK 21
- Apache Maven
- Git

Para verificar las instalaciones:

```bash
java -version
```

```bash
mvn -version
```

```bash
git --version
```

## Instalación

Clonar el repositorio:

```bash
git clone https://github.com/davidhma/reto-qa-backend.git
```

Ingresar al proyecto:

```bash
cd reto-qa-backend
```

Resolver las dependencias:

```bash
mvn dependency:resolve
```

## Ejecución de pruebas

Para ejecutar toda la suite:

```bash
mvn test
```

El Runner principal es:

```text
src/test/java/usuarios/UsuariosTest.java
```

Este Runner ejecuta los feature files correspondientes a los endpoints de usuarios.

## Resultado esperado

Una ejecución exitosa debe finalizar con un resultado similar a:

```text
Tests run: 7, Failures: 0, Errors: 0, Skipped: 0
BUILD SUCCESS
```

## Reporte de Karate

Karate genera automáticamente un reporte HTML después de la ejecución.

El reporte se encuentra en:

```text
target/karate-reports/karate-summary.html
```

Abrir `karate-summary.html` en un navegador permite revisar el resultado de los escenarios ejecutados.

## Consideraciones

La API ServeRest utiliza una base de datos compartida, por lo que se generan datos dinámicos para reducir conflictos entre ejecuciones.

Los usuarios creados para escenarios de consulta, actualización y eliminación son eliminados cuando corresponde para mantener las pruebas independientes y reducir residuos de datos.

La carpeta `target` no se versiona en Git debido a que contiene archivos y reportes generados durante la ejecución.

## Autor

Sharon Maiz Añamaco