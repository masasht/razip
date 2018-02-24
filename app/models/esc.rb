class Esc < ApplicationRecord
  belongs_to :maker
  
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :maker_url, format: /\A#{URI::regexp(%w(http https))}\z/, :allow_blank => true
  
  has_many :machines
  has_many :microposts
  has_many :ownerships
  has_many :users, through: :ownerships
end
