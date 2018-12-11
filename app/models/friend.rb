class Friend < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :group, dependent: :destroy
  belongs_to :friend, class_name: 'User', dependent: :destroy

  validates_presence_of(:user)
end
