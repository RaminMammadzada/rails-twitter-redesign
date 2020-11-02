class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: :followerId
  belongs_to :followed, class_name: 'User', foreign_key: :followedId
end
