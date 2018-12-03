class SessionsController < ApplicationController
  def new
    redirect_to current_user if logged_in?
  end

  def create
    user = authenticate_with_google
    if user
      cookies.signed[:user_id] = user.id
      redirect_to user
    else
      redirect_to new_session_url, alert: ''
    end
  end

  private

  def authenticate_with_google
    if flash[:google_sign_in_token].present?
      google_user = GoogleSignIn::Identity.new(flash[:google_sign_in_token])
      user = User.find_by google_id: google_user.user_id
      user ||= create_user(google_user)
      log_in(user)

      return user
    end
  end

  def create_user(google_user)
    user = User.new
    user.google_id = google_user.user_id
    user.name = google_user.name.downcase.split.map(&:capitalize).join(' ')
    user.email = google_user.email_address.downcase
    user.picture = google_user.avatar_url
    user.save!
    return user
  end
end