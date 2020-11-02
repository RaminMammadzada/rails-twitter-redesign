class Opinion < ApplicationRecord
  belongs_to :user, foreign_key :authorId
end
