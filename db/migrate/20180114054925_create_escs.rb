class CreateEscs < ActiveRecord::Migration[5.0]
  def change
    create_table :escs do |t|
      t.string :name
      t.string :image
      t.references :maker, foreign_key: true
      t.string :maker_url
      t.integer :list_price
      t.string :motor_type
      t.string :sencor
      t.string :battery_type
      t.string :input_current
      t.string :output_current_max
      t.string :output_current
      t.string :bec
      t.text :information

      t.timestamps
    end
  end
end
