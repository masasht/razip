class CreateReceviers < ActiveRecord::Migration[5.0]
  def change
    create_table :receviers do |t|
      t.string :name
      t.string :image
      t.references :maker, foreign_key: true
      t.string :maker_url
      t.integer :list_price
      t.string :frequency
      t.string :spectrum
      t.string :dimensions
      t.string :weight
      t.text :information
      
      t.timestamps
    end
  end
end
