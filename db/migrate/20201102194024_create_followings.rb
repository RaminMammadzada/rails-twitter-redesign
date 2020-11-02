class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :followerId
      t.integer :followingId

      t.timestamps
    end
  end
end
