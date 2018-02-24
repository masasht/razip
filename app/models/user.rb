class User < ApplicationRecord
  attr_accessor :remember_token
  
  validates :name, length: { maximum: 20 }
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
  has_many :microposts
  
  # Have Want用
  has_many :ownerships
  has_many :kits, through: :ownerships
  has_many :motors, through: :ownerships
  has_many :escs, through: :ownerships
  has_many :servos, through: :ownerships
  has_many :receviers, through: :ownerships
  
  
  #引数に関連するユーザーが存在すればそれを返し、存在しまければ新規に作成する
  def self.find_or_create_from_auth_hash(auth_hash)
    #OmniAuthで取得した各データを代入していく
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
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

  def want?(item)
#    want_items = self.kits + self.motors + self.escs + self.servos + self.receviers
#    want_items.include?(item)
    
    if item.class.name == "Kit"
      self.ownerships.find_by(kit_id: item.id, interest: "Want") != nil
    elsif  item.class.name == "Motor"
      self.ownerships.find_by(motor_id: item.id, interest: "Want") != nil
    elsif  item.class.name == "Esc"
      self.ownerships.find_by(esc_id: item.id, interest: "Want") != nil
    elsif  item.class.name == "Servo"
      self.ownerships.find_by(servo_id: item.id, interest: "Want") != nil
    elsif  item.class.name == "Recevier"
      self.ownerships.find_by(recevier_id: item.id, interest: "Want") != nil
    end
    
  end
  
  def want(item)
    if item.class.name == "Kit"
      self.ownerships.find_or_create_by(kit_id: item.id, interest: "Want")
    elsif  item.class.name == "Motor"
      self.ownerships.find_or_create_by(motor_id: item.id, interest: "Want")
    elsif  item.class.name == "Esc"
      self.ownerships.find_or_create_by(esc_id: item.id, interest: "Want")
    elsif  item.class.name == "Servo"
      self.ownerships.find_or_create_by(servo_id: item.id, interest: "Want")
    elsif  item.class.name == "Recevier"
      self.ownerships.find_or_create_by(recevier_id: item.id, interest: "Want")
    end
  end
  
  def unwant(item)
    if item.class.name == "Kit"
      want = self.ownerships.find_by(kit_id: item.id)
    elsif  item.class.name == "Motor"
      want = self.ownerships.find_by(motor_id: item.id)
    elsif  item.class.name == "Esc"
      want = self.ownerships.find_by(esc_id: item.id)
    elsif  item.class.name == "Servo"
      want = self.ownerships.find_by(servo_id: item.id)
    elsif  item.class.name == "Recevier"
      want = self.ownerships.find_by(recevier_id: item.id)
    end
    want.destroy if want
  end
  
    def have?(item)
#    want_items = self.kits + self.motors + self.escs + self.servos + self.receviers
#    want_items.include?(item)
    
    if item.class.name == "Kit"
      self.ownerships.find_by(kit_id: item.id, interest: "Have") != nil
    elsif  item.class.name == "Motor"
      self.ownerships.find_by(motor_id: item.id, interest: "Have") != nil
    elsif  item.class.name == "Esc"
      self.ownerships.find_by(esc_id: item.id, interest: "Have") != nil
    elsif  item.class.name == "Servo"
      self.ownerships.find_by(servo_id: item.id, interest: "Have") != nil
    elsif  item.class.name == "Recevier"
      self.ownerships.find_by(recevier_id: item.id, interest: "Have") != nil
    end
    
  end
  
  def have(item)
    if item.class.name == "Kit"
      self.ownerships.find_or_create_by(kit_id: item.id, interest: "Have")
    elsif  item.class.name == "Motor"
      self.ownerships.find_or_create_by(motor_id: item.id, interest: "Have")
    elsif  item.class.name == "Esc"
      self.ownerships.find_or_create_by(esc_id: item.id, interest: "Have")
    elsif  item.class.name == "Servo"
      self.ownerships.find_or_create_by(servo_id: item.id, interest: "Have")
    elsif  item.class.name == "Recevier"
      self.ownerships.find_or_create_by(recevier_id: item.id, interest: "Have")
    end
  end
  
  def unhave(item)
    if item.class.name == "Kit"
      have = self.ownerships.find_by(kit_id: item.id)
    elsif  item.class.name == "Motor"
      have = self.ownerships.find_by(motor_id: item.id)
    elsif  item.class.name == "Esc"
      have = self.ownerships.find_by(esc_id: item.id)
    elsif  item.class.name == "Servo"
      have = self.ownerships.find_by(servo_id: item.id)
    elsif  item.class.name == "Recevier"
      have = self.ownerships.find_by(recevier_id: item.id)
    end
    have.destroy if have
  end
end
  