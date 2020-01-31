class FriendsController < ApplicationController
  def create
    @user = User.find_by id: params[:format]

  end

  def destroy
    
  end
end
