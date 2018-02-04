class Machine < ApplicationRecord
  

  belongs_to :user
  belongs_to :kit, optional: true
  belongs_to :motor, optional: true
  belongs_to :esc, optional: true
  belongs_to :servo, optional: true
  belongs_to :recevier, optional: true
  
  mount_uploader :image, ImageUploader

  has_many :clips, dependent: :destroy
  has_many :fastened, through: :clips, source: :user
  has_many :microposts


# ↓ここが怪しい。
#  def clipped(user)
#  end

end