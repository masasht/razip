class User < ApplicationRecord
  attr_accessor :remember_token
  
  validates :name, length: { maximum: 20 }, uniqueness: true
  validates :email, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }, :allow_blank => true
  validates :site_url, format: /\A#{URI::regexp(%w(http https))}\z/, :allow_blank => true
#  has_secure_password
  
  has_many :machines
  
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  has_many :clips, dependent: :destroy
  has_many :fastenings, through: :clips, source: :machine

  has_many :makers
  has_many :kits
#  has_many :kits ,through: :machines #ユーザのもっているキットを検索
  has_many :motors
  has_many :escs
  has_many :servos
  has_many :receviers
  has_many :microposts
  
  
  #引数に関連するユーザーが存在すればそれを返し、存在しまければ新規に作成する
  def self.find_or_create_from_auth_hash(auth_hash)
    #OmniAuthで取得した各データを代入していく
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    email = auth_hash[:info][:email]
    name = auth_hash[:info][:name]
    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.email = email
      user.name = name
    end
  end
  
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def fasten(machine)
    self.clips.find_or_create_by(machine_id: machine.id)
  end
  
  def unfasten(machine)
    clip = self.clips.find_by(machine_id: machine.id)
    clip.destroy if clip
  end
  
  def fastening?(machine)
    self.fastenings.include?(machine)
  end
  
  def feed_microposts
    Micropost.where(user_id: self.following_ids + [self.id])
  end
  
end
  