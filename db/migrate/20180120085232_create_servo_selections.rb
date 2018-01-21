class CreateServoSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :servo_selections do |t|
      t.string :servo_type

      t.timestamps
    end
  end
end
