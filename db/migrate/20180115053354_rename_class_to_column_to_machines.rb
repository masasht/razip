class RenameClassToColumnToMachines < ActiveRecord::Migration[5.0]
  def change
    rename_column :machines, :class, :regulation
  end
end
