class User < ApplicationRecord
  has_many :opinions, foreign_key: authorId, dependent: :destroy
end
