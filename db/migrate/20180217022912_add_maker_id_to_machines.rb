class AddMakerIdToMachines < ActiveRecord::Migration[5.0]
  def change
    add_column :machines, :maker_id, :integer
  end
end
