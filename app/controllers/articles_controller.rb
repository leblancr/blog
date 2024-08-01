# frozen_string_literal: true

# ArticlesController handles the CRUD operations for articles.
#
# This controller provides actions to create, read, update, and delete
# articles. It interacts with the Article model and renders views
# for these actions.
#
# Actions:
# - index: Displays a list of articles
# - show: Shows a single article
# - new: Renders a form for creating a new article
# - create: Processes the form submission and creates a new article
# - edit: Renders a form for editing an existing article
# - update: Processes the form submission and updates an article
# - destroy: Deletes an article
class ArticlesController < ApplicationController
  def index
    # render app/views/articles/index.html.erb
    @articles = Article.all
  end

  def show
    # When a request includes query parameters in the URL (e.g., ?id=123),
    # these parameters are available in params.
    @article = Article.find(params[:id])
    # The returned article is stored in the @article instance variable,
    # so it is accessible by the view. By default, the show action will
    # render app/views/articles/show.html.erb.
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
