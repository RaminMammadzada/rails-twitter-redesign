class Opinion < ApplicationRecord
  belongs_to :user, foreign_key: :authorId
  has_many :votes, class_name: 'Vote', foreign_key: :current_opinion_id

           has_many :followed_users, class_name: 'Following', foreign_key: :followerId, dependent: :destroy
  has_many :followeds, through: :followed_users
end
