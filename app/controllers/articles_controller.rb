class ArticlesController < ApplicationController
  # GET /articles
  def index
    @articles = Article.order(published_at: :desc)
    render json: @articles.as_json(only: [:id, :title, :content, :author, :category, :published_at])
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article.as_json(only: [:id, :title, :content, :author, :category, :published_at]), status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
    render json: @article.as_json(only: [:id, :title, :content, :author, :category, :published_at])
  rescue ActiveRecord::RecordNotFound
    render status: :not_found
  end 

  def method_not_allowed
    render status: :method_not_allowed
  end

  private

  def article_params
    params.permit(:title, :content, :author, :category, :published_at)
  end
end
