class Auth::SessionsController < ApplicationController
  skip_before_action :logged_in_user
  def new

  end
  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] = remember(user)
      redirect_back_or root_url
    else
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  def logged_in_user
    unless logged_in?
      store_location
      redirect_to new_auth_session_url
    end
  end



    
end
