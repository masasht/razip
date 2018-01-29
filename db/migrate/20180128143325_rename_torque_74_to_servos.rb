class RenameTorque74ToServos < ActiveRecord::Migration[5.0]
  def change
    rename_column :servos, :torque, :torque_74
  end
end
