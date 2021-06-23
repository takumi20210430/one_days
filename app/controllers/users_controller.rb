class UsersController < ApplicationController
  before_action :baria_user, only: [:edit, :unsubscribe]
  
  def index
    @users = User.all.page(params[:page]).per(5)
    @dog = Dog.new
    @dogs = Dog.all
  end

  def show
    @user = User.find(params[:id])
    @dogs = @user.dogs
    @dog = Dog.new
    @articles = @user.articles.page(params[:page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def follows
    user = User.find(params[:id])
    @follows = user.followings.page(params[:page]).per(5)
  end

  def follows_index
    @article = Article.limit(30).order(" created_at DESC ")
    @articles = @article.where(user_id: [*current_user.following_ids]).page(params[:page]).per(8)
  end

  def followers
    user = User.find(params[:id])
    @followers = user.followers.page(params[:page]).per(5)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :root #削除に成功すればrootページに戻る
  end

   private

  def user_params
    params.require(:user).permit(:name, :image, :introduction, :admin, :is_deleted)
  end
  
  def baria_user
    @user = User.find(params[:id])
      unless @user.id == current_user.id || current_user.admin
        redirect_to current_user
      end
  end
end
