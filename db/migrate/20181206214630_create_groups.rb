class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :picture
      t.string :invitation_token

      t.timestamps
    end
  end
end
