class LikesController < ApplicationController
  def create
    @like = current_user.likes.new like_params
    @post = @like.duty
    @liked = @post.likes.find_by(user_id: current_user.id)

    respond_to do |format|
      if !@liked
        @like.save
        format.js
      else
        @liked.destroy
        format.js
      end
      @like.like_post_comment_broadcast(@post.likes.count, @like.duty_type, @post.id)

    end
  end

  private
  def like_params
    params[:like].permit!
  end
end
