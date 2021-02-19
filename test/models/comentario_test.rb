require 'test_helper'

class ComentarioTest < ActiveSupport::TestCase

  test 'nao deve criar comentario vazio' do
    comentario = Comentario.new
    assert_not comentario.save
  end

  test 'nao deve criar comentario com comentario invalido' do
    comentario = Comentario.new comentario: 'a', usuario: @usuario = usuarios(:one), curso: @curso = cursos(:one)
    assert_not comentario.save
  end

  test 'deve criar comentario corretamente' do
    comentario = Comentario.new comentario: 'teste comentario', usuario: @usuario = usuarios(:one), curso: @curso = cursos(:one)
    assert comentario.save
  end
end
