class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :picture
      t.string :invitation_token
      t.bigint :owner_id
      t.timestamps
    end

    add_index :groups, :owner_id
    add_foreign_key :groups, :users, column: :owner_id
  end
end
