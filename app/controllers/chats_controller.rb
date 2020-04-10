class ChatsController < ApplicationController
  def create
    @message = current_user.messages.create message_params
    conversation = Conversation.find_conversation_by_room_id_and_send_id \
      room_params, current_user.id
    @receiver = User.find_by id: conversation.receive_id
    if @receiver
      @message.chat_broadcast @receiver
    end

  end
  private
  def message_params
    params.require(:message).permit!
  end

  def room_params
    params[:message][:room_id]
  end
end
