class Group < ApplicationRecord
  include TokenConcern

  has_many :group_users
  has_many :users, through: :group_users
  belongs_to :owner, class_name: 'User', dependent: :destroy

  before_create do
    self.users << owner
    create_invitation_token
  end

  validates_presence_of :name, :owner

  def create_invitation_token
    self.invitation_token = new_token
  end
end

