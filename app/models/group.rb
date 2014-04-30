class Group < ActiveRecord::Base
  has_many :matches
  has_many :participations
  has_many :teams, through: :participations
  validates :nombre, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "Solo Letras" } , uniqueness: true, length: {minimum: 1, maximum: 1}
  
end
