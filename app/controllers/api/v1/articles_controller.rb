class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  # GET /api/v1/articles
  def index
    @articles = Article.published
    render json: @articles, only: [:title, :slug, :lead, :published_at]
  end

  # GET /api/v1/articles/:slug
  def show
    render json: {
      title: @article.title,
      slug: @article.slug,
      lead: @article.lead,
      content: (@article.content.respond_to?(:body) ? @article.content.body.to_s : @article.read_attribute(:content)),
      published_at: @article.published_at
    }
  end

  private

  def set_article
    @article = Article.find_by!(slug: params[:slug])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Article not found' }, status: :not_found
  end

  end
