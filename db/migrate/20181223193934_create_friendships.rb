class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.references :friend
      t.string :friend_name
      t.text :friend_public_key
      t.text :user_public_key

      t.timestamps
    end
  end
end
