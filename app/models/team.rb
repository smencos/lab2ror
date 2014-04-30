class Team < ActiveRecord::Base
  has_many :match1, :class_name => "Match", :foreign_key => 'local_id'
  has_many :match2, :class_name => "Match", :foreign_key => 'visitante_id'
  has_many :match3, :class_name => "Match", :foreign_key => 'ganador_id'
  has_many :match4, :class_name => "Match", :foreign_key => 'perdedor_id'
  has_one :participation
  has_one :group, through: :participation
  belongs_to :group
  validates :nombre, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "Solo Letras" } , uniqueness: true
  validates :entrenador,  presence: true, uniqueness: true
  validates :bandera,  presence: true
  validates_format_of :bandera, :with => URI::regexp(%w(http https))
  validates :uniforme,  presence: true
  validates_format_of :uniforme, :with => URI::regexp(%w(http https))
  validates :historia, presence: true, length: {minimum: 15, maximum: 200}
  
end
