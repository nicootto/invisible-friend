class Group < ApplicationRecord
  include TokenConcern

  has_many :group_users
  has_many :users, through: :group_users

  def create_invitation_token
    self.invitation_token = new_token
  end
end

