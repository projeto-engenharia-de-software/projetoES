Feature: curso
  As a usuario do sistema
  I want to Criar um curso
  So that eu nao tenha que fazer isso manualmente

  Scenario: criar curso em branco
    Given Eu estou logado
    And Clico em novo curso
    When Clico em criar curso
    Then O sistema informa que nao pode criar um curso em branco

  Scenario: criar curso com nome invalido
    Given Eu estou logado
    And Clico em novo curso
    When Eu preencho o campo nome do curso com "ruby" e detahes do curso com "ruby detalhes"
    And Clico em criar curso
    Then O sistema informa que nao pode criar um curso com nome invalido

  Scenario: crair curso com descricao invalida
    Given Eu estou logado
    And Clico em novo curso
    When Eu preencho o campo nome do curso com "ruby on rails" e detahes do curso com "detalhes"
    And Clico em criar curso
    Then O sistema informa que nao pode criar um curso com detalhes invalido

  Scenario: criar curso com sucesso
    Given Eu estou logado
    And Clico em novo curso
    When Eu preencho o campo nome do curso com "ruby on rails" e detahes do curso com "rails detalhes"
    And Clico em criar curso
    Then O sistema informa que o curso foi criado com sucesso

  Scenario: apagar um curso
    Given Eu estou logado
    When Clico em cursos
    And Deleto o curso com nome "ruby on rails"
    Then O sistema informa que o curso foi apagado com sucesso