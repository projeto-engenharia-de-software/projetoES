require 'test_helper'

class AulaTest < ActiveSupport::TestCase

  test 'nao deve criar aula vazia' do
    aula = Aula.new
    assert_not aula.save
  end

  test 'nao deve criar aula com nome invalido' do
    aula = Aula.new nomeAula: "ruby", conteudo: "123456789"
    assert_not aula.save
  end

  test 'deve criar aula corretamente' do
    aula = Aula.new nomeAula: 'ruby on rails', conteudo: '123456789', curso: @curso = cursos(:one)
    assert aula.save
  end
end
