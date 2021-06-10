class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user_id = current_user.id
    @dog.save
    redirect_to dog_path(@dog)
  end

  def index
    @user = current_user
    @users = User.all
    @dogs = Dog.all

  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def dog_params
    params.require(:dog).permit(:user_id, :name, :image_id, :introduction, :age, :dog_type_id, :skill, :favorite)
  end

end
