class CommentsController < ApplicationController
  before_action :set_resource, only: [:create]

  def create
    @comment = @resource.comments.build comments_params
    @comment.user = current_user

    @comment.save
  end

  protected

  def comments_params
    params.require(:comment).permit(:content)
  end

  def set_resource
    @resource = if params[:post_id]
                  Post.find(params[:post_id])
                elsif params[:article_id]
                  Article.find(params[:article_id])
                end
  end
end
