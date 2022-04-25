class User < ApplicationRecord
  attr_accessor :login
  acts_as_voter

  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable    
  belongs_to :career
  has_many :posts
  has_one_attached :avatar
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
  has_many :comments, dependent: :destroy
  has_many :skills, dependent: :destroy
  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    condition = warden_conditions.dup
    if login = condition.delete(:login)
      where(condition.to_hash).where("lower(username)= :value OR lower(email) = :value", value: login.downcase).first
    else
      where(condition.to_hash).first
    end
  end
end
