class Maker < ApplicationRecord
  
  belongs_to :user
  
  validates :maker_name, presence: true, uniqueness: true
  validates :official_url, format: /\A#{URI::regexp(%w(http https))}\z/, :allow_blank => true
  
  has_many :kits
  has_many :motors
  has_many :escs
  has_many :servos
  has_many :receviers
  
end
