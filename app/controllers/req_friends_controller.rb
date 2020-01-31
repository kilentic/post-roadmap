class ReqFriendsController < ApplicationController
  def index
    @req_friends = ReqFriend.all
  end
  def create
    @user = User.find_by id: params[:format]
    if @user &&  !(current_user.req_users.find_by id: @user)
      current_user.res_users << @user 
      isFollow = Follow.find_by followee: current_user, follower: @user
      if !isFollow
        Follow.create followee: current_user, follower: @user
      end
    current_user.broadcast_send_req_friend @user
    else
      redirect_to request.referrer
    end
  end

  def update
    @req_friends = ReqFriend.where(res_user: current_user, seen: false).update seen: true
  end

  def destroy
    @user = User.find_by id: params[:id]
    @res_user = ReqFriend.find_by res_user_id: @user, req_user_id: current_user
    @req_user = ReqFriend.find_by req_user_id: @user, res_user_id: current_user

    if @res_user
      @type = 0
      @res_user.destroy
      @req_count = 0
      current_user.broadcast_delete_req_friend @user
    end

    if @req_user
      @type = 1
      @req_user.destroy
      @req_count = ReqFriend.where(res_user_id: current_user, seen: false).count
      current_user.broadcast_delete_req_friend @user
    end
  end
end
