class ChangeDatatypeTurnOfMotors < ActiveRecord::Migration[5.0]
  def change
    change_column :motors, :turn, :string
  end
end
