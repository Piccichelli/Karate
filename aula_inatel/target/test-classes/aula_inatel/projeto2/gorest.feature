Feature: Tetando API Gorest


Background:Executa antes de cada teste
       * def url_base = 'https://gorest.co.in/public/'

Scenario: Testando retorno 200 v2/users/4/posts.
        Given url url_base
        And path 'v2/users/4/posts'
        When method get
        Then status 200

Scenario: Testando user_id v2/users/6/posts.
        Given url url_base
        And path 'v2/users/6/posts'
        When method get
        Then status 200
        Then match response[0].user_id == 6

Scenario: Testando entrar em uma url invalida na rota da api.
        Given url url_base
        And path 'a'
        When method get
        Then status 404

Scenario: Testando dar usar um delete numa endpoint get
        Given url url_base
        And path 'v2/users/4/posts'
        When method delete
        Then status 404

Scenario: Pegando o array response e testando os tipos
        Given url url_base
        And path 'v2/posts/'
        When method get
        Then status 200
        And match $ == '#[10]'
        And match each $ contains {id: "#number", title: "#string"}

Scenario: Testando todos conteudos do get
        Given url url_base
        And path 'v2/users/90'
        When method get
        Then status 200
        And match response.id == 90
        And match response.name == "Mrs. Paramartha Arora"
        And match response.email == "mrs_paramartha_arora@green-farrell.net"
        And match response.gender == "male"
        And match response.status == "active"