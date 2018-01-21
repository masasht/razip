class AddUserIdToMotor < ActiveRecord::Migration[5.0]
  def change
    add_reference :motors, :user, foreign_key: true
  end
end
