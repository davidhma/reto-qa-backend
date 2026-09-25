Feature: Actualizar usuario - ServeRest

  Background:
    * url baseUrl
    * def usuario = call read('classpath:helpers/generarDatos.js')

  Scenario: Actualizar un usuario existente correctamente
    Given path 'usuarios'
    And request usuario
    When method post
    Then status 201
    And match response._id == '#string'
    * def usuarioId = response._id

    * def usuarioActualizado =
      """
      {
        "nome": "Usuario QA Actualizado",
        "email": "#(usuario.email)",
        "password": "novaSenha123",
        "administrador": "false"
      }
      """

    Given path 'usuarios', usuarioId
    And request usuarioActualizado
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'

    # Verificar que los datos fueron actualizados
    Given path 'usuarios', usuarioId
    When method get
    Then status 200
    And match response.nome == 'Usuario QA Actualizado'
    And match response.email == usuario.email
    And match response.password == 'novaSenha123'
    And match response.administrador == 'false'
    And match response._id == usuarioId

    # Limpieza del usuario creado
    Given path 'usuarios', usuarioId
    When method delete
    Then status 200