class CreateUserAuths < ActiveRecord::Migration[5.2]
  def change
    create_table :user_auths do |t|
      t.references :user
      t.string 'provider_uid'
      t.string 'provider'
      t.timestamps
    end
  end
end
