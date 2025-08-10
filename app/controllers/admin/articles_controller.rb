class Admin::ArticlesController < ApplicationController
  layout "layouts/admin-app"
  before_action :authenticate_user!
  before_action :set_admin_article, only: %i[ show edit update destroy ]

  # GET /admin/articles or /admin/articles.json
  def index
    @admin_articles = Article.all.order(created_at: :desc)
  end

  # GET /admin/articles/1 or /admin/articles/1.json
  def show
  end

  # GET /admin/articles/new
  def new
    @admin_article = Article.new
  end

  # GET /admin/articles/1/edit
  def edit
  end

  # POST /admin/articles or /admin/articles.json
  def create
    @admin_article = Article.new(admin_article_params)

    respond_to do |format|
      if @admin_article.save
        format.html { redirect_to admin_articles_path, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @admin_article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/articles/1 or /admin/articles/1.json
  def update
    respond_to do |format|
      if @admin_article.update(admin_article_params)
        format.html { redirect_to admin_articles_path, notice: "Article was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @admin_article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/articles/1 or /admin/articles/1.json
  def destroy
    @admin_article.destroy!

    respond_to do |format|
      format.html { redirect_to admin_articles_path, notice: "Article was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_article
      @admin_article = Article.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_article_params
      params.require(:article).permit(:title, :lead, :content, :published_at, :slug)
    end
end
