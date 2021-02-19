Given ("Eu cadastro um usuario com nome {string}, senha {string}, email {string} e tipo de usuario {string}") do |nomeUsuario, senha, email, tipoUsuario|
  visit "/login"
  click_link "novo usuario"
  fill_in "usuario[email]", :with => email
  fill_in "usuario[senha]", :with => senha
  fill_in "usuario[nomeUsuario]", :with => nomeUsuario
  choose(tipoUsuario)
  click_button "Criar usuario"
end

And ("logo com ele") do
  visit "/login"
  find("#email").set('rafael@gmail.com')
  find("#senha").set("123456789")
  find("#logar").click()
end

And("Crio um curso com nome do curso com {string} e detahes do curso com {string}") do |nomeCurso, detalhesCurso|
  click_link "Novo curso"
  fill_in "curso[nomeCurso]", :with => nomeCurso
  fill_in "curso[detalhesCurso]", :with => detalhesCurso
  click_button "Criar curso"
end

When ("Clico em nova aula") do
  click_link "Nova aula"
end

And ("Clico em criar aula") do
  click_button "Criar aula"
end

Then ("O sistema informa que nao pode criar uma aula em branco") do
  assert_selector('div#error_explanation', text: ' ')
end


When ("Crio uma aula com nome {string} e conteudo {string}") do |nomeAula, conteudo|
  click_link "Nova aula"
  fill_in "aula[nomeAula]", :with => nomeAula
  fill_in "aula[conteudo]", :with => conteudo
end

Then ("O sistema informa que nao pode criar uma aula com nome invalido") do
  assert_selector('div#error_explanation', text: 'Nomeaula is too short (minimum is 5 characters)')
end


Then('O sistema informa que nao pode criar uma aula com conteudo invalida') do
  assert_selector('div#error_explanation', text: 'Conteudo is too short (minimum is 9 characters)')
end

Then('O sistema informa que a aula foi adicionada com sucesso') do
  assert_selector('p#notice', text: "Aula adicionada com sucesso.")
end


When('clico em apagar aula com nome {string}') do |nomeAula|
  click_link "d-#{nomeAula}"
end

Then('O sistema informa que a aula foi apagada com sucesso') do
  assert_selector('p#notice', text: "Aula apagada com sucesso.")
end