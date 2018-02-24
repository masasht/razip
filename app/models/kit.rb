class Kit < ApplicationRecord
  belongs_to :maker
  
  validates :name, presence: true, length: { maximum: 250 }, uniqueness: true
  validates :maker_url, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true
  validates :category, presence: true, length: { maximum: 50 }
  validates :drive_system, presence: true, length: { maximum: 50 }
  
  has_many :machines
  #has_many :users, through: :machines
  has_many :microposts
  has_many :ownerships
  has_many :users, through: :ownerships
end
