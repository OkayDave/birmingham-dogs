class DogsController < ApplicationController
  respond_to :json, :html

  def index
    @dogs = Dog.all

    respond_with @dogs do |format|
      format.html
      format.json { render json: {dogs: @dogs} }
    end
  end

  def show
    @dog = Dog.find(params[:id])

    respond_with(@dog) do |format|
      format.html
      format.json { render json: {dog: @dog} }
    end
  end
end
