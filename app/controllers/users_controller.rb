class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @dog = Dog.new
  end

  def show
    @user = User.find(params[:id])
    @dogs = @user.dogs
    @dog = Dog.new
  end

  def edit
    @user = current_user
  end

  def unsubscribe
  end

  def withdraw
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def follows
  end

  def followers
  end

   private

  def user_params
    params.require(:user).permit(:name, :image_id, :introduction, :admin)
  end
end
