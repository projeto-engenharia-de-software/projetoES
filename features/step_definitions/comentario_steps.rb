When ("Clico em novo comentario") do
  click_link "Novo comentario"
end

And ("Clico em Adicionar comentario") do
  click_button "Criar Comentario"
end

Then ("O sistema informa que nao pode criar uma comentario em branco") do
  assert_selector('div#error_explanation', text: ' ')
end


When('Crio um comentario com conteudo {string}') do |comentario|
  click_link "Novo comentario"
  fill_in "comentario[comentario]", :with => comentario
end

Then ("O sistema informa que nao pode criar uma comentario invalido") do
  assert_selector('div#error_explanation', text: 'Comentario is too short (minimum is 3 characters)')
end


Then ("O sistema informa que o comentario foi adicionada com sucesso") do
  assert_selector('p#notice', text: 'Comentario adicionado com sucesso.')
end


And ("clico em apagar comentario {string}") do |comentario|
  click_link "d-#{comentario}"
end

Then ("O sistema informa que o comentario foi apagada com sucesso") do
  assert_selector('p#notice', text: 'Comentario apagado.')
end

And ("cadastro um usuario nome {string}, senha {string}, email {string} e tipo de usuario {string}") do |nomeUsuario, senha, email, tipoUsuario|
  visit "/login"
  click_link "Novo usuario"
  fill_in "usuario[email]", :with => email
  fill_in "usuario[senha]", :with => senha
  fill_in "usuario[nomeUsuario]", :with => nomeUsuario
  choose(tipoUsuario)
  click_button "Criar Usuario"
end

And ("logo com o usuario professor") do
  visit "/login"
  find("#email").set('rafael@gmail.com')
  find("#senha").set("123456789")
  find("#logar").click()
end

And ("faco logout e logo com o usuario aluno") do
  click_link "Voltar"
  click_link "Voltar"
  click_link "logout"
  find("#email").set('marcos@gmail.com')
  find("#senha").set("123456789")
  find("#logar").click()
end

When ("crio um comentario {string} no curso {string}") do |comentario, curso|
  click_link "Cursos"
  click_link "v-#{curso}"
  click_link "Novo comentario"
  fill_in "comentario[comentario]", :with => comentario
  click_button "Criar Comentario"
end

And ("faco logout e logo com o usuario professor") do
  click_link "Voltar"
  click_link "Voltar"
  click_link "Voltar"
  click_link "logout"
  find("#email").set('rafael@gmail.com')
  find("#senha").set("123456789")
  find("#logar").click()
end

Then ("vou nos comentario do curso {string} e apago o comentario {string}") do |curso, comentario|
  click_link "Cursos"
  click_link "v-#{curso}"
  click_link "Comentarios"
  click_link "d-#{comentario}"
end