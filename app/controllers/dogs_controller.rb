class DogsController < ApplicationController
  def new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user_id = current_user.id
    @dog.save
    redirect_to dog_path(@dog)
  end

  def index
  end

  def show
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
