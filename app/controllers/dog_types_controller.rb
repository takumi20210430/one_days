class DogTypesController < ApplicationController
  def index
    @dog_types = DogType.all
    @dog_type = DogType.new
  end

  def create
    dog_type = DogType.new(dog_type_params)
    dog_type.save
    redirect_to dog_types_path
  end

  def edit
    @dog_type = DogType.find(params[:id])
  end

  def update
   dog_type = DogType.find(params[:id])
   dog_type.update(dog_type_params)
    redirect_to dog_types_path
  end

  private

  def dog_type_params
    params.require(:dog_type).permit(:type_name)
  end
end
