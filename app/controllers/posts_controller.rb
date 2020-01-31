class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
   @post = Post.new
   @comment = Comment.new
   @like = Like.new
   followers = current_user.followers.pluck(:id)
   followers.push(current_user.id)
   @posts = Post.where(user: followers).order(created_at: :desc).page params[:page]
   
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
        @post.broadcast_post current_user
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
    if @post.update_attributes message_params
      @like = Like.new
      @comment = Comment.new
      respond_to do |format|
        format.js
      end
    end
  end
  
private
  def message_params
    params.require(:post).permit(:message)
  end
end
