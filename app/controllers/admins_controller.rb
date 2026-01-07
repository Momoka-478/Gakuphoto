class AdminsController < ApplicationController

  before_action :authenticate_any!, only: [:show, :index]

  def show
    @admin = Admin.find(params[:id])
    @posts = @admin.posts
  end

  def index
    @admins = Admin.all
    @post = Post.new
  end

  private

  def authenticate_any!
    unless admin_signed_in? || user_signed_in?
      redirect_to new_user_session_path, alert: "ログインしてください"
    end
  end
end
