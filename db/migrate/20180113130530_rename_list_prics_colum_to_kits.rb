class RenameListPricsColumToKits < ActiveRecord::Migration[5.0]
  def change
    rename_column :kits, :list_prics, :list_price
  end
end
