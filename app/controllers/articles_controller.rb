class ArticlesController < ApplicationController
  before_action :baria_user, only: [:edit, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to user_path(@article.user.id)
    else
      render 'new'
    end
  end

  def index
    @user = current_user
    @users = User.all
    @articles = Article.all.page(params[:page]).per(8)
  end

  def show
    @article = Article.find(params[:id])
    @article_comment = ArticleComment.new
    @article_comments = @article.article_comments
  end



  def edit
     @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to user_path(@article.user.id)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :image1, :image2, :image3, :image4, :image5)
  end

  def baria_user
    @article = Article.find(params[:id])
    @user = @article.user
      unless @user.id == current_user.id || current_user.admin
        #本人の他に管理者フラグを持っている人も編集可能
        redirect_to articles_path
      end
  end
end
