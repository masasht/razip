class ChangeDatatypeTurnMotors < ActiveRecord::Migration[5.0]
  def change
    
    # 変更内容
    def up
      change_column :motors, :turn, :float 
    end
    
    # 変更前の状態
    def down
      change_column :motors, :turn, :string
    end
  end
end
