class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_param)

    if @article.save
      flash[:notice] = "Article is successfully saved"
      redirect_to articles_path
    else
      render new_article_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_param)
      flash[:notice] = "Article is successfully editted"
      redirect_to articles_path(@article)
    else
      render edit_article_path
    end
  end



  private

  def article_param
    params.require(:article).permit(:title, :description)
  end
end
