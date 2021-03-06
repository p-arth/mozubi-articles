require 'shorturl'
require 'nokogiri'
require 'open-uri'
require 'readingtime'

class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  def index
    if params[:query].present?
      @searched = true
      @articles = Article.search_by_title_and_body(params[:query])
    else
      @articles = Article.all
    end
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    # Shorten source link
    short_url = ShortURL.shorten(article_params[:source], :tinyurl)
    # Build body with heading tags
    doc = Nokogiri::HTML(URI.open(article_params[:source]))
    heading_array = []
    doc.search('h1').each{ |h| heading_array << h.text }
    doc.search('h2').each{ |h| heading_array << h.text }
    doc.search('h3').each{ |h| heading_array << h.text }
    body = heading_array.join(', ')
    # Estimated reading time
    estimated_time = body.reading_time :format => :approx
    if estimated_time.include?('second')
      estimated_time = 'Less than 1 minute'
    end

    @article = Article.new(
      title: article_params[:title],
      source: short_url,
      body: body,
      estimated_time: estimated_time
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
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :source, :body, :estimated_time)
    end
end
