class Auth::SignupsController < ApplicationController
  skip_before_action :logged_in_user

  def new
    @user = User.new
  end
  def create
    @user = User.new user_params
      if @user.invalid? 
        respond_to do |format|
          @errors = @user.errors
          format.js
        end
      elsif @user.save

        redirect_to root_url
      end
      
  end

  private
  def user_params
    params[:user].permit(:name, :phone, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      redirect_to new_auth_session_url
    end
  end


end
