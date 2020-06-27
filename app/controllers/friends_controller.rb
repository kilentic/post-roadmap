class FriendsController < ApplicationController
  def create
    @user = User.find_by id: params[:format]
    req = ReqFriend.find_by res_user: current_user, req_user: @user
    if @user && req
      Friend.create friend: @user, current: current_user
      Friend.create friend: current_user, current: @user
      Follow.where(followee: current_user, follower: @user).first_or_create
      
      req.destroy
      @req_count = ReqFriend.where(res_user: current_user, seen: false).count
      current_user.broadcast_accept_friend @user
    end
  end

  def destroy
    @user = User.find_by id: params[:id]
    friend = Friend.find_by(current: current_user, friend: @user)
    current = Friend.find_by(current: @user, friend: current_user)
    followee = Follow.find_by follower: current_user, followee: @user
    follower = Follow.find_by follower: @user, followee: current_user
    if @user && friend && current
      friend.destroy
      current.destroy
      
      if followee
        followee.destroy
      end

      if follower
        follower.destroy
      end

      current_user.broadcast_unfriend @user
    end
  end
end
