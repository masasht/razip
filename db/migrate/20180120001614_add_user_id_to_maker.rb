class AddUserIdToMaker < ActiveRecord::Migration[5.0]
  def change
    add_reference :makers, :user, foreign_key: true
  end
end
