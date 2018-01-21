class ChangeImageToMachines < ActiveRecord::Migration[5.0]
  def change
    change_column :machines, :image, :text
  end
end
