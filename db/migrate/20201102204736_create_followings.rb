class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :followerId
      t.integer :followedId

      t.timestamps
    end
  end
end
