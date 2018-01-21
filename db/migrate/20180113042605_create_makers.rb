class CreateMakers < ActiveRecord::Migration[5.0]
  def change
    create_table :makers do |t|
      t.string :maker_name
      t.string :official_url

      t.timestamps
    end
  end
end
