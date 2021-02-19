Feature: comentario
  As a usuario do sistema
  I want to Criar um comentario
  So that eu nao tenha que fazer isso manualmente

  Scenario: adicionar comentario em branco
    Given Eu cadastro um usuario com nome "rafael", senha "123456789", email "rafael@gmail.com" e tipo de usuario "Professor"
    And logo com ele
    And Crio um curso com nome do curso com "ruby on rails" e detahes do curso com "ruby detalhes"
    When Clico em novo comentario
    And Clico em Adicionar comentario
    Then O sistema informa que nao pode criar uma comentario em branco

  Scenario: adicionar comentario invalido
    Given Eu cadastro um usuario com nome "rafael", senha "123456789", email "rafael@gmail.com" e tipo de usuario "Professor"
    And logo com ele
    And Crio um curso com nome do curso com "ruby on rails" e detahes do curso com "ruby detalhes"
    When Crio um comentario com conteudo "r"
    And Clico em Adicionar comentario
    Then O sistema informa que nao pode criar uma comentario invalido

  Scenario: adicionar comentario com sucesso
    Given Eu cadastro um usuario com nome "rafael", senha "123456789", email "rafael@gmail.com" e tipo de usuario "Professor"
    And logo com ele
    And Crio um curso com nome do curso com "ruby on rails" e detahes do curso com "ruby detalhes"
    When Crio um comentario com conteudo "teste comentario"
    And Clico em Adicionar comentario
    Then O sistema informa que o comentario foi adicionada com sucesso

  Scenario: apagar um comentario
    Given Eu cadastro um usuario com nome "rafael", senha "123456789", email "rafael@gmail.com" e tipo de usuario "Professor"
    And logo com ele
    And Crio um curso com nome do curso com "ruby on rails" e detahes do curso com "ruby detalhes"
    When Crio um comentario com conteudo "teste comentario"
    And Clico em Adicionar comentario
    And clico em apagar comentario "teste comentario"
    Then O sistema informa que o comentario foi apagada com sucesso

  Scenario: professor apagar comentario de aluno
    Given Eu cadastro um usuario com nome "rafael", senha "123456789", email "rafael@gmail.com" e tipo de usuario "Professor"
    And cadastro um usuario nome "marcos", senha "123456789", email "marcos@gmail.com" e tipo de usuario "Aluno"
    And logo com o usuario professor
    And Crio um curso com nome do curso com "ruby on rails" e detahes do curso com "ruby detalhes"
    And faco logout e logo com o usuario aluno
    When crio um comentario "ruby nao e facil" no curso "ruby on rails"
    And faco logout e logo com o usuario professor
    Then vou nos comentario do curso "ruby on rails" e apago o comentario "ruby nao e facil"
    And O sistema informa que o comentario foi apagada com sucesso
