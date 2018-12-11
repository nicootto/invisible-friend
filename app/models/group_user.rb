class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates_presence_of :group, :user
end
