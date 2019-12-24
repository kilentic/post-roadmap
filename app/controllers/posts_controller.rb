class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
   @posts = Post.order(id: :desc).page params[:page]
   @post = Post.new
   @comment = Comment.new
   @like = Like.new
#   @posts = @posts = Post.paginate(page: params[:page])
  end

  def edit 
    @post = Post.find_by id: params[:id]
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @post = Post.find_by id: params[:id]
    if @post
      @post.destroy
      respond_to do |format|
        format.js
      end
    end
      
  end

  def create
    @post = current_user.posts.new message_params
    respond_to do |format|
      if @post.save
        @comment = Comment.new
        @like = Like.new
        format.js
      else
        format.js
      end
    end
  end
  
  def new
    @post = Post.new
    respond_to do |format|
      format.js
    end
  end

  def update
    @post = Post.find_by id: params[:id]
    respond_to do |format|
      if @post.update_attributes message_params
        format.js
      else
        format.js
      end
    end
  end
  
private
  def message_params
    params.require(:post).permit(:message)
  end
end
