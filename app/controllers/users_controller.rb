class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @dog = Dog.new
    @dogs = Dog.all
  end

  def show
    @user = User.find(params[:id])
    @dogs = @user.dogs
    @dog = Dog.new
    @articles = @user.articles
  end

  def edit
    @user = current_user
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: "Invalid")
    reset_session
    redirect_to root_path
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def follows
    user = User.find(params[:id])
    @follows = user.followings

  end

  def followers
    user = User.find(params[:id])
    @followers = user.followers
  end

   private

  def user_params
    params.require(:user).permit(:name, :image, :introduction, :admin, :is_deleted)
  end
end
