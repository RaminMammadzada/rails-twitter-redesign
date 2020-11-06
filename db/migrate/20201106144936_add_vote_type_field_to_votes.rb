class AddVoteTypeFieldToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :vote_type, :string
  end
end
