class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
        redirect_to posts_path
        flash[:notice] = 'Comment added'
    else
      redirect_to post_path(@post)
      flash[:alert] = 'Failed'
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end


  def set_comment
    @comment = Comment.find(params[:id])
  end
end
