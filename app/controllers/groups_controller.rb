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
    @group = Group.create(name: group_name, owner: current_user)
    redirect_to @group
  end

  private

  def group_name
    params[:group][:name]
  end

end
