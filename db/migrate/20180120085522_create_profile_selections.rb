class CreateProfileSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_selections do |t|
      t.string :profile_type

      t.timestamps
    end
  end
end
