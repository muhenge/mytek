class Post < ApplicationRecord
  acts_as_votable
  has_rich_text :content
  validates :title, length: {maximum: 50}
  belongs_to :user
  belongs_to :career
  has_many :skills
  has_many :comments
  scope :most_recent, -> { order(created_at: :desc) }
end
