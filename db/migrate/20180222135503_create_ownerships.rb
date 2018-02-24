class CreateOwnerships < ActiveRecord::Migration[5.0]
  def change
    create_table :ownerships do |t|
      t.string :interest
      t.references :user, foreign_key: true
      t.references :kit, foreign_key: true
      t.references :motor, foreign_key: true
      t.references :esc, foreign_key: true
      t.references :servo, foreign_key: true
      t.references :recevier, foreign_key: true

      t.timestamps
      
    end
  end
end
