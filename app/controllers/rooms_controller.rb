class RoomsController < ApplicationController
  def index
    @conversations = Conversation.where(send_id: current_user.id)
  end
  def create
    conversations = Conversation.existing_conversation(current_user.id, params[:id])
    @user = User.find_by id: params[:id]
    if @user
      if conversations.count == 2
        @room = conversations[0].room
      elsif conversations.count == 1
      elsif conversations.count == 0
        @room = Room.create
        Conversation.create_conversation(@room.id, current_user.id, @user.id)
      end
    end
  end

  def show
    @room = Room.find_by id: params[:id]
    conversation = @room.conversations.find_by send_id: current_user
    @receiver = User.find_by id: conversation.receive_id
    if @room
      @messages = @room.messages
    end
  end
end
