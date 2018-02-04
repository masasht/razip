class ChangeDatatypeTurnMotors < ActiveRecord::Migration[5.0]
  def change
    change_column :motors, :turn, "USING turn::double precision"
  end
end
