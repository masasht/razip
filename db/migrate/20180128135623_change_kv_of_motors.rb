class ChangeKvOfMotors < ActiveRecord::Migration[5.0]
  def change
    change_column :motors, :kv, :integer
  end
end
