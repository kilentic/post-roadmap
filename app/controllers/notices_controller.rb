class NoticesController < ApplicationController
  def index
    @notifications = current_user.notifications.order(created_at: :DESC)
    respond_to do |format|
      format.js
    end
      
  end

  def update
    if params[:id] === 'all'
      current_user.notifications.where(isSeen: false).update isSeen: true
    else
      Notification.find_by(id: params[:id]).update isSeen: true
      @count = current_user.notifications.where(isSeen: false).count
      respond_to do |format|
        format.js
      end
    end
  end
end
