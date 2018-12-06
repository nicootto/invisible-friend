class AddFkToFriendsModel < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :friends, :users, column: :friend_id
    add_index :friends, :friend_id
  end
end
