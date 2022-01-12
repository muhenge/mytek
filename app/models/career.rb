class Career < ApplicationRecord
  has_many :user
  has_many :posts
end
