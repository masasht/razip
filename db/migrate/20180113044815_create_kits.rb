class CreateKits < ActiveRecord::Migration[5.0]
  def change
    create_table :kits do |t|
      t.string :name
      t.string :image
      t.references :maker, foreign_key: true
      t.string :maker_url
      t.integer :list_prics
      t.string :category
      t.string :drive_system
      t.text :information

      t.timestamps
    end
  end
end
