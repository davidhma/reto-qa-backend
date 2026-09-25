Feature: Registrar usuarios - ServeRest

  Background:
    * url baseUrl
    * def usuario = call read('classpath:helpers/generarDatos.js')

  Scenario: Registrar un nuevo usuario con datos válidos
    Given path 'usuarios'
    And request usuario
    When method post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

    # Limpieza del usuario creado
    * def usuarioId = response._id
    Given path 'usuarios', usuarioId
    When method delete
    Then status 200

  Scenario: Registrar usuario con email ya existente
    Given path 'usuarios'
    And request usuario
    When method post
    Then status 201
    And match response._id == '#string'
    * def usuarioId = response._id

    Given path 'usuarios'
    And request usuario
    When method post
    Then status 400
    And match response.message == 'Este email já está sendo usado'

    # Limpieza del usuario creado
    Given path 'usuarios', usuarioId
    When method delete
    Then status 200