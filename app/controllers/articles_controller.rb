class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_param)
    @article.save

    if @article.save
      flash[:notice] = "Article is successfully saved"
      redirect_to articles_path
    else
      render new_article_path
    end
  end



  private

  def article_param
    params.require(:article).permit(:title, :description)
  end
end
