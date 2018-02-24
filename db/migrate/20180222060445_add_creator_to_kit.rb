class AddCreatorToKit < ActiveRecord::Migration[5.0]
  def change
    add_column :kits, :creator, :integer
    add_column :kits, :editor, :integer
  end
end
