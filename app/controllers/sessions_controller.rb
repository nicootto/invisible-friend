class SessionsController < ApplicationController
  def new
    redirect_to current_user if logged_in?
  end

  def create
    if auth_hash
      user = User.find_or_create_from_auth_hash(auth_hash)
      log_in(user)
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

  def auth_hash
    request.env['omniauth.auth']
  end
end
