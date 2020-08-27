class CommentsController < ApplicationController

  def create
    @post_image = PostImage.find(params[:post_image_id])
    @comment = @post_image.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referer
      else
      @post_image_new = PostImage.new
      @comments = @post_image.comments
      redirect_to request.referer
      end
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    @comment = Comment.find(params[:id])
      if @comment.user == current_user
      @comment.destroy
      end
      redirect_to request.referer
  end

private

  def comment_params
    params.require(:comment).permit(:comment, :post_image_id)
  end
end
