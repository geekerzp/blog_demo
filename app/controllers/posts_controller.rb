class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to posts_path, notice: "post updated successfully"
    else
      render :edit
    end
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build post_params
    @post.tags_string = post_params[:tags_string]
    if @post.save
      redirect_to posts_path, notice: "post created successfully"
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "post deleted successfully"
  end

  protected

  def post_params
    params.require(:post).permit(:title, :body, :tags_string)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
