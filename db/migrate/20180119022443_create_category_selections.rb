class CreateCategorySelections < ActiveRecord::Migration[5.0]
  def change
    create_table :category_selections do |t|
      t.string :category

      t.timestamps
    end
  end
end
