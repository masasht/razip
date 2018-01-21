class AddOhmToEsc < ActiveRecord::Migration[5.0]
  def change
    add_column :escs, :ohm, :float
  end
end
