class Machine < ApplicationRecord
  

  belongs_to :user
  belongs_to :kit
  belongs_to :motor
  belongs_to :esc
  belongs_to :servo
  belongs_to :recevier
  
  mount_uploader :image, ImageUploader

  has_many :clips, dependent: :destroy
  has_many :fastened, through: :clips, source: :user
  has_many :microposts

# ↓ここが怪しい。
#  def clipped(user)
#  end

end