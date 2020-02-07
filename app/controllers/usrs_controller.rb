class UsrsController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    @posts = @user.posts.order(created_at: :desc)
    @like = Like.new
    @comment = Comment.new
    @isFollow = Follow.find_by follower_id: @user, followee_id: current_user
    @isReqFriend = ReqFriend.find_by res_user_id: current_user, req_user_id: @user
    @isResFriend = ReqFriend.find_by req_user_id: current_user, res_user_id: @user
    @isFriend = Friend.find_by current: current_user, friend: @user
  end

  def edit
    @user = User.find_by id: params[:id]
    respond_to do |format|
      format.js
    end
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update_attributes user_params
      respond_to do |format|
        format.js
      end
    end
  end

  def search
    @users_result = User.search_user params[:usr_search][:name]
  end

  private
  def user_params
    params.require(:user).permit(:birthday, :gender, :phone, :address)
    
  end
end
