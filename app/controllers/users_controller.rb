class UsersController < ApplicationController
  def show
    @posts = Post.all
    @like = Like.new
    @comment = Comment.new

  end

end
