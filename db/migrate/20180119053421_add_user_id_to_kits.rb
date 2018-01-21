class AddUserIdToKits < ActiveRecord::Migration[5.0]
  def change
    add_reference :kits, :user, foreign_key: true
  end
end
