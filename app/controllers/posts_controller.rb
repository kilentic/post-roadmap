class PostsController < ApplicationController
  def index
    @posts = Post.order(:create_at).page params[:page]
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
    @post = Post.new message_params
    respond_to do |format|
      if @post.save
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
