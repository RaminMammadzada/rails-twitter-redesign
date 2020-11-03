class User < ApplicationRecord
  has_many :opinions, foreign_key: :authorId, dependent: :destroy

  has_many :follower_users, class_name: 'Following', foreign_key: :followerId, dependent: :destroy
  has_many :followers, through: :follower_users

  has_many :followed_users, class_name: 'Following', foreign_key: :followedId, dependent: :destroy
  has_many :followeds, through: :followed_users

  validates :username, presence: true
end
