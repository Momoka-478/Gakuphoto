class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
    @posts = @admin.posts
  end
end
