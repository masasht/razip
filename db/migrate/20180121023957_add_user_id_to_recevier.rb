class AddUserIdToRecevier < ActiveRecord::Migration[5.0]
  def change
    add_reference :receviers, :user, foreign_key: true
  end
end
