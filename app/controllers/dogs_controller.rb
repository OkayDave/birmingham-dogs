class DogsController < ApplicationController
  respond_to :json, :html

  def index
    @dogs = Dog.all

    respond_with @dogs
  end

  def show
    @dog = Dog.find(params[:id])

    respond_with(@dog)
  end
end
