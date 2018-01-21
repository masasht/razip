class AddUserIdToEsc < ActiveRecord::Migration[5.0]
  def change
    add_reference :escs, :user, foreign_key: true
  end
end
