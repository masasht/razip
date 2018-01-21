class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :user_url, format: /\A#{URI::regexp(%w(http https))}\z/, :allow_blank => true
  has_secure_password
  
  has_many :machines
  
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  has_many :clips, dependent: :destroy
  has_many :fastenings, through: :clips, source: :machine

  has_many :makers
  has_many :kits
  has_many :motors
  has_many :escs
  has_many :servos
  

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
end
