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
    @dogs = Dog.all.page(params[:page]).per(5)

  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])

  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    redirect_to dog_path(@dog.id)
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to user_path(@dog.user.id)
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :image1, :image2, :image3, :introduction, :age, :dog_type_id, :skill, :favorite)
  end

end
