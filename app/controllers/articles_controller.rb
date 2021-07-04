require 'shorturl'

class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles
  def create
    short_url = ShortURL.shorten(article_params[:source], :tinyurl)

    @article = Article.new(
      title: article_params[:title],
      source: short_url
    )
    respond_to do |format|
      if @article.save
        format.html { redirect_to root_path, notice: "Article was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :source, :body, :estimated_time)
    end
end
