

Given("Eu clico em novo usuario") do
  visit "/login"
  click_link "Novo usuario"
end

When("Clico em cadastrar") do
  click_button "Criar Usuario"
end

Then("O sistema informa que nao pode cadastrar usuario em branco") do
  assert_selector('div#error_explanation', text: '')
end



When("Eu preencho o campo email com {string}, senha com {string}, nome de usuario com {string} e seleciono o tipo de usuario como {string}") do |email, senha, nomeUsuario, tipoUsuario|
  fill_in "usuario[email]", :with => email
  fill_in "usuario[senha]", :with => senha
  fill_in "usuario[nomeUsuario]", :with => nomeUsuario
  choose(tipoUsuario)
end

Then("O sistema informa que o email o email e invalido") do
  assert_selector('div#error_explanation', text: '')
end




Then("O sistema informa que a senha e invalida") do
  assert_selector('div#error_explanation', text: 'Senha is too short (minimum is 8 characters)')
end



Then("O sistema informa que o usuario foi cadastrado com sucesso") do
  assert_selector('p#notice', text: 'Usuario criado com sucesso.')
end