class ChangeDatatypeTurnMotors < ActiveRecord::Migration[5.0]
  def change
    change_column :motors, :turn, :float
  end
end
