Feature: Listar usuarios - ServeRest

  Background:
    * url baseUrl

  Scenario: Listar todos los usuarios correctamente
    Given path 'usuarios'
    When method get
    Then status 200
    And match response.quantidade == '#number'
    And match response.usuarios == '#array'
    And match each response.usuarios contains
      """
      {
        nome: '#string',
        email: '#string',
        password: '#string',
        administrador: '#string',
        _id: '#string'
      }
      """