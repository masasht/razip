class CreateBrushSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :brush_selections do |t|
      t.string :motor_type

      t.timestamps
    end
  end
end
