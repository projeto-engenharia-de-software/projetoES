class Curso < ApplicationRecord
  has_many :aulas
  belongs_to :usuario
end
