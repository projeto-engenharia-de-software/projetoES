json.extract! curso, :id, :nomeCurso, :detalhesCurso, :usuario_id, :created_at, :updated_at
json.url curso_url(curso, format: :json)
