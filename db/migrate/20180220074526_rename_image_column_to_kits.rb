class RenameImageColumnToKits < ActiveRecord::Migration[5.0]
  def change
    rename_column :kits, :image, :affiliate
    rename_column :motors, :image, :affiliate
    rename_column :escs, :image, :affiliate
    rename_column :servos, :image, :affiliate
    rename_column :receviers, :image, :affiliate
  end
end
