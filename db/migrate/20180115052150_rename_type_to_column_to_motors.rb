class RenameTypeToColumnToMotors < ActiveRecord::Migration[5.0]
  def change
    rename_column :motors, :type, :brush
  end
end
