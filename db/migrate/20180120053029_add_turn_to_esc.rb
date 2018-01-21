class AddTurnToEsc < ActiveRecord::Migration[5.0]
  def change
    add_column :escs, :turn, :float
  end
end
