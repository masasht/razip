class CreateMotors < ActiveRecord::Migration[5.0]
  def change
    create_table :motors do |t|
      t.string :name
      t.string :image
      t.references :maker, foreign_key: true
      t.string :maker_url
      t.integer :list_price
      t.string :type
      t.string :sencor
      t.string :turn
      t.string :kv
      t.string :rpm
      t.string :torque
      t.string :voltage
      t.string :ampere
      t.text :information

      t.timestamps
    end
  end
end
