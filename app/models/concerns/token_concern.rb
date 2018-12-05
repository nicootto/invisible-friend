module TokenConcern

  def new_token
    SecureRandom.urlsafe_base64
  end

  def digest_token(token)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(token, cost: cost)
  end

  # Returns true if the given token matches the digest.
  def validate_token(digest, token)
    if token.nil? || digest.nil?
      false
    else
      BCrypt::Password.new(digest).is_password?(token)
    end
  end

end