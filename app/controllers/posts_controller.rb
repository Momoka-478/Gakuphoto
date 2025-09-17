class PostsController < ApplicationController

  before_action :authenticate_any!, only: [:index, :show]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def favorite_posts
    @favorite_posts = current_user.favorites.map(&:post)
  end

  private

  def authenticate_any!
    unless admin_signed_in? || user_signed_in?
      redirect_to new_user_session_path, alert: "ログインしてください"
    end
  end
end
