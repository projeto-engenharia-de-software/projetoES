class Curso < ApplicationRecord
  has_many :aulas, dependent: :destroy
  has_many :comentarios, dependent: :destroy
  validates :nomeCurso, presence: true, length: {minimum: 5}
  validates :detalhesCurso, presence: true, length: {minimum: 10}
  belongs_to :usuario
end
