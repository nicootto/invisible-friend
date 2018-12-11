class User < ApplicationRecord
  has_many :group_users
  has_many :groups, through: :group_users

  has_many :friends

  validates_presence_of :name

  def User.find_or_create_from_auth_hash(auth_hash)

    user_auth = UserAuth.find_by(provider: auth_hash.provider,
                                 provider_uid: auth_hash.uid)

    if user_auth
      return user_auth.user
    else
      User.create_from_auth_hash(auth_hash)
    end
  end

  def User.create_from_auth_hash(auth_hash)
    user = User.create!(
      name: auth_hash.info.name,
      email: auth_hash.info.email,
      picture: auth_hash.info.image
    )

    UserAuth.create!(
      user: user,
      provider: auth_hash.provider,
      provider_uid: auth_hash.uid
    )

    return user
  end

end
