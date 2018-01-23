class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :machine, optional: true
  belongs_to :kit, optional: true
  belongs_to :motor, optional: true
  belongs_to :esc, optional: true
  belongs_to :servo, optional: true
  belongs_to :recevier, optional: true
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
#  validates :machine, required: false
#  validates :kit, required: false
#  validates :motor, required: false
#  validates :esc, required: false
#  validates :servo, required: false
#  validates :recevier, required: false
  
end
