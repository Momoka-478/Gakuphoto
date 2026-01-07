class Admin::PostCommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_admin.post_comments.new(post_comment_params)
    @post_comment.post = @post
    if @post_comment.save
      redirect_to admin_post_path(@post)
    else
      render 'admin/posts/show'
    end
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to request.referer
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
