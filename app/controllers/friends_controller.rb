class FriendsController < ApplicationController
  def create
    @user = User.find_by id: params[:format]
    req = ReqFriend.find_by res_user: current_user, req_user: @user
    if @user && req
      Friend.create friend: @user, current: current_user
      Friend.create friend: current_user, current: @user
      req.destroy
    end
  end

  def destroy
    @user = User.find_by id: params[:id]
    friend = Friend.find_by(current: current_user, friend: @user)
    current = Friend.find_by(current: @user, friend: current_user)
    if @user && friend && current
      friend.destroy
      current.destroy
    end
  end
end
