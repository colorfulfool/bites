class AddLaboratoryRefToExperiment < ActiveRecord::Migration[5.0]
  def change
    add_reference :experiments, :laboratory, foreign_key: true
  end
end
