class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :current_opinion_id

      t.timestamps
    end
  end
end
