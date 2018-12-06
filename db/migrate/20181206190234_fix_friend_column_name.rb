class FixFriendColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :friends, :friend, :friend_id
  end
end
