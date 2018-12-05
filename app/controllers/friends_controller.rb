class FriendsController < ApplicationController
  def show
    user = current_user
    group = Group.find(params[:group_id])
    friend = Friend.find_by(group: group.id, user: user.id)

    @friend = User.find(friend.friend)
  end
end
