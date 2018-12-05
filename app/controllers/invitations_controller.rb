class InvitationsController < ApplicationController
  before_action :logged_in_user

  def create
    invitation_code = params[:id]
    group = Group.find_by(invitation_code: invitation_code)
    group.users << current_user
    redirect_to group
  end
end
