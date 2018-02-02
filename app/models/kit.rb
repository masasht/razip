class Kit < ApplicationRecord
  belongs_to :maker
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 250 }, uniqueness: true
  validates :maker_url, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true
  validates :category, presence: true, length: { maximum: 50 }
  validates :drive_system, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  
  mount_uploader :image, ImageUploader

  has_many :machines
  has_many :users
  #has_many :users, through: :machines
  has_many :microposts
end
