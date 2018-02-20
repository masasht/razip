class AddTurnToMachine < ActiveRecord::Migration[5.0]
  def change
    add_column :machines, :turn, :string
  end
end
