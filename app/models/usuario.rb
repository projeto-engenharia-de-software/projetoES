class Usuario < ApplicationRecord
  has_many :cursos
  has_many :comentarios
end
