class CreateAssumptions < ActiveRecord::Migration[5.0]
  def change
    create_table :assumptions do |t|
      t.string :body
      t.references :experiment, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
