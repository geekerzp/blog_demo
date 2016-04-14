class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  def update
    if @article.update article_params
      redirect_to articles_path, notice: "article updated successfully"
    else
      render :edit
    end
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build article_params
    @article.tags_string = article_params[:tags_string]
    if @article.save
      redirect_to articles_path, notice: "article created successfully"
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "article deleted successfully"
  end

  protected

  def article_params
    params.require(:article).permit(:title, :body, :tags_string)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
