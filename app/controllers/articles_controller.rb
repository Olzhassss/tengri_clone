class ArticlesController < ApplicationController
  def index
    @articles = Article.page(params[:page]).per(12)
    # @feed_articles = feed
    # puts(@feed_articles)
  end

  def feed
    if params[:column].present?
      @feed_articles = get_category("news", nil, 25).order("#{params[:column]} #{params[:direction]}")
    else
      @feed_articles = get_category("news", nil, 25)
    end
    render partial: "feed"
  end

  def show
    @article = Article.find(params[:id])
  end

  def news_category
    @articles = get_category("news", :page, 5).order("published_at desc")
  end

  def articles_category
    @articles = get_category("articles", :page, 5)
  end

  def search
    @articles = Article.where("title LIKE ?", "%#{params[:query]}%")
    @count = @articles.count
    @articles = @articles.page(params[:page]).per(15)
    # @query = params[:query]
  end

  private
  
  def get_category(slug, page, per)
    @category = ArticleCategory.find_by(slug: slug)
    @articles = @category.present? ? @category.articles.page(params[page]).per(per) : ArticleCategory.none
  end
end
