class Group < ApplicationRecord
  include TokenConcern
  has_and_belongs_to_many :users

  def create_invitation_code
    self.invitation_code = new_token
  end
end
