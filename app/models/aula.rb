class Aula < ApplicationRecord
  has_many :comentarios
  belongs_to :curso
end
