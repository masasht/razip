class AddSpeed60ToServo < ActiveRecord::Migration[5.0]
  def change
    add_column :servos, :speed_60, :float
    add_column :servos, :speed_48, :float
    add_column :servos, :torque_60, :float
    add_column :servos, :torque_48, :float
  end
end
