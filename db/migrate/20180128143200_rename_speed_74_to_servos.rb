class RenameSpeed74ToServos < ActiveRecord::Migration[5.0]
  def change
    rename_column :servos, :speed, :speed_74
  end
end
