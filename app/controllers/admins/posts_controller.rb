module Admins
  class PostsController < BaseController
    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)

      # TODO: When the authentication is working, this will need to be removed.
      @post.administrator = Administrator.first

      if @post.save
        redirect_to @post, notice: 'Post created!'
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
end
