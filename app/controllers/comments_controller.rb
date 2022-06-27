class CommentsController < ApplicationController
  before_action :set_post, only: %i[create]

  def create
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to @post, notice: 'Comment created!'
    else
      redirect_to @post, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :email)
  end
end
