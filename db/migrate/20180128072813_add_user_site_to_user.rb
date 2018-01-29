class AddUserSiteToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_site, :string
  end
end
