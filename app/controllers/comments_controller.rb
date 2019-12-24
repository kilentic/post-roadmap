class CommentsController < ApplicationController
  def create
    
    @comment = current_user.comments.new comment_params
    respond_to do |format|
      if @comment.save
        @like = Like.new
        format.js 
      else
        format.js
      end
    end
  end
  private
  def comment_params
    params[:comment].permit!
  end
end
