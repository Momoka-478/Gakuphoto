class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @post = Post.find(params[:id])
    @favorite_posts = @user.favorite_posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to new_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
