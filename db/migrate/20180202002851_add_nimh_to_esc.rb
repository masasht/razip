class AddNimhToEsc < ActiveRecord::Migration[5.0]
  def change
    add_column :escs, :life, :string, after: :lipo
    add_column :escs, :nimh, :string, after: :life
    add_column :escs, :nicd, :string, after: :nimh
  end
end
