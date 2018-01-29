class RenameUserSiteToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :user_site, :site_name
  end
end
