class Conversation < ApplicationRecord
  belongs_to :room
# belongs_to :send, class_name: 'User'
# belongs_to :receive, class_name: 'User'

  scope :existing_conversation, ->(send_id, receive_id) do
    where("(send_id = ? AND receive_id = ?) OR (send_id = ? AND receive_id = ?)",
      send_id, receive_id, receive_id, send_id)
  end

  scope :create_conversation, ->(room_id, send_id, receive_id) do
    create(room_id: room_id, send_id: send_id, receive_id: receive_id)
    create(room_id: room_id, send_id: receive_id, receive_id: send_id)
  end

  scope :find_conversation_by_room_id_and_send_id, ->(room_id, send_id) do
     find_by room_id: room_id, send_id: send_id
  end
end
