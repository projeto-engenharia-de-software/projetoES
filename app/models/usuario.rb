class Usuario < ApplicationRecord
  has_many :cursos
  has_many :comentarios
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :senha, presence: true, length: {minimum: 8}
  validates :nomeUsuario, presence: true, length: {minimum: 5}
  validates :tipoUsuario, presence: true
end
