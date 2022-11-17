Feature: Tetando API StarWars


Background:Executa antes de cada teste
       * def url_base = 'https://swapi.dev/api/'
Scenario: Testando retorno people/1/ e o name.
        Given url url_base
        And path 'people/1/'
        When method get
        Then status 200
        And match response.name == "Luke Skywalker"

Scenario: Testando retorno planets/3/1234.
        Given url url_base
        And path 'planets/3/1234'
        When method get
        Then status 404