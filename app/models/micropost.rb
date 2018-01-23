class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :machine
  belongs_to :kit
  belongs_to :motor
  belongs_to :esc
  belongs_to :servo
  belongs_to :recevier
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  validates :machine, :allow_blank => true
  validates :kit, :allow_blank => true
  validates :motor, :allow_blank => true
  validates :esc, :allow_blank => true
  validates :servo, :allow_blank => true
  validates :recevier, :allow_blank => true
  
end
