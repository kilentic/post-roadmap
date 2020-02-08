class VideoCallsController < ApplicationController
  def create
    head :no_content
    VideoCallChannel.broadcast_to(
      current_user,
      session_params
    )

  end
  def show
    
  end
  def index
    
  end

  private
    def session_params
      params.permit(:type, :from, :to, :sdp, :candidate)
    end
end
