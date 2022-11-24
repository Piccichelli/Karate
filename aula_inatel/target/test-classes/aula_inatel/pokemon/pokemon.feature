Feature: Tetando API Pokemon


Background:Executa antes de cada teste
       * def url_base = 'https://pokeapi.co/api/v2/'

Scenario: Testando retorno pokemon/ditto e o name.
        Given url url_base
        And path 'pokemon/ditto/'
        When method get
        Then status 200
        And match response.name == "ditto"

Scenario: pokemon/ditto/1 erro.
        Given url url_base
        And path 'pokemon/ditto/1/'
        When method get
        Then status 404

Scenario: Testando entrar em um array do retorno e visitando outra url
        Given url url_base
        And path 'version/1/'
        When method get
        Then status 200
        And def idioma = $.names[7].language.url
        And url idioma
        When method get
        Then status 200
        And match response.name == 'en'
        And match response.id == 9