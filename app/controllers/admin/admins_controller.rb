class Admin::AdminsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def show
    @admin = Admin.find(params[:id])
    @posts = @admin.posts
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    @admin.update(admin_params)
    redirect_to admin_admin_path(current_admin.id)
  end

  
  private

  def admin_params
    params.require(:admin).permit(:name, :profile_image)
  end
end
