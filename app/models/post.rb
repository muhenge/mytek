class Post < ApplicationRecord
  acts_as_votable
  validates :content, :presence => true
  # validates :title, :presence => true, length: {minimum:10}
  belongs_to :user
  belongs_to :career
  has_many :comments
  scope :most_recent, -> { order(created_at: :desc) }
  
end
