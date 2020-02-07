class ChatsController < ApplicationController
  def create
    @message = current_user.messages.create message_params
    conversation = Conversation.find_by room_id: params[:message][:room_id],
      send_id: current_user.id
    @receiver = User.find_by id: conversation.receive_id
    if @receiver
      @message.chat_broadcast @receiver
    end

  end
  private
  def message_params
    params.require(:message).permit!
  end
end
