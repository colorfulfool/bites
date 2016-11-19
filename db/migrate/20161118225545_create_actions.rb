class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.text :body
      t.references :experiment, foreign_key: true
      t.references :last_updator

      t.timestamps
    end
  end
end
