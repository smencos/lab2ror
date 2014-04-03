class CreateEstadios < ActiveRecord::Migration
  def change
    create_table :estadios do |t|
      t.string :nombre
      t.string :ciudad
      t.date :construccion
      t.integer :capmax
      t.string :foto

      t.timestamps
    end
  end
end
