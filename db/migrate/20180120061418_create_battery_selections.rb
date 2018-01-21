class CreateBatterySelections < ActiveRecord::Migration[5.0]
  def change
    create_table :battery_selections do |t|
      t.string :battery_type

      t.timestamps
    end
  end
end
