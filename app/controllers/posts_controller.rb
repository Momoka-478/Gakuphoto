class PostsController < ApplicationController

  before_action :authenticate_any!, only: [:index, :show]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end


  private

  def authenticate_any!
    unless admin_signed_in? || user_signed_in?
      redirect_to new_user_session_path, alert: "ログインしてください"
    end
  end
end
