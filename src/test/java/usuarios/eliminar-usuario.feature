Feature: Eliminar usuario - ServeRest

  Background:
    * url baseUrl
    * def usuario = call read('classpath:helpers/generarDatos.js')

  Scenario: Eliminar un usuario existente correctamente
    # Crear usuario para realizar la prueba
    Given path 'usuarios'
    And request usuario
    When method post
    Then status 201
    And match response._id == '#string'
    * def usuarioId = response._id

    # Eliminar usuario
    Given path 'usuarios', usuarioId
    When method delete
    Then status 200
    And match response.message == 'Registro excluído com sucesso'

    # Comprobar que el usuario ya no existe
    Given path 'usuarios', usuarioId
    When method get
    Then status 400