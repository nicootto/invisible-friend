class SessionsController < ApplicationController
  def new
    redirect_to current_user if logged_in?
  end

  def create
    user = authenticate_with_google
    if user
      redirect_back_or user
    else
      redirect_to root_url, alert: 'Ocurrió un error en el acceso'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def authenticate_with_google
    return unless flash[:google_sign_in_token].present?

    google_user = GoogleSignIn::Identity.new(flash[:google_sign_in_token])
    user = User.find_by google_id: google_user.user_id
    user ||= create_user(google_user)
    log_in(user)
    return user
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