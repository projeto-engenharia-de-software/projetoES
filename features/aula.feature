Feature: aula
  As a usuario do sistema
  I want to Criar um aula
  So that eu nao tenha que fazer isso manualmente

  Scenario: adicionar aula em branco
    Given Eu cadastro um usuario com nome "rafael", senha "123456789", email "rafael@gmail.com" e tipo de usuario "Professor"
    And logo com ele
    And Crio um curso com nome do curso com "ruby on rails" e detahes do curso com "ruby detalhes"
    When Clico em nova aula
    And Clico em criar aula
    Then O sistema informa que nao pode criar uma aula em branco

  Scenario: adicionar aula com nome invalido
    Given Eu cadastro um usuario com nome "rafael", senha "123456789", email "rafael@gmail.com" e tipo de usuario "Professor"
    And logo com ele
    And Crio um curso com nome do curso com "ruby on rails" e detahes do curso com "ruby detalhes"
    When Crio uma aula com nome "ruby" e conteudo "260214684"
    And Clico em criar aula
    Then O sistema informa que nao pode criar uma aula com nome invalido

  Scenario: adicionar aula com conteudo invalido
    Given Eu cadastro um usuario com nome "rafael", senha "123456789", email "rafael@gmail.com" e tipo de usuario "Professor"
    And logo com ele
    And Crio um curso com nome do curso com "ruby on rails" e detahes do curso com "ruby detalhes"
    When Crio uma aula com nome "rails" e conteudo "12456"
    And Clico em criar aula
    Then O sistema informa que nao pode criar uma aula com conteudo invalida

  Scenario: adicionar aula com sucesso
    Given Eu cadastro um usuario com nome "rafael", senha "123456789", email "rafael@gmail.com" e tipo de usuario "Professor"
    And logo com ele
    And Crio um curso com nome do curso com "ruby on rails" e detahes do curso com "ruby detalhes"
    When Crio uma aula com nome "rails" e conteudo "260214684"
    And Clico em criar aula
    Then O sistema informa que a aula foi adicionada com sucesso

  Scenario: apagar uma aula
    Given Eu cadastro um usuario com nome "rafael", senha "123456789", email "rafael@gmail.com" e tipo de usuario "Professor"
    And logo com ele
    And Crio um curso com nome do curso com "ruby on rails" e detahes do curso com "ruby detalhes"
    When Crio uma aula com nome "rails" e conteudo "260214684"
    And Clico em criar aula
    And clico em apagar aula com nome "rails"
    Then O sistema informa que a aula foi apagada com sucesso