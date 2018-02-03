class AddUsUserClassToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_class, :string, default: '未設定'
  end
end
