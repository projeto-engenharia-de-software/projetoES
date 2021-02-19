class Aula < ApplicationRecord
  validates :nomeAula, presence: true, length: {minimum: 5}
  validates :conteudo, presence: true, length: {minimum: 9}
  belongs_to :curso
end
