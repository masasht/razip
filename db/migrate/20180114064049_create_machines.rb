class CreateMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :machines do |t|
      t.string :machine_name
      t.string :image
      t.references :user, foreign_key: true
      t.references :kit, foreign_key: true
      t.references :motor, foreign_key: true
      t.references :esc, foreign_key: true
      t.references :servo, foreign_key: true
      t.references :recevier, foreign_key: true
      t.string :class
      t.text :other
      t.text :information

      t.timestamps
    end
  end
end
