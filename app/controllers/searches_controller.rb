class SearchesController < ApplicationController

  def search
    @range = params[:range]

    @word = params[:word]

    if @range == "User"
       @users = User.looks(params[:search], params[:word])
    elsif @range == "Dog"
       @dogs = Dog.looks(params[:search], params[:word])
    else
      @articles = Article.looks(params[:search], params[:word])
    end

  end

end

