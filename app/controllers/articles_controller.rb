class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new

  end

  def create

  end
end
