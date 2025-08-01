class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.admin_id = current_admin.id
    @post.save
    redirect_to posts_path
  end

  def index
  end

  def show
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :body)
  end

end
