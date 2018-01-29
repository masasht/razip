class ChangeOutputCurrentMaxOfEscs < ActiveRecord::Migration[5.0]
  def change
    change_column :escs, :output_current_max, :integer
  end
end
