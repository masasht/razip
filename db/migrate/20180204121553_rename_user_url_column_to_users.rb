class RenameUserUrlColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :user_url, :site_url
  end
end
