class DrawsController < ApplicationController
  include DrawsHelper

  def create
    group = Group.find(params[:group_id])
    find_friends(group)

    flash[:success] = 'Se han sorteado los amigos'
    redirect_to group
  end
end
