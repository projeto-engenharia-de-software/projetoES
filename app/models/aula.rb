class Aula < ApplicationRecord
  has_many :comentarios
  validates :nomeAula, presence: true, length: {minimum: 5}
  validates :conteudo, presence: true, length: {minimum: 8}
  belongs_to :curso
end
