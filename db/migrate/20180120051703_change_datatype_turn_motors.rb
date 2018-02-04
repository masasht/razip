class ChangeDatatypeTurnMotors < ActiveRecord::Migration[5.0]
  def change
    change_column :motors, :turn, :float , limit: 53
  end
end
