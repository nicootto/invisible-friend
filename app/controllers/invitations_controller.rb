class InvitationsController < ApplicationController
  before_action :logged_in_user

  def create
    invitation_code = params[:id]
    group = Group.find_by(invitation_code: invitation_code)
    unless group.users.include? current_user
      group.users << current_user
    end
    redirect_to group
  end
end
