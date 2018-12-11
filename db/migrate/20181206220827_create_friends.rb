class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :friend_id
      t.timestamps
    end

    add_index :friends, :friend_id
    add_foreign_key :friends, :users, column: :friend_id
  end
end
