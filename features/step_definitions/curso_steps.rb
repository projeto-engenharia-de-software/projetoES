

Given("Eu estou logado") do
  visit "/login"
  click_link "Novo usuario"
  fill_in "usuario[email]", :with => "usuario@gmail.com"
  fill_in "usuario[senha]", :with => "12345678"
  fill_in "usuario[nomeUsuario]", :with => "usuario teste"
  choose("Professor")
  click_button "Criar Usuario"
  visit "/login"
  find("#email").set('usuario@gmail.com')
  find("#senha").set("12345678")
  find("#logar").click()
  assert_selector('p#notice', text: 'Logado com sucesso')
end

And("Clico em novo curso") do
  click_link "Novo curso"
end

When("Clico em criar curso") do
  click_button "Criar Curso"
end

Then("O sistema informa que nao pode criar um curso em branco") do
  assert_selector('div#error_explanation', text: "Nomecurso can't be blank")
end



When("Eu preencho o campo nome do curso com {string} e detahes do curso com {string}") do |nomeCurso, detalhesCurso|
  fill_in "curso[nomeCurso]", :with => nomeCurso
  fill_in "curso[detalhesCurso]", :with => detalhesCurso
end

Then("O sistema informa que nao pode criar um curso com nome invalido") do
  assert_selector('div#error_explanation', text: "Nomecurso is too short (minimum is 5 characters)")
end



Then("O sistema informa que nao pode criar um curso com detalhes invalido") do
  assert_selector('div#error_explanation', text: "Detalhescurso is too short (minimum is 10 characters)")
end



Then("O sistema informa que o curso foi criado com sucesso") do
  assert_selector('p#notice', text: 'Curso criado com sucesso.')
end



When("Clico em cursos") do

  click_link "Novo curso"
  fill_in "curso[nomeCurso]", :with => "ruby on rails"
  fill_in "curso[detalhesCurso]", :with => "detalhes do curso de rails"
  click_button "Criar Curso"
  click_link "Voltar"
end

And ("Deleto o curso com nome {string}") do |nomeCurso|
  click_link "d-#{nomeCurso}"
end

Then ("O sistema informa que o curso foi apagado com sucesso") do
  assert_selector('p#notice', text: 'Curso foi apagado com sucesso.')
end