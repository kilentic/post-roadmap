class FollowsController < ApplicationController
  def create
    @follower = User.find_by id: params[:format]
    Follow.where(followee: current_user, follower: @follower).first_or_create
  end

  def destroy
    @follow_record = Follow.find_by followee_id: current_user, follower_id: params[:id] 
    @follow_record.destroy
    @unfollower = User.find_by id: params[:id]
  end
end
