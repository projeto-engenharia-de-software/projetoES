json.extract! usuario, :id, :nomeUsuario, :email, :senha, :tipoUsuario, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
