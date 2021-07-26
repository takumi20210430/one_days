class DogsController < ApplicationController
   before_action :baria_user, only: [:edit, :destroy]
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user_id = current_user.id
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render 'new'
    end
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
    if @dog.update(dog_params)
      redirect_to dog_path(@dog.id)
    else
      render 'edit'
    end
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

  def baria_user
    @dog = Dog.find(params[:id])
    @user = @dog.user
      unless @user.id == current_user.id || current_user.admin
        #本人の他に管理者フラグを持っている人も編集可能
        redirect_to dogs_path
      end
  end

end
