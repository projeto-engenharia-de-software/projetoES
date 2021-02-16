require 'test_helper'

class CursoTest < ActiveSupport::TestCase

  test 'nao deve criar usuario vazio' do
    curso = Curso.new
    assert_not curso.save
  end

  test 'nao deve criar curso com nome invalido' do
    curso = Curso.new nomeCurso: "ruby", detalhesCurso: "detalhes do curso de ruby"
    assert_not curso.save
  end

  test 'deve criar curso corretamente' do
    curso = Curso.new nomeCurso: 'ruby on rails', detalhesCurso: 'detalhes do curso de rails', usuario: @usuario = usuarios(:one)
    assert curso.save
  end

end
