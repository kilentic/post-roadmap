class VideoCallsController < ApplicationController

  def create
    @remote_user = User.find_by id: params[:id]
    if(params[:signal])
      broadcast_signal @remote_user, "SIGNAL"
    end
  end
  def show
    
  end
  def index
    
  end
  def answer
  end
  def cancel
    @remote_user = User.find_by id: params[:id]
    broadcast_signal @remote_user, "CANCEL"
  end
  def broadcast_signal remote_user, type

    VideoCallSignalChannel.broadcast_to(
      remote_user,
      html: VideoCallsController.render(partial: 'video_calls/signal', locals: {receiver: remote_user, sender: current_user}),
      type: type

    )
  end
  def broadcast_data
    head :no_content
    remote_user = User.find_by id: params[:id]
    VideoCallChannel.broadcast_to(
      remote_user,
      session_params
    )
    
  end

  private
    def session_params
      params.permit(:type, :from, :to, :sdp, :candidate, :stt)
    end
end
