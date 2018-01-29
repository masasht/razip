class ChangeOutputCurrentOfEscs < ActiveRecord::Migration[5.0]
  def change
    change_column :escs, :output_current, :integer
  end
end
