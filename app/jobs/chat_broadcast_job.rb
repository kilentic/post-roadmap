class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform message, receiver
    ChatChannel.broadcast_to(
      receiver,
      html_message: RoomsController.render(partial: 'rooms/rec_message', locals: {message: message}),
      room_id: message.room.id,
      html_icon: RoomsController.render(partial: 'rooms/icon_chat_tab', locals: {user: message.user, room: message.room})
    )

  end
end
