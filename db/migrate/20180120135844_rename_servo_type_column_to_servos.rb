class RenameServoTypeColumnToServos < ActiveRecord::Migration[5.0]
  def change
    rename_column :servos, :type, :servo_type
  end
end
