class LikeBroadcastJob < ApplicationJob
  queue_as :default

  def perform count, duty_type, duty_id
    ActionCable.server.broadcast 'like_post_comment_channel',
                                  count: count,
                                  duty_type: duty_type,
                                  duty_id: duty_id
  end
end
