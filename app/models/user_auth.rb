class UserAuth < ApplicationRecord
  belongs_to :user
  validates_presence_of(:user, :provider, :provider_uid)
end
