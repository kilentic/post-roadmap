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

  has_many :currents, foreign_key: :friend_id, class_name: 'Friend'
  has_many :current_users, through: :currents

  has_many :friends, foreign_key: :current_id, class_name: 'Friend'
  has_many :friend_users, through: :friends

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
    isSend = true
    NotifyReqFriendJob.perform_later self, res_user, isSend
  end

  def broadcast_delete_req_friend res_user
    isSend = false
    NotifyReqFriendJob.perform_later self, res_user, isSend
  end
end
