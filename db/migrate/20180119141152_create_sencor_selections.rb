class CreateSencorSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :sencor_selections do |t|
      t.string :sensor

      t.timestamps
    end
  end
end
