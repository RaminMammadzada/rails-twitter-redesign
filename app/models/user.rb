class User < ApplicationRecord
  has_many :opinions, foreign_key: :authorId, dependent: :destroy

  has_many :follower_users, class_name: 'Following', foreign_key: :followedId, dependent: :destroy
  has_many :followers, through: :follower_users

  has_many :followed_users, class_name: 'Following', foreign_key: :followerId, dependent: :destroy
  has_many :followeds, through: :followed_users

  validates :username, presence: true
  validates :fullname, presence: true
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_attached_file :cover_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover_image, content_type: /\Aimage\/.*\z/

  validates :photo, presence: true
  validates :cover_image, presence: true

  has_many :votes, class_name: 'Vote', foreign_key: :voter_id, dependent: :destroy
end
