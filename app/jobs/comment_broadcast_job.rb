class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform comment, c_user
    ActionCable.server.broadcast "comment_post_channel" ,
      post_id: comment.post.id,
      count: comment.post.comments.count,
      comment: comment
  end

  private
  def render_with_signed_in_user(user, *args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
    renderer = CommentsController.renderer.new('warden' => proxy)
    renderer.render(*args)
  end

end
