class CreateDriveSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :drive_selections do |t|
      t.string :drive_system
      
      t.timestamps
    end
  end
end
