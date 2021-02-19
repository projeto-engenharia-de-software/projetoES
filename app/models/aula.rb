class Aula < ApplicationRecord
  validates :nomeAula, presence: true, length: {minimum: 5}
  validates :conteudo, presence: true, length: {minimum: 7}
  belongs_to :curso
end
