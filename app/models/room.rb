class Room < ApplicationRecord
  has_many :conversations
  #has_many :co_users, through: :conversations

  has_many :messages

  has_many :room_users, class_name: 'RoomUser'
  has_many :usr_users, through: :room_users

end
