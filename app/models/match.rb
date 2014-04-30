class Match < ActiveRecord::Base
  belongs_to :fases
  belongs_to :estados
  belongs_to :team2, :class_name => "Team", :foreign_key => 'local_id'
  belongs_to :team3, :class_name => "Team", :foreign_key => 'visitante_id'
  belongs_to :team4, :class_name => "Team", :foreign_key => 'ganador_id'
  belongs_to :team5, :class_name => "Team", :foreign_key => 'perdedor_id'
  belongs_to :group
  belongs_to :estadio
  
  validates :fecha, presence: true
  
  validates :fecha, presence:true, uniqueness:{ scope: :estadio_id }
  
  validates :fase_id, presence: true, inclusion: { in: [1,2,3,4,5],
    message: "%{value} no es fase correcta" }
  
  validates :estado_id, presence: true, inclusion: { in: [1,2,3],
    message: "%{value} no es estado correcto" } 
  
  validates :local_id, presence: true,  uniqueness:{ scope: :fecha }
  
  validates :visitante_id, presence: true, uniqueness:{ scope: :fecha } 
  
  validates :marcador, presence: true, format: { with: /\A\d+-\d+\z/,
                                              message: "Solo numeros positivos d-d" }   
  
  validates :ganador, presence: true, if: :empate
  
  validates :perdedor, presence: true, if: :empate
  
  validates :empate, presence: true, if: :empate_2
  
  validates :estadio_id, presence: true
  
  validate :visitante_local
  
  validate :valid_date
  
  def visitante_local
    if (visitante_id == local_id)
      errors.add(:local_id, "local no puede ser igual a visitante")
    end
  end
  
    def valid_date
    if (fecha.class == nil)
      errors.add(:fecha, "fecha invalida")
    end
  end
      
      def empate
        del = false
        if (estado_id == 3)
          st = marcador.split("-")
          if (st[0] != st[1])
            del == true
          end
        end
        del
      end
  
      def empate
        del = false
        if (estado_id == 3)
          st = marcador.split("-")
          if (st[0] == st[1])
            del == true
          end
        end
        del
      end
  
      
end
