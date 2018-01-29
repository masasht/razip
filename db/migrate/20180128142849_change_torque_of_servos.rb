class ChangeTorqueOfServos < ActiveRecord::Migration[5.0]
  def change
    change_column :servos, :torque, :float
  end
end
