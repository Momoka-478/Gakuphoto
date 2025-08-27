class Admin::AdminsController < ApplicationController
  layout 'admin'

  def show
    @admin = Admin.find(params[:id])
    @posts = @admin.posts
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :profile_image)
  end
end
