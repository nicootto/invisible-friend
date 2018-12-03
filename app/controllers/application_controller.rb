class ApplicationController < ActionController::Base
  include SessionHelper

  # Confirms a logged-in user
  def logged_in_user
    unless logged_in?
      store_location
      redirect_to login_url
    end
  end
end
