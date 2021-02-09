class Comentario < ApplicationRecord
  validates :comentario, presence: true, length: {minimum: 3}
  belongs_to :usuario
  belongs_to :curso
end
