class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable , :omniauth_providers => [:facebook, :google_oauth2]
  has_one :authen
  has_many :posts
  has_many :comments
  has_many :likes

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  has_many :requests, foreign_key: :res_user_id, class_name: 'ReqFriend'
  has_many :req_users, through: :requests

  has_many :respones, foreign_key: :req_user_id, class_name: 'ReqFriend'
  has_many :res_users, through: :respones

  has_many :current_users, foreign_key: :friend_id, class_name: 'Friend'
  has_many :currents, through: :current_users

  has_many :friend_users, foreign_key: :current_id, class_name: 'Friend'
  has_many :friends, through: :friend_users

  has_many :messages

  has_many :room_users
  has_many :usr_rooms, through: :room_users, source: :room

  has_many :notifications

# has_many :conversations
# has_many :co_rooms, through: :conversations, source: :room

# has_many :senders, foreign_key: :receive_id, class_name: 'Conversation'
# has_many :sends, through: :senders, source: :receive

# has_many :receivers, foreign_key: :send_id, class_name: 'Conversation'
# has_many :receives, through: :receivers, source: :send

  scope :search_user, -> (name) do
    where("name LIKE ?", "%#{name.strip}%")
  end

  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] &&
        session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end


  def broadcast_send_req_friend res_user
    action = "send-req"
    NotifyReqFriendJob.perform_later self, res_user, action
  end

  def broadcast_delete_req_friend res_user
    action = "delete-req"
    NotifyReqFriendJob.perform_later self, res_user, action
  end

  def broadcast_accept_friend res_user
    action = "accept-friend"
    NotifyReqFriendJob.perform_later self, res_user, action
  end

  def broadcast_unfriend user
    action = "unfriend"
    NotifyReqFriendJob.perform_later self, user, action
  end

end
