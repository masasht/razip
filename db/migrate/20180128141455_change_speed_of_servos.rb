class ChangeSpeedOfServos < ActiveRecord::Migration[5.0]
  def change
    change_column :servos, :speed, :float
  end
end
