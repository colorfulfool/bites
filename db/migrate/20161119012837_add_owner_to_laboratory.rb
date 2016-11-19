class AddOwnerToLaboratory < ActiveRecord::Migration[5.0]
  def change
    add_reference :laboratories, :owner
  end
end
