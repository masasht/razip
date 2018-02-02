class RenameServosColumnToMakers < ActiveRecord::Migration[5.0]
  def change
    rename_column :makers, :supply_servos, :supply_servo
  end
end
