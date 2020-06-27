class PostBroadcastJob < ApplicationJob
  queue_as :default

  def perform s_post, fer_user
    s_post.user.followees.each do |follower|
      PostChannel.broadcast_to(
        follower,
        #render_with_signed_in_user(follower, s_post)
        PostsController.render(partial: 'posts/postb', locals: {post: s_post, current_usr: follower})
      )
    end
  end

  private
  def render_with_signed_in_user(user, *args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
    renderer = PostsController.renderer.new('warden' => proxy)
    renderer.render(*args)
  end
end
