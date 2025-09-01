class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @post.likes.create(user: current_user)
    redirect_to @post
  end

  def destroy
    favorite = @post.favorites.find_by(user: current_user)
    favorite.destroy if favorite
    redirect_to @post
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
