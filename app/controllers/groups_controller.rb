class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.create_invitation_code
    @group.users << current_user
    @group.save!
    redirect_to @group
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

end
