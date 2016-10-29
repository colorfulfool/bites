class CreateLaboratories < ActiveRecord::Migration[5.0]
  def change
    create_table :laboratories do |t|
      t.string :name
      t.text :description
      
      t.string :slug

      t.timestamps
    end
  end
end
