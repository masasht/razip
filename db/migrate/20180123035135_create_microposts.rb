class CreateMicroposts < ActiveRecord::Migration[5.0]
  def change
    create_table :microposts do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :machine, foreign_key: true
      t.references :kit, foreign_key: true
      t.references :motor, foreign_key: true
      t.references :esc, foreign_key: true
      t.references :servo, foreign_key: true
      t.references :recevier, foreign_key: true

      t.timestamps
    end
  end
end
