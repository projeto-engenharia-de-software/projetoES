require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase

  test 'nao deve criar usuario vazio' do
    usuario = Usuario.new
    assert_not usuario.save
  end

  test 'nao deve criar usuario com email invalido' do
    usuario = Usuario.new email: 'emailTeste', senha: '12345678', nomeUsuario: 'rafael', tipoUsuario: 1
    assert_not usuario.save
  end

  test 'deve criar usuario corretamente' do
    usuario = Usuario.new email: 'email@gmail.com', senha: '12345678', nomeUsuario: 'rafael', tipoUsuario: 1
    assert usuario.save
  end

end
