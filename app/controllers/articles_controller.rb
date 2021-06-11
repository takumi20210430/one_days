class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to user_path(@article.user.id)
  end

  def index
    @user = current_user
    @users = User.all
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @user = current_user
  end

  def edit
     @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to user_path(@article.id)
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :image1, :image2, :image3, :image4, :image5)
  end
end
