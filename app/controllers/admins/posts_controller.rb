module Admins
  class PostsController < BaseController
    before_action :set_post, only: %i[edit update destroy]

    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = current_admin.posts.new(post_params)

      if @post.save
        redirect_to @post, notice: 'Post created!'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post updated!'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @post.destroy
      redirect_to admins_posts_path, notice: 'Post deleted!'
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
end
