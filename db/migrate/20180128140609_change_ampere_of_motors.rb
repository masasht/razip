class ChangeAmpereOfMotors < ActiveRecord::Migration[5.0]
  def change
    change_column :motors, :ampere, :integer
  end
end
