class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def chat_broadcast receiver
    ChatBroadcastJob.perform_later self, receiver
  end
end
