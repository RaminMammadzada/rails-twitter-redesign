class Vote < ApplicationRecord
  belongs_to :user,  class_name: 'User', foreign_key: :voter_id
  belongs_to :opinion, class_name: 'Opinion', foreign_key: :current_opinion_id
end
