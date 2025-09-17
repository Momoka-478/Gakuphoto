class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    @posts = @admin.posts
  end

  def index
    @admins = Admin.all
    @post = Post.new
  end
end
