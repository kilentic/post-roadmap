class SelfUserBroadcastJob < ApplicationJob
  queue_as :default

  def perform c_user, html, post_id, count
    SelfUserChannel.broadcast_to c_user,
      html: html,
      post_id: post_id,
      count: count
  end
end
