class AddSupplyKitToMaker < ActiveRecord::Migration[5.0]
  def change
    add_column :makers, :supply_kit, :boolean, default: false, null: false
    add_column :makers, :supply_motor, :boolean, default: false, null: false
    add_column :makers, :supply_esc, :boolean, default: false, null: false
    add_column :makers, :supply_servos, :boolean, default: false, null: false
    add_column :makers, :supply_recevier, :boolean, default: false, null: false
  end
end
