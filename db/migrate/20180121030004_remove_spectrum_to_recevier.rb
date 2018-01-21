class RemoveSpectrumToRecevier < ActiveRecord::Migration[5.0]
  def change
    remove_column :receviers, :spectrum, :string
  end
end
