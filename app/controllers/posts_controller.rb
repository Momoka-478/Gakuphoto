class PostsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.admin_id = current_admin.id
    if @post.save
      redirect_to post_path(post.id)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post_destroy
    redirect_to '/posts'
  end

  private

  def change_layout
    case action_name
    when 'new', 'create', 'destroy'
      'admin'
    end
  end

  def post_params
    params.require(:post).permit(:image, :title, :body)
  end
end
