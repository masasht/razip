class AddUserIdToServo < ActiveRecord::Migration[5.0]
  def change
    add_reference :servos, :user, foreign_key: true
  end
end
