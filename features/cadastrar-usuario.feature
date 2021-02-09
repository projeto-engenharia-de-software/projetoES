Feature: cadastrar usuario
  As a usuario do sistema
  I want to cadastrar um usuario
  So that eu nao tenha que fazer isso manualmente

  Scenario: cadastrar usuario em branco
    Given Eu clico em novo usuario
    When Clico em cadastrar
    Then O sistema informa que nao pode cadastrar usuario em branco

  Scenario: cadastrar usuario com email invalido
    Given Eu clico em novo usuario
    When Eu preencho o campo email com "testeEmail", senha com "12345678", nome de usuario com "usuario teste" e seleciono o tipo de usuario como "admin"
    And Clico em cadastrar
    Then O sistema informa que o email o email e invalido

  Scenario: Cadastrar usuario com senha invalida
    Given Eu clico em novo usuario
    When Eu preencho o campo email com "teste@gmail.com", senha com "1234567", nome de usuario com "usuario teste" e seleciono o tipo de usuario como "admin"
    And Clico em cadastrar
    Then O sistema informa que a senha e invalida

  Scenario: Cadastrar usuario valido
    Given Eu clico em novo usuario
    When Eu preencho o campo email com "teste@gmail.com", senha com "12345678", nome de usuario com "usuario teste" e seleciono o tipo de usuario como "admin"
    And Clico em cadastrar
    Then O sistema informa que o usuario foi cadastrado com sucesso

  Scenario: Cadastrar usuario como aluno
    Given Eu clico em novo usuario
    When Eu preencho o campo email com "teste@gmail.com", senha com "12345678", nome de usuario com "usuario teste" e seleciono o tipo de usuario como "aluno"
    And Clico em cadastrar
    Then O sistema informa que o usuario foi cadastrado com sucesso