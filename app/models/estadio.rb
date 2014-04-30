class Estadio < ActiveRecord::Base
  has_many :matches
  validates :nombre, presence: true, uniqueness: true
  validates :ciudad, presence: true, uniqueness: true, inclusion: { in: ["Belo Horizonte", "Brasilia", "Cuiaba", "Curitiba", "Fortaleza", "Manaus", "Natal", "Recife", "Rio de Janeiro", "Salvador", "Sao Paulo"],
                                                                  message: "%{value} is not a valid city" }
  validates :capmax, presence: true, format: { with: /\A\d+\z/,
                                              message: "Solo numeros positivos" }   
  validates :foto,  presence: true
  validates_format_of :foto, :with => URI::regexp(%w(http https))
  validates :construccion, presence: true
  validate :valid_date
  
  def valid_date
    if (construccion.class == nil)
      errors.add(:construccion, "fecha invalida")
    end
  end
  
end  
