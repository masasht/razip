class CreateFrequencySelections < ActiveRecord::Migration[5.0]
  def change
    create_table :frequency_selections do |t|
      t.string :frequency_type

      t.timestamps
    end
  end
end
