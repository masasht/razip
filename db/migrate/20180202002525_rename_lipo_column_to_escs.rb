class RenameLipoColumnToEscs < ActiveRecord::Migration[5.0]
  def change
    rename_column :escs, :battery_type, :lipo
  end
end
