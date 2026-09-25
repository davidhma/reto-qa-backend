Feature: Buscar usuario por ID - ServeRest

  Background:
    * url baseUrl
    * def usuario = call read('classpath:helpers/generarDatos.js')

  Scenario: Buscar un usuario existente por ID
    Given path 'usuarios'
    And request usuario
    When method post
    Then status 201
    And match response._id == '#string'
    * def usuarioId = response._id

    Given path 'usuarios', usuarioId
    When method get
    Then status 200
    And match response.nome == usuario.nome
    And match response.email == usuario.email
    And match response.password == usuario.password
    And match response.administrador == usuario.administrador
    And match response._id == usuarioId

    # Limpieza del usuario creado
    Given path 'usuarios', usuarioId
    When method delete
    Then status 200

Scenario: Buscar usuario con ID inexistente
  Given path 'usuarios', 'id-inexistente'
  When method get
  Then status 400
  And match response == '#object'